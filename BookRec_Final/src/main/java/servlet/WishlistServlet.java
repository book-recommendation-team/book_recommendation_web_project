package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject; // JSON 파싱을 위해 추가 (bookId 추출)
import com.google.gson.JsonSyntaxException;
import dao.WishlistDao;
import dto.ApiResponse;
import dto.WishlistItemResponse;
import service.WishlistService;
import service.WishlistException; // WishlistService에서 정의한 예외 임포트

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/api/users/me/wishlists/*") // /api/users/me/wishlists 또는 /api/users/me/wishlists/{bookId}
public class WishlistServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private WishlistService wishlistService;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        this.wishlistService = new WishlistService(new WishlistDao());
        this.gson = new Gson();
    }

    // 찜 목록 조회 (GET /api/users/me/wishlists)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print(gson.toJson(ApiResponse.error("UNAUTHORIZED", "로그인이 필요합니다.")));
            return;
        }

        int userId = (int) session.getAttribute("loggedInUser");

        try {
            List<WishlistItemResponse> wishlists = wishlistService.getWishlistsByUserId(userId);
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(ApiResponse.success(wishlists, "찜 목록 조회 성공")));

        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }

    // 찜 목록에 책 추가 (POST /api/users/me/wishlists)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print(gson.toJson(ApiResponse.error("UNAUTHORIZED", "로그인이 필요합니다.")));
            return;
        }

        int userId = (int) session.getAttribute("loggedInUser");

        try {
            // 요청 바디에서 book_id 파싱 (JsonObject를 사용하여 유연하게 파싱)
            JsonObject jsonRequest = gson.fromJson(request.getReader(), JsonObject.class);
            if (jsonRequest == null || !jsonRequest.has("bookId")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(ApiResponse.error("INVALID_INPUT", "책 ID가 필요합니다.")));
                return;
            }
            int bookId = jsonRequest.get("bookId").getAsInt();

            boolean success = wishlistService.addWishlist(userId, bookId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_CREATED); // 201 Created
                out.print(gson.toJson(ApiResponse.success(null, "찜 목록에 책이 추가되었습니다.")));
            } else {
                // 이 블록은 WishlistService에서 예외를 던지므로 사실상 실행되지 않음
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("ADD_FAILED", "찜 목록 추가에 실패했습니다.")));
            }

        } catch (JsonSyntaxException | NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_JSON_OR_BOOK_ID", "요청 데이터의 JSON 형식이 올바르지 않거나 책 ID가 유효하지 않습니다.")));
            e.printStackTrace();
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (WishlistException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 비즈니스 로직 오류 (예: 중복)
            out.print(gson.toJson(ApiResponse.error(e.getCode(), e.getMessage())));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }

    // 찜 목록에서 책 삭제 (DELETE /api/users/me/wishlists/{bookId})
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print(gson.toJson(ApiResponse.error("UNAUTHORIZED", "로그인이 필요합니다.")));
            return;
        }

        int userId = (int) session.getAttribute("loggedInUser");

        // URL 경로에서 bookId 추출 (예: /api/users/me/wishlists/123)
        String pathInfo = request.getPathInfo(); // 예: "/123"
        int bookId;
        try {
            if (pathInfo == null || pathInfo.length() < 2) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(ApiResponse.error("INVALID_PATH", "삭제할 책 ID가 URL 경로에 포함되어야 합니다.")));
                return;
            }
            bookId = Integer.parseInt(pathInfo.substring(1)); // "/123" -> "123"
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_BOOK_ID", "유효하지 않은 책 ID 형식입니다.")));
            return;
        }

        try {
            boolean success = wishlistService.removeWishlist(userId, bookId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT); // 204 No Content (삭제 성공 시 본문 없음)
                // out.print(gson.toJson(ApiResponse.success(null, "찜 목록에서 책이 삭제되었습니다."))); // 204에는 본문 포함 안 함
            } else {
                // 이 블록은 WishlistService에서 예외를 던지므로 사실상 실행되지 않음
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("REMOVE_FAILED", "찜 목록 제거에 실패했습니다.")));
            }

        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (WishlistException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 비즈니스 로직 오류 (예: 찜 목록에 없음)
            out.print(gson.toJson(ApiResponse.error(e.getCode(), e.getMessage())));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }
}