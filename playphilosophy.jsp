<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>철학 - 책 추천</title>
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
            position: relative;
        }

        /* 뒤로가기 버튼 스타일 */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            width: 50px;
            height: 50px;
            background-color: #e6f0d7;
            border: none;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            z-index: 10;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #cce0b8;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }

        .back-button i {
            font-size: 18px;
            color: #446b3c;
        }

        .page-title {
            text-align: center;
            font-size: 2.5em;
            font-weight: bold;
            color: #446b3c;
            margin: 40px 0;
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

            .back-button {
                width: 40px;
                height: 40px;
                top: 10px;
                left: 10px;
            }

            .back-button i {
                font-size: 16px;
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
        <!-- 뒤로가기 버튼 -->
        <a href="playlistmain.jsp" class="back-button" title="뒤로가기">
            <i class="fas fa-arrow-left"></i>
        </a>

        <div class="page-title">철학</div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/V7IUtUsfARA?si=_zMpOcn4UiL2MpS8" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <a href="https://search.shopping.naver.com/book/catalog/32496186730?query=%EC%A0%95%EC%9D%98%EB%9E%80%20%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcvatsps%7Cci%3Daae8d75304057911d156f3e6d6b0b32eb47cec67%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7c85b83a1643d6d8323e4ebf532b7fff987827c1" target="_blank" class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/c.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">정의란 무엇인가</div>
                        <div class="featured-book-author">저자: 마이클 샌델</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.3</span>
                            <span>(872)</span>
                        </div>
                        <div class="featured-book-description">
                            한국에 '정의' 열풍을 불러일으킨 마이클 샌델은 구제 금융, 대리 출산, 동성 결혼, 과거사 공개 사과 등 현대 사회에서 우리가 흔히 부딪히는 문제를 통해 '무엇이 정의로운가'에 대한 해답을 탐구했다. 
                            이 책은 탁월한 정치 철학자들이 남긴 시대를 초월한 철학적인 질문을 알기 쉽게 소개한다. 
                            이를 통해 옳고 그름, 정의와 부당함, 평등과 불평등, 개인의 권리와 공동선을 둘러싼 주장들이 경쟁하는 공적 담론과 토론의 장에서 정의에 관한 자신만의 견해를 정립하고 논리 기반을 굳건하게 다지는 토대를 제공한다.
                             이 책은 현대 사회의 문제를 진단하고 새로운 대안을 찾아내는 정치 철학자들의 지적 탐색 과정을 보여준다.

                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">🤔 WITHUS의 추천 철학</h2>
            <div class="grid">
                <a href="https://search.shopping.naver.com/book/catalog/32496186730?query=%EC%A0%95%EC%9D%98%EB%9E%80%20%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcvatsps%7Cci%3Daae8d75304057911d156f3e6d6b0b32eb47cec67%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7c85b83a1643d6d8323e4ebf532b7fff987827c1" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c.jpg" alt="배경" />
                    <img class="cover-img" src="img/c.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">정의란 무엇인가</div>
                        <div class="book-author">마이클 샌델</div>
                        <div class="review-preview">현대 사회의 정의 문제에 대한 윤리적 고찰</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/54399687943?query=%EA%B5%AD%EA%B0%80%20%ED%94%8C%EB%9D%BC%ED%86%A4&NaPm=ct%3Dmcvaxi7c%7Cci%3Dd728e87cccfd37ef97cba1956260c58c9b2e5cda%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D266bacbbe0cc7cf1ad63afd64cc51b6cf87cd584" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c1.jpg" alt="배경" />
                    <img class="cover-img" src="img/c1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">국가</div>
                        <div class="book-author">플라톤</div>
                        <div class="review-preview">이상적인 국가와 정의에 대한 서양 철학의 고전</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32456295914?query=%EC%88%9C%EC%88%98%EC%9D%B4%EC%84%B1%EB%B9%84%ED%8C%90&NaPm=ct%3Dmcvaxpx4%7Cci%3Db9824e224368e11225044bcd540d402e6a696bc3%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dfa93f2ef4d7549ab1437c9c2aeca5640021d4d16" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c2.jpg" alt="배경" />
                    <img class="cover-img" src="img/c2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">순수이성비판</div>
                        <div class="book-author">임마누엘 칸트</div>
                        <div class="review-preview">근대 서양 철학의 기념비적 저작</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32445527545?query=%EC%B0%A8%EB%9D%BC%ED%88%AC%EC%8A%A4%ED%8A%B8%EB%9D%BC%EB%8A%94%20%EC%9D%B4%EB%A0%87%EA%B2%8C%20%EB%A7%90%ED%96%88%EB%8B%A4&NaPm=ct%3Dmcvaxxmw%7Cci%3D6a33d859cc0da367d16cfc8bd07129f9d3213b9b%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D93415c6b7643f2ad4ef275e8d248a9dfb64dbe8c" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c3.jpg" alt="배경" />
                    <img class="cover-img" src="img/c3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">차라투스트라는 이렇게 말했다</div>
                        <div class="book-author">프리드리히 니체</div>
                        <div class="review-preview">초인 사상과 영원 회귀 사상</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441645060?query=%EB%8D%B0%EB%AF%B8%EC%95%88&NaPm=ct%3Dmcvay3t4%7Cci%3D398963cbb4ec46261c02cd703c3e6fedd5d224ac%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D63cb429593ee6b79a3b0ca6d116937cf9a2aedb9" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c4.jpg" alt="배경" />
                    <img class="cover-img" src="img/c4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">데미안</div>
                        <div class="book-author">헤르만 헤세</div>
                        <div class="review-preview">자아를 찾아가는 성장과 철학적 여정</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32463251656?query=%EC%A3%BD%EC%9D%80%20%EC%8B%9C%EC%9D%B8%EC%9D%98%20%EC%82%AC%ED%9A%8C&NaPm=ct%3Dmcvaycao%7Cci%3D1536dd35342b8357574d2ef2337dce297523bbb3%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D8678e3c042e516858e8de70427ddf1476a5e33db" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c5.jpg" alt="배경" />
                    <img class="cover-img" src="img/c5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죽은 시인의 사회</div>
                        <div class="book-author">N.H. 클라인바움</div>
                        <div class="review-preview">자유로운 사고와 삶의 본질 탐구</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32454452301?query=%EA%B5%B0%EC%A3%BC%EB%A1%A0&NaPm=ct%3Dmcvayj8o%7Cci%3D7b019c952ae29789af32e7172c734f3e0f4acbaa%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2856f7e71e3836f2a88de3c02c889f137b6ee96f" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c6.jpg" alt="배경" />
                    <img class="cover-img" src="img/c6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">군주론</div>
                        <div class="book-author">니콜로 마키아벨리</div>
                        <div class="review-preview">정치 철학의 냉혹한 현실을 보여주는 고전</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/53249090482?query=%EC%9E%90%EC%9C%A0%EB%A1%A0&NaPm=ct%3Dmcvayq6o%7Cci%3D0e17bd486171c5b16fa21988eaafb38c45213595%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D2815503344308e5a4602e0e205574437609b9bb8" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c7.jpg" alt="배경" />
                    <img class="cover-img" src="img/c7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">자유론</div>
                        <div class="book-author">존 스튜어트 밀</div>
                        <div class="review-preview">개인의 자유와 사회의 역할에 대한 고찰</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32475523886?query=%EC%95%84%ED%94%94%EC%9D%B4%20%EA%B8%B8%EC%9D%B4%20%EB%90%98%EB%A0%A4%EB%A9%B4&NaPm=ct%3Dmcvayyo8%7Cci%3Df86aa1df92a01bc281809d3db87dca7b02ae8795%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0ec04e1ea467fd883cbf0c835d53814d39687418" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c8.jpg" alt="배경" />
                    <img class="cover-img" src="img/c8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">아픔이 길이 되려면</div>
                        <div class="book-author">김승섭</div>
                        <div class="review-preview">사회적 고통을 의학적 관점에서 성찰한 인문학적 탐구</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/37236380619?query=%EB%8F%84%EB%8D%95%EA%B2%BD&NaPm=ct%3Dmcvaziqg%7Cci%3D0366fc377d86693cdfc26ba1048c7035f5d1fa25%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7eda0400e6fe304a7cb37b561e6d757bcdd19518" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c9.jpg" alt="배경" />
                    <img class="cover-img" src="img/c9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">도덕경</div>
                        <div class="book-author">노자</div>
                        <div class="review-preview">무위자연과 도의 철학을 담은 동양 철학의 고전</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441101016?query=%EC%B2%A0%ED%95%99%EC%9D%B4%20%ED%95%84%EC%9A%94%ED%95%9C%20%EC%8B%9C%EA%B0%84&NaPm=ct%3Dmcvazsrk%7Cci%3D839949028eaa13f7cd08834422de9358d82264a2%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D33f5ee9d409c8692ff1bc34b1aff831321440f1c" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c10.jpg" alt="배경" />
                    <img class="cover-img" src="img/c10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">철학이 필요한 시간</div>
                        <div class="book-author">강신주</div>
                        <div class="review-preview">일상 속 철학적 사유를 권하는 책</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/34906313618?query=%EB%85%BC%EC%96%B4&NaPm=ct%3Dmcvb0540%7Cci%3D68be772616e8b18ecbedff087bf0bf4aea912a49%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dad0fdb82c184b6d3281ba11fbc10121b35e1d58b" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c11.jpg" alt="배경" />
                    <img class="cover-img" src="img/c11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">논어</div>
                        <div class="book-author">공자</div>
                        <div class="review-preview">유교 사상의 핵심이자 동양 철학의 근간</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/42305597619?query=%EB%A7%88%ED%9D%94%EC%97%90%EC%9D%BD%EB%8A%94%EC%87%BC%ED%8E%9C%ED%95%98%EC%9A%B0%EC%96%B4&NaPm=ct%3Dmcvb0edc%7Cci%3D530b70dc3ef97df91bd12182084b08edc2546d66%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D79e5a09e8b1de78a099391366da996a71fb2e104" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c12.jpg" alt="배경" />
                    <img class="cover-img" src="img/c12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">마흔에 읽는 쇼펜하우어</div>
                        <div class="book-author">쇼펜하우어</div>
                        <div class="review-preview">중년의 관점에서 재해석한 쇼펜하우어의 철학적 지혜</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32490720633?query=%EC%86%8C%ED%94%BC%EC%9D%98%20%EC%84%B8%EA%B3%84&NaPm=ct%3Dmcvb0oeg%7Cci%3Db0ab9920a5509762a6f06022284e0a55a6bcc170%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcd76a61488c0d9e762eca7610bc3804239e79097" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c13.jpg" alt="배경" />
                    <img class="cover-img" src="img/c13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">소피의 세계</div>
                        <div class="book-author">요슈타인 가아더</div>
                        <div class="review-preview">소설로 읽는 철학</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32473323658?query=%EC%8B%9C%EC%A7%80%ED%94%84%20%EC%8B%A0%ED%99%94&NaPm=ct%3Dmcvb0zz4%7Cci%3Dd890b6a8858a491163fe83bb99653f33b8108c00%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dda137bec05a939bf8598de27846d065724b7f9ac" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c14.jpg" alt="배경" />
                    <img class="cover-img" src="img/c14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">시지프 신화</div>
                        <div class="book-author">알베르 카뮈</div>
                        <div class="review-preview">부조리한 삶에 대한 실존주의적 성찰</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32456306648?query=%EC%B2%A0%ED%95%99%EC%9D%80%20%EC%96%B4%EB%96%BB%EA%B2%8C%20%EC%82%B6%EC%9D%98%20%EB%AC%B4%EA%B8%B0%EA%B0%80%20%EB%90%98%EB%8A%94%EA%B0%80&NaPm=ct%3Dmcvb1as0%7Cci%3De938981105353938f3391e997fb2d7da409ceade%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D48e11f35c09d810cdd2bffc076dad1da5430448d" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c15.jpg" alt="배경" />
                    <img class="cover-img" src="img/c15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">철학은 어떻게 삶의 무기가 되는가</div>
                        <div class="book-author">야마구치 슈</div>
                        <div class="review-preview">실용적인 관점에서 철학을 해석</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441030298?query=%EB%AA%A8%EB%93%A0%20%EA%B2%83%EC%9D%B4%20%EB%90%98%EB%8A%94%20%EB%B2%95&NaPm=ct%3Dmcvb1j9k%7Cci%3Da615955d9aaf293cc865c8f04dbfb24748f98ac1%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dcc1a85839daddde4e6e49a75d8053e7703ee1236" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c16.jpg" alt="배경" />
                    <img class="cover-img" src="img/c16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">모든 것이 되는 법</div>
                        <div class="book-author">에밀리 와프닉</div>
                        <div class="review-preview">다양한 관심사를 가진 현대인을 위한 삶의 철학</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/46032325620?query=%EA%B9%A8%EC%A7%84%20%ED%8B%88%EC%9D%B4%20%EC%9E%88%EC%96%B4%EC%95%BC&NaPm=ct%3Dmcvb1siw%7Cci%3D89c4ace8e93177ca13ec34de946aaaec06977080%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dfb27ea4796a602db8c94fd86979af92ed0e2d5b8" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c17.jpg" alt="배경" />
                    <img class="cover-img" src="img/c17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">깨진 틈이 있어야 그 사이로 빛이 들어온다</div>
                        <div class="book-author">니체</div>
                        <div class="review-preview">고통과 상처를 통해 찾는 삶의 의미와 희망</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/54724585242?query=%EB%82%98%EB%A5%BC%20%EC%95%84%ED%94%84%EA%B2%8C%20%ED%95%9C%20%EB%A7%90%EC%9D%80&NaPm=ct%3Dmcvb1zgw%7Cci%3Dd9888c512a052f5fd79c7419f2c5629b46547147%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0238098954ec60bda4c765af55df5334634ae274" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c18.jpg" alt="배경" />
                    <img class="cover-img" src="img/c18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나를 아프게 한 말들이 모두 진실은 아니었다</div>
                        <div class="book-author">마르쿠스 아우렐리우스</div>
                        <div class="review-preview">스토아 철학을 통한 마음의 평정과 내적 성장</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/46430404619?query=%EC%99%9C%20%EB%8B%B9%EC%8B%A0%EC%9D%80%20%EB%8B%A4%EB%A5%B8%20%EC%82%AC%EB%9E%8C%EC%9D%84&NaPm=ct%3Dmcvb27yg%7Cci%3Dc9437e6d85bfb9ff37b89380a55be0b9fd9643a5%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D622da139afffa08c28fe3e76195da55805b5d113" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/c19.jpg" alt="배경" />
                    <img class="cover-img" src="img/c19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">왜 당신은 다른 사람을 위해 살고 있는가</div>
                        <div class="book-author">고윤</div>
                        <div class="review-preview">진정한 자아와 독립적인 삶에 대한 철학적 탐구</div>
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