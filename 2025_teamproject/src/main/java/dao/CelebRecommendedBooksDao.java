package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.CelebRecommendedBooks;

public class CelebRecommendedBooksDao {
    private Connection conn;

    public CelebRecommendedBooksDao(Connection conn) {
        this.conn = conn;
    }

    // 셀럽 ID로 추천한 책 목록 가져오기 (order_in_rec 순서대로)
    public List<CelebRecommendedBooks> getBooksByCelebId(int celebRecId) throws SQLException {
        List<CelebRecommendedBooks> list = new ArrayList<>();
        String sql = "SELECT celeb_rec_book_id, celeb_rec_id, book_id, order_in_rec FROM celeb_recommended_books WHERE celeb_rec_id = ? ORDER BY order_in_rec";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, celebRecId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    CelebRecommendedBooks crb = new CelebRecommendedBooks();
                    crb.setCeleb_rec_book_id(rs.getInt("celeb_rec_book_id"));
                    crb.setCeleb_rec_id(rs.getInt("celeb_rec_id"));
                    crb.setBook_id(rs.getInt("book_id"));
                    crb.setOrder_in_rec(rs.getInt("order_in_rec"));
                    list.add(crb);
                }
            }
        }
        return list;
    }
}
