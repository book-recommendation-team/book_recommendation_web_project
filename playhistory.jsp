<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>인문/역사 - 책 추천</title>
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
            <div class="page-title">인문/역사</div>
        </div>

        <div class="main-content">
            <!-- 왼쪽 영상 섹션 -->
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/YPKSQxXJPMU?si=RvND3CrpVBeYm6ri" 
                    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; 
                    encrypted-media; gyroscope; picture-in-picture; web-share" 
                    referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>
                <div class="featured-book">
                    <div class="featured-book-image">
                        <img src="img/dur5.jpg" alt="캐드 책 표지">
                    </div>
                    <div class="featured-book-info">
                        <div class="featured-book-title">넥서스</div>
                        <div class="featured-book-author">저자: 유발 하라리</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.3</span>
                            <span>(297)</span>
                        </div>
                        <div class="featured-book-description">
                            글로벌 베스트셀러 『사피엔스』 『호모 데우스』 『21세기를 위한 21가지 제언』으로 우리 시대 가장 중요한 사상가의 반열에 오른 유발 하라리 교수가 압도적 통찰로 AI 혁명의 의미와 본질을 꿰뚫어 보고 인류에게 남은 기회를 냉철하게 성찰하는 신작으로 돌아왔다. 
                            생태적 붕괴와 국제정치적 긴장에 이어 친구인지 적인지 모를 AI 혁명까지, 인간 본성의 어떤 부분이 우리를 자기 파괴의 길로 내모는 것일까? AI는 이전 정보 기술과 무엇이 다르고, 왜 위험할까? 멸종을 향해 달려가는 가장 영리한 동물, 우리 사피엔스는 생존과 번영의 길을 찾을 수 있을까?
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="cards-section">
            <h2 class="cards-title">📚 WITHUS의 추천 인문/역사</h2>
            <div class="grid">
                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사피엔스</div>
                        <div class="book-author">유발 하라리</div>
                        <div class="review-preview">인류의 역사와 미래를 거시적으로 조망</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur1.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">역사란 무엇인가</div>
                        <div class="book-author">E.H. 카</div>
                        <div class="review-preview">역사학의 고전이자 필독서</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur2.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">로마 제국 쇠망사</div>
                        <div class="book-author">에드워드 기번</div>
                        <div class="review-preview">서양 고전 역사의 기념비적 저작</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur3.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">총, 균, 쇠</div>
                        <div class="book-author">재레드 다이아몬드</div>
                        <div class="review-preview">문명의 흥망성쇠를 환경적 관점에서 분석</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur4.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나의 문화유산답사기</div>
                        <div class="book-author">유홍준</div>
                        <div class="review-preview">한국 문화유산의 아름다움을 대중에게 알림</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur5.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">넥서스</div>
                        <div class="book-author">유발 하라리</div>
                        <div class="review-preview">정보와 권력의 미래를 예측하는 통찰력 있는 분석</div>
                    </div>
                </div>
                    <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur6.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">서양미술사</div>
                        <div class="book-author">에른스트 H. 곰브리치</div>
                        <div class="review-preview">미술사의 바이블로 불리는 대표적인 입문서</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur7.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">문화의 수수께끼</div>
                        <div class="book-author">마빈 해리스</div>
                        <div class="review-preview">다양한 문화 현상을 인류학적 관점에서 해석</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur8.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죽은 경제학자의 살아있는 아이디어</div>
                        <div class="book-author">토드 부크홀츠</div>
                        <div class="review-preview">경제사상사를 쉽고 재미있게 풀어냄</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur9.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">21세기 자본</div>
                        <div class="book-author">토마 피케티</div>
                        <div class="review-preview">불평등 문제를 역사적 데이터로 분석</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur10.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">유럽 도시 기행1</div>
                        <div class="book-author">유시민</div>
                        <div class="review-preview">유럽 도시들의 역사와 문화를 깊이 있게 탐방</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur11.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사마천 사기</div>
                        <div class="book-author">사마천</div>
                        <div class="review-preview">중국 역사서의 걸작이자 동양 사학의 출발점</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur12.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">조선왕조실록</div>
                        <div class="book-author">대중을 위한 번역본</div>
                        <div class="review-preview">한국사의 방대한 기록물</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/a1.jpg" alt="배경" />
                    <img class="cover-img" src="img/a1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">물질의 세계</div>
                        <div class="book-author">에드 콘웨이</div>
                        <div class="review-preview">현대 문명을 이루는 물질들의 숨겨진 이야기</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur13.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">삼국유사</div>
                        <div class="book-author">일연</div>
                        <div class="review-preview">한국 고대사와 불교문화의 소중한 기록</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur14.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">역사의 종말</div>
                        <div class="book-author">프랜시스 후쿠야마</div>
                        <div class="review-preview">냉전 이후 서구 자유민주주의의 승리 선언</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur18.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">세계사를 바꾼 10가지 약</div>
                        <div class="book-author">사토 겐타로</div>
                        <div class="review-preview">인류 역사는 ‘질병과 약의 투쟁 역사’다</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur17.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">다시, 역사의 쓸모</div>
                        <div class="book-author">최태성</div>
                        <div class="review-preview">현재를 이해하기 위한 역사적 통찰력</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur15.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">잃어버린 시간을 찾아서</div>
                        <div class="book-author">마르셀 프루스트</div>
                        <div class="review-preview">기억과 시간의 본질을 탐구</div>
                    </div>
                </div>

                <div class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dur19.jpg" alt="배경" />
                    <img class="cover-img" src="img/dur19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">호모데우스</div>
                        <div class="book-author">유발 하라리</div>
                        <div class="review-preview">기술 발전이 가져올 인류의 미래를 예측</div>
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