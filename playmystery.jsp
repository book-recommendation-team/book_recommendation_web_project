<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>추리/스릴러 - 책 추천</title>
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
            text-decoration: none;
            color: inherit;
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
            text-decoration: none;
            color: inherit;
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
            <div class="page-title">미스테리/추리</div>
        </div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/sMAl90ZkJHM?si=dl6ao0IHxfRxTtxh" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <a href="https://search.shopping.naver.com/book/catalog/32463541483" target="_blank" class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/m3.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">용의자 X의 헌신</div>
                        <div class="featured-book-author">저자: 히가시노 게이고</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.6</span>
                            <span>(89)</span>
                        </div>
                        <div class="featured-book-description">
                            서정적인 언어, 예리한 질문과 탐구의 글쓰기로 펼쳐 보이는 장대한 우주 목가. 
                            2024년 부커상 수상작으로, 우주정거장에서 지구를 공전하는 여섯 우주비행사의 하루를 그린 아름다운 소설입니다.
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">🔍 WITHUS의 추천 미스테리/추리</h2>
            <div class="grid">
                <a href="https://search.shopping.naver.com/book/catalog/32491716827?query=%EC%85%9C%EB%A1%9D%20%ED%99%88%EC%A6%88%20%EC%A0%84%EC%A7%91%20%EC%84%B8%ED%8A%B8&NaPm=ct%3Dmcvaeik8%7Cci%3D9924dcf538bbd98cdec3038a21c4ef09fe997ba7%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D5666aaa11a614a772f79ff424a5fe0bd54be5754" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m.jpg" alt="배경" />
                    <img class="cover-img" src="img/m.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">셜록 홈즈 전집</div>
                        <div class="book-author">아서 코난 도일</div>
                        <div class="review-preview">탐정 소설의 고전이자 원형</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32463426752?query=%EA%B7%B8%EB%A6%AC%EA%B3%A0%20%EC%95%84%EB%AC%B4%EB%8F%84%20%EC%97%86%EC%97%88%EB%8B%A4&NaPm=ct%3Dmcvaeqa0%7Cci%3Dd736d36b62b1227405fa14c108e3057744cebc20%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dc969bc301fedf65fbbcc5bff76a4f9f7ee2b87e9" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m1.jpg" alt="배경" />
                    <img class="cover-img" src="img/m1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">그리고 아무도 없었다</div>
                        <div class="book-author">애거서 크리스티</div>
                        <div class="review-preview">밀실 추리 소설의 대가</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/39570707619?query=%EA%B2%80%EC%9D%80%20%EA%B3%A0%EC%96%91%EC%9D%B4&NaPm=ct%3Dmcvaf5pk%7Cci%3D27332be374cfe3df039d6b41c74f3c78d84f11dd%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D5a6035d01f2cd1db89d5568d2a2d04faeee02209" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m2.jpg" alt="배경" />
                    <img class="cover-img" src="img/m2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">검은 고양이</div>
                        <div class="book-author">에드거 앨런 포</div>
                        <div class="review-preview">고딕 소설과 심리 스릴러의 선구자</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32463541483" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m3.jpg" alt="배경" />
                    <img class="cover-img" src="img/m3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">용의자 X의 헌신</div>
                        <div class="book-author">히가시노 게이고</div>
                        <div class="review-preview">반전과 심리 묘사가 뛰어난 일본 미스터리</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32465496972?query=%EC%9D%B4%EB%B0%A9%EC%9D%B8&NaPm=ct%3Dmcvafs34%7Cci%3D2ae9a51d3cb2735b1c01d2745299b17d8da7a579%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0daace47f658c0f1520f06f47a933df370b3adcb" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m4.jpg" alt="배경" />
                    <img class="cover-img" src="img/m4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">이방인</div>
                        <div class="book-author">알베르 카뮈</div>
                        <div class="review-preview">부조리 문학의 대표작</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32445380150?query=%EC%82%B4%EC%9D%B8%EC%9E%90%EC%9D%98%20%EA%B8%B0%EC%96%B5%EB%B2%95&NaPm=ct%3Dmcvafzsw%7Cci%3Dfd2185717f8847d6d1d967b6d062c205de013e33%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D4bc0d330fa37fc48015b0ff87d32a4bf3191090a" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m5.jpg" alt="배경" />
                    <img class="cover-img" src="img/m5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">살인자의 기억법</div>
                        <div class="book-author">김영하</div>
                        <div class="review-preview">기억 상실 살인범의 독특한 시점</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32486069451?query=%EB%88%88%EB%A8%BC%20%EC%95%94%EC%82%B4%EC%9E%90&NaPm=ct%3Dmcvag8ag%7Cci%3Dcde13f0041d6b8d706f5d02628766c98343818e8%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcd4765d87b777dedebccc9910056183eb81e3332" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m6.jpg" alt="배경" />
                    <img class="cover-img" src="img/m6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">눈먼 암살자</div>
                        <div class="book-author">마거릿 애트우드</div>
                        <div class="review-preview">문학성과 서스펜스를 겸비한 작품</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32455951957?query=%EB%82%98%EB%A5%BC%20%EC%B0%BE%EC%95%84%EC%A4%98&NaPm=ct%3Dmcvagq1c%7Cci%3D3fe2cabd833e56b6851386f1fa0eb0d384a04a33%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbc0aced3345f5e170a5f8773798d231667de0bc8" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m7.jpg" alt="배경" />
                    <img class="cover-img" src="img/m7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나를 찾아줘</div>
                        <div class="book-author">길리언 플린</div>
                        <div class="review-preview">예측 불허의 반전 심리 스릴러</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441026328?cat_id=50005765&frm=PBOKPRO&query=%EC%B6%94%EB%A6%AC+%EB%AF%B8%EC%8A%A4%ED%84%B0%EB%A6%AC&NaPm=ct%3Dmcvak4q0%7Cci%3D0bec43bde67db1fdc623d9bd28e9127a5c1c93a0%7Ctr%3Dboknx%7Csn%3D95694%7Chk%3Dc33daf226c861433252aa003a9f8ff2c6e70506d" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m30.jpg" alt="배경" />
                    <img class="cover-img" src="img/m30.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">악의</div>
                        <div class="book-author">히가시노 게이고</div>
                        <div class="review-preview">죽음을 둘러싼 쫓고 쫓기는 두뇌게임</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/37993612653?query=%EC%96%91%EB%93%A4%EC%9D%98%20%EC%B9%A8%EB%AC%B5&NaPm=ct%3Dmcvamzcg%7Cci%3D9d4dc7e2aad09170636c2801c3775b7ef0aa94a6%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D9ef8c6e267a4b2df9c67d501e0781fb068bac159" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m9.jpg" alt="배경" />
                    <img class="cover-img" src="img/m9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">양들의 침묵</div>
                        <div class="book-author">토마스 해리스</div>
                        <div class="review-preview">사이코패스 범죄 스릴러의 대표작</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/36801579622?query=%EB%82%98%EB%AF%B8%EC%95%BC%20%EC%9E%A1%ED%99%94%EC%A0%90%EC%9D%98%20%EA%B8%B0%EC%A0%81&NaPm=ct%3Dmcvan9dk%7Cci%3D7795a37a4957224c1afa0c7091be83486272ab02%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D67107793576e49f9cfe82342e4915bfa430eb041" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m10.jpg" alt="배경" />
                    <img class="cover-img" src="img/m10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나미야 잡화점의 기적</div>
                        <div class="book-author">히가시노 게이고</div>
                        <div class="review-preview">따뜻한 판타지 미스터리</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32477587844?query=%EC%9E%A5%EB%AF%B8%EC%9D%98%20%EC%9D%B4%EB%A6%84&NaPm=ct%3Dmcvank6g%7Cci%3D4234cdc06363d49b3166dcc8309a4a2236c27cd8%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd582e4b8ec6980584783d9c83dd259d75b8b33f0" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m11.jpg" alt="배경" />
                    <img class="cover-img" src="img/m11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">장미의 이름</div>
                        <div class="book-author">움베르토 에코</div>
                        <div class="review-preview">중세 수도원 배경의 지적 추리 소설</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32463522644?query=%EC%A3%84%EC%99%80%20%EB%B2%8C&NaPm=ct%3Dmcvanr4g%7Cci%3D3a3bf6ac825db8dec45ead9b002bed9cca17ad11%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dde3a2d9c024313c4b159a1d36e11dbbbbe847603" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m12.jpg" alt="배경" />
                    <img class="cover-img" src="img/m12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죄와 벌</div>
                        <div class="book-author">표도르 도스토옙스키</div>
                        <div class="review-preview">범죄와 인간 양심의 문제를 다룬 심리 소설</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32491412836?query=%EB%82%98%EB%8A%94%20%EA%B3%A0%EC%96%91%EC%9D%B4%EB%A1%9C%EC%86%8C%EC%9D%B4%EB%8B%A4&NaPm=ct%3Dmcvao0ds%7Cci%3Db603840d303484a31812aaf5a93d7cab9e1c8a27%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcb5c60e1c59551d40a23beeb5b22efe62748186f" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m13.jpg" alt="배경" />
                    <img class="cover-img" src="img/m13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 고양이로소이다</div>
                        <div class="book-author">나쓰메 소세키</div>
                        <div class="review-preview">인간 사회 풍자</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/35304167846?query=%EA%B2%80%EC%9D%80%20%EC%A7%91&NaPm=ct%3Dmcvaoaew%7Cci%3D82cfc178b2358aa13c3d69a47b7675ebef396182%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Ddd1208b166de3096ccb105d6ca16af164b7235d6" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m14.jpg" alt="배경" />
                    <img class="cover-img" src="img/m14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">검은 집</div>
                        <div class="book-author">기시 유스케</div>
                        <div class="review-preview">일본 호러 미스터리</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32486413942" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m15.jpg" alt="배경" />
                    <img class="cover-img" src="img/m15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">애크로이드 살인 사건</div>
                        <div class="book-author">애거사 크리스티</div>
                        <div class="review-preview">추리 소설사에 길이 남을 혁신적인 트릭</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/54213715512" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m16.jpg" alt="배경" />
                    <img class="cover-img" src="img/m16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">고독한 용의자</div>
                        <div class="book-author">찬호께이</div>
                        <div class="review-preview">홍콩 추리 소설의 독특한 매력을 보여주는 작품</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/54069896693" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m17.jpg" alt="배경" />
                    <img class="cover-img" src="img/m17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">첫번째 거짓말이 중요하다</div>
                        <div class="book-author">애슐리 엘스턴</div>
                        <div class="review-preview">청소년을 위한 흥미진진한 미스터리 소설</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/39075448620?query=%ED%95%98%EC%9A%B0%EC%8A%A4%EB%A9%94%EC%9D%B4%EB%93%9C&NaPm=ct%3Dmcvap7lc%7Cci%3D88f55ce5b16868ed01fa793744b62d30d9c9d22a%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D6bf3b2f480eaa9e1464821155bc852bd9d0fe537" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m18.jpg" alt="배경" />
                    <img class="cover-img" src="img/m18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">하우스메이드</div>
                        <div class="book-author">프리다 맥파튼</div>
                        <div class="review-preview">계급 갈등과 복수를 다룬 심리 스릴러</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32463439697?query=Y%EC%9D%98%20%EB%B9%84%EA%B7%B9&NaPm=ct%3Dmcvapejc%7Cci%3D1f818ccfe933f7026c71eab422ed9b5f6b6686a0%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db45d508401125d562af3c9e0c37bc3d1c49d856d" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m19.jpg" alt="배경" />
                    <img class="cover-img" src="img/m19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">Y의 비극</div>
                        <div class="book-author">앨러리 퀸</div>
                        <div class="review-preview">본격 추리 소설의 황금기를 대표하는 고전</div>
                    </div>
                </a>
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