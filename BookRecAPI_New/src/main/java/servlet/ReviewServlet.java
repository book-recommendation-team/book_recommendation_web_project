package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import dao.ReviewDao;
import dto.ApiResponse;
import dto.ReviewResponse;
import dto.ReviewUpdateRequest;
import service.ReviewService;
import service.ReviewException; // ReviewService에서 정의한 예외 임포트

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

@WebServlet("/api/users/me/reviews/*") // /api/users/me/reviews (GET), /api/users/me/reviews/{reviewId} (PUT, DELETE)
public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ReviewService reviewService;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        this.reviewService = new ReviewService(new ReviewDao());
        this.gson = new Gson();
    }

    // 자신이 쓴 리뷰 목록 조회 (GET /api/users/me/reviews)
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
            List<ReviewResponse> reviews = reviewService.getMyReviews(userId);
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(ApiResponse.success(reviews, "리뷰 목록 조회 성공")));

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

    // 리뷰 수정 (PUT /api/users/me/reviews/{reviewId})
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            out.print(gson.toJson(ApiResponse.error("UNAUTHORIZED", "로그인이 필요합니다.")));
            return;
        }

        int userId = (int) session.getAttribute("loggedInUser");

        // URL 경로에서 reviewId 추출 (예: /api/users/me/reviews/123)
        String pathInfo = request.getPathInfo();
        int reviewId;
        try {
            if (pathInfo == null || pathInfo.length() < 2) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(ApiResponse.error("INVALID_PATH", "수정할 리뷰 ID가 URL 경로에 포함되어야 합니다.")));
                return;
            }
            reviewId = Integer.parseInt(pathInfo.substring(1)); // "/123" -> "123"
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_REVIEW_ID", "유효하지 않은 리뷰 ID 형식입니다.")));
            return;
        }

        try {
            ReviewUpdateRequest updateRequest = gson.fromJson(request.getReader(), ReviewUpdateRequest.class);

            // 서비스 호출
            boolean success = reviewService.updateMyReview(reviewId, userId, updateRequest);

            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
                out.print(gson.toJson(ApiResponse.success(null, "리뷰가 성공적으로 수정되었습니다.")));
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("UPDATE_FAILED", "리뷰 수정에 실패했습니다.")));
            }

        } catch (JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_JSON", "요청 데이터의 JSON 형식이 올바르지 않습니다.")));
            e.printStackTrace();
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (ReviewException e) { // 비즈니스 로직 오류 (예: 유효성 검증, 권한 없음)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error(e.getCode(), e.getMessage())));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }

    // 리뷰 삭제 (DELETE /api/users/me/reviews/{reviewId})
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

        // URL 경로에서 reviewId 추출 (예: /api/users/me/reviews/123)
        String pathInfo = request.getPathInfo();
        int reviewId;
        try {
            if (pathInfo == null || pathInfo.length() < 2) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(ApiResponse.error("INVALID_PATH", "삭제할 리뷰 ID가 URL 경로에 포함되어야 합니다.")));
                return;
            }
            reviewId = Integer.parseInt(pathInfo.substring(1)); // "/123" -> "123"
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_REVIEW_ID", "유효하지 않은 리뷰 ID 형식입니다.")));
            return;
        }

        try {
            boolean success = reviewService.deleteMyReview(reviewId, userId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT); // 204 No Content (삭제 성공 시 본문 없음)
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("DELETE_FAILED", "리뷰 삭제에 실패했습니다.")));
            }

        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (ReviewException e) { // 비즈니스 로직 오류 (예: 리뷰를 찾을 수 없음, 권한 없음)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error(e.getCode(), e.getMessage())));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }
}