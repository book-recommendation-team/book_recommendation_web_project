<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<%@ include file="css/main_css.jsp"%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<div>${celeb.celeb_name}</div>
<div>${celeb.celeb_description}</div>

</body>
</html>