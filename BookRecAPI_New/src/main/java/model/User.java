package model;

import java.time.LocalDateTime;
import java.util.Objects;

public class User {
    private int userId;
    private String username;
    private String password; // 암호화된 비밀번호
    private String nickname;
    private String email;
    private String gender; // ENUM 'M', 'F', 'O'
    private String mbti;   // VARCHAR(10)
    private LocalDateTime regDate;
    private LocalDateTime lastLoginDate;
    private String status; // <-- 이 필드가 추가되었습니다.

    // 기본 생성자
    public User() {}

    // 모든 필드를 초기화하는 생성자 (status 필드 포함)
    public User(int userId, String username, String password, String nickname, String email, String gender, String mbti, LocalDateTime regDate, LocalDateTime lastLoginDate, String status) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.email = email;
        this.gender = gender;
        this.mbti = mbti;
        this.regDate = regDate;
        this.lastLoginDate = lastLoginDate;
        this.status = status; // <-- 생성자에 status 필드 추가
    }

    // Getter와 Setter 메서드 (필수)
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getMbti() { return mbti; }
    public void setMbti(String mbti) { this.mbti = mbti; }

    public LocalDateTime getRegDate() { return regDate; }
    public void setRegDate(LocalDateTime regDate) { this.regDate = regDate; }

    public LocalDateTime getLastLoginDate() { return lastLoginDate; }
    public void setLastLoginDate(LocalDateTime lastLoginDate) { this.lastLoginDate = lastLoginDate; }

    // status 필드의 Getter와 Setter (새롭게 추가된 부분)
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return "User{" +
               "userId=" + userId +
               ", username='" + username + '\'' +
               ", nickname='" + nickname + '\'' +
               ", email='" + email + '\'' +
               ", gender='" + gender + '\'' +
               ", mbti='" + mbti + '\'' +
               ", regDate=" + regDate +
               ", lastLoginDate=" + lastLoginDate +
               ", status='" + status + '\'' + // <-- toString에도 status 추가
               '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return userId == user.userId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId);
    }
}