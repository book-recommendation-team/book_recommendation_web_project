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
    <title>시/소설 - 책 추천</title>
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
    <%@ include file="header.jsp" %>

   <nav>
		<a href="<%=contextPath%>/aiRecommend.jsp">(AI) 책 추천</a> <a
			href="<%=contextPath%>/reviewList">리뷰</a> <a
			href="<%=contextPath%>/playlistmain.jsp">플레이리스트</a> <a
			href="<%=contextPath%>/celebList">셀럽추천</a> <a
			href="<%=contextPath%>/mypage.jsp">마이페이지</a>
	</nav>

    <div class="container">
        <!-- 뒤로가기 버튼 -->
        <a href="playlistmain.jsp" class="back-button" title="뒤로가기">
            <i class="fas fa-arrow-left"></i>
        </a>

        <div class="page-title">시/소설</div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/Ha7964DxrO0?si=6m-fxoCcJWO_U5el" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <div class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/추천1.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">캐드</div>
                        <div class="featured-book-author">저자: 시튼스 스케치</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.6</span>
                            <span>(5)</span>
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
            <h2 class="cards-title">📚 WITHUS의 추천 도서</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl1.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">하늘과 바람과 별과 시</div>
                        <div class="book-author">윤동주</div>
                        <div class="review-preview">한국 근대시의 정수</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl2.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">진달래꽃</div>
                        <div class="book-author">김소월</div>
                        <div class="review-preview">한국 서정시의 대표작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl3.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">꽃</div>
                        <div class="book-author">김춘수</div>
                        <div class="review-preview">존재론적 탐구를 담은 대표 시집</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl4.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">님의 침묵</div>
                        <div class="book-author">한용운</div>
                        <div class="review-preview">독립과 사랑을 노래한 민족시</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl5.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">별 헤는 밤</div>
                        <div class="book-author">윤동주</div>
                        <div class="review-preview">서정성과 저항 정신의 조화</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl6.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">서랍에 저녁을 넣어 두었다</div>
                        <div class="book-author">한강</div>
                        <div class="review-preview">일상의 소중함을 시적으로 담아낸 감성적 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl7.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">풀꽃</div>
                        <div class="book-author">나태주</div>
                        <div class="review-preview">짧지만 깊은 울림을 주는 현대시</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl8.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사랑하라 한번도 상처받지 않은 것처럼</div>
                        <div class="book-author">류시화 엮음</div>
                        <div class="review-preview">대중에게 사랑받는 외국 시 모음</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl9.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">슬픔이 기쁨에게</div>
                        <div class="book-author">정호승</div>
                        <div class="review-preview">현실 비판과 따뜻한 시선</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl10.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">입속의 검은 잎</div>
                        <div class="book-author">기형도</div>
                        <div class="review-preview">도시인의 불안과 절망을 담은 대표작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl11.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">서시</div>
                        <div class="book-author">윤동주</div>
                        <div class="review-preview">시대의 아픔을 노래한 대표 서시</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl12.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나와 나타샤와 흰 당나귀</div>
                        <div class="book-author">백석</div>
                        <div class="review-preview">토속적이고 향토적인 언어</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl13.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">혼모노</div>
                        <div class="book-author">성해나</div>
                        <div class="review-preview">현대 사회의 허위와 진실을 탐구하는 예리한 통찰</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl14.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">소년이 온다</div>
                        <div class="book-author">한강</div>
                        <div class="review-preview">5·18 광주를 배경으로 한 역사의 아픔과 인간성 탐구</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl15.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">급류</div>
                        <div class="book-author">정대건</div>
                        <div class="review-preview">격동하는 시대 속 인간의 삶과 의지를 그린 힘 있는 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl16.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">채식주의자</div>
                        <div class="book-author">한강</div>
                        <div class="review-preview">여성의 의식과 해방을 그린 충격적이고 강렬한 작품</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl17.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">작별하지 않는다</div>
                        <div class="book-author">한강</div>
                        <div class="review-preview">이별과 기억, 존재에 대한 철학적 성찰이 담긴 시적 소설</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl18.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">외눈박이 물고기의 사랑</div>
                        <div class="book-author">류시화</div>
                        <div class="review-preview">결핍 속에서도 사랑과 이해를 찾아가는 에세이.</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl20.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl20.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">내가 사랑하는 사람</div>
                        <div class="book-author">정호승</div>
                        <div class="review-preview">사랑과 존재의 의미</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/tl21.jpg" alt="배경" />
                    <img class="cover-img" src="img/tl21.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">흰</div>
                        <div class="book-author">한강</div>
                        <div class="review-preview">색깔과 기억을 통해 삶과 죽음을 탐구하는 서정적 산문</div>
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