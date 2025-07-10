package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.RecentBookDTO;

/**
 * 사용자가 책을 클릭했을 때 요청을 받아 세션에 "최근 본 책" 목록을 기록하는 서블릿.
 * 처리가 끝난 후 원래 책 상세 페이지로 리다이렉트합니다.
 */
@WebServlet("/bookClick")
public class BookClickServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int MAX_RECENT_BOOKS = 10; // 최근 본 책 목록의 최대 개수

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 요청 파라미터에서 책 정보 추출
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String image = request.getParameter("image");
        String link = request.getParameter("link");

        // 필수 파라미터가 없으면 아무 작업도 하지 않고 리다이렉트
        if (id == null || title == null || image == null || link == null) {
            // 파라미터가 불완전할 경우 기본 페이지나 에러 페이지로 보낼 수 있음
            response.sendRedirect(request.getContextPath() + "/main.jsp");
            return;
        }

        // 2. DTO 객체 생성
        RecentBookDTO newBook = new RecentBookDTO(id, title, author, image, link);

        // 3. 세션에서 '최근 본 책' 목록 가져오기
        HttpSession session = request.getSession();
        List<RecentBookDTO> recentBooks = (List<RecentBookDTO>) session.getAttribute("recentBooks");

        // 세션에 목록이 없으면 새로 생성
        if (recentBooks == null) {
            recentBooks = new ArrayList<>();
        }

        // 4. 목록 관리 (중복 제거 및 맨 앞으로 이동)
        // 기존 목록에 같은 책이 있으면 제거. id를 기준으로 비교.
        recentBooks.removeIf(book -> book.getId().equals(newBook.getId()));

        // 새 책을 목록의 맨 앞에 추가
        recentBooks.add(0, newBook);

        // 5. 목록 최대 개수 유지
        while (recentBooks.size() > MAX_RECENT_BOOKS) {
            recentBooks.remove(recentBooks.size() - 1); // 가장 오래된 항목(리스트의 마지막)을 제거
        }

        // 6. 업데이트된 목록을 다시 세션에 저장
        session.setAttribute("recentBooks", recentBooks);

        // 7. 원래 목적지(책 상세 페이지)로 리다이렉트
        response.sendRedirect(link);
    }
}