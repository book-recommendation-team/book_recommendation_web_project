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
            text-decoration: none;
            color: inherit;
        }

        .card:hover {
            transform: translateY(-5px);
            text-decoration: none;
            color: inherit;
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
                    <a href="https://search.shopping.naver.com/book/catalog/53735013051?query=%EB%8B%A8%20%ED%95%9C%20%EB%B2%88%EC%9D%98%20%EC%82%B6&NaPm=ct%3Dmcu90a20%7Cci%3D3c3c979758c78a075d02727cfc8916cb0a4c4f45%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D05da3badf4b48f8a667a9b7a75a5af4833aac31e" target="_blank" class="featured-book-image">
                        <img src="img/esa1.jpg" alt="단 한 번의 삶 책 표지">
                    </a>
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
                <a href="https://search.shopping.naver.com/book/catalog/42325184618?query=%EB%AC%B4%EC%86%8C%EC%9C%A0&NaPm=ct%3Dmcu8ppnk%7Cci%3D321961b23d79c81573360834d80e34a539b1d37e%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D73e70fe564dc2199fe6941a840b68ab24c34627c" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">무소유</div>
                        <div class="book-author">법정</div>
                        <div class="review-preview">간결한 삶의 미학, 한국 에세이의 고전</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32482042408?query=%EC%9D%B8%EC%97%B0%20%ED%94%BC%EC%B2%9C%EB%93%9D&NaPm=ct%3Dmcu8qahk%7Cci%3D78407c8838bcc6a0679308b96ec80eacab3319e7%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd68886a5c36e89a1fd19f2b0fc435199a1a81584" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp1.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp1.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">인연</div>
                        <div class="book-author">피천득</div>
                        <div class="review-preview">삶의 소중한 인연들을 담은 서정적 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441659387?query=%EA%B0%9C%EC%9D%B8%EC%A3%BC%EC%9D%98%EC%9E%90%20%EC%84%A0%EC%96%B8&NaPm=ct%3Dmcu8qi7c%7Cci%3D3e974f40f3fddd5bd51ea6a0cf81761948cb5638%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbc0757d7ccf6dfab1865cffc24d6f3ee8900edde" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp2.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp2.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">개인주의자 선언</div>
                        <div class="book-author">문유석</div>
                        <div class="review-preview">사회와 개인의 균형을 찾아가는 이야기</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32465494978?query=%EB%82%98%EB%8A%94%20%EB%82%98%EB%A1%9C%20%EC%82%B4%EA%B8%B0%EB%A1%9C%20%ED%96%88%EB%8B%A4&NaPm=ct%3Dmcu8qt08%7Cci%3D63785833ed3ef9cc3e1f809f285d726fd5159312%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D7662d4e15873bf614ffe9dc78622603637f9ca39" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp3.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp3.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">나는 나로 살기로 했다</div>
                        <div class="book-author">김수현</div>
                        <div class="review-preview">현대인의 공감을 얻은 위로와 자존감 회복 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32485602637?query=%EC%A3%BD%EC%9D%8C%EC%9D%98%20%EC%88%98%EC%9A%A9%EC%86%8C%EC%97%90%EC%84%9C&NaPm=ct%3Dmcu8r1hs%7Cci%3Db11a22f334d9d526e04e9ac3014434f2c0224dc4%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dea989ff3595eec40d76f7533bebd5ddefc864e33" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp4.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp4.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">죽음의 수용소에서</div>
                        <div class="book-author">빅터 프랭클</div>
                        <div class="review-preview">인간 존재의 의미를 탐색한 실존주의 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32465515855?query=%EC%96%B4%EB%96%BB%EA%B2%8C%20%EC%82%B4%20%EA%B2%83%EC%9D%B8%EA%B0%80&NaPm=ct%3Dmcu8rdu8%7Cci%3D5af47b7bae28bcada18cc2ee2cd69def5eaeeb51%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0db0fb05bef4cee4cdc15aacc83f6f0bdf1df56d" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp5.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp5.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">어떻게 살 것인가</div>
                        <div class="book-author">유시민</div>
                        <div class="review-preview">삶의 방향을 제시하는 철학적 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32490282198?query=%ED%98%BC%EC%9E%90%EA%B0%80%20%ED%98%BC%EC%9E%90%EC%97%90%EA%B2%8C&NaPm=ct%3Dmcu8rpew%7Cci%3D8b9296a3fdf86a8d61f65917e902c017930d7513%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D9ea8c4e914b1ed0b7763d4cc928f5ecb45ad8f89" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp6.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp6.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">혼자가 혼자에게</div>
                        <div class="book-author">이병률</div>
                        <div class="review-preview">여행과 고독 속에서 찾은 감성</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/46931760625?query=%EC%97%AC%ED%96%89%EC%9D%98%20%EC%9D%B4%EC%9C%A0&NaPm=ct%3Dmcu8rx4o%7Cci%3Ddc4f0aaa1f93d858f39970604ab17bf061364c13%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D16a4b847d2425acae8feacf5873931297781c998" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp7.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp7.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">여행의 이유</div>
                        <div class="book-author">김영하</div>
                        <div class="review-preview">여행을 통한 삶의 의미 탐색</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32436139331?query=%EB%82%AD%EB%A7%8C%EC%A0%81%20%EC%97%B0%EC%95%A0%EC%99%80%20%EA%B7%B8%20%ED%9B%84%EC%9D%98%20%EC%9D%BC%EC%83%81&NaPm=ct%3Dmcu8s75s%7Cci%3D26f6fcb6cbf7534c3151b9949b9987f98c9a5290%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D048b116fe7255f74d501c1c5278dd0bd7f6bbae8" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp8.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp8.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">낭만적 연애와 그 후의 일상</div>
                        <div class="book-author">알랭 드 보통</div>
                        <div class="review-preview">관계에 대한 철학적 고찰</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32475523886?query=%EC%95%84%ED%94%94%EC%9D%B4%20%EA%B8%B8%EC%9D%B4%20%EB%90%98%EB%A0%A4%EB%A9%B4&NaPm=ct%3Dmcu8sevk%7Cci%3D4c30f3d0ef967407bc47cc99fee635ab298a5bca%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dbdcc40c2be624055dcf7f65bd0e3d4521f73c28f" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp9.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp9.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">아픔이 길이 되려면</div>
                        <div class="book-author">김승섭</div>
                        <div class="review-preview">아픔을 통해 사회를 바라보는 시선</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32445599640?query=%EC%96%B8%EC%96%B4%EC%9D%98%20%EC%98%A8%EB%8F%84&NaPm=ct%3Dmcu8sl1s%7Cci%3D05a59e11282e2d25412d9c483586dae17de259bd%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D74a13472225b3c696a2687938ab4d34d4fe24b7c" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp10.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp10.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">언어의 온도</div>
                        <div class="book-author">이기주</div>
                        <div class="review-preview">언어가 가진 힘과 의미를 담은 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32466975969?query=%EB%82%B4%20%EC%98%86%EC%97%90%20%EC%9E%88%EB%8A%94%20%EC%82%AC%EB%9E%8C&NaPm=ct%3Dmcu8sub4%7Cci%3D0f00b4eec63ca45551eee5ff46137b2d8d5059d5%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D161c91146cd6c5f19fa0321d113f6b76bc4441d3" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp11.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp11.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">내 옆에 있는 사람</div>
                        <div class="book-author">이병률</div>
                        <div class="review-preview">일상 속 관계와 감성</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32466637728?query=%EA%B2%8C%EC%9C%BC%EB%A5%BC%20%EA%B6%8C%EB%A6%AC&NaPm=ct%3Dmcu8vhzk%7Cci%3D935d2f2521372d1e912fd14ccf64d9346ec15766%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Db4206ad930de6bb29fd39980e523291f2593c50e" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp12.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp12.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">게으를 권리</div>
                        <div class="book-author">폴 라파르그</div>
                        <div class="review-preview">일할 권리를 앞세우는 주장에 대한 반박</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32445721746?query=%EC%B2%98%EC%9D%8C%20%EC%9D%BD%EB%8A%94%20%EC%9B%94%EB%93%A0&NaPm=ct%3Dmcu8xccg%7Cci%3Ddce5705ea47111cc0043ddddaddf9a2217f4a9f4%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Df4bfbe574585e6b7b27e6b52a83a26879a0e8dd1" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp13.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp13.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">월든</div>
                        <div class="book-author">헨리 데이비드 소로</div>
                        <div class="review-preview">자연 속에서 자급자족하며 살았던 경험</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32466539178?query=%EC%9A%B0%EB%A6%AC%EB%8A%94%20%EC%96%B8%EC%A0%A0%EA%B0%80%20%EB%A7%8C%EB%82%9C%EB%8B%A4&NaPm=ct%3Dmcu8xq8g%7Cci%3De3bf40a69e7b6ca0c324bde017d9a56039ed3761%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dd6735772aa25c3861760ecd5ca6076ca4939d4b2" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp14.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp14.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">우리는 언젠가 만난다</div>
                        <div class="book-author">채사장</div>
                        <div class="review-preview">관계와 삶에 대한 철학적 성찰</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32454453350?query=%EC%8A%AC%ED%94%94%EC%9D%84%20%EA%B3%B5%EB%B6%80%ED%95%98%EB%8A%94%20%EC%8A%AC%ED%94%94&NaPm=ct%3Dmcu8y1t4%7Cci%3D460a0dc6ab9dc1a82386e36ac7e1310be04c5bbd%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D0f434cdc462d188ffdd1bbf49a446ae51a10b7eb" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp15.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp15.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">슬픔을 공부하는 슬픔</div>
                        <div class="book-author">신형철</div>
                        <div class="review-preview">비평가의 섬세한 시선으로 읽는 문학과 사회</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32487161391?query=%ED%95%98%EB%8A%98%20%ED%98%B8%EC%88%98%EB%A1%9C%20%EB%96%A0%EB%82%9C&NaPm=ct%3Dmcu8y8r4%7Cci%3Dfa9802a8c48cdfacd697c361158a7ca30c34f120%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D36107549c39165aad4cb28d1e039d269093e2ca5" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp16.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp16.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">하늘 호수로 떠난 여행</div>
                        <div class="book-author">류시화</div>
                        <div class="review-preview">영혼의 성장을 위한 여행 에세이</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32441659387?query=%EA%B0%9C%EC%9D%B8%EC%A3%BC%EC%9D%98%EC%9E%90%20%EC%84%A0%EC%96%B8&NaPm=ct%3Dmcu8yjk0%7Cci%3D79a77564798f9e142459220e79e494f8efbe281e%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D761111e2eb93fe6ed436493500310c78d4344d3c" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp17.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp17.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">개인주의자 선언</div>
                        <div class="book-author">문유석</div>
                        <div class="review-preview">사회와 개인의 균형을 찾아가는 이야기</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/32457424202?query=%EC%82%AC%EB%9E%91%EC%9D%98%20%EA%B8%B0%EC%88%A0&NaPm=ct%3Dmcu8yr9s%7Cci%3D38a3e2f61b91c5de626822b2c260f934cbbd01a6%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3Dc0f6135d81da46bf849862d40c40eb63df3e51d0" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp18.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp18.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">사랑의 기술</div>
                        <div class="book-author">에리히 프롬</div>
                        <div class="review-preview">진정한 사랑의 의미를 탐색하는 고전</div>
                    </div>
                </a>

                <a href="https://search.shopping.naver.com/book/catalog/50466246618?query=%ED%83%9C%EB%8F%84%EC%97%90%EA%B4%80%ED%95%98%EC%97%AC&NaPm=ct%3Dmcu8yzrc%7Cci%3D8de09ebefb5333e58a514e9a1439448274b6072f%7Ctr%3Dboksl%7Csn%3D95694%7Chk%3D3cc23b21194c3d8de6da160aca3e8819475ab0b8" target="_blank" class="card">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img" src="img/dp19.jpg" alt="배경" />
                    <img class="cover-img" src="img/dp19.jpg" alt="표지" />
                    <div class="card-content">
                        <div class="book-title">태도에 관하여</div>
                        <div class="book-author">임경선</div>
                        <div class="review-preview">자신만의 삶의 태도를 찾아가는 이야기</div>
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