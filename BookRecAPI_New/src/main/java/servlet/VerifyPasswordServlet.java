// src/main/java/controller/VerifyPasswordServlet.java (예시 경로)
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson; // Gson 라이브러리 사용을 가정 (pom.xml에 추가 필요)
import model.User;
import service.UserService;
import dao.UserDao; // UserDao도 필요하면 임포트
import security.BCryptPasswordEncoder; // PasswordEncoder 구현체 임포트
import security.PasswordEncoder; // PasswordEncoder 인터페이스 임포트

// Custom Exceptions (UserLoginException, UserProfileException)도 import 해야 합니다.
import service.UserProfileException;

@WebServlet("/verifyPassword") // 이 URL로 요청이 들어올 것입니다.
public class VerifyPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private Gson gson; // JSON 처리를 위한 Gson 객체

    public void init() throws ServletException {
        // 서블릿 초기화 시 UserService와 Gson 초기화 (DI 컨테이너 사용 시 방식이 달라짐)
        UserDao userDao = new UserDao(); // 실제 프로젝트에서는 DI를 통해 주입받는 것이 좋습니다.
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        this.userService = new UserService(userDao, passwordEncoder);
        this.gson = new Gson();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // JSON 응답임을 명시
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        
        // --- 여기를 수정합니다 ---
        String jsonResponse = ""; // 빈 문자열로 초기화하거나, 기본 오류 메시지로 초기화
                                 // 예: String jsonResponse = gson.toJson(new ApiResponse(false, "서버 오류: 초기화되지 않은 응답"));
        // -------------------------

        // 1. 요청 본문(JSON) 읽기
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        // DTO를 사용하여 요청 본문을 객체로 변환
        PasswordVerifyRequestDTO requestDto = null;
        try {
            requestDto = gson.fromJson(requestBody, PasswordVerifyRequestDTO.class);
            if (requestDto == null || requestDto.getUserId() == 0 || requestDto.getPassword() == null || requestDto.getPassword().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                jsonResponse = gson.toJson(new ApiResponse(false, "잘못된 요청 형식입니다."));
                out.print(jsonResponse);
                return;
            }
        } catch (com.google.gson.JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            jsonResponse = gson.toJson(new ApiResponse(false, "요청 JSON 형식이 올바르지 않습니다."));
            out.print(jsonResponse);
            return;
        }

        int userId = requestDto.getUserId();
        String enteredPassword = requestDto.getPassword();


        // 3. 세션에서 현재 로그인된 사용자 ID 확인 (보안 강화)
        HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음
        if (session == null || session.getAttribute("loggedInUser") == null) {
            // 로그인되지 않은 사용자
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 Unauthorized
            jsonResponse = gson.toJson(new ApiResponse(false, "로그인이 필요합니다."));
            out.print(jsonResponse);
            return;
        }

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser.getUserId() != userId) {
            // 요청된 userId와 세션의 userId가 다름 (잠재적 보안 위협 또는 잘못된 요청)
            response.setStatus(HttpServletResponse.SC_FORBIDDEN); // 403 Forbidden
            jsonResponse = gson.toJson(new ApiResponse(false, "유효하지 않은 요청입니다."));
            out.print(jsonResponse);
            return;
        }

        try {
            // 4. UserService를 통해 비밀번호 검증
            boolean isPasswordCorrect = userService.verifyPassword(userId, enteredPassword);

            if (isPasswordCorrect) {
                jsonResponse = gson.toJson(new ApiResponse(true, "비밀번호가 확인되었습니다."));
                response.setStatus(HttpServletResponse.SC_OK); // 200 OK
            } else {
                jsonResponse = gson.toJson(new ApiResponse(false, "비밀번호가 올바르지 않습니다."));
                response.setStatus(HttpServletResponse.SC_OK); // 200 OK (비밀번호 불일치는 비즈니스 로직 상의 성공적인 처리)
            }
        } catch (UserProfileException e) { // UserService에서 발생시킬 수 있는 예외
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            jsonResponse = gson.toJson(new ApiResponse(false, e.getMessage()));
            System.err.println("UserProfileException during password verification: " + e.getMessage());
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
            jsonResponse = gson.toJson(new ApiResponse(false, "데이터베이스 오류가 발생했습니다."));
            e.printStackTrace(); // 실제 서비스에서는 로깅 시스템 사용
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            jsonResponse = gson.toJson(new ApiResponse(false, "알 수 없는 서버 오류가 발생했습니다."));
            e.printStackTrace();
        } finally {
            // response.getWriter().print()는 한 번만 호출해야 합니다.
            // 이미 위에서 out.print(jsonResponse); return; 으로 호출하는 경우가 있으므로,
            // 이 finally 블록은 삭제하거나 out.isCommitted() 등을 확인하여 중복 출력을 막아야 합니다.
            // 여기서는 안전하게 이미 출력된 경우가 아니면 출력하도록 변경합니다.
            if (!response.isCommitted()) { // 아직 응답이 커밋되지 않았다면 (출력된 내용이 없다면)
                out.print(jsonResponse);
            }
            out.flush();
        }
    }

    // JSON 응답을 위한 간단한 DTO 클래스
    private static class ApiResponse {
        boolean success;
        String message;

        public ApiResponse(boolean success, String message) {
            this.success = success;
            this.message = message;
        }
    }

    // 비밀번호 확인 요청을 위한 DTO (Request Body)
    private static class PasswordVerifyRequestDTO {
        private int userId;
        private String password;

        public int getUserId() { return userId; }
        public String getPassword() { return password; }
    }
}