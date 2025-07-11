<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%
User loggedInUser = (User) session.getAttribute("loggedInUser");
String contextPath = request.getContextPath();
if (loggedInUser == null) {
	response.sendRedirect(contextPath + "/login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHUS - 마이페이지</title>

<link rel="icon" href="<%=contextPath%>/img/icon2.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/mypage.css">
<%@ include file="css/main_css.jsp"%>

<style>
/* ────────── 찜 카드 축소 & 체크박스 토글 ────────── */
.grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
	gap: 20px;
	justify-content: center
}

.grid>.card {
	width: 120px !important;
	max-width: 120px !important;
	position: relative;
	text-decoration: none
}

.grid>.card img {
	width: 100% !important;
	height: auto !important;
	display: block
}

.grid>.card .bg-img {
	position: absolute;
	inset: 0;
	object-fit: cover;
	filter: blur(8px);
	opacity: .35;
	transform: scale(1.1)
}

.grid>.card .cover-img {
	position: relative;
	z-index: 1
}

/* 체크박스 기본 숨김 → delete-mode 에서만 표시 */
.wishlist-item-checkbox {
	display: none
}

.delete-mode .wishlist-item-checkbox {
	display: block
}

/* ────────── 설정 페이지 스타일 추가 ────────── */
.settings-form {
    max-width: 800px;
    margin: 0 auto;
    padding: 30px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.settings-row {
    display: flex;
    gap: 40px;
    margin-bottom: 30px;
    align-items: center;
}

.setting-group {
    flex: 1;
}

.setting-group h4 {
    margin-top: 0;
    margin-bottom: 10px;
    color: #333;
    font-size: 16px;
}

.setting-group label {
    margin-right: 15px;
    display: inline-block;
}

.font-size-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

.font-size-group input[type="number"] {
    width: 80px;
    padding: 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.font-size-group button {
    padding: 5px 10px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
}

.font-size-group button:hover {
    background-color: #0056b3;
}
/* 독서 목표량 섹션 스타일 추가 */
.reading-goal-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    margin-top: 20px;
}

.reading-goal-container h4 {
    margin-top: 0;
    color: #333;
    font-size: 1.1em;
    border-bottom: 1px dashed #eee;
    padding-bottom: 10px;
    margin-bottom: 15px;
}

.goal-setting, .current-progress {
    margin-bottom: 25px;
}

.reading-goal-container label {
    margin-right: 10px;
    font-weight: bold;
    color: #555;
}

.reading-goal-container input[type="text"] {
    width: calc(100% - 120px);
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-right: 5px;
    box-sizing: border-box;
}

.reading-goal-container button {
    padding: 8px 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9em;
    transition: background-color 0.2s;
}

.reading-goal-container button:hover {
    background-color: #0056b3;
}

/* 목표 달성률 바 색상 */
.progress-bar-container #progress-bar {
    background-color: #28a745;
}

/* 검색 입력 그룹 스타일 */
.search-input-group {
    display: flex;
    gap: 10px;
    margin-bottom: 15px;
    align-items: center;
}

.search-input-group input[type="text"] {
    flex: 1;
    width: auto !important;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
}

.search-input-group button {
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    white-space: nowrap;
}

.search-input-group button:hover {
    background-color: #0056b3;
}

/* 검색 결과 스타일 */
#book-search-results {
    max-height: 300px;
    overflow-y: auto;
    border: 1px solid #ddd;
    border-radius: 4px;
    margin-top: 10px;
    background-color: white;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    display: none;
    z-index: 1000;
}

.book-search-item {
    display: flex;
    padding: 12px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
    transition: background-color 0.2s;
}

.book-search-item:hover {
    background-color: #f8f9fa !important;
}

.book-search-item:last-child {
    border-bottom: none;
}

.book-search-item img {
    width: 50px;
    height: 70px;
    margin-right: 15px;
    object-fit: cover;
    border-radius: 4px;
    flex-shrink: 0;
}

.book-search-item .book-info {
    flex: 1;
    min-width: 0;
}

.book-search-item .book-title {
    font-weight: 600;
    margin-bottom: 6px;
    color: #333;
    font-size: 14px;
    line-height: 1.3;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.book-search-item .book-author {
    color: #666;
    font-size: 13px;
    margin-bottom: 4px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.book-search-item .book-publisher {
    color: #888;
    font-size: 12px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}

.book-search-item .select-indicator {
    display: flex;
    align-items: center;
    padding-left: 10px;
    color: #007bff;
    font-size: 12px;
}
</style>
</head>

<body>
	<%@ include file="header.jsp"%>

	<nav>
		<a href="<%=contextPath%>/aiRecommend.jsp">(AI) 책 추천</a> <a
			href="<%=contextPath%>/reviewList">리뷰</a> <a
			href="<%=contextPath%>/playlistmain.jsp">플레이리스트</a> <a
			href="<%=contextPath%>/celebList">셀럽추천</a> <a
			href="<%=contextPath%>/mypage.jsp">마이페이지</a>
	</nav>

	<div class="main-content-wrapper">
		<div class="sidebar">
			<div class="profile">
				<img src="<%=contextPath%>/img/사진.jpg" alt="프로필사진" class="image">
				<%
				String nicknameDisplay = (loggedInUser != null) ? loggedInUser.getNickname() : "Guest";
				%>
				<p class="nickname-display"><%=nicknameDisplay%></p>
				<div class="link-group">
					<a href="#" class="a">찜</a>
				</div>
			</div>

			<div class="sidebar-menu">
				<div class="menu-category">라이브러리</div>
				<ul>
					<li class="active"><a href="#" data-content="recent-history">찜목록</a></li>
					<li><a href="#" data-content="order-delivery">리뷰 관리</a></li>
					<li><a href="#" data-content="returns">독서 목표량</a></li>
				</ul>

				<div class="menu-category">회원정보</div>
				<ul>
					<li><a href="#" data-content="edit-profile">회원정보수정</a></li>
					<li><a href="#" data-content="withdraw">회원탈퇴</a></li>
					<li><a href="#" data-content="customer-service">고객센터</a></li>
					<li><a href="#" data-content="settings">설정</a></li>
				</ul>
			</div>
		</div>

		<div class="right-section-wrapper">
			<div class="top-main-banner">
				<div class="recent-books-header">
					<h2>최근 본 책들</h2>
				</div>
				<div id="recent-books-list" class="recent-books-list">
					<c:choose>
						<c:when test="${not empty sessionScope.recentBooks}">
							<c:forEach var="book" items="${sessionScope.recentBooks}">
								<a href="${book.link}" target="_blank"
									title="${book.title} | ${book.author}">
									<img src="${book.image}" alt="${book.title}"
									style="width: 100px; height: 145px; object-fit: cover; margin: 0 5px; border-radius: 4px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
								</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>최근 본 책 내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>

				<div class="banner-controls">
					<button onclick="prevImage()">&#9664;</button>
					<button onclick="nextImage()">&#9654;</button>
				</div>
			</div>

			<div class="main-container">
				<div id="recent-history-content" class="content-section active">
					<h2>찜목록</h2>
					<p>찜한 책 내역이 여기에 표시됩니다.</p>
				</div>
				<div id="order-delivery-content" class="content-section">
					<h2>리뷰 관리</h2>
					<p>작성하신 리뷰들을 관리할 수 있습니다.</p>
					<p>이곳에 리뷰 목록 및 관리 기능이 들어갑니다.</p>
				</div>

				<div id="returns-content" class="content-section">
					<h2>독서 목표량</h2>
					<div class="reading-goal-container">
						<div class="goal-setting">
							<h4>독서 목표 설정</h4>
							
							<!-- 선택된 책 표시 영역 -->
							<div id="selected-book-display" style="display:none; margin-bottom:20px; padding:15px; border:1px solid #ddd; border-radius:8px; background-color:#f8f9fa;">
								<div style="display:flex; align-items:center;">
									<img id="selected-book-image" style="width:80px; height:120px; object-fit:cover; border-radius:4px; margin-right:15px; border:1px solid #ddd;" src="" alt="">
									<div style="flex:1;">
										<h5 id="selected-book-title" style="margin:0 0 8px 0; color:#333; font-size:16px;"></h5>
										<p id="selected-book-author" style="margin:4px 0; color:#666; font-size:14px;"></p>
										<p id="selected-book-publisher" style="margin:4px 0; color:#888; font-size:13px;"></p>
									</div>
								</div>
							</div>
							
							<!-- 검색 입력 그룹 -->
							<div id="search-input-section" class="search-input-group">
								<label for="goal-book-title">제목:</label>
								<input type="text" id="goal-book-title" placeholder="읽고 싶은 책 제목을 입력하세요">
								<button id="search">검색</button>
							</div>
							<!-- 검색 결과가 여기에 동적으로 추가됩니다 -->
							<div id="book-search-results-container"></div>
							
							<!-- 독서 목표 커스터마이징 (검색 부분 아래로 이동) -->
							<div style="margin-top: 30px;">
								<label for="custom-reading-goal" style="display: block; margin-bottom: 5px; font-size: 14px; color: #666;">독서 목표 설정:</label>
								<div id="custom-goal-input-section" style="display: flex; gap: 10px; align-items: center;">
									<input type="text" id="custom-reading-goal" placeholder="나만의 독서 목표를 입력하세요" style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 4px; font-size: 14px;">
									<button id="set-custom-goal-btn" style="padding: 8px 15px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; white-space: nowrap;">목표 설정</button>
								</div>
								<div id="custom-goal-display" style="display: none; padding: 10px; background-color: #f8f9fa; border: 1px solid #dee2e6; border-radius: 4px; margin-top: 10px;">
									<span id="custom-goal-text" style="color: #495057; font-weight: 500;"></span>
								</div>
							</div>
						</div>

						<div class="current-progress">
							<h4>오늘의 독서 기록</h4>
							<div style="margin-bottom: 20px;">
								<label for="today-reading-range">오늘 하루 읽은 범위(페이지):</label>
								<input type="text" id="today-reading-range" placeholder="">
							</div>
							<label for="today-summary" style="display: block;">오늘 읽은 내용 정리:</label>
							<input type="text" id="today-summary" placeholder="한 줄로 간단히 정리해보세요">
							<button id="update-progress-btn" style="margin-top: 10px;">기록 저장</button>
							<p class="progress-message" style="margin-top: 15px;">아직 오늘의 독서 기록이 없습니다.</p>
							<!-- 독서량에 따른 격려 메시지 -->
							<div id="encouragement-message" style="display:none; margin-top:15px; padding:10px; border-radius:5px; text-align:center; font-weight:bold;"></div>
						</div>

						<div class="goal-summary" style="margin-top: 30px;">
							<p id="last-reading-record" style="margin-top: 10px; font-weight: bold; color: #555;"></p>
							<button id="reset-goal-btn" style="background-color: #f44336; color: white; border: none; padding: 10px 15px; border-radius: 5px; cursor: pointer; margin-top: 20px;">목표 초기화</button>
						</div>
					</div>
				</div>

				<div id="edit-profile-content" class="content-section">
					<h2>회원정보수정</h2>
					<p>회원 정보 수정을 위해 비밀번호를 입력해주세요.</p>
					<form id="edit-profile-password-form" class="password-check-form">
						<label for="edit-profile-confirm-pw">비밀번호:</label> <input
							type="password" id="edit-profile-confirm-pw"
							name="edit-profile-confirm-pw" required>
						<button type="submit">확인</button>
					</form>
				</div>

				<div id="withdraw-content" class="content-section">
					<h2>회원 탈퇴</h2>
					<form id="withdraw-form" class="password-check-form">
						<p>회원 탈퇴 시 모든 정보가 삭제되며 복구할 수 없습니다.</p>
						<label for="withdraw-reason">탈퇴 사유 (선택 사항):</label>
						<textarea id="withdraw-reason" name="withdraw-reason" rows="5"
							></textarea>
						<label for="withdraw-password">비밀번호:</label> <input
							type="password" id="withdraw-password" name="password" required>
						<label for="confirm-withdraw"> <input type="checkbox"
							id="confirm-withdraw" required> 회원 탈퇴에 동의합니다.
						</label>
						<button type="submit">회원 탈퇴</button>
					</form>
				</div>

				<div id="edit-profile-detail-content" class="content-section">
					<h2>회원 정보 상세 수정</h2>
					<p>회원 정보를 수정합니다.</p>
					<form id="edit-profile-detail-form">
						<label for="detail-id">아이디:</label> <input type="text"
							id="detail-id" name="detail-id"
							value="<%=loggedInUser != null ? loggedInUser.getUsername() : ""%>"
							readonly> <label for="detail-new-password">새
							비밀번호:</label> <input type="password" id="detail-new-password"
							name="detail-new-password" >
						<label for="detail-confirm-new-password">새 비밀번호 확인:</label> <input
							type="password" id="detail-confirm-new-password"
							name="detail-confirm-new-password" >

						<label for="detail-nickname">닉네임:</label> <input type="text"
							id="detail-nickname" name="detail-nickname"
							value="<%=nicknameDisplay%>"> <label for="detail-gender">성별:</label>
						<input type="radio" id="gender-male" name="detail-gender"
							value="M"
							<%=(loggedInUser != null && "M".equals(loggedInUser.getGender())) ? "checked" : ""%>>
						<label for="gender-male" style="display: inline;">남성</label> <input
							type="radio" id="gender-female" name="detail-gender" value="F"
							<%=(loggedInUser != null && "F".equals(loggedInUser.getGender())) ? "checked" : ""%>>
						<label for="gender-female" style="display: inline;">여성</label> <input
							type="radio" id="gender-other" name="detail-gender" value="O"
							<%=(loggedInUser != null && "O".equals(loggedInUser.getGender())) ? "checked" : ""%>>
						<label for="gender-other" style="display: inline;">선택 안 함</label>
						<br> <br> <label for="detail-email">이메일:</label> <input
							type="email" id="detail-email" name="detail-email"
							value="<%=loggedInUser != null ? loggedInUser.getEmail() : ""%>">

						<label for="detail-name">이름:</label> <input type="text"
							id="detail-name" name="detail-name"
							value="<%=loggedInUser != null ? loggedInUser.getName() : ""%>"
							required> <label for="detail-mbti">MBTI:</label> <select
							id="detail-mbti" name="detail-mbti" required>
							<option value="">선택</option>
							<%
							String userMbti = (loggedInUser != null) ? loggedInUser.getMbti() : "";
							String[] validMbti = {"ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP", "ENFP", "ENTP",
									"ESTJ", "ESFJ", "ENFJ", "ENTJ"};
							for (String mbtiOption : validMbti) {
							%>
							<option value="<%=mbtiOption%>"
								<%=mbtiOption.equals(userMbti) ? "selected" : ""%>>
								<%=mbtiOption%>
							</option>
							<%
							}
							%>
						</select> <label for="detail-hobbies">취미/관심사:</label>
						<div class="checkbox-group" id="detail-hobbies-checkbox-group">
							<%
							String userHobbies = (loggedInUser != null) ? loggedInUser.getHobbies() : "";
							String[] userHobbiesArray = userHobbies != null && !userHobbies.isEmpty() ? userHobbies.split(",") : new String[]{};
							java.util.LinkedHashMap<String, String> hobbyMap = new java.util.LinkedHashMap<>();
							hobbyMap.put("reading", "독서");
							hobbyMap.put("movie", "영화");
							hobbyMap.put("music", "음악");
							hobbyMap.put("sports", "운동");
							hobbyMap.put("travel", "여행");
							hobbyMap.put("gaming", "게임");
							hobbyMap.put("cooking", "요리");
							hobbyMap.put("art", "미술");
							hobbyMap.put("science", "과학");
							hobbyMap.put("coding", "코딩");
							hobbyMap.put("fashion", "패션");
							hobbyMap.put("photography", "사진");
							hobbyMap.put("technology", "기술");
							hobbyMap.put("history", "역사");
							hobbyMap.put("writing", "글쓰기");
							hobbyMap.put("education", "교육");
							for (java.util.Map.Entry<String, String> entry : hobbyMap.entrySet()) {
								String hobbyValue = entry.getKey();
								String hobbyDisplay = entry.getValue();
								boolean isChecked = false;
								for (String userHobby : userHobbiesArray) {
									if (userHobby.trim().equalsIgnoreCase(hobbyValue)) {
								isChecked = true;
								break;
									}
								}
							%>
							<label><input type="checkbox" name="hobbies"
								value="<%=hobbyValue%>" <%=isChecked ? "checked" : ""%>>
								<%=hobbyDisplay%></label>
							<%
							}
							%>
						</div>
						<button type="submit">정보 저장</button>
					</form>
				</div>

				<div id="customer-service-content" class="content-section">
					<h2>고객센터</h2>
					<p>문의사항이나 불편한 점을 알려주시면 친절하게 도와드리겠습니다.</p>
					<form id="customer-service-form">
						<label for="cs-subject">제목:</label> <input type="text"
							id="cs-subject" name="cs-subject" >
						<label for="cs-message">내용:</label>
						<textarea id="cs-message" name="cs-message"
							></textarea>
						<button type="submit">문의 제출</button>
					</form>
				</div>

				<div id="settings-content" class="content-section">
					 <h2 style="border-bottom: 1px solid #ccc; padding-bottom: 10px; margin-bottom: 20px;">설정</h2>
					<form class="settings-form">
						<div class="settings-row">
							<div class="setting-group">
								<h4>최근 본 내역 저장</h4>
								<label>
									<input type="radio" name="saveRecent" value="yes" checked> 예
								</label>
								<label>
									<input type="radio" name="saveRecent" value="no"> 아니오
								</label>
							</div>
							<div class="setting-group">
								<h4>글꼴 크기 변경</h4>
								<div class="font-size-group">
									<label for="font-size">크기 (px):</label>
									<input type="number" id="font-size" name="font-size" value="16" min="10" max="30">
									<button type="button" onclick="resetFontSize()" >초기화</button>
								</div>
							</div>
						</div>

						<div class="settings-row">
							<div class="setting-group">
								<h4>검색 기록 저장</h4>
								<label>
									<input type="radio" name="saveSearch" value="yes" checked> 예
								</label>
								<label>
									<input type="radio" name="saveSearch" value="no"> 아니오
								</label>
							</div>
							<div class="setting-group">
								<h4>쿠키 사용 동의</h4>
								<label>
									<input type="radio" name="cookieConsent" value="yes" checked> 예
								</label>
								<label>
									<input type="radio" name="cookieConsent" value="no"> 아니오
								</label>
							</div>
						</div>

						<div class="settings-row">
							<div class="setting-group">
								<h4>마케팅 수신 동의 여부</h4>
								<label>
									<input type="radio" name="marketingConsent" value="yes"> 예
								</label>
								<label>
									<input type="radio" name="marketingConsent" value="no" checked> 아니오
								</label>
							</div>
							<div class="setting-group">
								<h4>알림 설정</h4>
								<label>
									<input type="radio" name="notifications" value="on" checked> 켜기
								</label>
								<label>
									<input type="radio" name="notifications" value="off"> 끄기
								</label>
							</div>
						</div>

						<button type="submit" style="width: 100%; padding: 15px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; font-size: 16px; margin-top: 20px; cursor: pointer;">설정 저장</button>
					</form>
				</div>
			</div>
		</div>
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
/* ── 배너 자리표시자 (원본 유지) ─────────────────────────────── */
function prevImage(){} function nextImage(){} function toggleSlide(){}

/* ── 글꼴 크기 초기화 함수 추가 ─────────────────────────────── */
function resetFontSize() {
    document.getElementById('font-size').value = 16;
	document.body.style.fontSize = '16px';
	const savedSettings = JSON.parse(localStorage.getItem('userSettings')) || {};
	savedSettings.fontSize = 16;
	localStorage.setItem('userSettings', JSON.stringify(savedSettings));
}

/* ── 초기화 ───────────────────────────────────────────────── */
document.addEventListener('DOMContentLoaded', () => {
  const contextPath = "<%=contextPath%>";

  /* ========================================================
     1.  검색(API) 기능  ― main.jsp와 동일
  ======================================================== */
  const mainContentArea = document.querySelector('.main-content-wrapper');
  const searchInput     = document.getElementById('search-box');
  const searchBtn       = document.getElementById('search-btn');

  if (searchBtn && searchInput && mainContentArea){
    searchBtn.addEventListener('click', () => performSearch(searchInput.value));
    searchInput.addEventListener('keypress', e=>{
      if(e.key==='Enter'){ e.preventDefault(); performSearch(searchInput.value);}
    });
  }

  async function performSearch(q){
    if(!q.trim()){alert('검색어를 입력해주세요.');return;}
    mainContentArea.innerHTML='<p class="loading-message" style="text-align:center;padding:50px;">검색 중...</p>';
    try{
      const url = contextPath + '/searchBook?query=' + encodeURIComponent(q.trim());
      const res = await fetch(url);  if(!res.ok) throw new Error();
      const data= await res.json();
      displaySearchResults(data.items);
    }catch(e){
      mainContentArea.innerHTML='<p class="error-message" style="text-align:center;padding:50px;color:red;">검색 오류</p>';
    }
  }

  function displaySearchResults(books){
    mainContentArea.innerHTML='';
    if(!books.length){
      mainContentArea.innerHTML='<p style="text-align:center;padding:50px;">검색 결과가 없습니다.</p>';return;
    }
    if(!document.getElementById('search-result-styles')){
      const st=document.createElement('style'); st.id='search-result-styles'; st.textContent=
        ".search-results-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));\n" +
        "          gap:25px;padding:20px 50px;max-width:1200px;margin:0 auto}\n" +
        "        .book-card{border:1px solid #ddd;border-radius:8px;padding:15px;background:#f9f9f9;text-align:center;transition:transform .2s}\n" +
        "        .book-card:hover{transform:translateY(-5px);box-shadow:0 4px 8px rgba(0,0,0,.1)}\n" +
        "        .book-card img{width:180px;height:260px;object-fit:cover;border-radius:4px}\n" +
        "        .book-card h3{font-size:1em;margin:10px 0 5px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}\n" +
        "        .book-card p{font-size:.8em;color:#666}";
      document.head.appendChild(st);
    }
    const g=document.createElement('div'); g.className='search-results-grid';
    books.forEach(b=>{
      const title=b.title.replace(/<b>|<\/b>/g,'');
      const author=b.author.replace(/<b>|<\/b>/g,'');
      const img=b.image?b.image:contextPath+'/img/icon2.png';
      const c=document.createElement('div'); c.className='book-card';
      c.innerHTML=
        "<a href=\"" + b.link + "\" target=\"_blank\"><img src=\"" + img + "\"" +
           "alt=\"" + title + "\" onerror=\"this.onerror=null;this.src='" + contextPath + "/img/icon2.png';\"></a>" +
         "<h3><a href=\"" + b.link + "\" target=\"_blank\">" + title + "</a></h3><p>" + author + "</p>";
      g.appendChild(c);
    });
    mainContentArea.appendChild(g);
  }

  /* ========================================================
     2.  사이드바 / 컨텐츠 토글
  ======================================================== */
  const sidebarLinks    = document.querySelectorAll('.sidebar-menu a');
  const contentSections = document.querySelectorAll('.content-section');
  function hideAll(){contentSections.forEach(s=>{s.style.display='none';s.classList.remove('active');});}
  function deactivate(){sidebarLinks.forEach(l=>l.classList.remove('active'));}

  sidebarLinks.forEach(link=>{
    link.addEventListener('click',e=>{
      e.preventDefault();
      const id=link.dataset.content+'-content';
      hideAll();
      const target=document.getElementById(id);
      if(target){ target.style.display='block'; target.classList.add('active'); }
      deactivate(); link.classList.add('active');
      if(link.dataset.content==='recent-history') loadWishlist();
    });
  });

  /* ========================================================
     3.  회원정보 수정 / 비밀번호 변경 / 탈퇴 / 문의
  ======================================================== */
  const editProfilePasswordForm=document.getElementById('edit-profile-password-form');
  if(editProfilePasswordForm){
    editProfilePasswordForm.addEventListener('submit',async ev=>{
      ev.preventDefault();
      const pw=document.getElementById('edit-profile-confirm-pw').value;
      try{
        const res=await fetch(contextPath+'/verifyPassword',{
          method:'POST',headers:{'Content-Type':'application/json'},
          body:JSON.stringify({password:pw})
        });
        const r=await res.json();
        if(res.ok&&r.success){
          alert('비밀번호가 확인되었습니다.');
          hideAll();
          const detail=document.getElementById('edit-profile-detail-content');
          if(detail){detail.style.display='block';detail.classList.add('active');}
          deactivate();
          document.querySelector('.sidebar-menu a[data-content="edit-profile"]').classList.add('active');
        }else alert(r.message||'비밀번호가 올바르지 않습니다.');
      }catch(e){alert('서버 오류가 발생했습니다.');}
      document.getElementById('edit-profile-confirm-pw').value='';
    });
  }

  /* 프로필 + 비밀번호 변경 */
  const profileForm=document.getElementById('edit-profile-detail-form');
  if(profileForm){
    profileForm.addEventListener('submit',async ev=>{
      ev.preventDefault();
      const newPw   = document.getElementById('detail-new-password').value;
      const newPwC  = document.getElementById('detail-confirm-new-password').value;
      const nickname= document.getElementById('detail-nickname').value;
      const email   = document.getElementById('detail-email').value;
      const nameVal = document.getElementById('detail-name').value;
      const gender  = document.querySelector('input[name="detail-gender"]:checked')?.value||'';
      const mbti    = document.getElementById('detail-mbti').value;
      const hobbies = Array.from(document.querySelectorAll('#detail-hobbies-checkbox-group input[name="hobbies"]:checked'))
                      .map(cb=>cb.value).join(',');

      if(!nickname||!email||!nameVal||!gender||!mbti||!hobbies){alert('모든 필수 정보를 입력해주세요.');return;}

      let okProfile=false, okPw=true;
      try{
        const res=await fetch(contextPath+'/updateUserProfile',{
          method:'POST',headers:{'Content-Type':'application/json'},
          body:JSON.stringify({nickname,email,gender,mbti,name:nameVal,hobbies})
        });
        const r=await res.json();
        if(res.ok&&r.success) okProfile=true; else alert(r.message||'프로필 업데이트 실패');
      }catch(e){alert('프로필 업데이트 오류');}

      if(newPw){
        if(newPw.length<8||!/[!@#$%^&*()]/.test(newPw)){alert('새 비밀번호는 8자 이상, 특수문자 포함'); okPw=false;}
        else if(newPw!==newPwC){alert('새 비밀번호 확인 불일치'); okPw=false;}
        if(okPw){
          try{
            const res=await fetch(contextPath+'/changePassword',{
              method:'POST',headers:{'Content-Type':'application/json'},
              body:JSON.stringify({newPassword:newPw})
            });
            const r=await res.json();
            if(!(res.ok&&r.success)){alert(r.message||'비밀번호 변경 실패'); okPw=false;}
          }catch(e){alert('비밀번호 변경 오류'); okPw=false;}
        }
      }

      if(okProfile&&okPw){alert('정보 변경 완료'); window.location.href='main.jsp';}
      else alert('정보 변경 실패');
    });
  }

  /* 회원 탈퇴 */
  const withdrawForm=document.getElementById('withdraw-form');
  if(withdrawForm){
    withdrawForm.addEventListener('submit',async ev=>{
      ev.preventDefault();
      if(!document.getElementById('confirm-withdraw').checked){alert('탈퇴 동의가 필요합니다.');return;}
      if(!confirm('정말 탈퇴하시겠습니까?')) return;
      const pw=document.getElementById('withdraw-password').value;
      const reason=document.getElementById('withdraw-reason').value;
      try{
        const res=await fetch(contextPath+'/withdrawUser',{
          method:'POST',headers:{'Content-Type':'application/json'},
          body:JSON.stringify({password:pw,reason})
        });
        const r=await res.json();
        if(res.ok&&r.success){alert('탈퇴 완료'); window.location.href=contextPath+'/login.jsp';}
        else alert(r.message||'탈퇴 실패');
      }catch(e){alert('탈퇴 중 오류');}
    });
  }

  /* 고객센터 문의 */
  const csForm=document.getElementById('customer-service-form');
  if(csForm){
    csForm.addEventListener('submit',ev=>{
      ev.preventDefault();
      const sub=document.getElementById('cs-subject').value.trim();
      const msg=document.getElementById('cs-message').value.trim();
      if(!sub||!msg){alert('제목과 내용을 입력하세요.');return;}
      alert('문의가 접수되었습니다.'); csForm.reset();
    });
  }

  /* ========================================================
     4.  찜목록 로드 + 선택 삭제 / 취소 / 전체선택
  ======================================================== */
  async function loadWishlist(){
    const con=document.getElementById('recent-history-content');
    if(!con) return;
    con.innerHTML='<h2>찜목록</h2><p>불러오는 중...</p>';
    try{
      const res=await fetch(contextPath+'/api/users/me/wishlists');
      if(!res.ok) throw new Error();
      const items=await res.json();

      con.innerHTML='<h2>찜목록</h2>';
      if(!items.length){con.innerHTML+='<p style="text-align:center;padding:50px;">찜한 도서가 없습니다.</p>';return;}

      const controls=document.createElement('div'); controls.className='wishlist-controls';
      controls.innerHTML=
        "<label id=\"wishlist-select-all-wrapper\" style=\"display:none;\">" +
        "  <input type=\"checkbox\" id=\"wishlist-select-all\"> 전체 선택" +
        "</label>" +
        "<button id=\"wishlist-select-toggle-btn\" class=\"wishlist-delete-selected-btn\">선택 삭제</button>" +
        "<button id=\"wishlist-cancel-btn\" class=\"wishlist-cancel-btn\" style=\"display:none;\">취소</button>";
      con.appendChild(controls);

      const grid=document.createElement('div'); grid.className='grid';
      items.forEach(book=>{
        const img = book.coverImageUrl ? contextPath+'/'+book.coverImageUrl : contextPath+'/img/icon2.png';
        const a   = document.createElement('a');
        a.className='card'; a.href=book.link; a.target='_blank';
        a.dataset.bookId=book.bookId;
        a.innerHTML=
          "<input type=\"checkbox\" class=\"wishlist-item-checkbox\"" +
          "                 style=\"position:absolute;top:12px;left:12px;z-index:10;\">" +
          " <img class=\"bg-img\"    src=\"" + img + "\" alt=\"\">" +
          " <img class=\"cover-img\" src=\"" + img + "\" alt=\"" + book.title + "\">" +
          " <div class=\"card-content\">" +
          "    <div class=\"book-title\">" + book.title + "</div>" +
          "    <div class=\"book-author\">" + book.author + "</div>" +
          " </div>";
        grid.appendChild(a);
      });
      con.appendChild(grid);
      attachWishlistHandlers(grid);
    }catch(e){
      con.innerHTML='<h2>찜목록</h2><p>불러오기 실패</p>';
    }
  }

  function attachWishlistHandlers(grid){
    const toggleBtn = document.getElementById('wishlist-select-toggle-btn');
    const cancelBtn = document.getElementById('wishlist-cancel-btn');
    const selectAllW= document.getElementById('wishlist-select-all-wrapper');
    const master    = document.getElementById('wishlist-select-all');
    let deleteMode  = false;

    if(master){
      master.onchange = e=>{
        grid.querySelectorAll('.wishlist-item-checkbox').forEach(cb=>cb.checked=e.target.checked);
      };
    }

    function enter(){
      deleteMode=true;
      grid.classList.add('delete-mode');
      selectAllW.style.display='inline-block';
      cancelBtn.style.display='inline-block';
      toggleBtn.textContent='삭제 실행';
    }
    function exit(){
      deleteMode=false;
      grid.classList.remove('delete-mode');
      selectAllW.style.display='none';
      cancelBtn.style.display='none';
      toggleBtn.textContent='선택 삭제';
      grid.querySelectorAll('.wishlist-item-checkbox').forEach(cb=>cb.checked=false);
      if(master) master.checked=false;
    }

    toggleBtn.addEventListener('click',async()=>{
      if(!deleteMode){enter();return;}
      const checked=grid.querySelectorAll('.wishlist-item-checkbox:checked');
      if(!checked.length){alert('선택된 책이 없습니다.');return;}
      if(!confirm('선택한 ' + checked.length + '권을 삭제하시겠습니까?'))return;
      await Promise.all(Array.from(checked).map(cb=>{
        const id=cb.closest('.card').dataset.bookId;
        return fetch(contextPath+'/api/users/me/wishlists?bookId='+id,{method:'POST'})
               .then(r=>{if(r.ok) cb.closest('.card').remove();});
      }));
      exit();
    });
    cancelBtn.addEventListener('click',exit);
  }

  /* ========================================================
     5.  설정 폼 처리 및 로컬 스토리지 기능 추가
  ======================================================== */
  const settingsForm = document.querySelector('.settings-form');
  const recentBooksList = document.getElementById('recent-books-list');

  if (settingsForm) {
    settingsForm.addEventListener('submit', function(event) {
      event.preventDefault();
      
      const settings = {
        saveRecent: document.querySelector('input[name="saveRecent"]:checked').value,
        fontSize: document.getElementById('font-size').value,
        saveSearch: document.querySelector('input[name="saveSearch"]:checked').value,
        cookieConsent: document.querySelector('input[name="cookieConsent"]:checked').value,
        marketingConsent: document.querySelector('input[name="marketingConsent"]:checked').value,
        notifications: document.querySelector('input[name="notifications"]:checked').value
      };
      
      localStorage.setItem('userSettings', JSON.stringify(settings));
      
      if (recentBooksList) {
        if (settings.saveRecent === 'no') {
          recentBooksList.style.display = 'none';
        } else {
          recentBooksList.style.display = 'block';
        }
      }

      if (searchInput) {
        if (settings.saveSearch === 'no') {
          searchInput.setAttribute('autocomplete', 'off');
        } else {
          searchInput.setAttribute('autocomplete', 'on');
        }
      }

      document.body.style.fontSize = settings.fontSize + 'px';
      alert('설정이 저장되었습니다.');
    });
  }

  // 페이지 로드 시 저장된 설정 적용
  const savedSettings = localStorage.getItem('userSettings');
  if (savedSettings) {
    const settings = JSON.parse(savedSettings);
    
    if (settings.saveRecent) {
      const saveRecentRadio = document.querySelector('input[name="saveRecent"][value="' + settings.saveRecent + '"]');
      if(saveRecentRadio) saveRecentRadio.checked = true;

      if (recentBooksList) {
        if (settings.saveRecent === 'no') {
          recentBooksList.style.display = 'none';
        } else {
          recentBooksList.style.display = 'block';
        }
      }
    }
    
    if (settings.fontSize) {
      document.body.style.fontSize = settings.fontSize + 'px';
      const fontSizeInput = document.getElementById('font-size');
      if(fontSizeInput) fontSizeInput.value = settings.fontSize;
    }
    
    if (settings.saveSearch) {
      const saveSearchRadio = document.querySelector('input[name="saveSearch"][value="' + settings.saveSearch + '"]');
      if(saveSearchRadio) saveSearchRadio.checked = true;

      if (searchInput) {
        if (settings.saveSearch === 'no') {
          searchInput.setAttribute('autocomplete', 'off');
        } else {
          searchInput.setAttribute('autocomplete', 'on');
        }
      }
    }
    if (settings.cookieConsent) {
      const cookieRadio = document.querySelector('input[name="cookieConsent"][value="' + settings.cookieConsent + '"]');
      if(cookieRadio) cookieRadio.checked = true;
    }
    if (settings.marketingConsent) {
      const marketingRadio = document.querySelector('input[name="marketingConsent"][value="' + settings.marketingConsent + '"]');
      if(marketingRadio) marketingRadio.checked = true;
    }
    if (settings.notifications) {
      const notificationRadio = document.querySelector('input[name="notifications"][value="' + settings.notifications + '"]');
      if(notificationRadio) notificationRadio.checked = true;
    }
  }

   /* ========================================================
   독서 목표량 기능 (기존 API 활용한 검색 기능 추가)
   ======================================================== */
   const goalBookTitleInput = document.getElementById('goal-book-title');
   const searchBookBtn = document.getElementById('search');
   const todayReadingRangeInput = document.getElementById('today-reading-range');
   const todaySummaryInput = document.getElementById('today-summary');
   const updateProgressBtn = document.getElementById('update-progress-btn');
   const currentGoalDisplay = document.getElementById('current-goal-display');
   const lastReadingRecord = document.getElementById('last-reading-record');
   const resetGoalBtn = document.getElementById('reset-goal-btn');
   const progressMessage = document.querySelector('.current-progress .progress-message');
   const customReadingGoalInput = document.getElementById('custom-reading-goal');
   const setCustomGoalBtn = document.getElementById('set-custom-goal-btn');
   const encouragementMessage = document.getElementById('encouragement-message');

   let goalBookTitle = "";
   let lastReadRange = "";
   let lastSummary = "";
   let lastRecordDate = "";
   let selectedBookData = null;
   let customGoal = "매일매일 독서하기"; // 기본 목표

   // 커스텀 독서 목표 설정 기능
   if (setCustomGoalBtn) {
       setCustomGoalBtn.addEventListener('click', () => {
           const newGoal = customReadingGoalInput ? customReadingGoalInput.value.trim() : '';
           if (!newGoal) {
               alert('독서 목표를 입력해주세요.');
               return;
           }
           
           customGoal = newGoal;
           localStorage.setItem('customReadingGoal', customGoal);
           
           // 입력창 숨기고 저장된 텍스트 표시
           const inputSection = document.getElementById('custom-goal-input-section');
           const displaySection = document.getElementById('custom-goal-display');
           const textElement = document.getElementById('custom-goal-text');
           
           if (inputSection) inputSection.style.display = 'none';
           if (displaySection) displaySection.style.display = 'block';
           if (textElement) textElement.textContent = customGoal;
           
           updateReadingGoalUI();
           alert('독서 목표가 설정되었습니다!');
       });
   }

   // 목표 수정 버튼 이벤트 제거 (수정 버튼이 없으므로)

   // 엔터키로 목표 설정
   if (customReadingGoalInput) {
       customReadingGoalInput.addEventListener('keypress', (e) => {
           if (e.key === 'Enter') {
               e.preventDefault();
               if (setCustomGoalBtn) setCustomGoalBtn.click();
           }
       });
   }

   // 페이지 수를 추출하는 함수
   function extractPageCount(rangeText) {
       if (!rangeText) return 0;
       
       const text = rangeText.trim();
       
       // "30" 같은 단순 숫자
       if (/^\d+$/.test(text)) {
           return parseInt(text);
       }
       
       // "1-30", "10~40", "20 - 50" 같은 범위
       const rangeMatch = text.match(/(\d+)\s*[-~]\s*(\d+)/);
       if (rangeMatch) {
           const start = parseInt(rangeMatch[1]);
           const end = parseInt(rangeMatch[2]);
           return Math.max(0, end - start + 1);
       }
       
       // "30페이지", "30p" 같은 형태
       const pageMatch = text.match(/(\d+)\s*[페p]/i);
       if (pageMatch) {
           return parseInt(pageMatch[1]);
       }
       
       return 0;
   }

   // 격려 메시지 표시 함수
   function showEncouragementMessage(pageCount) {
       if (!encouragementMessage) return;
       
       let message = '';
       let bgColor = '';
       let textColor = '';
       
       if (pageCount <= 0) {
           encouragementMessage.style.display = 'none';
           return;
       } else if (pageCount <= 20) {
           message = '좀 더 노력해봐요! 내일도 화이팅! 💪';
           bgColor = '#fff3cd';
           textColor = '#856404';
       } else if (pageCount <= 50) {
           message = '좋아요! 나날이 발전하고 있어요! 👍';
           bgColor = '#d1ecf1';
           textColor = '#0c5460';
       } else {
           message = '대단합니다! 내용을 잘 정리하기만 한다면 완벽합니다! 🎉';
           bgColor = '#d4edda';
           textColor = '#155724';
       }
       
       encouragementMessage.textContent = message;
       encouragementMessage.style.backgroundColor = bgColor;
       encouragementMessage.style.color = textColor;
       encouragementMessage.style.border = `1px solid ${textColor}`;
       encouragementMessage.style.display = 'block';
   }

   // 검색 기능 추가 (기존 API 활용)
   if (searchBookBtn) {
       searchBookBtn.addEventListener('click', () => {
           const query = goalBookTitleInput ? goalBookTitleInput.value.trim() : '';
           if (!query) {
               alert('검색할 책 제목을 입력해주세요.');
               return;
           }
           searchBooksForGoal(query);
       });
   }

   // 엔터키로 검색
   if (goalBookTitleInput) {
       goalBookTitleInput.addEventListener('keypress', (e) => {
           if (e.key === 'Enter') {
               e.preventDefault();
               if (searchBookBtn) searchBookBtn.click();
           }
       });
   }

   // 책 검색 함수 (기존 searchBook API 사용)
   async function searchBooksForGoal(query) {
       const resultsDiv = getOrCreateSearchResults();
       resultsDiv.style.display = 'block';
       resultsDiv.innerHTML = '<div style="text-align:center;padding:20px;color:#666;">검색 중...</div>';
       
       try {
           const url = contextPath + '/searchBook?query=' + encodeURIComponent(query.trim());
           console.log('Searching with URL:', url); // 디버깅용
           
           const response = await fetch(url, {
               method: 'GET',
               headers: {
                   'Content-Type': 'application/json',
               },
               mode: 'cors'
           });
           
           console.log('Response status:', response.status);
           console.log('Response headers:', response.headers);
           
           if (!response.ok) {
               throw new Error(`검색 요청 실패: ${response.status} ${response.statusText}`);
           }
           
           const responseText = await response.text();
           console.log('Raw response:', responseText);
           
           let data;
           try {
               data = JSON.parse(responseText);
           } catch (e) {
               console.error('JSON parse error:', e);
               throw new Error('서버 응답이 올바른 JSON 형식이 아닙니다.');
           }
           
           console.log('Parsed data:', data);
           
           if (data.error) {
               throw new Error(data.error);
           }
           
           const books = data.items || [];
           console.log('Books found:', books.length);
           
           if (books.length > 0) {
               console.log('First book sample:', books[0]);
           }
           
           // 테스트용 더미 데이터 추가 (API가 실패할 경우)
           if (books.length === 0) {
               console.log('No books found, adding test data');
               const testBooks = [
                   {
                       title: '테스트 책 1',
                       author: '테스트 저자 1',
                       publisher: '테스트 출판사',
                       image: 'https://via.placeholder.com/50x70?text=Book1',
                       link: 'https://example.com'
                   },
                   {
                       title: '테스트 책 2',
                       author: '테스트 저자 2',
                       publisher: '테스트 출판사 2',
                       image: 'https://via.placeholder.com/50x70?text=Book2',
                       link: 'https://example.com'
                   }
               ];
               displayBookSearchResults(testBooks);
               return;
           }
           
           displayBookSearchResults(books);
           
       } catch (error) {
           console.error('검색 오류:', error);
           
           // 오류 발생 시 테스트 데이터 표시
           const testBooks = [
               {
                   title: '오류 테스트 책',
                   author: '테스트 저자',
                   publisher: '테스트 출판사',
                   image: 'https://via.placeholder.com/50x70?text=Error',
                   link: 'https://example.com'
               }
           ];
           
           resultsDiv.innerHTML = `
               <div style="background:#fff3cd;border:1px solid #ffeaa7;padding:10px;margin:10px;border-radius:4px;">
                   <strong>오류 발생:</strong> ${error.message}<br>
                   <small>아래는 테스트 데이터입니다:</small>
               </div>
           `;
           
           displayBookSearchResults(testBooks);
       }
   }

   // 검색 결과 DIV 생성 또는 가져오기
   function getOrCreateSearchResults() {
       let resultsDiv = document.getElementById('book-search-results');
       if (!resultsDiv) {
           resultsDiv = document.createElement('div');
           resultsDiv.id = 'book-search-results';
           resultsDiv.style.cssText = `
               max-height: 300px; 
               overflow-y: auto; 
               border: 1px solid #ddd; 
               border-radius: 4px; 
               margin-top: 10px;
               background-color: white;
               box-shadow: 0 2px 5px rgba(0,0,0,0.1);
               display: none;
               z-index: 1000;
           `;
           
           // 검색창 바로 밑에 배치
           const searchContainer = document.getElementById('book-search-results-container');
           if (searchContainer) {
               searchContainer.appendChild(resultsDiv);
           }
       }
       return resultsDiv;
   }

   // 검색 결과 표시
   function displayBookSearchResults(books) {
       const resultsDiv = getOrCreateSearchResults();
       
       if (!books || books.length === 0) {
           resultsDiv.innerHTML = '<div style="text-align:center;padding:20px;color:#888;">검색 결과가 없습니다.</div>';
           return;
       }

       console.log('Displaying books:', books);

       // HTML을 직접 생성하는 대신 DOM 요소를 생성
       resultsDiv.innerHTML = ''; // 기존 내용 지우기
       
       books.forEach((book, index) => {
           // 데이터 정리
           const title = book.title ? book.title.replace(/<[^>]*>/g, '') : '제목 없음';
           const author = book.author ? book.author.replace(/<[^>]*>/g, '') : '저자 미상';
           const publisher = book.publisher || '';
           
           console.log(`Creating element for book ${index}:`, {title, author, publisher, image: book.image});
           
           // DOM 요소 생성
           const itemDiv = document.createElement('div');
           itemDiv.className = 'book-search-item';
           itemDiv.style.cssText = 'display:flex; padding:12px; border-bottom:1px solid #eee; cursor:pointer; transition: background-color 0.2s;';
           
           // 마우스 이벤트
           itemDiv.onmouseover = function() { this.style.backgroundColor = '#f8f9fa'; };
           itemDiv.onmouseout = function() { this.style.backgroundColor = 'white'; };
           
           // 클릭 이벤트
           itemDiv.onclick = function() { 
               console.log('Clicked on book:', index);
               selectBookForGoal(index); 
           };
           
           // 이미지 요소
           const img = document.createElement('img');
           img.style.cssText = 'width:50px;height:70px;margin-right:15px;object-fit:cover;border-radius:4px;flex-shrink:0;border:1px solid #ddd;background-color:#f5f5f5;';
           img.alt = title;
           
           // 이미지 URL 설정
           if (book.image && book.image.trim() !== '' && book.image !== 'null') {
               img.src = book.image;
               img.onerror = function() {
                   console.log('Image failed to load, using default');
                   this.src = contextPath + '/img/icon2.png';
               };
               img.onload = function() {
                   console.log('Image loaded successfully:', this.src);
               };
           } else {
               img.src = contextPath + '/img/icon2.png';
           }
           
           // 텍스트 정보 컨테이너
           const infoDiv = document.createElement('div');
           infoDiv.style.cssText = 'flex:1;min-width:0;';
           
           // 제목
           const titleDiv = document.createElement('div');
           titleDiv.style.cssText = 'font-weight:600;margin-bottom:6px;color:#333;font-size:14px;line-height:1.3;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;';
           titleDiv.title = title;
           titleDiv.textContent = title;
           
           // 저자
           const authorDiv = document.createElement('div');
           authorDiv.style.cssText = 'color:#666;font-size:13px;margin-bottom:4px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;';
           authorDiv.title = author;
           authorDiv.textContent = author;
           
           // 출판사
           const publisherDiv = document.createElement('div');
           publisherDiv.style.cssText = 'color:#888;font-size:12px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;';
           publisherDiv.title = publisher;
           publisherDiv.textContent = publisher;
           
           // 선택 버튼
           const selectDiv = document.createElement('div');
           selectDiv.style.cssText = 'display:flex;align-items:center;padding-left:10px;';
           const selectSpan = document.createElement('span');
           selectSpan.style.cssText = 'color:#007bff;font-size:12px;font-weight:bold;';
           selectSpan.textContent = '선택';
           selectDiv.appendChild(selectSpan);
           
           // 요소들 조립
           infoDiv.appendChild(titleDiv);
           infoDiv.appendChild(authorDiv);
           infoDiv.appendChild(publisherDiv);
           
           itemDiv.appendChild(img);
           itemDiv.appendChild(infoDiv);
           itemDiv.appendChild(selectDiv);
           
           resultsDiv.appendChild(itemDiv);
       });

       window.currentSearchResults = books;
       console.log('Results displayed, total books:', books.length);
   }

   // 검색 결과 외부 클릭 시 닫기
   document.addEventListener('click', function(event) {
       const resultsDiv = document.getElementById('book-search-results');
       const searchInput = document.getElementById('goal-book-title');
       const searchBtn = document.getElementById('search');
       
       if (resultsDiv && resultsDiv.style.display === 'block') {
           if (!resultsDiv.contains(event.target) && 
               event.target !== searchInput && 
               event.target !== searchBtn) {
               resultsDiv.style.display = 'none';
           }
       }
   });

   // 로컬 스토리지에서 목표와 현황 불러오기
   function loadReadingGoal() {
       const savedGoalTitle = localStorage.getItem('goalBookTitle');
       const savedGoalData = localStorage.getItem('goalBookData');
       const savedLastRecordDate = localStorage.getItem('lastRecordDate');
       const savedCustomGoal = localStorage.getItem('customReadingGoal');

       // 독서 기록 부분은 새로고침 시 휘발되도록 주석처리
       // const savedLastReadRange = localStorage.getItem('lastReadRange');
       // const savedLastSummary = localStorage.getItem('lastSummary');

       if (savedGoalTitle) {
           goalBookTitle = savedGoalTitle;
           
           // 저장된 책 데이터가 있으면 선택된 책 표시
           if (savedGoalData) {
               try {
                   selectedBookData = JSON.parse(savedGoalData);
                   
                   // 검색창 섹션 숨기기
                   const searchInputSection = document.getElementById('search-input-section');
                   if (searchInputSection) {
                       searchInputSection.style.display = 'none';
                   }
                   
                   // 선택된 책 표시 영역 보이기
                   const selectedBookDisplay = document.getElementById('selected-book-display');
                   if (selectedBookDisplay) {
                       selectedBookDisplay.style.display = 'block';
                       
                       const titleElement = document.getElementById('selected-book-title');
                       const authorElement = document.getElementById('selected-book-author');
                       const publisherElement = document.getElementById('selected-book-publisher');
                       const imageElement = document.getElementById('selected-book-image');
                       
                       if (titleElement) titleElement.textContent = savedGoalTitle;
                       if (authorElement) authorElement.textContent = selectedBookData.author ? selectedBookData.author.replace(/<[^>]*>/g, '') : '저자 미상';
                       if (publisherElement) publisherElement.textContent = selectedBookData.publisher || '';
                       
                       if (imageElement) {
                           if (selectedBookData.image && selectedBookData.image.trim() !== '' && selectedBookData.image !== 'null') {
                               imageElement.src = selectedBookData.image;
                               imageElement.onerror = function() {
                                   this.src = '<%=contextPath%>/img/icon2.png';
                               };
                           } else {
                               imageElement.src = '<%=contextPath%>/img/icon2.png';
                           }
                           imageElement.alt = savedGoalTitle;
                       }
                   }
               } catch(e) {
                   console.error('Error parsing saved book data:', e);
               }
           }
       }
       
       // 독서 기록 부분은 새로고침 시 초기화 (휘발)
       lastReadRange = "";
       lastSummary = "";
       if (todayReadingRangeInput) todayReadingRangeInput.value = "";
       if (todaySummaryInput) todaySummaryInput.value = "";
       
       if (savedLastRecordDate) {
           lastRecordDate = savedLastRecordDate;
       }
       if (savedCustomGoal) {
           customGoal = savedCustomGoal;
           
           // 저장된 커스텀 목표가 있으면 표시 모드로 전환
           const inputSection = document.getElementById('custom-goal-input-section');
           const displaySection = document.getElementById('custom-goal-display');
           const textElement = document.getElementById('custom-goal-text');
           
           if (inputSection) inputSection.style.display = 'none';
           if (displaySection) displaySection.style.display = 'block';
           if (textElement) textElement.textContent = customGoal;
       }
       updateReadingGoalUI();
   }

   // UI 업데이트 함수
   function updateReadingGoalUI() {
       const lastReadingRecord = document.getElementById('last-reading-record');
       const progressMessage = document.querySelector('.current-progress .progress-message');

       if (lastReadingRecord && progressMessage) {
           if (lastReadRange || lastSummary || lastRecordDate) {
               let record = "";
               if (lastRecordDate) {
                   record += `마지막 기록 일자: ${'${lastRecordDate}'}`;
               }
               if (lastReadRange) {
                   record += lastRecordDate ? ` | ${'${lastReadRange}'}` : lastReadRange;
               }
               if (lastSummary) {
                   record += ` | ${'${lastSummary}'}`;
               }
               lastReadingRecord.textContent = record;
               progressMessage.textContent = "오늘의 독서 기록이 있습니다.";
               
               // 격려 메시지 표시
               const pageCount = extractPageCount(lastReadRange);
               showEncouragementMessage(pageCount);
           } else {
               lastReadingRecord.textContent = "아직 독서 기록이 없습니다.";
               progressMessage.textContent = "아직 오늘의 독서 기록이 없습니다.";
           }
       }
   }

   // 기록 저장 버튼 클릭 이벤트
   if (updateProgressBtn) {
       updateProgressBtn.addEventListener('click', () => {
           const newReadRange = todayReadingRangeInput ? todayReadingRangeInput.value.trim() : '';
           const newSummary = todaySummaryInput ? todaySummaryInput.value.trim() : '';
           
           if (!newReadRange && !newSummary) {
               alert("오늘 읽은 범위 또는 한 줄 정리를 입력해주세요.");
               return;
           }

           lastReadRange = newReadRange;
           lastSummary = newSummary;
           
           // 현재 날짜만 저장 (시간 제외)
           const now = new Date();
           lastRecordDate = now.getFullYear() + '년 ' + 
                            (now.getMonth() + 1) + '월 ' + 
                            now.getDate() + '일';
           
           localStorage.setItem('lastReadRange', lastReadRange);
           localStorage.setItem('lastSummary', lastSummary);
           localStorage.setItem('lastRecordDate', lastRecordDate);
           
           updateReadingGoalUI();
           alert("오늘의 독서 기록이 저장되었습니다!");
       });
   }

   // 목표 초기화 버튼 클릭 이벤트
   if (resetGoalBtn) {
       resetGoalBtn.addEventListener('click', () => {
           if (confirm("독서 목표와 기록을 초기화하시겠습니까?")) {
               // 전역 변수 초기화
               goalBookTitle = "";
               lastReadRange = "";
               lastSummary = "";
               lastRecordDate = "";
               selectedBookData = null;
               customGoal = "매일매일 독서하기";
               
               // 로컬 스토리지 데이터 삭제
               localStorage.removeItem('goalBookTitle');
               localStorage.removeItem('goalBookData');
               localStorage.removeItem('lastReadRange');
               localStorage.removeItem('lastSummary');
               localStorage.removeItem('lastRecordDate');
               localStorage.removeItem('customReadingGoal');
               
               // 입력 필드들 초기화
               const goalBookTitleInput = document.getElementById('goal-book-title');
               const todayReadingRangeInput = document.getElementById('today-reading-range');
               const todaySummaryInput = document.getElementById('today-summary');
               const customReadingGoalInput = document.getElementById('custom-reading-goal');
               
               if (goalBookTitleInput) goalBookTitleInput.value = "";
               if (todayReadingRangeInput) todayReadingRangeInput.value = "";
               if (todaySummaryInput) todaySummaryInput.value = "";
               if (customReadingGoalInput) customReadingGoalInput.value = "";
               
               // 선택된 책 표시 영역 숨기기
               const selectedBookDisplay = document.getElementById('selected-book-display');
               if (selectedBookDisplay) selectedBookDisplay.style.display = 'none';
               
               // 검색창 섹션 다시 보이기
               const searchInputSection = document.getElementById('search-input-section');
               if (searchInputSection) searchInputSection.style.display = 'flex';
               
               // 커스텀 목표 UI 초기화 (입력창 보이기, 저장된 텍스트 숨기기)
               const inputSection = document.getElementById('custom-goal-input-section');
               const displaySection = document.getElementById('custom-goal-display');
               if (inputSection) inputSection.style.display = 'flex';
               if (displaySection) displaySection.style.display = 'none';
               
               // 검색 결과와 격려 메시지 숨기기
               const resultsDiv = document.getElementById('book-search-results');
               const encouragementMessage = document.getElementById('encouragement-message');
               if (resultsDiv) resultsDiv.style.display = 'none';
               if (encouragementMessage) encouragementMessage.style.display = 'none';
               
               // UI 업데이트
               updateReadingGoalUI();
               alert("독서 목표와 기록이 초기화되었습니다.");
           }
       });
   }

   // 페이지 로드 시 독서 목표 불러오기
   loadReadingGoal();

  /* ========================================================
     초기 표시 (찜목록 탭)
  ======================================================== */
  hideAll();
  const first=document.getElementById('recent-history-content');
  if(first){first.style.display='block';first.classList.add('active');}
  const sideFirst=document.querySelector('.sidebar-menu a[data-content="recent-history"]');
  if(sideFirst) sideFirst.classList.add('active');
  loadWishlist();

}); /* DOMContentLoaded 끝 */

// 전역 함수로 selectBookForGoal 정의 (onclick에서 호출하기 위해)
function selectBookForGoal(index) {
    console.log('Global selectBookForGoal called with index:', index);
    console.log('Available books:', window.currentSearchResults);
    
    if (!window.currentSearchResults || !window.currentSearchResults[index]) {
        alert('책 선택 중 오류가 발생했습니다.');
        return;
    }
    
    const selectedBookData = window.currentSearchResults[index];
    console.log('Selected book data:', selectedBookData);
    
    // 제목에서 HTML 태그 제거
    const title = selectedBookData.title ? selectedBookData.title.replace(/<[^>]*>/g, '') : '제목 없음';
    const author = selectedBookData.author ? selectedBookData.author.replace(/<[^>]*>/g, '') : '저자 미상';
    const publisher = selectedBookData.publisher || '';
    
    // 검색창 섹션 숨기기
    const searchInputSection = document.getElementById('search-input-section');
    if (searchInputSection) {
        searchInputSection.style.display = 'none';
    }
    
    // 선택된 책 표시 영역 보이기
    const selectedBookDisplay = document.getElementById('selected-book-display');
    if (selectedBookDisplay) {
        selectedBookDisplay.style.display = 'block';
        
        // 책 정보 설정
        const titleElement = document.getElementById('selected-book-title');
        const authorElement = document.getElementById('selected-book-author');
        const publisherElement = document.getElementById('selected-book-publisher');
        const imageElement = document.getElementById('selected-book-image');
        
        if (titleElement) titleElement.textContent = title;
        if (authorElement) authorElement.textContent = author;
        if (publisherElement) publisherElement.textContent = publisher;
        
        if (imageElement) {
            if (selectedBookData.image && selectedBookData.image.trim() !== '' && selectedBookData.image !== 'null') {
                imageElement.src = selectedBookData.image;
                imageElement.onerror = function() {
                    this.src = '<%=contextPath%>/img/icon2.png';
                };
            } else {
                imageElement.src = '<%=contextPath%>/img/icon2.png';
            }
            imageElement.alt = title;
        }
    }
    
    // 로컬 스토리지에 저장
    try {
        localStorage.setItem('goalBookTitle', title);
        localStorage.setItem('goalBookData', JSON.stringify(selectedBookData));
        console.log('Data saved to localStorage');
    } catch(e) {
        console.error('localStorage save error:', e);
    }
    
    // UI 업데이트
    const currentGoalDisplay = document.getElementById('current-goal-display');
    if (currentGoalDisplay) {
        currentGoalDisplay.textContent = `"${title}"`;
    }
    
    // 검색 결과 숨기기
    const resultsDiv = document.getElementById('book-search-results');
    if (resultsDiv) {
        resultsDiv.style.display = 'none';
    }
    
    alert('목표 도서를 설정했습니다!');
}

// 목표 초기화 함수 (전역) - 사용되지 않으므로 제거
</script>

</body>
</html>