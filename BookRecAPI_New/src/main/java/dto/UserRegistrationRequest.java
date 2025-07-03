package dto;

//클라이언트로부터 회원가입 요청을 받을 때 사용할 데이터 구조
public class UserRegistrationRequest {
private String username;
private String password;
private String nickname;
private String email;
private String gender;
private String mbti;

public UserRegistrationRequest() {}

// 모든 필드를 포함하는 생성자 (선택 사항)
public UserRegistrationRequest(String username, String password, String nickname, String email, String gender, String mbti) {
   this.username = username;
   this.password = password;
   this.nickname = nickname;
   this.email = email;
   this.gender = gender;
   this.mbti = mbti;
}

// Getter 및 Setter 메서드
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
}