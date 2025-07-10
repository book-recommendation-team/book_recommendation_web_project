package service;

import dao.ReviewDao;
import dto.ReviewResponse;
import dto.ReviewUpdateRequest;
import model.Review; // 필요하다면 Review 모델을 DAO에서 받아 처리할 수 있습니다.
import java.sql.SQLException;
import java.util.List;

public class ReviewService {
    private ReviewDao reviewDao;

    // 생성자를 통한 의존성 주입
    public ReviewService(ReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }

    /**
     * 특정 사용자가 작성한 모든 리뷰를 조회합니다.
     *
     * @param userId 조회할 사용자 ID
     * @return 리뷰 항목들의 리스트 (ReviewResponse DTO)
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public List<ReviewResponse> getMyReviews(int userId) throws SQLException {
        return reviewDao.getReviewsByUserId(userId);
    }

    /**
     * 사용자의 특정 리뷰를 수정합니다.
     *
     * @param reviewId 수정할 리뷰 ID
     * @param userId 리뷰를 작성한 사용자 ID (인가 검증용)
     * @param updateRequest 수정할 리뷰 정보 DTO
     * @return 성공 시 true
     * @throws SQLException 데이터베이스 오류 발생 시
     * @throws ReviewException 리뷰를 찾을 수 없거나 수정 실패 시
     */
    public boolean updateMyReview(int reviewId, int userId, ReviewUpdateRequest updateRequest) throws SQLException, ReviewException {
        // 1. DTO 필드 유효성 검증
        if (updateRequest.getRating() < 1 || updateRequest.getRating() > 5) {
            throw new ReviewException("INVALID_RATING", "별점은 1점에서 5점 사이여야 합니다.");
        }
        if (updateRequest.getTitle() == null || updateRequest.getTitle().trim().isEmpty()) {
            throw new ReviewException("INVALID_TITLE", "리뷰 제목은 필수입니다.");
        }
        if (updateRequest.getContent() == null || updateRequest.getContent().trim().isEmpty()) {
            throw new ReviewException("INVALID_CONTENT", "리뷰 내용은 필수입니다.");
        }

        // 2. 해당 리뷰가 존재하는지, 그리고 현재 사용자의 리뷰인지 확인 (DAO에서 이미 user_id로 검증)
        ReviewResponse existingReview = reviewDao.getReviewByIdAndUserId(reviewId, userId);
        if (existingReview == null) {
            throw new ReviewException("REVIEW_NOT_FOUND", "해당 리뷰를 찾을 수 없거나 수정 권한이 없습니다.");
        }

        // 3. DB 업데이트
        boolean success = reviewDao.updateReview(reviewId, userId, updateRequest);
        if (!success) {
            throw new ReviewException("UPDATE_FAILED", "리뷰 수정에 실패했습니다.");
        }
        return true;
    }

    /**
     * 사용자의 특정 리뷰를 삭제합니다.
     *
     * @param reviewId 삭제할 리뷰 ID
     * @param userId 리뷰를 작성한 사용자 ID (인가 검증용)
     * @return 성공 시 true
     * @throws SQLException 데이터베이스 오류 발생 시
     * @throws ReviewException 리뷰를 찾을 수 없거나 삭제 실패 시
     */
    public boolean deleteMyReview(int reviewId, int userId) throws SQLException, ReviewException {
        // 해당 리뷰가 존재하는지, 그리고 현재 사용자의 리뷰인지 확인 (DAO에서 이미 user_id로 검증)
        ReviewResponse existingReview = reviewDao.getReviewByIdAndUserId(reviewId, userId);
        if (existingReview == null) {
            throw new ReviewException("REVIEW_NOT_FOUND", "해당 리뷰를 찾을 수 없거나 삭제 권한이 없습니다.");
        }

        boolean success = reviewDao.deleteReview(reviewId, userId);
        if (!success) {
            throw new ReviewException("DELETE_FAILED", "리뷰 삭제에 실패했습니다.");
        }
        return true;
    }
}