package servlet;

import dao.UserDao;
import dto.ApiResponse;
import dto.UserRegistrationRequest;
import dto.UserResponse;
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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/api/users")
public class UserRegistrationServlet extends HttpServlet {
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
        // --- 여기를 수정했습니다 ---
        response.setContentType("application/json; charset=UTF-8");
        // --- 수정 끝 ---
        response.setCharacterEncoding("UTF-8"); // 이 줄은 그대로 둡니다.
        PrintWriter out = response.getWriter();

        try {
            UserRegistrationRequest reqDto = gson.fromJson(request.getReader(), UserRegistrationRequest.class);

            if (reqDto.getUsername() == null || reqDto.getUsername().trim().isEmpty() ||
                reqDto.getPassword() == null || reqDto.getPassword().trim().isEmpty() ||
                reqDto.getNickname() == null || reqDto.getNickname().trim().isEmpty() ||
                reqDto.getEmail() == null || reqDto.getEmail().trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "INVALID_INPUT", "필수 정보(사용자 이름, 비밀번호, 닉네임, 이메일)가 누락되었습니다.")));
                return;
            }

            if (reqDto.getPassword().length() < 8 || !reqDto.getPassword().matches(".*[!@#$%^&*()].*")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "INVALID_PASSWORD", "비밀번호는 최소 8자 이상이어야 하며 특수문자를 포함해야 합니다.")));
                return;
            }

            if (!reqDto.getEmail().matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$")) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "INVALID_EMAIL", "유효하지 않은 이메일 형식입니다.")));
                return;
            }

            String[] validMbti = {"ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP",
                                  "ESTP", "ESFP", "ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ"};
            boolean isValidMbti = false;
            if (reqDto.getMbti() != null && !reqDto.getMbti().trim().isEmpty()) {
                for (String mbti : validMbti) {
                    if (mbti.equalsIgnoreCase(reqDto.getMbti())) {
                        isValidMbti = true;
                        break;
                    }
                }
                if (!isValidMbti) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.print(gson.toJson(new ApiResponse("error", "INVALID_MBTI", "유효하지 않은 MBTI 유형입니다.")));
                    return;
                }
            }

            if (userDao.isUsernameTaken(reqDto.getUsername())) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "DUPLICATE_USERNAME", "이미 사용 중인 사용자 이름입니다.")));
                return;
            }
            if (userDao.isNicknameTaken(reqDto.getNickname())) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "DUPLICATE_NICKNAME", "이미 사용 중인 닉네임입니다.")));
                return;
            }
            if (userDao.isEmailTaken(reqDto.getEmail())) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print(gson.toJson(new ApiResponse("error", "DUPLICATE_EMAIL", "이미 사용 중인 이메일입니다.")));
                return;
            }

            String hashedPassword = passwordEncoder.encode(reqDto.getPassword());

            User newUser = new User();
            newUser.setUsername(reqDto.getUsername());
            newUser.setPassword(hashedPassword);
            newUser.setNickname(reqDto.getNickname());
            newUser.setEmail(reqDto.getEmail());
            newUser.setGender(reqDto.getGender());
            newUser.setMbti(reqDto.getMbti());

            User createdUser = userDao.createUser(newUser);

            if (createdUser != null) {
                UserResponse userResponse = UserResponse.fromUser(createdUser);
                response.setStatus(HttpServletResponse.SC_CREATED);
                out.print(gson.toJson(new ApiResponse("success", userResponse, "회원가입이 완료되었습니다.")));
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print(gson.toJson(new ApiResponse("error", "REGISTRATION_FAILED", "사용자 등록에 실패했습니다. 관리자에게 문의하세요.")));
            }

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