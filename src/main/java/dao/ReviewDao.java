package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dto.ReviewResponse;
import dto.ReviewUpdateRequest;
import model.Review; // Review 모델이 필요합니다.
import util.DBUtil;

public class ReviewDao {

    /**
     * 사용자가 작성한 모든 리뷰를 조회합니다.
     * 리뷰된 책의 제목을 함께 가져와 ReviewResponse DTO 리스트로 반환합니다.
     *
     * @param userId 조회할 사용자 ID
     * @return 리뷰 항목들의 리스트
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public List<ReviewResponse> getReviewsByUserId(int userId) throws SQLException {
        String sql = "SELECT r.review_id, r.book_id, b.title AS book_title, r.rating, r.title, r.content, r.created_at, r.updated_at " +
                     "FROM Reviews r JOIN Books b ON r.book_id = b.book_id " +
                     "WHERE r.user_id = ? ORDER BY r.created_at DESC";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ReviewResponse> reviews = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int reviewId = rs.getInt("review_id");
                int bookId = rs.getInt("book_id");
                String bookTitle = rs.getString("book_title");
                int rating = rs.getByte("rating");
                String title = rs.getString("title");
                String content = rs.getString("content");
                LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updatedAt = rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null;
                reviews.add(new ReviewResponse(reviewId, bookId, bookTitle, rating, title, content, createdAt, updatedAt));
            }
            return reviews;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 특정 사용자가 작성한 특정 리뷰의 상세 정보를 조회합니다.
     * 보안을 위해 user_id도 함께 검증합니다.
     *
     * @param reviewId 조회할 리뷰 ID
     * @param userId   조회할 리뷰의 사용자 ID
     * @return 해당 리뷰의 ReviewResponse 객체 또는 null
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public ReviewResponse getReviewByIdAndUserId(int reviewId, int userId) throws SQLException {
        String sql = "SELECT r.review_id, r.book_id, b.title AS book_title, r.rating, r.title, r.content, r.created_at, r.updated_at " +
                     "FROM Reviews r JOIN Books b ON r.book_id = b.book_id " +
                     "WHERE r.review_id = ? AND r.user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ReviewResponse review = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewId);
            pstmt.setInt(2, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                int bookId = rs.getInt("book_id");
                String bookTitle = rs.getString("book_title");
                int rating = rs.getByte("rating");
                String title = rs.getString("title");
                String content = rs.getString("content");
                LocalDateTime createdAt = rs.getTimestamp("created_at").toLocalDateTime();
                LocalDateTime updatedAt = rs.getTimestamp("updated_at") != null ? rs.getTimestamp("updated_at").toLocalDateTime() : null;
                review = new ReviewResponse(reviewId, bookId, bookTitle, rating, title, content, createdAt, updatedAt);
            }
            return review;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자가 작성한 리뷰의 내용을 수정합니다.
     * 보안을 위해 user_id도 함께 검증합니다.
     *
     * @param reviewId 수정할 리뷰 ID
     * @param userId   리뷰를 작성한 사용자 ID
     * @param reqDto   수정할 리뷰 정보 (rating, title, content)
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean updateReview(int reviewId, int userId, ReviewUpdateRequest reqDto) throws SQLException {
        String sql = "UPDATE Reviews SET rating = ?, title = ?, content = ? WHERE review_id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setByte(1, (byte) reqDto.getRating());
            pstmt.setString(2, reqDto.getTitle());
            pstmt.setString(3, reqDto.getContent());
            pstmt.setInt(4, reviewId);
            pstmt.setInt(5, userId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자가 작성한 리뷰를 삭제합니다.
     * 보안을 위해 user_id도 함께 검증합니다.
     *
     * @param reviewId 삭제할 리뷰 ID
     * @param userId   리뷰를 작성한 사용자 ID
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean deleteReview(int reviewId, int userId) throws SQLException {
        String sql = "DELETE FROM Reviews WHERE review_id = ? AND user_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewId);
            pstmt.setInt(2, userId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }
}