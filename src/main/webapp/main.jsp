<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ page import="model.User"%>

<%
// [수정 1] loggedInUser 변수를 페이지 상단에서 한 번만 선언하여
// 페이지 내 모든 스크립틀릿에서 접근할 수 있도록 범위를 조정합니다.
User loggedInUser = (User) session.getAttribute("loggedInUser");
String contextPath = request.getContextPath(); // [개선 1] contextPath도 미리 변수로 선언
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHUS</title>

<%-- [권장] CSS는 가급적 .css 파일로 분리하고 <link> 태그로 연결하는 것이 표준적인 방법입니다. --%>
<%-- <link rel="stylesheet" href="<%= contextPath %>/css/main.css"> --%>
<%@ include file="css/main_css.jsp"%>

<link rel="icon" href="img/icon2.png" type="image/x-icon">
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>
<body>
	<header>
		<div id="logo">
			<a href="<%=contextPath%>/main.jsp"> <img src="img/logo.png"
				alt="로고"></a>
		</div>


		<div class="search-form">
			<input type="text" id="search-box" placeholder="검색어를 입력하세요..."
				class="search-input" />
			<button type="button" id="search-btn" class="search-button">검색</button>
		</div>


		<div id="user-buttons">
			<%
			if (loggedInUser == null) {
				// 로그인되어 있지 않은 경우
			%>
			<button id="join-btn">회원가입</button>
			<button id="login-btn">로그인</button>
			<%
			} else {
			// 로그인되어 있는 경우
			%>
			<span class="welcome-message">환영합니다, <%=loggedInUser.getNickname()%>님!
			</span>
			<button id="mypage-btn">마이페이지</button>
			<button id="logout-btn">로그아웃</button>
			<%
			}
			%>
		</div>
	</header>

	<nav>
		<a href="#">(AI) 책 추천</a> <a
			href="${pageContext.request.contextPath}/reviewList">리뷰</a> <a
			href="#">플레이리스트</a> <a
			href="${pageContext.request.contextPath}/celebList">셀럽추천</a>
		<%-- [수정 1 해결] 이제 loggedInUser가 정상적으로 접근 가능합니다. EL을 사용하면 더 간결해집니다. --%>
		<a href="${loggedInUser != null ? 'mypage.jsp' : 'login.jsp'}">마이페이지</a>
	</nav>
	<div id="main-content-area">
		<div class="banner">
			<a id="banner-link"
				href="https://product.kyobobook.co.kr/detail/S000215578377"
				target="_blank"> <img id="banner-image" src="img/b1.jpg"
				alt="배너 이미지" />
			</a>
			<div class="banner-controls">
				<%-- [개선 3] onclick 속성을 제거하고 JS에서 이벤트 리스너를 추가합니다. --%>
				<button id="banner-prev-btn">&#9664;</button>
				<button id="banner-toggle-btn">⏸</button>
				<button id="banner-next-btn">&#9654;</button>
			</div>
		</div>

		<div class="section-title">
			<%-- [개선 3] onclick 속성을 제거하고 JS에서 이벤트 리스너를 추가합니다. --%>
			<a href="#" data-banner="weekly" id="btn-weekly">이 주의 책</a> <a
				href="#" data-banner="new" id="btn-new">신간 소개</a> <a href="#"
				data-banner="featured" id="btn-featured">눈에 띄는 새책</a> <a href="#"
				data-banner="hot" id="btn-hot">화제의 책</a> <a href="#"
				data-banner="exclusive" id="btn-exclusive">단독 에디션</a>
		</div>

		<div class="main_list">
			<h2>
				<%-- [개선 3] onclick 속성을 제거하고 JS에서 이벤트 리스너를 추가합니다. --%>
				<button id="main-list-title" data-tag="cool"
					style="background: none; border: none; font-size: 24px; font-weight: bold; cursor: pointer;">돌고
					돌아 다시 여름</button>
			</h2>
			<div class="tag-list">
				<%-- [개선 3] onclick 속성을 제거하고 JS에서 이벤트 리스너를 추가합니다. --%>
				<button class="tag-button" data-tag="cool">서늘한 여름</button>
				<button class="tag-button" data-tag="tearful">눈물의 여름</button>
				<button class="tag-button" data-tag="moment">여름의 순간들</button>
				<button class="tag-button" data-tag="new">상반기 베스트 셀러</button>
			</div>
			<div>
				<button id="carousel-prev-btn" color="#446b3c">&#9664;</button>
				<button id="carousel-next-btn" color="#446b3c">&#9654;</button>
			</div>
			<div id="book-list-container"></div>
		</div>
	</div>
	<%-- 맨 위로 가기 버튼 --%>
	<button id="scrollToTopBtn">
		<img src="img/up1.png" alt="위로 가기 버튼" />
	</button>


	<%-- 푸터 파일 포함 --%>
	<%@ include file="./main_footer.jsp"%>

	<%-- [수정 2] 불필요한 스크립틀릿 제거
    String query = request.getParameter("query");
    이 코드는 JavaScript 로직에서 사용되지 않으므로 삭제합니다.
    --%>

	<script>
    // [개선 4] 모든 JavaScript 로직을 DOMContentLoaded 이벤트 리스너 안에 넣어
    // 전역 스코프의 오염을 방지하고 코드 실행 순서를 보장합니다.
    
    document.addEventListener('DOMContentLoaded', () => {
    	console.log("contextPath: '<%=request.getContextPath()%>'");
    	const contextPath = "<%=request.getContextPath()%>";
        const mainContentArea = document.getElementById('main-content-area');
        const searchInput = document.getElementById('search-box');
        const searchBtn = document.getElementById('search-btn');
        if (searchBtn) {
          searchBtn.addEventListener('click', () => {
            const query = searchInput.value.trim();
            performSearch(query);
          });
        }
        // --- 검색 기능 ---
        async function performSearch(query) {
            if (!query || !query.trim()) {
                alert('검색어를 입력해주세요.');
                return;
            }
            
            mainContentArea.innerHTML = '<p class="loading-message">검색 중...</p>';

            try {
                const encodedQuery = encodeURIComponent(query);
                // [수정 3] 하드코딩된 경로를 동적 contextPath로 변경합니다.
                const apiUrl = `${'${contextPath}'}/searchBook?query=${'${encodedQuery}'}'`;
                
                const response = await fetch(apiUrl);
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                
                const data = await response.json();
                displaySearchResults(data.items);
            } catch (error) {
                console.error('Search failed:', error);
                mainContentArea.innerHTML = '<p class="error-message">검색 중 오류가 발생했습니다.</p>';
            }
        }

        function displaySearchResults(books) {
            mainContentArea.innerHTML = '';
            if (!books || books.length === 0) {
                mainContentArea.innerHTML = '<p class="info-message">검색 결과가 없습니다.</p>';
                return;
            }

            // [개선] 이 스타일은 main_css.jsp 또는 main.css 파일에 미리 정의해두는 것이 좋습니다.
            const styleId = 'search-result-styles';
            if (!document.getElementById(styleId)) {
                const style = document.createElement('style');
                style.id = styleId;
                style.innerHTML = `
                    .search-results-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 25px; padding: 20px 50px; }
                    .book-card { border: 1px solid #ddd; border-radius: 8px; padding: 15px; text-align: center; background-color: #f9f9f9; transition: transform 0.2s; }
                    .book-card:hover { transform: translateY(-5px); box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
                    .book-card img { width: 180px; height: 260px; object-fit: cover; border-radius: 4px; }
                    .book-card h3 { font-size: 1em; margin: 10px 0 5px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
                    .book-card p { font-size: 0.8em; color: #666; }
                `;
                document.head.appendChild(style);
            }

            const resultsGrid = document.createElement('div');
            resultsGrid.className = 'search-results-grid';

            books.forEach(book => {
                const bookCard = document.createElement('div');
                bookCard.className = 'book-card';
                const title = book.title.replace(/<b>|<\/b>/g, '');
                const author = book.author.replace(/<b>|<\/b>/g, '');
                const imageUrl = book.image;
                console.log(imageUrl)

                let imgHtml = `<img src="${'${contextPath}'}/img/icon2.png" alt="${'${title}'}">`;
                if (imageUrl) {
                    const encodedUrl = encodeURIComponent(imageUrl);
                    const proxySrc = `${'${contextPath}'}/imageProxy?url=${'${encodedUrl}'}`;
                    imgHtml = `<img src="${'${imageUrl}'}" alt="${'${title}'}" onerror="this.onerror=null; this.src='${contextPath}/img/icon2.png';">`;
                }
					
                const linkedImgHtml = '<a href="' + book.link + '" target="_blank">' + imgHtml + '</a>';

                bookCard.innerHTML = `${'${linkedImgHtml}'}'<h3>${'${title}'}</h3><p>${'${author}'}</p>`;

                //bookCard.innerHTML = `${'${imgHtml}'}'<h3>${'${title}'}</h3><p>${'${author}'}</p>`;
               
				
                resultsGrid.appendChild(bookCard);
            });

            mainContentArea.appendChild(resultsGrid);
        }

        // --- 책 목록 캐러셀 기능 ---

        // [구조적 문제 경고]
        // 아래 booksData처럼 JavaScript 변수에 많은 양의 HTML을 문자열로 저장하는 것은
        // 유지보수를 매우 어렵게 만듭니다. 서버에서 데이터를 JSON으로 받아와 동적으로 HTML을 생성(AJAX)하는
        // 방식을 사용하는 것이 훨씬 좋은 아키텍처입니다.
        const booksData = {
            cool: `<p>서늘한 여름 책 목록 HTML...</p>`, // 예시: 실제로는 book-carousel HTML
            tearful: `<p>눈물의 여름 책 목록 HTML...</p>`,
            moment: `<p>여름의 순간들 책 목록 HTML...</p>`,
            new: `<p>상반기 베스트 셀러 목록 HTML...</p>`
        };

        const tags = ['cool', 'tearful', 'moment', 'new'];
        let currentTagIndex = 0;
        const bookListContainer = document.getElementById('book-list-container');
        const tagButtons = document.querySelectorAll('.tag-button');

        function getTagLabel(tag) {
            const button = document.querySelector(`.tag-button[data-tag="${tag}"]`);
            return button ? button.textContent.trim() : '';
        }

        function updateActiveTagButton() {
            tagButtons.forEach(btn => {
                btn.classList.toggle('active', btn.dataset.tag === tags[currentTagIndex]);
            });
        }

        function showBooks(tag) {
            bookListContainer.innerHTML = booksData[tag] || '<p>해당 카테고리의 책이 없습니다.</p>';
            currentTagIndex = tags.indexOf(tag);
            updateActiveTagButton();
        }


        // --- 배너 기능 ---
        const bannerImage = document.getElementById('banner-image');
        const bannerLink = document.getElementById('banner-link');
        const pauseBtn = document.getElementById('banner-toggle-btn');
        const bannerData = {
            weekly: { img: "img/b1.jpg", link: "https://product.kyobobook.co.kr/detail/S000215578377" },
            new: { img: "img/honmono_reco.jpg", link: "https://product.kyobobook.co.kr/detail/S000216111714" },
            featured: { img: "img/b3.jpg", link: "https://product.kyobobook.co.kr/detail/S000216842334" },
            hot: { img: "img/b4.jpg", link: "https://product.kyobobook.co.kr/detail/S000000781065" },
            exclusive: { img: "img/event.png", link: "#" }
        };
        const bannerKeys = Object.keys(bannerData);
        let currentBannerIndex = 0;
        let bannerInterval = null;

        function showBanner(index) {
            const key = bannerKeys[index];
            bannerImage.src = bannerData[key].img;
            bannerLink.href = bannerData[key].link;
        }

        function nextBanner() {
            currentBannerIndex = (currentBannerIndex + 1) % bannerKeys.length;
            showBanner(currentBannerIndex);
        }

        function prevBanner() {
            currentBannerIndex = (currentBannerIndex - 1 + bannerKeys.length) % bannerKeys.length;
            showBanner(currentBannerIndex);
        }

        function toggleSlide() {
            if (bannerInterval) {
                clearInterval(bannerInterval);
                bannerInterval = null;
                pauseBtn.textContent = "▶";
            } else {
                startAutoSlide();
                pauseBtn.textContent = "⏸";
            }
        }

        function startAutoSlide() {
            if (bannerInterval) clearInterval(bannerInterval);
            bannerInterval = setInterval(nextBanner, 3000);
        }

        function changeBanner(key) {
            const index = bannerKeys.indexOf(key);
            if (index !== -1) {
                currentBannerIndex = index;
                showBanner(currentBannerIndex);
                if (bannerInterval) {
                    clearInterval(bannerInterval);
                    bannerInterval = null;
                    pauseBtn.textContent = "▶";
                }
            }
        }


        // --- 이벤트 리스너 바인딩 ---
        const logoutBtn = document.getElementById('logout-btn');
        if (logoutBtn) {
            logoutBtn.addEventListener('click', () => {
                if (confirm('로그아웃 하시겠습니까?')) {
                    window.location.href = `${contextPath}/logout`;
                }
            });
        }
        
        const joinBtn = document.getElementById('join-btn');
        if(joinBtn) joinBtn.addEventListener('click', () => location.href='register.jsp');

        const loginBtn = document.getElementById('login-btn');
        if(loginBtn) loginBtn.addEventListener('click', () => location.href='login.jsp');
        
        const mypageBtn = document.getElementById('mypage-btn');
        if(mypageBtn) mypageBtn.addEventListener('click', () => location.href='mypage.jsp');


        document.getElementById('banner-prev-btn').addEventListener('click', prevBanner);
        document.getElementById('banner-next-btn').addEventListener('click', nextBanner);
        document.getElementById('banner-toggle-btn').addEventListener('click', toggleSlide);

        document.querySelectorAll('.section-title a').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                changeBanner(e.target.dataset.banner);
            });
        });

        tagButtons.forEach(button => {
            button.addEventListener('click', (e) => {
                showBooks(e.target.dataset.tag);
            });
        });

        document.getElementById('main-list-title').addEventListener('click', (e) => {
            showBooks(e.target.dataset.tag);
        });

        document.getElementById('carousel-prev-btn').addEventListener('click', () => {
            currentTagIndex = (currentTagIndex - 1 + tags.length) % tags.length;
            showBooks(tags[currentTagIndex]);
        });

        document.getElementById('carousel-next-btn').addEventListener('click', () => {
            currentTagIndex = (currentTagIndex + 1) % tags.length;
            showBooks(tags[currentTagIndex]);
        });

        const scrollToTopBtn = document.getElementById('scrollToTopBtn');
        window.addEventListener('scroll', () => {
            scrollToTopBtn.style.display = window.scrollY > 300 ? 'block' : 'none';
        });
        scrollToTopBtn.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
        

        // --- 초기화 로직 ---
        function initializePage() {
            const urlParams = new URLSearchParams(window.location.search);
            const queryFromUrl = urlParams.get('query');

            if (queryFromUrl) {
                searchInput.value = decodeURIComponent(queryFromUrl.replace(/\+/g, ' '));
                performSearch(queryFromUrl);
            } else {
                // 기본 페이지 로드
                showBanner(currentBannerIndex);
                startAutoSlide();
                showBooks('cool');
            }
        }

        initializePage();
    });
    </script>
</body>
</html>
