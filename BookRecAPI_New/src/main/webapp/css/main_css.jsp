<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
  /* 기본 스타일 (기존 유지) */
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

#logo a img {
    cursor: pointer;
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

#logout-btn,
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

#user-buttons {
    display: flex;
    gap: 10px;
    margin-right: 150px;
} 

.banner {
    position: relative;
    width: 100%;
    height: 650px;
    overflow: hidden;
      background-color: transparent;
}

.banner img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center center;
    z-index: 1;
}

.banner-controls {
    position: absolute;
    bottom: 10px;
    right: 10px;
    z-index: 3;
    display: flex;
    gap: 6px;
}

.banner-controls button {
    background-color: rgba(255, 193, 7, 0.9);
    border: none;
    padding: 6px 8px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    color: #000;
    transition: background-color 0.3s ease;
}

.banner-controls button:hover {
    background-color: rgba(255, 160, 0, 0.95);
}

.section-title {
    background-color: #e6f0d7;
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 34px;
    padding: 18px 0;
     width: 100%;        /* ✅ 추가 */
    margin: 8px 0;      /* ✅ 가운데 정렬 제거 */
}

.section-title a {
    text-decoration: none;
    margin: 0 20px;
    color: #000;
    font-weight: bold;
}

.section-title a:hover {
    text-decoration: underline;
}

.main_list {
    padding: 20px;
    text-align: center;
}

 .tag-list {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 12px;
    margin: 20px 0;
}

.tag-button {
    background-color: #e6f0d7; /* 기본 연그린 */
    border: 1px solid transparent;
    padding: 8px 16px;
    border-radius: 20px;
    font-size: 14px;
    color: #446b3c; /* 그린 계열 텍스트 */
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.3s, color 0.3s, border 0.3s;
    outline: none;
}

.tag-button:hover {
    background-color: #d0e6c5;             /* hover 시 약간 더 진한 그린 */
    color: #2e4f25;
}

.tag-button.active {
    background-color: #c0dab0;             /* 클릭됐을 때 조금 더 강조 */
    border: 1px solid #8cb78a;             /* 테두리도 자연스러운 초록 */
    color: #2e4f25;                        /* 글자도 어울리는 진한 그린 */
}

.tag-button:focus {
    outline: none;
    box-shadow: none;
}

/* 책 슬라이더 스타일 */
.book-carousel {
    position: relative;
    max-width: 1000px;
    margin: 0 auto 40px auto;
    overflow: hidden;
}

.carousel-window {
    width: 1000px;
    overflow: hidden;
    margin: 0 auto;
}

.carousel-track {
    display: flex;
    transition: transform 0.5s ease;
}

/* 이전/다음 버튼 - 위치 고정, 색상 조정 */
.carousel-btn {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 26px;
    background-color: #f3f8ef;
    border: none;
    color: #444;
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 50%;
    z-index: 2;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: background-color 0.3s, color 0.3s;
    user-select: none;
}

.carousel-btn:hover {
    background-color: #c8dfb5;
    color: #000;
}

.carousel-btn.prev {
    left: 10px;
}

.carousel-btn.next {
    right: 10px;
}

.book-item {
    flex: 0 0 25%;
    text-align: center;
    padding: 10px;
    box-sizing: border-box;
}

.book-item img {
    width: 180px;
    height: 260px;
    object-fit: cover;
    border-radius: 6px;
}

.book-info {
    margin-top: 8px;
}

.book-title {
    font-size: 14px;
    font-weight: bold;
    margin-top: 10px;
    color: #444;
}

.book-author {
    font-size: 12px;
    color: #666;
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

 /* 이전/다음 버튼 스타일 */
#carousel-prev-btn, #carousel-next-btn {
    font-size: 18px;
    padding: 5px 12px;
    margin: 10px 5px 20px 5px;
    cursor: pointer;
    border: 1px solid #446b3c;
    background: white;
    color: #446b3c;
    border-radius: 4px;
}
#carousel-prev-btn:hover, #carousel-next-btn:hover {
    background-color: #446b3c;
    color: white;
}
#scrollToTopBtn {
  position: fixed;
  bottom: 150px;
  right: 40px;
  width: 66px; /* 이미지와 딱 맞게 약간 키움 */
  height: 66px;
  background-color: transparent;
  border: none;
  border-radius: 0;
  transform: rotate(45deg);
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15); /* 그림자 더 작고 약하게 */
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 999;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
  padding: 0;
  margin-top: 0px; /* margin-top 제거 또는 0으로 */
}

#scrollToTopBtn img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  transform: rotate(-45deg);
  display: block;
  transition: transform 0.3s ease;
  position: relative;
  top: 0;
  left: 0;
}

#scrollToTopBtn:hover {
  transform: rotate(45deg) translateY(2px); /* 움직임도 줄임 */
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2); /* 호버시 그림자도 작게 */
}

#scrollToTopBtn:hover img {
  transform: scale(1.05) rotate(-45deg);
}

</style>
