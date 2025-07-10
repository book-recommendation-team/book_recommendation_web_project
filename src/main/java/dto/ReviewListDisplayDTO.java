package dto;

import java.time.LocalDateTime;

public class ReviewListDisplayDTO {
    private int reviewId;
    private int userId; // <<-- 이 부분이 'int'로 되어 있어야 합니다!
    private String reviewText;
    private int rating;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    private int bookId;
    private String bookTitle;
    private String bookAuthor;
    private String bookCoverImageUrl;

    public ReviewListDisplayDTO() {}

    public ReviewListDisplayDTO(int reviewId, int userId, String reviewText, int rating,
                                LocalDateTime createdAt, LocalDateTime updatedAt,
                                int bookId, String bookTitle, String bookAuthor, String bookCoverImageUrl) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.reviewText = reviewText;
        this.rating = rating;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.bookId = bookId;
        this.bookTitle = bookTitle;
        this.bookAuthor = bookAuthor;
        this.bookCoverImageUrl = bookCoverImageUrl;
    }

    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; } // <<-- 이 메서드가 'int'를 받도록 되어 있어야 합니다!

    public String getReviewText() { return reviewText; }
    public void setReviewText(String reviewText) { this.reviewText = reviewText; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }

    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    public String getBookAuthor() { return bookAuthor; }
    public void setBookAuthor(String bookAuthor) { this.bookAuthor = bookAuthor; }

    public String getBookCoverImageUrl() { return bookCoverImageUrl; }
    public void setBookCoverImageUrl(String bookCoverImageUrl) { this.bookCoverImageUrl = bookCoverImageUrl; }

    @Override
    public String toString() {
        return "ReviewListDisplayDTO{" +
               "reviewId=" + reviewId +
               ", userId=" + userId +
               ", reviewText='" + reviewText + '\'' +
               ", rating=" + rating +
               ", createdAt=" + createdAt +
               ", updatedAt=" + updatedAt +
               ", bookId=" + bookId +
               ", bookTitle='" + bookTitle + '\'' +
               ", bookAuthor='" + bookAuthor + '\'' +
               ", bookCoverImageUrl='" + bookCoverImageUrl + '\'' +
               '}';
    }
}