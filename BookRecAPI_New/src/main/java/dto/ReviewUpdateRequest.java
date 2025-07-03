package dto;

public class ReviewUpdateRequest {
    private int rating;
    private String title;
    private String content;

    public ReviewUpdateRequest() {}

    public ReviewUpdateRequest(int rating, String title, String content) {
        this.rating = rating;
        this.title = title;
        this.content = content;
    }

    // Getter 및 Setter 메서드
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    @Override
    public String toString() {
        return "ReviewUpdateRequest{" +
               "rating=" + rating +
               ", title='" + title + '\'' +
               '}';
    }
}