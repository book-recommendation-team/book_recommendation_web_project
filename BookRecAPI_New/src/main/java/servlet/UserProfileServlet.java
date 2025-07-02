package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import dao.UserDao; // 서비스 계층이 없을 경우 직접 사용, 있을 경우 서비스에서 호출
import dto.ApiResponse;
import dto.PasswordChangeRequest;
import dto.UserProfileUpdateRequest;
import dto.UserResponse;
import model.User;
import security.BCryptPasswordEncoder; // 서비스 계층이 없을 경우 직접 사용
import security.PasswordEncoder; // 서비스 계층이 없을 경우 직접 사용
import service.UserService; // 서비스 계층이 있을 경우 사용 (권장)

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/api/users/me/*") // /api/users/me, /api/users/me/password, /api/users/me/profile 등 처리
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 서비스 계층 사용 시
    private UserService userService;
    // 서비스 계층 미사용 시 (아래와 같이 직접 DAO와 PasswordEncoder 사용)
    // private UserDao userDao;
    // private PasswordEncoder passwordEncoder;

    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        // 서비스 계층 초기화 (권장)
        this.userService = new UserService(new UserDao(), new BCryptPasswordEncoder());
        // 서비스 계층 미사용 시
        // this.userDao = new UserDao();
        // this.passwordEncoder = new BCryptPasswordEncoder();

        this.gson = new Gson();
    }

    // 현재 로그인된 사용자 프로필 조회 (GET /api/users/me)
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
            User user = userService.getUserProfile(userId); // 서비스 호출
            // User user = userDao.findByUserId(userId); // 서비스 미사용 시

            if (user == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print(gson.toJson(ApiResponse.error("USER_NOT_FOUND", "사용자 정보를 찾을 수 없습니다.")));
                return;
            }

            // 계정 상태 확인 (로그인되었어도 비활성/탈퇴 계정일 수 있음)
            if (!"active".equals(user.getStatus())) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                out.print(gson.toJson(ApiResponse.error("ACCOUNT_INACTIVE", "비활성화되거나 탈퇴한 계정입니다.")));
                return;
            }

            UserResponse userResponse = UserResponse.fromUser(user);
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(ApiResponse.success(userResponse, "프로필 정보 조회 성공")));

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

    // 프로필 정보 수정 (PUT /api/users/me/profile) 및 비밀번호 변경 (PUT /api/users/me/password)
    // 회원 탈퇴 (POST /api/users/me/withdraw)
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

        String pathInfo = request.getPathInfo(); // "/profile" 또는 "/password"

        try {
            if ("/profile".equals(pathInfo)) {
                // 프로필 정보 수정 처리
                UserProfileUpdateRequest reqDto = gson.fromJson(request.getReader(), UserProfileUpdateRequest.class);
                if (reqDto == null || reqDto.getNickname() == null || reqDto.getEmail() == null ||
                    reqDto.getNickname().trim().isEmpty() || reqDto.getEmail().trim().isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(gson.toJson(ApiResponse.error("INVALID_INPUT", "닉네임과 이메일은 필수 입력값입니다.")));
                    return;
                }
                // 이메일 및 닉네임 형식, 중복 검사 (서비스 계층에서 수행하는 것이 좋음)

                boolean success = userService.updateUserProfile(userId, reqDto); // 서비스 호출
                // boolean success = userDao.updateUserProfile(userId, reqDto); // 서비스 미사용 시

                if (success) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    out.print(gson.toJson(ApiResponse.success(null, "프로필 정보가 성공적으로 수정되었습니다.")));
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print(gson.toJson(ApiResponse.error("UPDATE_FAILED", "프로필 정보 수정에 실패했습니다.")));
                }

            } else if ("/password".equals(pathInfo)) {
                // 비밀번호 변경 처리
                PasswordChangeRequest reqDto = gson.fromJson(request.getReader(), PasswordChangeRequest.class);
                if (reqDto == null || reqDto.getCurrentPassword() == null || reqDto.getNewPassword() == null ||
                    reqDto.getCurrentPassword().trim().isEmpty() || reqDto.getNewPassword().trim().isEmpty()) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(gson.toJson(ApiResponse.error("INVALID_INPUT", "현재 비밀번호와 새 비밀번호를 모두 입력해주세요.")));
                    return;
                }
                // 새 비밀번호 정책 검증 (서비스 계층에서 수행하는 것이 좋음)
                if (reqDto.getNewPassword().length() < 8 || !reqDto.getNewPassword().matches(".*[!@#$%^&*()].*")) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(gson.toJson(ApiResponse.error("INVALID_PASSWORD", "새 비밀번호는 최소 8자 이상이어야 하며 특수문자를 포함해야 합니다.")));
                    return;
                }

                // 서비스 호출
                boolean success = userService.changePassword(userId, reqDto.getCurrentPassword(), reqDto.getNewPassword());
                // 서비스 미사용 시:
                // User user = userDao.findByUserId(userId);
                // if (user == null || !passwordEncoder.matches(reqDto.getCurrentPassword(), user.getPassword())) {
                //    throw new SecurityException("INVALID_CURRENT_PASSWORD"); // 커스텀 예외로 던지거나 바로 응답
                // }
                // String hashedNewPassword = passwordEncoder.encode(reqDto.getNewPassword());
                // boolean success = userDao.updatePassword(userId, hashedNewPassword);

                if (success) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    out.print(gson.toJson(ApiResponse.success(null, "비밀번호가 성공적으로 변경되었습니다.")));
                } else {
                    // 서비스에서 던지는 구체적인 예외에 따라 SC_UNAUTHORIZED 또는 SC_INTERNAL_SERVER_ERROR
                    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                    out.print(gson.toJson(ApiResponse.error("PASSWORD_CHANGE_FAILED", "현재 비밀번호가 일치하지 않거나 변경에 실패했습니다.")));
                }

            } else {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                out.print(gson.toJson(ApiResponse.error("NOT_FOUND", "요청하신 경로를 찾을 수 없습니다.")));
            }

        } catch (JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(ApiResponse.error("INVALID_JSON", "요청 데이터의 JSON 형식이 올바르지 않습니다.")));
            e.printStackTrace();
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (SecurityException e) { // UserService에서 던질 수 있는 커스텀 예외
             response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
             out.print(gson.toJson(ApiResponse.error("AUTH_FAILED", e.getMessage())));
             e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(ApiResponse.error("UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }

    // 회원 탈퇴 (DELETE /api/users/me 또는 POST /api/users/me/withdraw)
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

        // 실제 회원 탈퇴 시, 비밀번호 재확인 같은 추가 인증 로직이 필요할 수 있습니다.
        // 여기서는 편의상 생략합니다.

        try {
            // 서비스 호출
            boolean success = userService.withdrawUser(userId); // 서비스 호출
            // 서비스 미사용 시:
            // boolean success = userDao.updateUserStatus(userId, "withdrawn");

            if (success) {
                session.invalidate(); // 세션 무효화
                response.setStatus(HttpServletResponse.SC_OK);
                out.print(gson.toJson(ApiResponse.success(null, "회원 탈퇴가 성공적으로 처리되었습니다.")));
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(ApiResponse.error("WITHDRAW_FAILED", "회원 탈퇴 처리 중 오류가 발생했습니다.")));
            }

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
}