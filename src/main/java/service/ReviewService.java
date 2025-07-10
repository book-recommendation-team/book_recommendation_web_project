package service;

import dao.ReviewBookDAO;
import dao.ReviewDAO;
import dao.ContentBlockDAO; // ContentBlockDAO 임포트
import model.Review;
import model.ReviewBook;
import model.ContentBlock; // ContentBlock 모델 임포트
import dto.ReviewListDisplayDTO;
import dto.ReviewDetailDisplayDTO; // 새로 만든 DTO 임포트

import java.sql.SQLException;
import java.util.List;
import java.time.LocalDateTime;

public class ReviewService {
    private final ReviewBookDAO reviewBookDAO = new ReviewBookDAO();
    private final ReviewDAO reviewDAO = new ReviewDAO();
    private final ContentBlockDAO contentBlockDAO = new ContentBlockDAO(); // ContentBlockDAO 인스턴스 생성

    
    
    public boolean deleteReview(int reviewId, int callingUserId) throws SQLException {
        // 1. 삭제 권한 확인 (선택 사항이지만 중요)
        // 리뷰 작성자와 삭제 요청자가 같은지 확인합니다.
        ReviewListDisplayDTO reviewToDelete = reviewDAO.getReviewByIdWithBookInfo(reviewId);
        if (reviewToDelete == null) {
            System.out.println("Review with ID " + reviewId + " not found.");
            return false; // 리뷰가 존재하지 않음
        }
        if (reviewToDelete.getUserId() != callingUserId) {
            System.out.println("User " + callingUserId + " does not have permission to delete review " + reviewId);
            return false; // 권한 없음
        }

        // 2. 해당 리뷰의 ContentBlock들을 먼저 삭제
        int contentBlocksDeleted = contentBlockDAO.deleteByReviewId(reviewId);
        System.out.println(contentBlocksDeleted + " content blocks deleted for review ID " + reviewId);

        // 3. Review 본체를 삭제
        int reviewsDeleted = reviewDAO.delete(reviewId);
        System.out.println(reviewsDeleted + " review entries deleted for review ID " + reviewId);

        return reviewsDeleted > 0; // 1개 이상 삭제되었으면 성공
    }
    /**
     * 리뷰 작성을 처리하는 핵심 서비스 메서드.
     * 책 정보를 바탕으로 ReviewBook을 찾거나 생성하고, Review를 저장합니다.
     * @param userId 로그인한 사용자 ID (int 타입)
     * @param reviewBookData form에서 넘어온 책 정보 (ISBN, 제목 등)
     * @param reviewText 리뷰 내용
     * @param rating 별점
     * @return 새로 생성된 review_id 또는 -1 (실패 시)
     * @throws SQLException DB 작업 중 오류 발생 시
     */
    public int submitReview(int userId, ReviewBook reviewBookData, String reviewText, int rating) throws SQLException {
        int bookId;
        ReviewBook existingBook = reviewBookDAO.findByIsbn(reviewBookData.getIsbn());

        if (existingBook != null) {
            // 이미 존재하는 책이면 해당 book_id 사용
            bookId = existingBook.getBookId();
            System.out.println("Existing book found. Using book_id: " + bookId); // 디버깅용
        } else {
            // 새로운 책이면 ReviewBook에 삽입하고 생성된 book_id 가져오기
            bookId = reviewBookDAO.insert(reviewBookData);
            if (bookId == -1) {
                // 책 삽입 실패 시
                System.err.println("Failed to insert new book into ReviewBook table.");
                return -1;
            }
            System.out.println("New book inserted. Generated book_id: " + bookId); // 디버깅용
        }

        // 리뷰 객체 생성
        Review review = new Review();
        review.setUserId(userId); // int userId 설정
        review.setBookId(bookId);
        review.setReviewText(reviewText);
        review.setRating(rating);
        // created_at, updated_at은 DB에서 자동으로 설정되지만, 필요하면 여기서도 설정 가능
        review.setCreatedAt(LocalDateTime.now());
        review.setUpdatedAt(LocalDateTime.now());

        // reviews 테이블에 리뷰 삽입
        int reviewId = reviewDAO.insert(review);
        System.out.println("Review inserted. Generated review_id: " + reviewId); // 디버깅용

        return reviewId;
    }

    /**
     * 리뷰 목록 페이지에 표시할 모든 리뷰와 책 정보를 가져옵니다.
     * @return ReviewListDisplayDTO 객체들의 리스트
     * @throws SQLException DB 오류 시
     */
    public List<ReviewListDisplayDTO> getAllReviewsForDisplay() throws SQLException {
        return reviewDAO.getAllReviewsWithBookInfo();
    }

    /**
     * 특정 리뷰 상세와 해당 책 정보, 그리고 모든 내용 블록들을 가져옵니다.
     * ReviewDetailServlet에서 사용됩니다.
     * @param reviewId 조회할 리뷰 ID
     * @return ReviewDetailDisplayDTO 객체 (없으면 null)
     * @throws SQLException DB 오류 시
     */
    public ReviewDetailDisplayDTO getReviewDetailWithContentBlocks(int reviewId) throws SQLException {
        // 1. 리뷰 기본 정보 (Review + ReviewBook) 조회
        ReviewListDisplayDTO listDisplayDto = reviewDAO.getReviewByIdWithBookInfo(reviewId);

        if (listDisplayDto == null) {
            return null; // 해당 reviewId의 리뷰가 없으면 null 반환
        }

        // 2. 해당 리뷰의 ContentBlock들 조회
        List<ContentBlock> contentBlocks = contentBlockDAO.findByReviewId(reviewId);

        // 3. ReviewDetailDisplayDTO에 모든 정보 조합
        ReviewDetailDisplayDTO detailDto = new ReviewDetailDisplayDTO();
        // ReviewListDisplayDTO의 필드들을 ReviewDetailDisplayDTO로 복사 (상속받았으므로 setter 사용)
        detailDto.setReviewId(listDisplayDto.getReviewId());
        detailDto.setUserId(listDisplayDto.getUserId());
        detailDto.setReviewText(listDisplayDto.getReviewText());
        detailDto.setRating(listDisplayDto.getRating());
        detailDto.setCreatedAt(listDisplayDto.getCreatedAt());
        detailDto.setUpdatedAt(listDisplayDto.getUpdatedAt());
        detailDto.setBookId(listDisplayDto.getBookId());
        detailDto.setBookTitle(listDisplayDto.getBookTitle());
        detailDto.setBookAuthor(listDisplayDto.getBookAuthor());
        detailDto.setBookCoverImageUrl(listDisplayDto.getBookCoverImageUrl());
        // 필요하다면 listDisplayDto에 naverLink, isbn, publisher 등 추가 정보가 있다면 여기에 복사 설정

        detailDto.setContentBlocks(contentBlocks); // ContentBlock 리스트 설정

        return detailDto;
    }

    // 이전에 사용되었던 getReviewDetailForDisplay 메서드는 이제 getReviewDetailWithContentBlocks로 대체됩니다.
    // 하지만 만약 다른 곳에서 이 메서드를 호출한다면 유지해야 합니다.
    // 현재 ReviewDetailServlet에서 getReviewDetailWithContentBlocks를 사용하므로 이 메서드는 더 이상 직접 호출되지 않을 수 있습니다.
    public ReviewListDisplayDTO getReviewDetailForDisplay(int reviewId) throws SQLException {
        return reviewDAO.getReviewByIdWithBookInfo(reviewId);
    }
}