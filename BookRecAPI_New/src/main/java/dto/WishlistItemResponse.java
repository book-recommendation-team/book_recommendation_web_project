package dto;

import java.time.LocalDateTime;

public class WishlistItemResponse {
    private final int bookId;
    private final String isbn;
    private final String title;
    private final String author;
    private final String coverImageUrl;
    private final LocalDateTime addedAt; // 찜한 시각

    public WishlistItemResponse(int bookId, String isbn, String title, String author, String coverImageUrl, LocalDateTime addedAt) {
        this.bookId = bookId;
        this.isbn = isbn;
        this.title = title;
        this.author = author;
        this.coverImageUrl = coverImageUrl;
        this.addedAt = addedAt;
    }

    // Getter 메서드
    public int getBookId() { return bookId; }
    public String getIsbn() { return isbn; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public String getCoverImageUrl() { return coverImageUrl; }
    public LocalDateTime getAddedAt() { return addedAt; }

    @Override
    public String toString() {
        return "WishlistItemResponse{" +
               "bookId=" + bookId +
               ", title='" + title + '\'' +
               ", author='" + author + '\'' +
               ", addedAt=" + addedAt +
               '}';
    }
}