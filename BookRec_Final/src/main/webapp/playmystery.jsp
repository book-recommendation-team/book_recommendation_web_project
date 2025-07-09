<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> <%-- User 모델 클래스 import --%>
<%
    // [추가] 페이지에서 사용할 변수들을 선언합니다.
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>추리/스릴러 - 책 추천</title>
    <%@ include file="css/main_css.jsp"%>
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
    <%@ include file="header.jsp" %>

    <nav>
		<a href="<%=contextPath%>/aiRecommend.jsp">(AI) 책 추천</a> <a
			href="<%=contextPath%>/reviewList">리뷰</a> <a
			href="<%=contextPath%>/playlistmain.jsp">플레이리스트</a> <a
			href="<%=contextPath%>/celebList">셀럽추천</a> <a
			href="<%=contextPath%>/mypage.jsp">마이페이지</a>
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
                <div class="featured-book">
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
                </div>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">🔍 WITHUS의 추천 미스테리/추리</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m.jpg" alt="배경" />
                    <img class="cover-img" src="img/m.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">셜록 홈즈 전집</div>
                        <div class="book-author">아서 코난 도일</div>
                        <div class="review-preview">탐정 소설의 고전이자 원형</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m1.jpg" alt="배경" />
                    <img class="cover-img" src="img/m1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">그리고 아무도 없었다</div>
                        <div class="book-author">애거서 크리스티</div>
                        <div class="review-preview">밀실 추리 소설의 대가</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m2.jpg" alt="배경" />
                    <img class="cover-img" src="img/m2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">검은 고양이</div>
                        <div class="book-author">에드거 앨런 포</div>
                        <div class="review-preview">고딕 소설과 심리 스릴러의 선구자</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m3.jpg" alt="배경" />
                    <img class="cover-img" src="img/m3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">용의자 X의 헌신</div>
                        <div class="book-author">히가시노 게이고</div>
                        <div class="review-preview">반전과 심리 묘사가 뛰어난 일본 미스터리</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m4.jpg" alt="배경" />
                    <img class="cover-img" src="img/m4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">이방인</div>
                        <div class="book-author">알베르 카뮈</div>
                        <div class="review-preview">부조리 문학의 대표작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m5.jpg" alt="배경" />
                    <img class="cover-img" src="img/m5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">살인자의 기억법</div>
                        <div class="book-author">김영하</div>
                        <div class="review-preview">기억 상실 살인범의 독특한 시점</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m6.jpg" alt="배경" />
                    <img class="cover-img" src="img/m6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">눈먼 암살자</div>
                        <div class="book-author">마거릿 애트우드</div>
                        <div class="review-preview">문학성과 서스펜스를 겸비한 작품</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m7.jpg" alt="배경" />
                    <img class="cover-img" src="img/m7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나를 찾아줘</div>
                        <div class="book-author">길리언 플린</div>
                        <div class="review-preview">예측 불허의 반전 심리 스릴러</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m8.jpg" alt="배경" />
                    <img class="cover-img" src="img/m8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">침묵의 봄</div>
                        <div class="book-author">레이첼 카슨</div>
                        <div class="review-preview">환경 미스터리 고전</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m9.jpg" alt="배경" />
                    <img class="cover-img" src="img/m9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">양들의 침묵</div>
                        <div class="book-author">토마스 해리스</div>
                        <div class="review-preview">사이코패스 범죄 스릴러의 대표작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m10.jpg" alt="배경" />
                    <img class="cover-img" src="img/m10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나미야 잡화점의 기적</div>
                        <div class="book-author">히가시노 게이고</div>
                        <div class="review-preview">따뜻한 판타지 미스터리</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m11.jpg" alt="배경" />
                    <img class="cover-img" src="img/m11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">장미의 이름</div>
                        <div class="book-author">움베르토 에코</div>
                        <div class="review-preview">중세 수도원 배경의 지적 추리 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m12.jpg" alt="배경" />
                    <img class="cover-img" src="img/m12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죄와 벌</div>
                        <div class="book-author">표도르 도스토옙스키</div>
                        <div class="review-preview">범죄와 인간 양심의 문제를 다룬 심리 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m13.jpg" alt="배경" />
                    <img class="cover-img" src="img/m13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 고양이로소이다</div>
                        <div class="book-author">나쓰메 소세키</div>
                        <div class="review-preview">인간 사회 풍자</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m14.jpg" alt="배경" />
                    <img class="cover-img" src="img/m14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">검은 집</div>
                        <div class="book-author">기시 유스케</div>
                        <div class="review-preview">일본 호러 미스터리</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m15.jpg" alt="배경" />
                    <img class="cover-img" src="img/m15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">애크로이드 살인 사건</div>
                        <div class="book-author">애거사 크리스티</div>
                        <div class="review-preview">추리 소설사에 길이 남을 혁신적인 트릭</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m16.jpg" alt="배경" />
                    <img class="cover-img" src="img/m16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">고독한 용의자</div>
                        <div class="book-author">찬호께이</div>
                        <div class="review-preview">홍콩 추리 소설의 독특한 매력을 보여주는 작품</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m17.jpg" alt="배경" />
                    <img class="cover-img" src="img/m17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">첫번째 거짓말이 중요하다</div>
                        <div class="book-author">애슐리 엘스턴</div>
                        <div class="review-preview">청소년을 위한 흥미진진한 미스터리 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m18.jpg" alt="배경" />
                    <img class="cover-img" src="img/m18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">하우스메이드</div>
                        <div class="book-author">프리다 맥파튼</div>
                        <div class="review-preview">계급 갈등과 복수를 다룬 심리 스릴러</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/m19.jpg" alt="배경" />
                    <img class="cover-img" src="img/m19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">Y의 비극</div>
                        <div class="book-author">앨러리 퀸</div>
                        <div class="review-preview">본격 추리 소설의 황금기를 대표하는 고전</div>
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