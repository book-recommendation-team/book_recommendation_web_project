package dto;

import java.time.LocalDateTime;

public class ReviewResponse {
    private final int reviewId;
    private final int bookId;
    private final String bookTitle; // 어떤 책에 대한 리뷰인지 보여주기 위함
    private final int rating;
    private final String title;
    private final String content;
    private final LocalDateTime createdAt;
    private final LocalDateTime updatedAt;

    public ReviewResponse(int reviewId, int bookId, String bookTitle, int rating, String title, String content, LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.reviewId = reviewId;
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.rating = rating;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getter 메서드
    public int getReviewId() { return reviewId; }
    public int getBookId() { return bookId; }
    public String getBookTitle() { return bookTitle; }
    public int getRating() { return rating; }
    public String getTitle() { return title; }
    public String getContent() { return content; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }

    @Override
    public String toString() {
        return "ReviewResponse{" +
               "reviewId=" + reviewId +
               ", bookId=" + bookId +
               ", bookTitle='" + bookTitle + '\'' +
               ", rating=" + rating +
               ", title='" + title + '\'' +
               '}';
    }
}