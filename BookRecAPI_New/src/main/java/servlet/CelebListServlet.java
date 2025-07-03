package servlet;

import dao.CelebRecommendationsDao;
import dao.CelebRecommendedBooksDao;
import dto.ApiResponse;
import dto.CelebRecommendationResponse;
import service.CelebRecommendationService;
import service.CelebRecommendationException;

import com.google.gson.Gson;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/celebList/*") // URL 매핑을 '/celebList/*'로 유지
public class CelebListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CelebRecommendationService celebRecommendationService;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        this.celebRecommendationService = new CelebRecommendationService(
            new CelebRecommendationsDao(),
            new CelebRecommendedBooksDao()
        );
        this.gson = new Gson();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        
        List<CelebRecommendationResponse> finalCelebList = new ArrayList<>(); 

        try {
            List<CelebRecommendationResponse> realCelebList = celebRecommendationService.getAllCelebRecommendations();
            
            if (realCelebList != null && !realCelebList.isEmpty()) {
                finalCelebList.addAll(realCelebList);
            }

            // 하드코딩된 테스트용 더미 데이터들을 최종 리스트에 추가합니다.
            finalCelebList.add(new CelebRecommendationResponse(
                1, "박찬욱", "영화감독 박찬욱이 추천한 책 모음", request.getContextPath() + "/img/박찬욱.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                2, "아이유", "가수 아이유가 읽고 감동한 책 리스트", request.getContextPath() + "/img/아이유.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                3, "RM", "방탄소년단 RM의 책장 속 인생 책들", request.getContextPath() + "/img/RM.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                4, "페이커", "페이커 대상혁이 추천하는 책", request.getContextPath() + "/img/페이커.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                5, "한강", "노벨문학상 한강의 책장", request.getContextPath() + "/img/한강.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                6, "홍경", "홍경의 추천 도서", request.getContextPath() + "/img/홍경.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                7, "박정민", "박정민의 인생책", request.getContextPath() + "/img/박정민.jpg", LocalDateTime.now()));
            finalCelebList.add(new CelebRecommendationResponse(
                8, "문상훈", "문상훈이 추천하는 시집들", request.getContextPath() + "/img/문상훈.jpg", LocalDateTime.now()));
            
            request.setAttribute("celebList", finalCelebList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/celebList.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "셀럽 추천 목록을 불러오는 데 실패했습니다 (DB 오류).");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "알 수 없는 오류가 발생했습니다.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/error.jsp");
            dispatcher.forward(request, response);
        }
    }

    // 셀럽 추천 글 삭제 (DELETE /celebList/{celebRecId})
    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int celebRecId;
        try {
            // --- 🚨🚨🚨 ID 파싱 로직을 더욱 견고하게 수정합니다. 🚨🚨🚨 ---
            // request.getPathInfo() 대신 request.getRequestURI()를 사용하여 파싱
            // 이는 request.getPathInfo()가 예상대로 동작하지 않을 때를 대비한 더 견고한 방법입니다.
            String requestURI = request.getRequestURI(); // 예: /BookRecAPI_New/celebList/6
            String contextPath = request.getContextPath(); // 예: /BookRecAPI_New
            String servletPath = request.getServletPath(); // 예: /celebList

            // /BookRecAPI_New/celebList/6 에서 /BookRecAPI_New/celebList를 제거 -> /6
            String idPart = requestURI.substring(contextPath.length() + servletPath.length());
            
            if (idPart.startsWith("/")) {
                idPart = idPart.substring(1); // 선행 슬래시 제거 -> 6
            }
            
            if (idPart.isEmpty()) { // ID 부분이 비어있으면 오류
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(ApiResponse.error("INVALID_PATH", "삭제할 셀럽 추천 ID가 URL 경로에 포함되어야 합니다.")));
                return;
            }

            celebRecId = Integer.parseInt(idPart); // 숫자로 파싱 시도
            // --- ID 파싱 로직 수정 끝 ---

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_ID_FORMAT", "유효하지 않은 셀럽 추천 ID 형식입니다.")));
            e.printStackTrace();
            return;
        }

        try {
            boolean success = celebRecommendationService.deleteCelebRecommendation(celebRecId);

            if (success) {
                response.setStatus(HttpServletResponse.SC_NO_CONTENT); // 204 No Content (삭제 성공, 응답 본문 없음)
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("DELETE_FAILED", "셀럽 추천 글 삭제에 실패했습니다.")));
            }
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (CelebRecommendationException e) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND); // NOT_FOUND -> 404
            out.print(gson.toJson(ApiResponse.error(e.getCode(), e.getMessage())));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }
}