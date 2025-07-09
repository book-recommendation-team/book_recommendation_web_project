 package model;

import java.time.LocalDateTime;
import java.util.Objects; // for equals/hashCode

public class Review {
    private int reviewId;
    private int userId;
    private int bookId;
    private byte rating; // TINYINT는 Java에서 byte로 매핑됩니다 (1~5점)
    private String title;
    private String content;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    // 기본 생성자
    public Review() {}

    // 모든 필드를 포함하는 생성자
    public Review(int reviewId, int userId, int bookId, byte rating, String title, String content,
                  LocalDateTime createdAt, LocalDateTime updatedAt) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.bookId = bookId;
        this.rating = rating;
        this.title = title;
        this.content = content;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    // Getter 및 Setter 메서드
    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public byte getRating() { return rating; }
    public void setRating(byte rating) { this.rating = rating; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    @Override
    public String toString() {
        return "Review{" +
               "reviewId=" + reviewId +
               ", userId=" + userId +
               ", bookId=" + bookId +
               ", rating=" + rating +
               ", title='" + title + '\'' +
               ", createdAt=" + createdAt +
               '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Review review = (Review) o;
        return reviewId == review.reviewId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(reviewId);
    }
}