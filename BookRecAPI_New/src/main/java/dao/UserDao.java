package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;

import model.User; // User 모델
import dto.UserProfileUpdateRequest; // UserProfileUpdateRequest DTO 임포트
import util.DBUtil; // DB 연결 유틸리티

public class UserDao {

    /**
     * 새로운 사용자를 데이터베이스에 추가합니다.
     * User 모델에 'status' 필드를 추가했으므로, INSERT 쿼리에 'status' 컬럼을 명시적으로 포함합니다.
     * 'status'는 기본적으로 'active'로 설정됩니다.
     *
     * @param user 추가할 사용자 정보 객체 (password는 이미 해싱된 상태여야 함)
     * @return 데이터베이스에 저장된 사용자 정보 (user_id 포함) 또는 null (실패 시)
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public User createUser(User user) throws SQLException {
        // 'status' 컬럼을 명시적으로 추가하여 'active'로 설정
        String sql = "INSERT INTO Users (username, password, nickname, email, gender, mbti, reg_date, status) VALUES (?, ?, ?, ?, ?, ?, NOW(), 'active')";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getNickname());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getMbti());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    user.setUserId(rs.getInt(1));
                    user.setRegDate(LocalDateTime.now());
                    user.setStatus("active"); // 생성 시 status 설정 동기화
                    return user;
                }
            }
            return null;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자 이름으로 사용자를 조회합니다. (로그인 및 중복 확인용)
     * 'status' 컬럼을 함께 조회하여 계정 상태를 확인할 수 있도록 합니다.
     *
     * @param username 조회할 사용자 이름
     * @return 해당 사용자 객체 또는 null (사용자가 없는 경우)
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public User findByUsername(String username) throws SQLException {
        // 'status' 컬럼 추가하여 조회
        String sql = "SELECT user_id, username, password, nickname, email, gender, mbti, reg_date, last_login_date, status FROM Users WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setMbti(rs.getString("mbti"));
                user.setRegDate(rs.getTimestamp("reg_date") != null ? rs.getTimestamp("reg_date").toLocalDateTime() : null);
                user.setLastLoginDate(rs.getTimestamp("last_login_date") != null ? rs.getTimestamp("last_login_date").toLocalDateTime() : null);
                user.setStatus(rs.getString("status")); // status 필드 매핑
            }
            return user;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 이메일로 사용자를 조회합니다. (중복 확인용)
     *
     * @param email 조회할 이메일
     * @return 이메일이 존재하는지 여부
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public boolean isEmailTaken(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users WHERE email = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자 이름(username)이 이미 사용 중인지 확인합니다. (중복 확인용)
     *
     * @param username 확인할 사용자 이름
     * @return 사용자 이름이 이미 사용 중이면 true, 아니면 false
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public boolean isUsernameTaken(String username) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users WHERE username = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 닉네임이 이미 사용 중인지 확인합니다. (중복 확인용)
     *
     * @param nickname 확인할 닉네임
     * @return 닉네임이 이미 사용 중이면 true, 아니면 false
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public boolean isNicknameTaken(String nickname) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users WHERE nickname = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nickname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자 로그인 시간 업데이트
     *
     * @param userId 로그인한 사용자 ID
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public void updateLastLoginDate(int userId) throws SQLException {
        String sql = "UPDATE Users SET last_login_date = NOW() WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.executeUpdate();
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

  

    /**
     * 사용자 ID로 사용자를 조회합니다. (마이페이지 프로필 조회용)
     * 'status' 컬럼을 함께 조회하여 사용자 상태를 확인할 수 있도록 합니다.
     *
     * @param userId 조회할 사용자 ID
     * @return 해당 사용자 객체 또는 null
     * @throws SQLException 데이터베이스 작업 중 오류 발생 시
     */
    public User findByUserId(int userId) throws SQLException {
        // 'status' 컬럼 추가하여 조회
        String sql = "SELECT user_id, username, password, nickname, email, gender, mbti, reg_date, last_login_date, status FROM Users WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        User user = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setNickname(rs.getString("nickname"));
                user.setEmail(rs.getString("email"));
                user.setGender(rs.getString("gender"));
                user.setMbti(rs.getString("mbti"));
                user.setRegDate(rs.getTimestamp("reg_date") != null ? rs.getTimestamp("reg_date").toLocalDateTime() : null);
                user.setLastLoginDate(rs.getTimestamp("last_login_date") != null ? rs.getTimestamp("last_login_date").toLocalDateTime() : null);
                user.setStatus(rs.getString("status")); // status 필드 매핑
            }
            return user;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자 프로필 정보를 업데이트합니다.
     * (닉네임, 이메일, 성별, MBTI)
     * 이메일과 닉네임의 중복 확인은 서비스 계층에서 먼저 수행되어야 합니다.
     *
     * @param userId 사용자 ID
     * @param reqDto 업데이트할 프로필 정보 (UserProfileUpdateRequest DTO 사용)
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean updateUserProfile(int userId, UserProfileUpdateRequest reqDto) throws SQLException {
        String sql = "UPDATE Users SET nickname = ?, email = ?, gender = ?, mbti = ? WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reqDto.getNickname());
            pstmt.setString(2, reqDto.getEmail());
            pstmt.setString(3, reqDto.getGender());
            pstmt.setString(4, reqDto.getMbti());
            pstmt.setInt(5, userId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자의 비밀번호를 업데이트합니다. (해싱된 비밀번호)
     *
     * @param userId 사용자 ID
     * @param newHashedPassword 새로 해싱된 비밀번호
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean updatePassword(int userId, String newHashedPassword) throws SQLException {
        String sql = "UPDATE Users SET password = ? WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, newHashedPassword);
            pstmt.setInt(2, userId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자의 상태를 업데이트합니다. (예: 'active', 'inactive', 'withdrawn')
     * 회원 탈퇴 기능에 사용됩니다.
     *
     * @param userId 사용자 ID
     * @param status 변경할 상태 문자열 ('active', 'inactive', 'withthrown')
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean updateUserStatus(int userId, String status) throws SQLException {
        String sql = "UPDATE Users SET status = ? WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setInt(2, userId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }
}