package dto;

public class UserProfileUpdateRequest {
    private String nickname;
    private String email;
    private String gender;
    private String mbti;

    public UserProfileUpdateRequest() {}

    public UserProfileUpdateRequest(String nickname, String email, String gender, String mbti) {
        this.nickname = nickname;
        this.email = email;
        this.gender = gender;
        this.mbti = mbti;
    }

    // Getter 및 Setter 메서드
    public String getNickname() { return nickname; }
    public void setNickname(String nickname) { this.nickname = nickname; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getMbti() { return mbti; }
    public void setMbti(String mbti) { this.mbti = mbti; }

    @Override
    public String toString() {
        return "UserProfileUpdateRequest{" +
               "nickname='" + nickname + '\'' +
               ", email='" + email + '\'' +
               ", gender='" + gender + '\'' +
               ", mbti='" + mbti + '\'' +
               '}';
    }
}