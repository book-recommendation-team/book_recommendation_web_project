<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 1. 수정된 헤더 파일 포함 --%>
<%@ include file="./main2.jsp" %>


<%-- 2. B 파일의 개선된 본문 내용 유지 --%>
<div class="banner">
  <%-- 클릭 가능한 배너 링크 (B의 개선점) --%>
  <a id="banner-link" href="https://product.kyobobook.co.kr/detail/S000215578377" target="_blank">
    <img id="banner-image" src="img/b1.jpg" alt="배너 이미지" />
  </a>
  <div class="banner-controls">
    <button onclick="prevImage()">&#9664;</button>
    <button onclick="toggleSlide()" id="pause-btn">⏸</button>
    <button onclick="nextImage()">&#9654;</button>
  </div>
</div>

<div class="section-title">
    <a href="#" onclick="changeBanner('weekly'); return false;" id="btn-weekly">이 주의 책</a>
    <a href="#" onclick="changeBanner('new'); return false;" id="btn-new">신간 소개</a>
    <a href="#" onclick="changeBanner('featured'); return false;" id="btn-featured">눈에 띄는 새책</a>
    <a href="#" onclick="changeBanner('hot'); return false;" id="btn-hot">화제의 책</a>
    <a href="#" onclick="changeBanner('exclusive'); return false;" id="btn-exclusive">단독 에디션</a>
</div>

<div class="main_list">
    <h2><button style="background:none;border:none;font-size:24px;font-weight:bold;cursor:pointer;" onclick="showBooks('cool')">돌고 돌아 다시 여름</button></h2>
    <div class="tag-list">
        <button class="tag-button" onclick="showBooks('cool')">서늘한 여름</button>
        <button class="tag-button" onclick="showBooks('tearful')">눈물의 여름</button>
        <button class="tag-button" onclick="showBooks('moment')">여름의 순간들</button>
        <button class="tag-button" onclick="showBooks('new')">상반기 베스트 셀러</button>
    </div>
    
    <%-- [기능 복원] A파일에 있던 책 카테고리 이동 버튼 (B에서는 주석처리 되어있었음) --%>
    <div>
        <button id="carousel-prev-btn" color="#446b3c">&#9664;</button>
        <button id="carousel-next-btn" color="#446b3c">&#9654;</button>
    </div>
    
    <div id="book-list-container"></div>
</div>

<%-- 맨 위로 가기 버튼 (B의 개선점) --%>
<button id="scrollToTopBtn">
  <img src="img/up1.png" alt="위로 가기 버튼" />
</button>


<%-- 3. 수정된 푸터 파일 포함 --%>
<%@ include file="./main_footer.jsp" %>


<%-- 4. 기능이 복원되고 통합된 스크립트 --%>
<script>
// 책 데이터 (기존과 동일)
const booksData = {
    cool: `
      <div class="book-carousel"><div class="carousel-window"><div class="carousel-track">
      <div class="book-item"><img src="img/love.jpg" alt="칵테일, 러브, 좀비" /><div class="book-info"><p class="book-title">칵테일, 러브, 좀비 (리커버)</p><p class="book-author">조예은</p></div></div>
      <div class="book-item"><img src="img/9791158791971.jpg" alt="우중괴담" /><div class="book-info"><p class="book-title">우중괴담</p><p class="book-author">미쓰다 신조</p></div></div>
      <div class="book-item"><img src="img/9791160408331.jpg" alt="트로피컬 나이트" /><div class="book-info"><p class="book-title">트로피컬 나이트</p><p class="book-author">조예은</p></div></div>
      <div class="book-item"><img src="img/9791193190364.jpg" alt="당신의 잘린, 손" /><div class="book-info"><p class="book-title">당신의 잘린, 손</p><p class="book-author">배예람, 클레이븐</p></div></div>
      <div class="book-item"><img src="img/9791158792183.jpg" alt="세뇌살인" /><div class="book-info"><p class="book-title">세뇌살인</p><p class="book-author">혼다 데쓰야</p></div></div>
      </div></div></div>`,
    tearful: `
      <div class="book-carousel"><div class="carousel-window"><div class="carousel-track">
      <div class="book-item"><img src="img/9791196674380.jpg" alt="오지 않는 버스를 기다리는 아이" /><div class="book-info"><p class="book-title">오지 않는 버스를 기다리는 아이</p><p class="book-author">토마스 S. 스프래들리 , 제임스 P. 스프래들리</p></div></div>
      <div class="book-item"><img src="img/9791191043754.jpg" alt="세상의 마지막 기차역(리커버 에디션)" /><div class="book-info"><p class="book-title">세상의 마지막 기차역(리커버 에디션)</p><p class="book-author">무라세 다케시</p></div></div>
      <div class="book-item"><img src="img/9791167901484.jpg" alt="나미야 잡화점의 기적" /><div class="book-info"><p class="book-title">나미야 잡화점의 기적</p><p class="book-author">히가시노 게이고</p></div></div>
      <div class="book-item"><img src="img/9791197377143.jpg" alt="어서 오세요, 휴남동 서점입니다" /><div class="book-info"><p class="book-title">어서 오세요, 휴남동 서점입니다</p><p class="book-author">황보름</p></div></div>
      </div></div></div>`,
    moment: `
      <div class="book-carousel"><div class="carousel-window"><div class="carousel-track">
       <div class="book-item"><img src="img/9791194324799.jpg" alt="여름어 사전" /><div class="book-info"><p class="book-title">여름어 사전</p><p class="book-author">아침달 편집부</p></div></div>
       <div class="book-item"><img src="img/9791130667607.jpg" alt="주게무의 여름" /><div class="book-info"><p class="book-title">주게무의 여름</p><p class="book-author">모가미 잇페이</p></div></div>
       <div class="book-item"><img src="img/9791194192329.jpg" alt=" 스웨덴에서 보낸 여름" /><div class="book-info"><p class="book-title">스웨덴에서 보낸 여름</p><p class="book-author">김승래</p></div></div>
       <div class="book-item"><img src="img/photo8.jpeg" alt="첫 여름, 완주" /><div class="book-info"><p class="book-title">첫 여름, 완주</p><p class="book-author">김금희</p></div></div>
       <div class="book-item"><img src="img/photo3.jpeg" alt="고래눈이 내리다" /><div class="book-info"><p class="book-title">고래눈이 내리다</p><p class="book-author">김보영</p></div></div>
      </div></div></div>`,
    new: `
      <div class="book-carousel"><div class="carousel-window"><div class="carousel-track">
        <div class="book-item"><img src="img/Unknown.jpeg" alt="소년이 온다" /><div class="book-info"><p class="book-title">소년이 온다</p><p class="book-author">한강</p></div></div>
        <div class="book-item"><img src="img/9788901294742.jpg" alt="청춘의 독서" /><div class="book-info"><p class="book-title">청춘의 독서</p><p class="book-author">유시민</p></div></div>
        <div class="book-item"><img src="img/9788932043562.jpg" alt="빛과 실" /><div class="book-info"><p class="book-title">빛과 실</p><p class="book-author">한강</p></div></div>
        <div class="book-item"><img src="img/9788998441012.jpg" alt="모순" /><div class="book-info"><p class="book-title">모순</p><p class="book-author">양귀자</p></div></div>
      </div></div></div>`
};

// --- 책 리스트 관련 함수들 ---
const tags = ['cool', 'tearful', 'moment', 'new'];
let currentTagIndex = 0;

function getTagLabel(tag) {
    switch(tag) {
        case 'cool': return '서늘한 여름';
        case 'tearful': return '눈물의 여름';
        case 'moment': return '여름의 순간들';
        case 'new': return '상반기 베스트 셀러';
        default: return '';
    }
}

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

function showBooks(tag) {
    const container = document.getElementById('book-list-container');
    container.innerHTML = booksData[tag] || '<p>해당 카테고리의 책이 없습니다.</p>';
    currentTagIndex = tags.indexOf(tag);
    updateActiveTagButton();
}

// --- 페이지 로드 시 실행될 스크립트 ---
document.addEventListener('DOMContentLoaded', () => {
    // --- 배너 관련 로직 (B의 개선점) ---
    const bannerImagesMap = {
      weekly: "img/b1.jpg",
      new: "img/honmono_reco.jpg",
      featured: "img/b3.jpg",
      hot: "img/b4.jpg",
      exclusive: "img/event.png"
    };
    const bannerLinksMap = {
      weekly: "https://product.kyobobook.co.kr/detail/S000215578377",
      new: "https://product.kyobobook.co.kr/detail/S000216111714",
      featured: "https://product.kyobobook.co.kr/detail/S000216842334",
      hot: "https://product.kyobobook.co.kr/detail/S000000781065",
      exclusive: "#"
    };
    let bannerKeys = Object.keys(bannerImagesMap);
    let currentBannerIndex = 0;
    let bannerInterval = null;
    const bannerImage = document.getElementById('banner-image');
    const bannerLink = document.getElementById('banner-link');
    const pauseBtn = document.getElementById('pause-btn');

    function updateActiveBannerButton(key) {
      document.querySelectorAll('.section-title a').forEach(btn => btn.classList.remove('active'));
      const activeBtn = document.getElementById(`btn-${key}`);
      if (activeBtn) activeBtn.classList.add('active');
    }

    function showBanner(index) {
      const key = bannerKeys[index];
      bannerImage.src = bannerImagesMap[key];
      bannerLink.href = bannerLinksMap[key];
      updateActiveBannerButton(key);
    }

    window.nextImage = function() {
      currentBannerIndex = (currentBannerIndex + 1) % bannerKeys.length;
      showBanner(currentBannerIndex);
    }

    window.prevImage = function() {
      currentBannerIndex = (currentBannerIndex - 1 + bannerKeys.length) % bannerKeys.length;
      showBanner(currentBannerIndex);
    }
    
    window.toggleSlide = function() {
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
      bannerInterval = setInterval(window.nextImage, 3000);
    }

    window.changeBanner = function(key) {
      const index = bannerKeys.indexOf(key);
      if (index !== -1) {
        currentBannerIndex = index;
        showBanner(currentBannerIndex);
        // 수동 변경 시 자동 슬라이드 멈춤
        clearInterval(bannerInterval);
        bannerInterval = null;
        pauseBtn.textContent = "▶";
      }
    }

    // --- 스크롤 버튼 관련 로직 (B의 개선점) ---
    const scrollToTopBtn = document.getElementById('scrollToTopBtn');
    window.addEventListener('scroll', () => {
        scrollToTopBtn.style.display = window.scrollY > 300 ? 'block' : 'none';
    });
    scrollToTopBtn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
    
    // --- [기능 복원] 책 카테고리 이동 버튼 이벤트 리스너 ---
    document.getElementById('carousel-prev-btn').addEventListener('click', () => {
        currentTagIndex = (currentTagIndex - 1 + tags.length) % tags.length;
        showBooks(tags[currentTagIndex]);
    });

    document.getElementById('carousel-next-btn').addEventListener('click', () => {
        currentTagIndex = (currentTagIndex + 1) % tags.length;
        showBooks(tags[currentTagIndex]);
    });

    // --- 페이지 첫 로드 시 초기화 ---
    showBanner(currentBannerIndex);
    startAutoSlide();
    showBooks('cool'); // 기본으로 '서늘한 여름' 책 목록 표시
});
</script>