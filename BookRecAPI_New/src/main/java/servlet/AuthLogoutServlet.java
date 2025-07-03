package servlet;

import com.google.gson.Gson; // Gson 라이브러리 임포트 (JSON 응답이 필요한 다른 서블릿과의 일관성을 위해 유지하지만, 이 서블릿에서는 직접 JSON 응답을 보내지 않습니다.)
import dto.ApiResponse;     // ApiResponse DTO 임포트 (동일)

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; // HttpSession 임포트
import java.io.IOException;
// PrintWriter는 sendRedirect를 사용하므로 더 이상 필요하지 않습니다.
// import java.io.PrintWriter;

@WebServlet("/api/auth/logout") // 로그아웃 API 엔드포인트 매핑
public class AuthLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Gson 인스턴스는 이 서블릿에서 직접 JSON 응답을 보내지 않으므로 필수적이지 않지만,
    // 다른 서블릿과의 일관성을 위해 필드로 유지하거나 제거할 수 있습니다.
    // private Gson gson; 

    // init() 메서드도 더 이상 gson 필드 초기화가 필요 없으므로, 필요하다면 제거하거나 비워둘 수 있습니다.
    // @Override
    // public void init() throws ServletException {
    //     super.init();
    //     this.gson = new Gson();
    // }

    // POST 요청 처리 (클라이언트에서 AJAX POST로 로그아웃 요청 시)
    // 현재 mypage.jsp는 window.location.href를 사용하므로 GET 요청을 보낼 가능성이 높습니다.
    // 하지만 API 관점에서 POST 로그아웃이 더 적절하므로, POST 요청 처리 로직을 유지하고 doGet을 호출합니다.
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 실제 로그아웃 처리 로직을 doGet 메서드로 위임
        doGet(request, response);
    }

    // GET 요청 처리 (웹 페이지에서 링크 클릭 또는 window.location.href 등에 의해 호출 시)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 현재 세션을 가져옴 (새로운 세션을 생성하지 않음: false)
        HttpSession session = request.getSession(false); 

        if (session != null) {
            // 세션 무효화 (로그인 정보 및 모든 세션 속성 삭제)
            session.invalidate(); 
            System.out.println("세션 무효화 성공: 사용자 로그아웃 처리 완료."); // 서버 로그
        } else {
            System.out.println("활성 세션이 없어 세션을 무효화할 수 없습니다. (이미 로그아웃 상태일 수 있음)"); // 서버 로그
        }

        // 로그아웃 처리 후 메인 페이지로 리다이렉트합니다.
        // response.sendRedirect()는 브라우저에게 새로운 URL로 이동하라는 명령을 내립니다.
        // request.getContextPath()는 웹 애플리케이션의 컨텍스트 경로를 반환합니다 (예: /yourwebapp).
        response.sendRedirect(request.getContextPath() + "/main.jsp"); // ⭐ 여기가 핵심
    }
}