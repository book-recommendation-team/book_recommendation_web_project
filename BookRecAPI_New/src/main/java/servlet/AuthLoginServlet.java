package servlet;

import dao.UserDao;
import dto.ApiResponse;
import dto.LoginRequest;
import dto.LoginResponse;
import model.User;
import security.BCryptPasswordEncoder;
import security.PasswordEncoder;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/api/auth/login")
public class AuthLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private UserDao userDao;
    private PasswordEncoder passwordEncoder;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        super.init();
        userDao = new UserDao();
        passwordEncoder = new BCryptPasswordEncoder();
        gson = new Gson();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        try {
            LoginRequest loginRequest = gson.fromJson(request.getReader(), LoginRequest.class);

            if (loginRequest.getUsername() == null || loginRequest.getUsername().trim().isEmpty() ||
                loginRequest.getPassword() == null || loginRequest.getPassword().trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "INVALID_INPUT", "사용자 이름과 비밀번호를 입력해주세요.")));
                return;
            }

            User user = userDao.findByUsername(loginRequest.getUsername());

            if (user == null || !passwordEncoder.matches(loginRequest.getPassword(), user.getPassword())) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print(gson.toJson(new ApiResponse("error", "INVALID_CREDENTIALS", "사용자 이름 또는 비밀번호가 일치하지 않습니다.")));
                return;
            }

            userDao.updateLastLoginDate(user.getUserId());

            HttpSession session = request.getSession();
            session.setAttribute("loggedInUser", user.getUserId());
            session.setMaxInactiveInterval(30 * 60);

            LoginResponse loginResponse = new LoginResponse(user.getUserId(), user.getUsername(), user.getNickname());
            response.setStatus(HttpServletResponse.SC_OK);
            out.print(gson.toJson(new ApiResponse("success", loginResponse, "로그인 성공")));

        } catch (JsonSyntaxException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(gson.toJson(new ApiResponse("error", "INVALID_JSON", "요청 데이터의 JSON 형식이 올바르지 않습니다.")));
            e.printStackTrace();
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(new ApiResponse("error", "DB_ERROR", "데이터베이스 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")));
            e.printStackTrace();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(gson.toJson(new ApiResponse("error", "UNKNOWN_ERROR", "알 수 없는 오류가 발생했습니다.")));
            e.printStackTrace();
        }
    }
}