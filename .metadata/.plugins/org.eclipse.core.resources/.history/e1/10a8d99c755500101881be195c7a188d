package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.CelebRecommendations;

public class CelebRecommendationsDao {
    private Connection conn;

    public CelebRecommendationsDao(Connection conn) {
        this.conn = conn;
    }

    // 전체 셀럽 목록 가져오기 (그리드용)
    public List<CelebRecommendations> getAllCelebs() throws SQLException {
        List<CelebRecommendations> list = new ArrayList<>();
        String sql = "SELECT celeb_rec_id, celeb_name, celeb_description, celeb_image_url, recommend_date FROM celeb_recommendations";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CelebRecommendations celeb = new CelebRecommendations();
                celeb.setCeleb_rec_id(rs.getInt("celeb_rec_id"));
                celeb.setCeleb_name(rs.getString("celeb_name"));
                celeb.setCeleb_description(rs.getString("celeb_description"));
                celeb.setCeleb_image_url(rs.getString("celeb_image_url"));
                celeb.setRecommend_date(rs.getDate("recommend_date"));
                list.add(celeb);
            }
        }
        return list;
    }

    // 특정 셀럽 상세 정보 가져오기 (필요시)
    public CelebRecommendations getCelebById(int celebId) throws SQLException {
        String sql = "SELECT celeb_rec_id, celeb_name, celeb_description, celeb_image_url, recommend_date FROM celeb_recommendations WHERE celeb_rec_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, celebId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    CelebRecommendations celeb = new CelebRecommendations();
                    celeb.setCeleb_rec_id(rs.getInt("celeb_rec_id"));
                    celeb.setCeleb_name(rs.getString("celeb_name"));
                    celeb.setCeleb_description(rs.getString("celeb_description"));
                    celeb.setCeleb_image_url(rs.getString("celeb_image_url"));
                    celeb.setRecommend_date(rs.getDate("recommend_date"));
                    return celeb;
                }
            }
        }
        return null; // 없으면 null 반환
    }
}
