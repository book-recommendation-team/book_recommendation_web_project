<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%
User loggedInUser = (User) session.getAttribute("loggedInUser");
String contextPath = request.getContextPath();
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<link rel="stylesheet" href="./css/celebDetail.css" />
<%-- 외부 CSS 파일 링크 --%>
<%@ include file="css/main_css.jsp"%>
<%-- main_css를 include --%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<meta charset="UTF-8">
	<title>한강의 추천 책</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
	<link rel="icon" href="img/icon2.png" type="image/x-icon">

</head>
<body>
	<%@ include file="header.jsp"%>

	<nav>
		<a href="<%=contextPath%>/aiRecommend.jsp">(AI) 책 추천</a> <a
			href="<%=contextPath%>/reviewList.jsp">리뷰</a> <a
			href="<%=contextPath%>/playlistmain.jsp">플레이리스트</a> <a
			href="<%=contextPath%>/celebList.jsp">셀럽추천</a> <a
			href="<%=contextPath%>/mypage.jsp">마이페이지</a>
	</nav>
	<div class="container">
		<h1>한강</h1>
		<p class="desc">노벨문학상 한강 작가의 책장</p>

		<div class="thumbnail-container">
			<img src="./img/celeb/hankang_thum.jpg" alt="Celeb2 이미지" />
		</div>

		<div class="text-block">"문학이라는 것은 끊임없이 타인의 내면으로 들어가고 그런 과정에서 자신의 내면을 깊게 파고 들어가는 행위이기 때문에 
		계속해서 그런 행위들을 반복하면서 내적인 힘이 생기게 되죠. 
		그래서 어떤 갑작스런 상황이 왔을 때, 스스로 판단하고 생각하고 최선을 다해서 결정할 수 있는 힘이 생길 수 있다고 생각합니다. 
		문학은 여분의 것이 아니라 꼭 필요한 것이라고 생각합니다.ㅣ"</div>
		<div class="text-block">"모든 독자가 작가는 아니지만, 모든 작가는 독자입니다. 좋은 독자들이 깊게 읽고 흥미롭게 읽는 독자들이 많이 나오는 것이 가장 좋을 거라고 생각합니다."</div>
		<div class="text-block">"때로는 희망이 있나 생각을 할 때도 있습니다. 하지만 희망이 있을 거라고 희망하는 것도 희망이라고 부를 수 있지 않나 생각합니다."</div>

		<div class="img-block">
			<img src="./img/celeb/hankang01.png" alt="책 이미지 1">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000000570406', '_blank')">
			<img src="./img/celeb/hankang_book01.jpg" alt="책1">
			<div class="book-info">
				<div class="book-title">이별 없는 세대</div>
				<p class="book-meta">저자: 볼프강 보르헤르트</p>
				<p class="book-meta">출판: 문학과지성사 </p>
				<p class="book-meta">발매: 2018.11.05</p>
				<p class="book-desc">버지니아 울프의 방대한 문학세계를 완성하다.</p>
			</div>
		</div>

		<div class="img-block">
			<img src="./img/celeb/hankang02.png" alt="책 이미지 2">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000000620291', '_blank')">
			<img src="./img/celeb/hankang_book02.jpg" alt="책2">
			<div class="book-info">
				<div class="book-title">카라마조프가의 형제들 </div>
				<p class="book-meta">저자: 표도르 도스토옙스키</p>
				<p class="book-meta">출판: 민음사</p>
				<p class="book-meta">발매: 2007.09.20</p>
				<p class="book-desc">도스토예프스키가 남긴 마지막 작품이자 최고의 작품!</p>
			</div>
		</div>

		<div class="img-block">
			<img src="./img/celeb/hankang03.png" alt="책 이미지 3">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000210455283', '_blank')">
			<img src="./img/celeb/hankang_book03.jpg" alt="책3">
			<div class="book-info">
				<div class="book-title">케테 콜비츠</div>
				<p class="book-meta">저자: 카테리네 크라머</p>
				<p class="book-meta">출판: 이온서가</p>
				<p class="book-meta">발매: 2023.10.07</p>
				<p class="book-desc">슬픔을 구출하는 예술</p>
			</div>
		</div>

		<div class="img-block">
			<img src="./img/celeb/hankang04.png" alt="책 이미지 4">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000001128430', '_blank')">
			<img src="./img/celeb/hankang_book04.jpg" alt="책4">
			<div class="book-info">
				<div class="book-title">어느 시인의 죽음</div>
				<p class="book-meta">저자: 보리스 파스테르나크</p>
				<p class="book-meta">출판: 까치</p>
				<p class="book-meta">발매: 2011.05.25</p>
				<p class="book-desc">영적 교감의 기록이자 내면을 향한 끝없는 여로의 기록</p>
			</div>
		</div>

		<div class="img-block">
			<img src="./img/celeb/hankang05.png" alt="책 이미지 5">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000000570377', '_blank')">
			<img src="./img/celeb/hankang_book05.jpg" alt="책5">
			<div class="book-info">
				<div class="book-title">아버지의 땅</div>
				<p class="book-meta">저자: 임철우</p>
				<p class="book-meta">출판: 문학과지성사</p>
				<p class="book-meta">발매: 2018.09.03</p>
				<p class="book-desc">우리 문학 토양을 단단하고 풍요롭게 다져온 작품을 만나다!</p>
			</div>
		</div>

		<div class="img-block">
			<img src="./img/celeb/hankang06.png" alt="책 이미지 6">
		</div>

		<div class="book-card" onclick="window.open('https://product.kyobobook.co.kr/detail/S000000611315', '_blank')">
			<img src="./img/celeb/hankang_book06.jpg" alt="책6">
			<div class="book-info">
				<div class="book-title">사자왕 형제의 모험</div>
				<p class="book-meta">저자: 아스트리드 린드그렌</p>
				<p class="book-meta">출판: 창비</p>
				<p class="book-meta">발매: 2015.07.10</p>
				<p class="book-desc">삶과 문학의 영원한 화두에 관해 이야기하는 고전</p>
			</div>
		</div>

		<!-- 필요한 만큼 image + book-card 반복 -->

		<button class="back-btn" onclick="history.back()">← 뒤로가기</button>
	</div>
<button id="scrollToTopBtn">
  <img src="img/up1.png" alt="위로 가기 버튼" />
</button>

	<footer>
		<div class="footer-container">
			<p>&copy; 2025 WITHUS. All rights reserved.</p>
			<div class="footer-links">
				<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">고객센터</a>
			</div>
		</div>
	</footer>
	
<script>
	document.addEventListener("DOMContentLoaded", () => {
		document.getElementById("scrollToTopBtn").addEventListener("click", () => {
			window.scrollTo({ top: 0, behavior: 'smooth' });
		});
	});
</script>

</body>
</html>
