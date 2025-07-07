package service;

import dao.WishlistDao;
import dto.WishlistItemResponse;
import java.sql.SQLException;
import java.util.List;

// 찜 목록 관련 비즈니스 로직에서 발생할 수 있는 특정 예외

public class WishlistService {
    private WishlistDao wishlistDao;

    // 생성자를 통한 의존성 주입
    public WishlistService(WishlistDao wishlistDao) {
        this.wishlistDao = wishlistDao;
    }

    /**
     * 사용자의 찜 목록에 책을 추가합니다.
     *
     * @param userId 찜을 추가할 사용자 ID
     * @param bookId 찜할 책 ID
     * @return 성공 시 true
     * @throws SQLException 데이터베이스 오류 발생 시
     * @throws WishlistException 이미 찜한 책이거나 추가 실패 시
     */
    public boolean addWishlist(int userId, int bookId) throws SQLException, WishlistException {
        // 이미 찜 목록에 있는지 서비스 계층에서 한 번 더 확인 (DAO에서도 UNIQUE 제약조건으로 방어되나, 서비스에서 명시적 예외 처리)
        if (wishlistDao.isBookInWishlist(userId, bookId)) {
            throw new WishlistException("DUPLICATE_WISHLIST", "이미 찜 목록에 있는 책입니다.");
        }

        boolean success = wishlistDao.addWishlist(userId, bookId);
        if (!success) {
            throw new WishlistException("ADD_FAILED", "찜 목록 추가에 실패했습니다.");
        }
        return true;
    }

    /**
     * 사용자의 찜 목록에서 책을 제거합니다.
     *
     * @param userId 찜을 제거할 사용자 ID
     * @param bookId 제거할 책 ID
     * @return 성공 시 true
     * @throws SQLException 데이터베이스 오류 발생 시
     * @throws WishlistException 찜 목록에 없는 책을 제거 시도하거나 제거 실패 시
     */
    public boolean removeWishlist(int userId, int bookId) throws SQLException, WishlistException {
        // 찜 목록에 없는 책을 제거하려는지 확인
        if (!wishlistDao.isBookInWishlist(userId, bookId)) {
            throw new WishlistException("NOT_IN_WISHLIST", "찜 목록에 없는 책입니다.");
        }

        boolean success = wishlistDao.removeWishlist(userId, bookId);
        if (!success) {
            throw new WishlistException("REMOVE_FAILED", "찜 목록 제거에 실패했습니다.");
        }
        return true;
    }

    /**
     * 특정 사용자의 찜 목록을 조회합니다.
     *
     * @param userId 조회할 사용자 ID
     * @return 찜 목록 항목들의 리스트 (WishlistItemResponse DTO)
     * @throws SQLException 데이터베이스 오류 발생 시
     */
    public List<WishlistItemResponse> getWishlistsByUserId(int userId) throws SQLException {
        return wishlistDao.getWishlistsByUserId(userId);
    }
}