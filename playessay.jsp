<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>에세이 - 책 추천</title>
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
            <div class="page-title">에세이</div>
        </div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
				<iframe src="https://www.youtube.com/embed/COKMTPmvaMA?si=-f_oHY6jr0A74xbD" title="YouTube video player" 
				frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
				referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <div class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/esa1.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">단 한 번의 삶</div>
                        <div class="featured-book-author">저자: 김영하</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.7</span>
                            <span>(240)</span>
                        </div>
                        <div class="featured-book-description">
                            단 한 번의 삶』은 작가의 지난 산문들보다 더 사적이고 한층 내밀하다. 
                            김영하는 '작가 김영하'에서 벗어나, 한 번뿐인 삶을 살아가는 우리 가운데 한 사람으로서 가만히 말을 건넨다. 
                            열네 편의 이야기에 담긴 진솔한 가족사와 직접 경험한 인생의 순간을 아우르는 깊은 사유는 우리를 멈춰 생각하게 한다.
                            우리는 얼마나 서로를, 그리고 자신을 모르고 살아가는가. 생각은 하나의 질문으로 수렴된다. 
                            내 앞에 놓인 삶을 어떻게 살아가야 할까. 이 책은 독자들에게 쉬운 위로나 뻔한 조언을 건네지 않는다. 
                            대신 담담히 풀어낸 솔직한 경험과 고민을 통해 독자들이 자신의 삶을 되돌아보게 만든다. 
                            『단 한 번의 삶』과 함께, 두고 온 시절에서 발견한 자기 삶의 장면들을 기록해보길 권한다.
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cards-section">
            <h2 class="cards-title">📚 WITHUS의 추천 에세이</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">무소유</div>
                        <div class="book-author">법정</div>
                        <div class="review-preview">간결한 삶의 미학, 한국 에세이의 고전</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp1.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">인연</div>
                        <div class="book-author">피천득</div>
                        <div class="review-preview">삶의 소중한 인연들을 담은 서정적 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp2.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">개인주의자 선언</div>
                        <div class="book-author">문유석</div>
                        <div class="review-preview">사회와 개인의 균형을 찾아가는 이야기</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp3.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 나로 살기로 했다</div>
                        <div class="book-author">김수현</div>
                        <div class="review-preview">현대인의 공감을 얻은 위로와 자존감 회복 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp4.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죽음의 수용소에서</div>
                        <div class="book-author">빅터 프랭클</div>
                        <div class="review-preview">인간 존재의 의미를 탐색한 실존주의 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp5.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">어떻게 살 것인가</div>
                        <div class="book-author">유시민</div>
                        <div class="review-preview">삶의 방향을 제시하는 철학적 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp6.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">혼자가 혼자에게</div>
                        <div class="book-author">이병률</div>
                        <div class="review-preview">여행과 고독 속에서 찾은 감성</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp7.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">여행의 이유</div>
                        <div class="book-author">김영하</div>
                        <div class="review-preview">여행을 통한 삶의 의미 탐색</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp8.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">낭만적 연애와 그 후의 일상</div>
                        <div class="book-author">알랭 드 보통</div>
                        <div class="review-preview">관계에 대한 철학적 고찰</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp9.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">아픔이 길이 되려면</div>
                        <div class="book-author">김승섭</div>
                        <div class="review-preview">아픔을 통해 사회를 바라보는 시선</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp10.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">언어의 온도</div>
                        <div class="book-author">이기주</div>
                        <div class="review-preview">언어가 가진 힘과 의미를 담은 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp11.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">내 옆에 있는 사람</div>
                        <div class="book-author">이병률</div>
                        <div class="review-preview">일상 속 관계와 감성</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp12.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">게으를 권리</div>
                        <div class="book-author">베르트랑 러셀</div>
                        <div class="review-preview">현대 사회의 노동에 대한 비판적 통찰</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp13.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">월든</div>
                        <div class="book-author">헨리 데이비드 소로</div>
                        <div class="review-preview">자연 속에서 자급자족하며 살았던 경험</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp14.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">우리는 언젠가 만난다</div>
                        <div class="book-author">채사장</div>
                        <div class="review-preview">관계와 삶에 대한 철학적 성찰</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp15.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">슬픔을 공부하는 슬픔</div>
                        <div class="book-author">신형철</div>
                        <div class="review-preview">비평가의 섬세한 시선으로 읽는 문학과 사회</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp16.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">하늘 호수로 떠난 여행</div>
                        <div class="book-author">류시화</div>
                        <div class="review-preview">영혼의 성장을 위한 여행 에세이</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp17.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">개인주의자 선언</div>
                        <div class="book-author">문유석</div>
                        <div class="review-preview">사회와 개인의 균형을 찾아가는 이야기</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp18.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사랑의 기술</div>
                        <div class="book-author">에리히 프롬</div>
                        <div class="review-preview">진정한 사랑의 의미를 탐색하는 고전</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp19.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">태도에 관하여</div>
                        <div class="book-author">임경선</div>
                        <div class="review-preview">자신만의 삶의 태도를 찾아가는 이야기</div>
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