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
    <title>SF/판타지 - 책 추천</title>
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
            <div class="page-title">SF/판타지</div>
        </div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                   <iframe src="https://www.youtube.com/embed/_XFeRhG3gow?si=kZHK6a7LSqeckQEE" 
                   title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                   referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <div class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/s4.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">듄</div>
                        <div class="featured-book-author">저자: 프랭크 허버트</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.6</span>
                            <span>(23)</span>
                        </div>
                        <div class="featured-book-description">
                             20세기 영미 SF계의 거장인 프랭크 허버트가 죽을 때까지 작업한 이 연대기는 제1부 듄Dune(1965), 제2부 듄, 메시아Dune, Messiah(1969), 제3부 듄의 후예들Children of Dune(1976), 제4부 듄의 신황제God Emperor of Dune(1981), 제5부 듄의 이단자들Heretics of Dune(1984), 제6부 듄의 신전Chapterhouse: Dune(1985) 총6부작으로 이루어져 있으며 우주 시대 3만 년의 인류 역사가 담겨 있다. 
                             『듄』은 공상 과학 소설이라는 장르 문학에 속하면서도 화려한 주인공들과 플롯의 탄탄함에 힘입어 이례적으로 출간 이후 현재까지 1200만 부 이상이 팔렸다. 
                             프랭크 허버트가 6년 간의 자료 조사 끝에 착수한 사막의 행성, 듄이라는 인류 미래의 세계를 그리는 작업은 그의 아들 브라이언 허버트가 이어받아 지금도 계속되고 있다.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">🚀 WITHUS의 추천 SF/판타지</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s1.jpg" alt="배경" />
                    <img class="cover-img" src="img/s1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">반지의 제왕 1</div>
                        <div class="book-author">J.R.R. 톨킨</div>
                        <div class="review-preview">판타지 장르의 절대적 고전 1</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s2.jpg" alt="배경" />
                    <img class="cover-img" src="img/s2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">반지의 제왕 2</div>
                        <div class="book-author">J.R.R. 톨킨</div>
                        <div class="review-preview">판타지 장르의 절대적 고전 2</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s3.jpg" alt="배경" />
                    <img class="cover-img" src="img/s3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">파운데이션</div>
                        <div class="book-author">아이작 아시모프</div>
                        <div class="review-preview">SF의 바이블이자 우주 오페라의 대명사</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s4.jpg" alt="배경" />
                    <img class="cover-img" src="img/s4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">듄</div>
                        <div class="book-author">프랭크 허버트</div>
                        <div class="review-preview">생태, 종교, 정치 등 깊이 있는 세계관의 SF 걸작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s5.jpg" alt="배경" />
                    <img class="cover-img" src="img/s5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">어스시의 마법사</div>
                        <div class="book-author">어슐러 르 귄</div>
                        <div class="review-preview">판타지 문학에 깊이를 더한 작품</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s6.jpg" alt="배경" />
                    <img class="cover-img" src="img/s6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">1984</div>
                        <div class="book-author">조지 오웰</div>
                        <div class="review-preview">디스토피아 SF의 경전</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s7.jpg" alt="배경" />
                    <img class="cover-img" src="img/s7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">멋진 신세계</div>
                        <div class="book-author">올더스 헉슬리</div>
                        <div class="review-preview">기술 발전이 가져온 비극적 미래 예언</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s8.jpg" alt="배경" />
                    <img class="cover-img" src="img/s8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">해리 포터 시리즈</div>
                        <div class="book-author">J.K. 롤링</div>
                        <div class="review-preview">현대 판타지의 문화 아이콘</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s9.jpg" alt="배경" />
                    <img class="cover-img" src="img/s9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">우리가 빛의 속도로 갈 수 없다면</div>
                        <div class="book-author">김초엽</div>
                        <div class="review-preview">한국 SF의 새로운 가능성을 보여준 단편집</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s10.jpg" alt="배경" />
                    <img class="cover-img" src="img/s10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">지구 끝의 온실</div>
                        <div class="book-author">김초엽</div>
                        <div class="review-preview">기후 변화와 인류의 미래를 다룬 장편 SF</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s11.jpg" alt="배경" />
                    <img class="cover-img" src="img/s11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">은하수를 여행하는 히치하이커를 위한 안내서</div>
                        <div class="book-author">더글러스 애덤스</div>
                        <div class="review-preview">유머러스하고 기발한 우주 여행 SF 코미디</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s12.jpg" alt="배경" />
                    <img class="cover-img" src="img/s12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">파리대왕</div>
                        <div class="book-author">윌리엄 골딩</div>
                        <div class="review-preview">문명과 야만성에 대한 깊이 있는 탐구</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s13.jpg" alt="배경" />
                    <img class="cover-img" src="img/s13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사이보그가 되다</div>
                        <div class="book-author">김초엽, 김원영</div>
                        <div class="review-preview">기술과 인간의 경계에 대한 현대적 성찰</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s14.jpg" alt="배경" />
                    <img class="cover-img" src="img/s14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">스페이스 오디세이</div>
                        <div class="book-author">아서 C. 클라크</div>
                        <div class="review-preview">인류의 기원과 진화를 탐구한 SF</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s15.jpg" alt="배경" />
                    <img class="cover-img" src="img/s15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">백만 광년의 고독 속에서 한 줄의 시를 읽다</div>
                        <div class="book-author">류시화</div>
                        <div class="review-preview">우주적 스케일에서 바라본 인간 존재의 의미</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s16.jpg" alt="배경" />
                    <img class="cover-img" src="img/s16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 전설이다</div>
                        <div class="book-author">리처드 매드슨</div>
                        <div class="review-preview">포스트 아포칼립스 장르의 원형</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s17.jpg" alt="배경" />
                    <img class="cover-img" src="img/s17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">호밀밭의 파수꾼</div>
                        <div class="book-author">J.D. 샐린저</div>
                        <div class="review-preview">청소년 성장 소설의 고전</div>
                    </div>
                </div>


                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s18.jpg" alt="배경" />
                    <img class="cover-img" src="img/s18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">시녀 이야기</div>
                        <div class="book-author">마거릿 애트우드</div>
                        <div class="review-preview">페미니즘 디스토피아 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s19.jpg" alt="배경" />
                    <img class="cover-img" src="img/s19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">장미의 이름</div>
                        <div class="book-author">움베르토 에코</div>
                        <div class="review-preview">중세 수도원을 배경으로 한 지적 추리 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/s20.jpg" alt="배경" />
                    <img class="cover-img" src="img/s20.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">설국열차</div>
                        <div class="book-author">자크 로브</div>
                        <div class="review-preview">계급 사회를 풍자한 포스트 아포칼립스</div>
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
        