<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>책 리뷰 목록</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="./css/reviewList.css" />
<%@ include file="css/main_css.jsp"%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
</head>
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

	<div class="container">
		<div style="text-align: right; margin-bottom: 20px;">
			<a href="reviewForm.jsp"
				style="padding: 10px 16px; background-color: #e6f0d7; color: black; text-decoration: none; border-radius: 8px;">작성하기</a>
		</div>

		<div class="grid">
			<c:forEach var="review" items="${reviewList}">
				<div class="card"
					onclick="location.href='reviewDetail?reviewId=${review.reviewId}'">
					<!-- 북마크 아이콘 -->
					<i class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
						src="${review.coverImageUrl}" alt="배경" /> <img class="cover-img"
						src="${review.coverImageUrl}" alt="표지" />
					<div class="card-content">
						<div class="book-title">${review.title}</div>
						<div class="book-author">${review.author}</div>
						<div class="review-preview">${review.reviewText}</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div style="height: 2000px;"></div>

	</div>

	<!-- TOP 버튼 -->
	<button id="topBtn" title="맨 위로 이동">
		<i class="fas fa-arrow-up"></i>
	</button>
	<script>
	document.addEventListener("DOMContentLoaded", () => {
		document.getElementById("topBtn").addEventListener("click", () => {
			window.scrollTo({ top: 0, behavior: 'smooth' });
		});
	});
</script>

</body>
</html>
