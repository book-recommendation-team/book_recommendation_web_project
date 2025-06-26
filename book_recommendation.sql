--  Users 테이블 (회원 정보)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) UNIQUE,
    gender ENUM('M', 'F', 'O'), -- 'M': 남성, 'F': 여성, 'O': 기타/선택안함
    mbti VARCHAR(10),
    reg_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login_date DATETIME
);

-- Books 테이블 (책 정보)
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL UNIQUE, -- 국제 표준 도서 번호
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    publisher VARCHAR(100),
    pub_date DATE,
    description TEXT,
    cover_image_url VARCHAR(500),
    link VARCHAR(500)
);

-- Reviews 테이블 (리뷰 정보)
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    rating TINYINT NOT NULL, -- 별점 (예: 1~5점)
    title VARCHAR(255),
    content TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 수정 시 자동 업데이트
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);



-- Playlists 테이블 (사용자 플레이리스트)
CREATE TABLE Playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


-- PlaylistBooks 테이블 (플레이리스트-책 관계: N:M 해소)
CREATE TABLE PlaylistBooks (
    playlist_book_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    book_id INT NOT NULL,
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (playlist_id) REFERENCES Playlists(playlist_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    UNIQUE (playlist_id, book_id)
);

-- UserInterests 테이블 (사용자 취미/관심사)
CREATE TABLE UserInterests (
    user_interest_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    interest_tag VARCHAR(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    UNIQUE (user_id, interest_tag)
);


-- Hashtags 테이블 (해시태그 정보)
CREATE TABLE Hashtags (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(50) NOT NULL UNIQUE
);


-- BookHashtags 테이블 (책-해시태그 관계: N:M 해소)
CREATE TABLE BookHashtags (
    book_hashtag_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Hashtags(tag_id) ON DELETE CASCADE,
    UNIQUE (book_id, tag_id)
);


-- CelebRecommendations 테이블 (셀럽 추천 정보)
CREATE TABLE CelebRecommendations (
    celeb_rec_id INT AUTO_INCREMENT PRIMARY KEY,
    celeb_name VARCHAR(100) NOT NULL,
    celeb_description TEXT,
    celeb_image_url VARCHAR(500),
    recommend_date DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- CelebRecommendedBooks 테이블 (셀럽 추천-책 관계: N:M 해소)
CREATE TABLE CelebRecommendedBooks (
    celeb_rec_book_id INT AUTO_INCREMENT PRIMARY KEY,
    celeb_rec_id INT NOT NULL,
    book_id INT NOT NULL,
    order_in_rec INT, -- 추천 목록 내 순서 (선택 사항)
    FOREIGN KEY (celeb_rec_id) REFERENCES CelebRecommendations(celeb_rec_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    UNIQUE (celeb_rec_id, book_id)
);


-- Wishlists 테이블 (찜 목록)
CREATE TABLE Wishlists (
    wish_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL, -- 찜한 대상이 책이라고 가정
    added_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    UNIQUE (user_id, book_id)
);

