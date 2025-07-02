<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHUS</title>
<%@ include file="css/main_css.jsp"%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
</head>

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<body>
	<header>
		<div id="logo">
			<a href="main.jsp"> <img src="img/logo.png" alt="로고">
			</a>
		</div>

		<div class="search-group">
			<input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
			<button id="search-btn">검색</button>
		</div>
		<div id="user-buttons">
			<button id="join-btn" onclick="location.href='join.jsp'">회원가입</button>
			<button id="login-btn" onclick="location.href='Login.jsp'">로그인</button>
		</div>
	</header>

	<nav>
		<a href="#">(AI) 책 추천</a> <a
			href="${pageContext.request.contextPath}/reviewList">리뷰</a> <a
			href="#">플레이리스트</a> <a
			href="${pageContext.request.contextPath}/celebList">셀럽추천</a> <a
			href="#">마이페이지</a>
	</nav>

	<div class="banner">
		<img id="banner-image" src="img/recommend1.png" alt="배너 이미지" />
		<div class="banner-controls">
			<button onclick="prevImage()">&#9664;</button>
			<button onclick="toggleSlide()" id="pause-btn">⏸</button>
			<button onclick="nextImage()">&#9654;</button>
		</div>
	</div>

	<div class="section-title">
		<a href="#" onclick="changeBanner('weekly'); return false;"
			id="btn-weekly">이 주의 책</a> <a href="#"
			onclick="changeBanner('new'); return false;" id="btn-new">신간 소개</a> <a
			href="#" onclick="changeBanner('featured'); return false;"
			id="btn-featured">눈에 띄는 새책</a> <a href="#"
			onclick="changeBanner('hot'); return false;" id="btn-hot">화제의 책</a> <a
			href="#" onclick="changeBanner('exclusive'); return false;"
			id="btn-exclusive">단독 에디션</a>
	</div>


	<div class="main_list">
		<h2>
			<button
				style="background: none; border: none; font-size: 24px; font-weight: bold; cursor: pointer;"
				onclick="showBooks('cool')">돌고 돌아 다시 여름</button>
		</h2>
		<div class="tag-list">
			<button class="tag-button" onclick="showBooks('cool')">서늘한
				여름</button>
			<button class="tag-button" onclick="showBooks('tearful')">눈물의
				여름</button>
			<button class="tag-button" onclick="showBooks('moment')">여름의
				순간들</button>
			<button class="tag-button" onclick="showBooks('new')">상반기
				베스트 셀러</button>
		</div>

		<!-- 이전 / 다음 버튼 추가 -->
		<div>
			<button id="carousel-prev-btn" color=#446b3c>&#9664;</button>
			<button id="carousel-next-btn" color=#446b3c>&#9654;</button>
		</div>

		<div id="book-list-container"></div>
	</div>

	<footer>
		<div class="footer-container">
			<p>&copy; 2025 WITHUS. All rights reserved.</p>
			<div class="footer-links">
				<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">고객센터</a>
			</div>
		</div>
	</footer>

	<script>
    // 배너 슬라이드 관련 기존 코드 (생략 가능)

    // 태그 배열과 현재 인덱스
    const tags = ['cool', 'tearful', 'moment', 'new'];
    let currentTagIndex = 0;

    // 각 태그 버튼에 맞는 한글 라벨
    function getTagLabel(tag) {
        switch(tag) {
            case 'cool': return '서늘한 여름';
            case 'tearful': return '눈물의 여름';
            case 'moment': return '여름의 순간들';
            case 'new': return '상반기 베스트 셀러';
            default: return '';
        }
    }

    // 활성화된 태그 버튼 표시 업데이트
    function updateActiveTagButton() {
        const buttons = document.querySelectorAll('.tag-button');
        buttons.forEach(btn => btn.classList.remove('active'));
        const activeTag = tags[currentTagIndex];
        buttons.forEach(btn => {
            if (btn.textContent.trim() === getTagLabel(activeTag)) {
                btn.classList.add('active');
            }
        });
    }

    // 책 데이터 (기존 데이터 그대로 복사)
    const booksData = {
        cool: `
          <div class="book-carousel">
            <div class="carousel-window">
              <div class="carousel-track">
                <div class="book-item">
                  <img src="img/love.jpg" alt="칵테일, 러브, 좀비" />
                  <div class="book-info">
                    <p class="book-title">칵테일, 러브, 좀비 (리커버)</p>
                    <p class="book-author">조예은</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791158791971.jpg" alt="우중괴담" />
                  <div class="book-info">
                    <p class="book-title">우중괴담</p>
                    <p class="book-author">미쓰다 신조</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791160408331.jpg" alt="트로피컬 나이트" />
                  <div class="book-info">
                    <p class="book-title">트로피컬 나이트</p>
                    <p class="book-author">조예은</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791193190364.jpg" alt="당신의 잘린, 손" />
                  <div class="book-info">
                    <p class="book-title">당신의 잘린, 손</p>
                    <p class="book-author">배예람, 클레이븐</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791158792183.jpg" alt="세뇌살인" />
                  <div class="book-info">
                    <p class="book-title">세뇌살인</p>
                    <p class="book-author">혼다 데쓰야</p>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        `,
       tearful: `
  <div class="book-carousel">
    <div class="carousel-window">
      <div class="carousel-track">
        <div class="book-item">
          <img src="img/9791196674380.jpg" alt="오지 않는 버스를 기다리는 아이" />
          <div class="book-info">
            <p class="book-title">오지 않는 버스를 기다리는 아이</p>
            <p class="book-author">토마스 S. 스프래들리 , 제임스 P. 스프래들리</p>
          </div>
        </div>
        <div class="book-item">
          <img src="img/9791191043754.jpg" alt="세상의 마지막 기차역(리커버 에디션)" />
          <div class="book-info">
            <p class="book-title">세상의 마지막 기차역(리커버 에디션)</p>
            <p class="book-author">무라세 다케시</p>
          </div>
        </div>
        <div class="book-item">
          <img src="img/9791167901484.jpg" alt="나미야 잡화점의 기적" />
          <div class="book-info">
            <p class="book-title">나미야 잡화점의 기적</p>
            <p class="book-author">히가시노 게이고</p>
          </div>
        </div>
        <div class="book-item">
          <img src="img/9791197377143.jpg" alt="어서 오세요, 휴남동 서점입니다" />
          <div class="book-info">
            <p class="book-title">어서 오세요, 휴남동 서점입니다</p>
            <p class="book-author">황보름</p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-btn next" onclick="moveCarousel(this, 1)">&#10095;</button>
  </div>
        `,
        moment: `
        	<div class="book-carousel">
            <button class="carousel-btn prev" onclick="moveCarousel(this, -1)">&#10094;</button>
            <div class="carousel-window">
              <div class="carousel-track">
                <div class="book-item">
                  <img src="img/9791194324799.jpg" alt="여름어 사전" />
                  <div class="book-info">
                    <p class="book-title">여름어 사전</p>
                    <p class="book-author">아침달 편집부</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791130667607.jpg" alt="주게무의 여름" />
                  <div class="book-info">
                    <p class="book-title">주게무의 여름</p>
                    <p class="book-author">모가미 잇페이</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9791194192329.jpg" alt=" 스웨덴에서 보낸 여름" />
                  <div class="book-info">
                    <p class="book-title">스웨덴에서 보낸 여름</p>
                    <p class="book-author">김승래</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/photo8.jpeg" alt="첫 여름, 완주" />
                  <div class="book-info">
                    <p class="book-title">첫 여름, 완주</p>
                    <p class="book-author">김금희</p>
                  </div>
                </div>
                <div class="book-item">
                <img src="img/photo3.jpeg" alt="고래눈이 내리다" />
                <div class="book-info">
                  <p class="book-title">고래눈이 내리다</p>
                  <p class="book-author">김보영</p>
                </div>
              </div>
              </div>
            </div>
            <button class="carousel-btn next" onclick="moveCarousel(this, 1)">&#10095;</button>
          </div>
        `,
        new: `
        	<div class="book-carousel">
            <button class="carousel-btn prev" onclick="moveCarousel(this, -1)">&#10094;</button>
            <div class="carousel-window">
              <div class="carousel-track">
                <div class="book-item">
                  <img src="img/Unknown.jpeg" alt="소년이 온다" />
                  <div class="book-info">
                    <p class="book-title">소년이 온다</p>
                    <p class="book-author">한강</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9788901294742.jpg" alt="청춘의 독서" />
                  <div class="book-info">
                    <p class="book-title">청춘의 독서</p>
                    <p class="book-author">유시민</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9788932043562.jpg" alt="빛과 실" />
                  <div class="book-info">
                    <p class="book-title">빛과 실</p>
                    <p class="book-author">한강</p>
                  </div>
                </div>
                <div class="book-item">
                  <img src="img/9788998441012.jpg" alt="모순" />
                  <div class="book-info">
                    <p class="book-title">모순</p>
                    <p class="book-author">양귀자</p>
                  </div>
                </div>
              </div>
            </div>
            <button class="carousel-btn next" onclick="moveCarousel(this, 1)">&#10095;</button>
          </div>
        `
    };

    // 책 리스트 출력 함수 (태그에 맞게 내용 바꾸고 활성 버튼 업데이트)
    function showBooks(tag) {
        const container = document.getElementById('book-list-container');
        container.innerHTML = booksData[tag] || '<p>해당 카테고리의 책이 없습니다.</p>';
        currentTagIndex = tags.indexOf(tag);
        updateActiveTagButton();
    }

    // 책 슬라이더 좌우 이동 함수 (기존)
    const slideIndices = new Map();
    function moveCarousel(button, direction) {
        const carousel = button.closest('.book-carousel');
        if (!carousel) return;
        const track = carousel.querySelector('.carousel-track');
        const items = carousel.querySelectorAll('.book-item');
        const container = carousel.querySelector('.carousel-window');
        if (items.length === 0) return;
        const itemWidth = items[0].offsetWidth;
        const visibleItems = Math.floor(container.offsetWidth / itemWidth);
        const maxIndex = Math.ceil(items.length / visibleItems) - 1;
        let index = slideIndices.get(carousel) || 0;
        index += direction;
        if (index < 0) index = 0;
        if (index > maxIndex) index = maxIndex;
        const offset = index * visibleItems * itemWidth;
        track.style.transform = `translateX(-${offset}px)`;
        slideIndices.set(carousel, index);
    }

    // 이전 버튼 클릭 시 태그 인덱스 감소 및 책 갱신
    document.getElementById('carousel-prev-btn').addEventListener('click', () => {
        currentTagIndex = (currentTagIndex - 1 + tags.length) % tags.length;
        showBooks(tags[currentTagIndex]);
    });

    // 다음 버튼 클릭 시 태그 인덱스 증가 및 책 갱신
    document.getElementById('carousel-next-btn').addEventListener('click', () => {
        currentTagIndex = (currentTagIndex + 1) % tags.length;
        showBooks(tags[currentTagIndex]);
    });

    // 페이지 로드 시 초기 책 보여주기 및 활성화 버튼 표시
    window.onload = () => {
        showBooks('cool');
    }
    
    window.onload = function () {
        const bannerImagesMap = {
          weekly: "img/recommend1.png",
          new: "img/honmono_reco.jpg",
          featured: "img/recommend3.png",
          hot: "img/recommend4.png",
          exclusive: "img/event.png"
        };

        let bannerKeys = Object.keys(bannerImagesMap);
        let currentBannerIndex = 0;
        let bannerInterval = null;

        const bannerImageElement = document.getElementById('banner-image');
        const pauseBtn = document.getElementById('pause-btn');

        function showBanner(index) {
          const key = bannerKeys[index];
          bannerImageElement.src = bannerImagesMap[key];
          updateActiveBannerButton(key);
        }

        function updateActiveBannerButton(key) {
          const buttons = document.querySelectorAll('.section-title a');
          buttons.forEach(btn => btn.classList.remove('active'));
          const activeBtn = document.getElementById(`btn-${key}`);
          if (activeBtn) activeBtn.classList.add('active');
        }

        function nextImage() {
          currentBannerIndex = (currentBannerIndex + 1) % bannerKeys.length;
          showBanner(currentBannerIndex);
        }

        function prevImage() {
          currentBannerIndex = (currentBannerIndex - 1 + bannerKeys.length) % bannerKeys.length;
          showBanner(currentBannerIndex);
        }

        function toggleSlide() {
          if (bannerInterval) {
            clearInterval(bannerInterval);
            bannerInterval = null;
            pauseBtn.textContent = "▶"; // 재생
          } else {
            startAutoSlide();
            pauseBtn.textContent = "⏸"; // 일시정지
          }
        }

        function startAutoSlide() {
          bannerInterval = setInterval(nextImage, 3000);
        }

        function changeBanner(key) {
          const index = bannerKeys.indexOf(key);
          if (index === -1) return;
          currentBannerIndex = index;
          showBanner(currentBannerIndex);
          clearInterval(bannerInterval);
          bannerInterval = null;
          pauseBtn.textContent = "▶";
        }

        // 외부에서 접근 가능하게
        window.prevImage = prevImage;
        window.nextImage = nextImage;
        window.toggleSlide = toggleSlide;
        window.changeBanner = changeBanner;

        showBanner(currentBannerIndex);
        startAutoSlide();
      };
      
      document.addEventListener('DOMContentLoaded', () => {
    	  showBooks('cool');  // 초기 로드시 서늘한 여름(=cool) 책 4개 바로 보이게 함
    	  updateActiveTagButton(); // 버튼 활성화도 같이
    	});
</script>
</body>
</html>
