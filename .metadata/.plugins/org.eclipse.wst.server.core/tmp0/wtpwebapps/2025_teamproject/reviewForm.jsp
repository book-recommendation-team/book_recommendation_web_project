<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<%@ include file="css/main_css.jsp"%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<title>리뷰 작성</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
	padding: 0;
}

.container {
	max-width: 1000px;
	margin: 30px auto;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

label {
	display: block;
	margin-top: 15px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 100%;
	padding: 10px;
	margin-top: 8px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 1rem;
}

textarea {
	height: 150px;
	resize: vertical;
}

.button-group {
	text-align: center;
	margin-top: 30px;
}

.button-group button {
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	font-size: 1rem;
	cursor: pointer;
	margin: 0 10px;
}

.button-submit {
	background-color: #e6f0d7;
	color: black;
}

.button-cancel {
	background-color: #fff;
	color: black;
}
</style>
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
		<h2>책 리뷰 작성</h2>
		<form action="submitReview" method="post">
			<label for="title">책 제목</label> <input type="text" id="title"
				name="title" required /> <label for="author">저자</label> <input
				type="text" id="author" name="author" required /> <label
				for="coverImageUrl">책 표지 이미지 URL</label> <input type="text"
				id="coverImageUrl" name="coverImageUrl" placeholder="https://..."
				required /> <label for="reviewText">리뷰 내용</label>
			<textarea id="reviewText" name="reviewText" placeholder="내용을 입력하세요."
				required></textarea>

			<div class="button-group">
				<button type="submit" class="button-submit">작성하기</button>
				<button type="button" class="button-cancel" onclick="history.back()">취소</button>
			</div>
		</form>
	</div>
</body>
</html>
