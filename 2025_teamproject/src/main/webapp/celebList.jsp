<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />

<head>
<meta charset="UTF-8">
<title>셀럽 추천 리스트</title>
</head>
<body>
	<header>
		<div id="logo">
			<img src="img/로고.png">
		</div>
		<input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
		<button id="logout-btn" onclick="location.href='Logout.jsp'">로그아웃</button>
	</header>

	<nav>
		<a href="#">(AI) 책 추천</a> 
		<a href="${pageContext.request.contextPath}/reviewList">리뷰</a> 
		<a href="#">플레이리스트</a> 
		<a href="${pageContext.request.contextPath}/celebList">셀럽추천</a> 
		<a href="#">마이페이지</a>
	</nav>
	<div class="container">
		<div style="text-align: right; margin-bottom: 20px;">
			<a href="celebForm.jsp"
				style="padding: 10px 16px; background-color: #e6f0d7; color: black; text-decoration: none; border-radius: 8px;">작성하기</a>
		</div>
		<div class="grid">
			<c:forEach var="celeb" items="${celebList}">
				<a class="card" href="celebDetail?celebId=${celeb.celeb_rec_id}">
					<!-- 북마크 아이콘 --> <i class="fas fa-bookmark bookmark-icon"></i> 
					<img src="${celeb.celeb_image_url}" alt="${celeb.celeb_name} 이미지" />
					<div class="card-content">
						<div class="card-title">${celeb.celeb_name}</div>
						<div class="card-desc">${celeb.celeb_description}</div>
					</div>
				</a>
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