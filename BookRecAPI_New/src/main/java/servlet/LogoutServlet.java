package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // HttpSession을 사용하기 위해 임포트

@WebServlet("/logout") // 웹 요청 URL을 /logout으로 매핑합니다.
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LogoutServlet() {
        super();
    }

    // GET 또는 POST 요청 모두 처리할 수 있도록 service 메서드를 오버라이드합니다.
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processLogout(request, response);
    }

    private void processLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // 기존 세션이 있다면 가져오고, 없다면 새로 생성하지 않습니다.

        if (session != null) {
            // 세션에서 로그인된 사용자 정보를 제거합니다. (선택 사항, invalidate가 모든 속성 제거)
            session.removeAttribute("loggedInUser"); 
            
            // 세션을 완전히 무효화합니다.
            session.invalidate();
            System.out.println("로그아웃: 세션이 무효화되었습니다."); // 서버 콘솔에 로그 출력
        } else {
            System.out.println("로그아웃: 활성 세션이 없습니다."); // 서버 콘솔에 로그 출력
        }

        // ⭐⭐⭐ 로그아웃 후 무조건 메인 페이지로 리다이렉트 ⭐⭐⭐
        response.sendRedirect(request.getContextPath() + "/main.jsp"); 
    }
}