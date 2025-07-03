package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import dto.WishlistItemResponse;
import model.Book; // Book 모델이 필요합니다.
import util.DBUtil;

public class WishlistDao {

    /**
     * 사용자의 찜 목록에 책을 추가합니다.
     *
     * @param userId 찜을 추가할 사용자 ID
     * @param bookId 찜할 책 ID
     * @return 성공 시 true, 실패 시 false (예: 이미 찜한 경우)
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean addWishlist(int userId, int bookId) throws SQLException {
        // UNIQUE (user_id, book_id) 제약조건으로 중복 방지
        String sql = "INSERT INTO Wishlists (user_id, book_id, added_at) VALUES (?, ?, NOW())";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, bookId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            // 중복 키 오류(Duplicate entry) 발생 시, 이미 찜한 것으로 간주하고 false 반환
            // MySQL에서는 Error Code 1062 (SQLSTATE 23000)
            if (e.getSQLState().equals("23000") && e.getErrorCode() == 1062) {
                System.out.println("Warning: User " + userId + " already wished book " + bookId);
                return false; // 이미 찜한 경우
            }
            throw e; // 그 외 다른 SQLException은 다시 던집니다.
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 사용자의 찜 목록에서 책을 제거합니다.
     *
     * @param userId 찜을 제거할 사용자 ID
     * @param bookId 제거할 책 ID
     * @return 성공 시 true, 실패 시 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean removeWishlist(int userId, int bookId) throws SQLException {
        String sql = "DELETE FROM Wishlists WHERE user_id = ? AND book_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, bookId);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } finally {
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 특정 사용자의 모든 찜 목록을 조회합니다.
     * 책 정보도 함께 가져와 WishlistItemResponse DTO 리스트로 반환합니다.
     *
     * @param userId 조회할 사용자 ID
     * @return 찜 목록 항목들의 리스트
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public List<WishlistItemResponse> getWishlistsByUserId(int userId) throws SQLException {
        String sql = "SELECT w.book_id, b.isbn, b.title, b.author, b.cover_image_url, w.added_at " +
                     "FROM Wishlists w JOIN Books b ON w.book_id = b.book_id " +
                     "WHERE w.user_id = ? ORDER BY w.added_at DESC";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<WishlistItemResponse> wishlists = new ArrayList<>();

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String isbn = rs.getString("isbn");
                String title = rs.getString("title");
                String author = rs.getString("author");
                String coverImageUrl = rs.getString("cover_image_url");
                LocalDateTime addedAt = rs.getTimestamp("added_at").toLocalDateTime();
                wishlists.add(new WishlistItemResponse(bookId, isbn, title, author, coverImageUrl, addedAt));
            }
            return wishlists;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }

    /**
     * 특정 책이 사용자의 찜 목록에 이미 있는지 확인합니다.
     *
     * @param userId 사용자 ID
     * @param bookId 책 ID
     * @return 찜 목록에 있으면 true, 없으면 false
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public boolean isBookInWishlist(int userId, int bookId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Wishlists WHERE user_id = ? AND book_id = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, bookId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
            return false;
        } finally {
            DBUtil.close(rs);
            DBUtil.close(pstmt);
            DBUtil.close(conn);
        }
    }
}