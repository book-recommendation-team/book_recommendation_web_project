package dto;

import java.time.LocalDateTime;

//클라이언트에게 사용자 정보를 응답할 때 사용할 데이터 구조 (비밀번호 등 민감 정보 제외)
public class UserResponse {
 private int userId;
 private String username;
 private String nickname;
 private String email;
 private String gender;
 private String mbti;
 private LocalDateTime regDate;
 private LocalDateTime lastLoginDate;

 public UserResponse(int userId, String username, String nickname, String email, String gender, String mbti, LocalDateTime regDate, LocalDateTime lastLoginDate) {
     this.userId = userId;
     this.username = username;
     this.nickname = nickname;
     this.email = email;
     this.gender = gender;
     this.mbti = mbti;
     this.regDate = regDate;
     this.lastLoginDate = lastLoginDate;
 }

 // Model의 User 객체를 DTO의 UserResponse 객체로 변환하는 헬퍼 메서드 (선택 사항, 유용함)
 public static UserResponse fromUser(model.User user) {
     return new UserResponse(
         user.getUserId(),
         user.getUsername(),
         user.getNickname(),
         user.getEmail(),
         user.getGender(),
         user.getMbti(),
         user.getRegDate(),
         user.getLastLoginDate()
     );
 }

 // Getter 메서드만 제공 (응답 데이터이므로 Setter는 보통 필요 없음)
 public int getUserId() { return userId; }
 public String getUsername() { return username; }
 public String getNickname() { return nickname; }
 public String getEmail() { return email; }
 public String getGender() { return gender; }
 public String getMbti() { return mbti; }
 public LocalDateTime getRegDate() { return regDate; }
 public LocalDateTime getLastLoginDate() { return lastLoginDate; }
}