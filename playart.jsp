<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예술/문화 - 책 추천</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="img/icon2.png" type="image/x-icon">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #eff7e8;
            padding: 0px;
        }

        #logo img {
            width: 200px;
            height: auto;
            margin-left: 150px;
        }

        #search-box {
            padding: 12px;
            width: 500px;
            border: 1px solid #ccc;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .search-group {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            align-items: center;
        }

        #search-btn {
            background-color: #e6f0d7;
            border: none;
            padding: 10px 16px;
            margin-left: 8px;
            font-weight: bold;
            cursor: pointer;
            border-radius: 4px;
        }

        #search-btn:hover {
            background-color: #cce0b8;
        }

        #user-buttons {
            display: flex;
            gap: 10px;
            margin-right: 150px;
        }

        #user-buttons button {
            background-color: #e6f0d7;
            border: none;
            padding: 10px 16px;
            cursor: pointer;
            width: 90px;
            font-weight: bold;
        }

        nav {
            background-color: #e6f0d7;
            text-align: center;
            padding: 15px 0;
        }

        nav a {
            text-decoration: none;
            margin: 0 40px;
            color: #000;
            font-weight: bold;
        }

        nav a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-header {
            position: relative;
            text-align: center;
            margin: 40px 0;
        }

        .back-button {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 50px;
            height: 50px;
            background-color: #e6f0d7;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            color: #446b3c;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #cce0b8;
        }

        .page-title {
            text-align: center;
            font-size: 2.5em;
            font-weight: bold;
            color: #446b3c;
            margin: 0;
        }

        /* 상단 영상 및 추천 도서 섹션 */
        .main-content {
            display: flex;
            gap: 30px;
            margin-top: 30px;
            align-items: flex-start;
        }

        .video-section {
            flex: 1;
            width: 50%;
        }

        .video-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #446b3c;
            margin-bottom: 15px;
        }

        .video-container {
            height: 370px; /* 고정 높이 설정 */
        }

        .video-container iframe {
            width: 100%;
            height: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .books-section {
            flex: 1;
            width: 50%;
            height: 415px; /* 제목 + 컨테이너 높이 */
        }

        .books-title {
            font-size: 1.5em;
            font-weight: bold;
            color: #446b3c;
            margin-bottom: 15px;
        }

        .featured-book {
            display: flex;
            gap: 20px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            height: 330px; /* 고정 높이 설정 */
            align-items: center; /* 모든 내용을 세로 중앙 정렬 */
            transition: box-shadow 0.3s ease; /* 카드 전체에도 호버 효과 */
        }

        .featured-book:hover {
            box-shadow: 0 6px 20px rgba(0,0,0,0.15); /* 호버 시 카드 그림자 강화 */
        }

        .featured-book-image {
            flex: 0 0 140px; /* 너비를 조금 늘림 */
            width: 140px;
            height: 200px; /* 높이를 늘림 */
            align-self: center; /* 세로 중앙 정렬 */
            transform: perspective(600px) rotateY(-15deg); /* 3D 회전 효과 */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* 부드러운 전환 */
            cursor: pointer;
        }

        .featured-book-image:hover {
            transform: perspective(600px) rotateY(0deg) scale(1.05); /* 호버 시 정면으로 돌아오며 확대 */
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 강화 */
        }

        .featured-book-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 6px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); /* 기본 그림자 */
            transition: transform 0.3s ease; /* 이미지 자체에도 전환 효과 */
        }

        .featured-book-image:hover img {
            transform: scale(1.02); /* 호버 시 이미지 살짝 확대 */
        }

        .featured-book-info {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .featured-book-title {
            font-size: 1.1em;
            font-weight: bold;
            color: #333;
            margin-bottom: 8px;
        }

        .featured-book-author {
            font-size: 0.9em;
            color: #666;
            margin-bottom: 8px;
        }

        .featured-book-rating {
            display: flex;
            align-items: center;
            gap: 5px;
            margin-bottom: 8px;
        }

        .stars {
            color: #f39c12;
        }

        .featured-book-description {
            font-size: 0.85em;
            color: #666;
            line-height: 1.4;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
        }

        /* 카드 그리드 섹션 */
        .cards-section {
            margin-top: 60px;
        }

        .cards-title {
            font-size: 1.8em;
            font-weight: bold;
            color: #446b3c;
            text-align: center;
            margin-bottom: 30px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 360px;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card .bg-img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            filter: blur(8px) brightness(0.7);
            object-fit: cover;
            z-index: 1;
        }

        .card .cover-img {
            position: relative;
            z-index: 2;
            width: 100px;
            height: 150px;
            object-fit: cover;
            margin: 50px auto 0;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-content {
            position: relative;
            z-index: 2;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 12px 14px;
            text-align: center;
        }

        .book-title {
            font-size: 1rem;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .book-author {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 6px;
        }

        .review-preview {
            font-size: 0.85rem;
            color: #333;
            line-height: 1.4;
            height: 2.8em;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .bookmark-icon {
            position: absolute;
            top: 12px;
            right: 12px;
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.8);
            z-index: 10;
            padding: 6px;
            border-radius: 50%;
            transition: color 0.2s ease;
        }

        .bookmark-icon:hover {
            color: #fff;
        }

        #topBtn {
            position: fixed;
            bottom: 40px;
            right: 40px;
            z-index: 9999;
            background-color: white;
            color: gray;
            border: none;
            border-radius: 50%;
            padding: 16px 18px;
            cursor: pointer;
            box-shadow: 0 8px 8px rgba(0,0,0,0.4);
            font-size: 1.5rem;
        }

        footer {
            background-color: #eff7e8;
            color: #333;
            padding: 20px 0;
            text-align: center;
            font-size: 14px;
            border-top: 1px solid #ccc;
            margin-top: 60px;
        }

        .footer-container {
            max-width: 1000px;
            margin: 0 auto;
        }

        .footer-links a {
            color: #333;
            text-decoration: none;
            margin: 0 8px;
        }

        .footer-links a:hover {
            text-decoration: underline;
        }

        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .back-button {
                width: 40px;
                height: 40px;
            }
            
            .page-title {
                font-size: 2em;
            }
            
            .main-content {
                flex-direction: column;
                gap: 20px;
            }
            
            .video-section, .books-section {
                width: 100%;
            }
            
            .video-container {
                height: 250px; /* 모바일에서도 고정 높이 */
            }

            .video-container iframe {
                height: 100%; /* 컨테이너 높이에 맞춤 */
            }

            .books-section {
                height: auto; /* 모바일에서는 자동 높이 */
            }
            
            .featured-book {
                flex-direction: column;
                text-align: center;
                height: auto; /* 모바일에서는 자동 높이 */
            }
            
            .featured-book-image {
                margin: 0 auto;
            }
            
            .grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
                gap: 20px;
            }
        }
    </style>
</head>
<body>
    <header>
        <div id="logo">
            <a href="main.jsp">
                <img src="img/logo.png" alt="로고">
            </a>
        </div>

        <div class="search-group">
            <input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
            <button id="search-btn">검색</button>
        </div>
        
        <div id="user-buttons">
            <button id="join-btn" onclick="location.href='register.jsp'">회원가입</button>
            <button id="login-btn" onclick="location.href='login.jsp'">로그인</button>
        </div>
    </header>

    <nav>
        <a href="#">(AI) 책 추천</a>
        <a href="${pageContext.request.contextPath}/reviewList">리뷰</a>
        <a href="${pageContext.request.contextPath}/celebList">플레이리스트</a>
        <a href="${pageContext.request.contextPath}/celebList">셀럽추천</a>
        <a href="#">마이페이지</a>
    </nav>

    <div class="container">
        <div class="page-header">
            <a href="playlistmain.jsp" class="back-button" title="뒤로가기">
                <i class="fas fa-arrow-left"></i>
            </a>
            <div class="page-title">문화/예술</div>
        </div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/lda2bk7RtC8?si=3fXzfH4cbS4OGGTI" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <div class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/n1.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">나의 문화유산답사기 9: 서울편 1</div>
                        <div class="featured-book-author">저자: 유홍준</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.6</span>
                            <span>(213)</span>
                        </div>
                        <div class="featured-book-description">
                            한국 인문서를 대표하는 독보적인 시리즈로서 380만 독자의 사랑을 받아온 『나의 문화유산답사기』가 돌아왔다.
                             햇수로 25년 동안 8권의 국내편과 4권의 일본편이 출간된 '답사기'가 드디어 수도 서울에 입성하여 서울편 1권 '만천명월 주인옹은 말한다'와 2권 '유주학선 무주학불'을 선보인다.
                             저자는 과거와 현재와 미래가 공존하는 거대 도시 서울의 문화유산과 역사를 섬세하고 날카로운 통찰로 바라보는 한편, 그와 얽힌 이야기들을 특유의 편안한 입담으로 풀어냈다.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">🎨 WITHUS의 추천 문화/예술</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d.jpg" alt="배경" />
                    <img class="cover-img" src="img/d.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">다른 방식으로 보기</div>
                        <div class="book-author">존 버거</div>
                        <div class="review-preview">미술 감상에 대한 새로운 시각 제시</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d1.jpg" alt="배경" />
                    <img class="cover-img" src="img/d1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나의 문화유산답사기</div>
                        <div class="book-author">유홍준</div>
                        <div class="review-preview">한국 문화유산에 대한 대중적 인식 확산</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d2.jpg" alt="배경" />
                    <img class="cover-img" src="img/d2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사진에 관하여</div>
                        <div class="book-author">수전 손택</div>
                        <div class="review-preview">사진의 본질과 사회적 의미를 탐구</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d3.jpg" alt="배경" />
                    <img class="cover-img" src="img/d3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">미학 오디세이</div>
                        <div class="book-author">진중권</div>
                        <div class="review-preview">대중을 위한 철학적 미학 입문서</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d4.jpg" alt="배경" />
                    <img class="cover-img" src="img/d4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죽기 전에 꼭 봐야 할 세계 건축</div>
                        <div class="book-author">피터 클락슨</div>
                        <div class="review-preview">전 세계의 주요 건축물 소개</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d5.jpg" alt="배경" />
                    <img class="cover-img" src="img/d5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">한국의 미 특강</div>
                        <div class="book-author">오주석</div>
                        <div class="review-preview">한국 미술의 특징과 아름다움을 해설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/mm1.jpg" alt="배경" />
                    <img class="cover-img" src="img/mm1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">컬러 앤 라이트</div>
                        <div class="book-author">제임스 거니</div>
                        <div class="review-preview">사실적인 표현을 위한 빛과 색 그리는 법</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d7.jpg" alt="배경" />
                    <img class="cover-img" src="img/d7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">음악의 역사</div>
                        <div class="book-author">클로드 팔리스카</div>
                        <div class="review-preview">서양 음악사의 흐름을 정리</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d8.jpg" alt="배경" />
                    <img class="cover-img" src="img/d8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">영화의 이해</div>
                        <div class="book-author">루이스 자네티</div>
                        <div class="review-preview">영화 이론의 고전적 입문서</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d9.jpg" alt="배경" />
                    <img class="cover-img" src="img/d9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">길 위의 인문학</div>
                        <div class="book-author">김정남</div>
                        <div class="review-preview">여행과 인문학을 결합한 새로운 시각</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d10.jpg" alt="배경" />
                    <img class="cover-img" src="img/d10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">아리스토텔레스의 시학</div>
                        <div class="book-author">아리스토텔레스</div>
                        <div class="review-preview">비극 이론의 고전</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d11.jpg" alt="배경" />
                    <img class="cover-img" src="img/d11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">미술관에 간 과학자</div>
                        <div class="book-author">이정모</div>
                        <div class="review-preview">과학적 시선으로 미술을 해석</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d12.jpg" alt="배경" />
                    <img class="cover-img" src="img/d12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">에디토리얼 씽킹</div>
                        <div class="book-author">최혜진</div>
                        <div class="review-preview">편집 디자인의 창의적 사고 과정</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d13.jpg" alt="배경" />
                    <img class="cover-img" src="img/d13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">현대 물리학과 동양사상</div>
                        <div class="book-author">프리초프 카프라</div>
                        <div class="review-preview">물리학과 동양 사상의 만남</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d14.jpg" alt="배경" />
                    <img class="cover-img" src="img/d14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">문학이란 무엇인가</div>
                        <div class="book-author">장 폴 사르트르</div>
                        <div class="review-preview">문학의 존재론적 의미 탐구</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d15.jpg" alt="배경" />
                    <img class="cover-img" src="img/d15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">인문학으로 읽는 경제학</div>
                        <div class="book-author">최진석</div>
                        <div class="review-preview">인문학적 관점에서 경제를 해석</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d16.jpg" alt="배경" />
                    <img class="cover-img" src="img/d16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">모 이야기</div>
                        <div class="book-author">최연주</div>
                        <div class="review-preview">현대인의 일상을 따뜻하게 그린 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d17.jpg" alt="배경" />
                    <img class="cover-img" src="img/d17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 고양이로소이다</div>
                        <div class="book-author">나쓰메 소세키</div>
                        <div class="review-preview">인간 사회를 풍자한 소설</div>
                    </div>
                </div>

 				                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d18.jpg" alt="배경" />
                    <img class="cover-img" src="img/d18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">방구석 미술관</div>
                        <div class="book-author">조원재</div>
                        <div class="review-preview">집에서 즐기는 미술 이야기와 작품 해설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/d19.jpg" alt="배경" />
                    <img class="cover-img" src="img/d19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">자연스러운 인체 드로잉</div>
                        <div class="book-author">드로잉 전문가</div>
                        <div class="review-preview">인체를 자연스럽게 그리는 기법과 노하우</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- TOP 버튼 -->
    <button id="topBtn" title="맨 위로 이동">
        <i class="fas fa-arrow-up"></i>
    </button>

    <footer>
         <div class="footer-container">
            <div class="footer-links">
                <a href="#">회사소개</a>
                <a href="#">이용약관</a>
                <a href="#">개인정보처리방침</a>
                <a href="#">고객센터</a>
            </div>
            <p>&copy; 2024 WithUs. All rights reserved.</p>
        </div>
    </footer>

    <script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("topBtn").addEventListener("click", () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    });
    </script>
</body>
</html>