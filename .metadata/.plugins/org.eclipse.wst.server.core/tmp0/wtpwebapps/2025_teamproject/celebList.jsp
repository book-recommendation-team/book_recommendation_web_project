<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<%@ include file="css/main_css.jsp"%>
<%@ include file="./main2.jsp" %>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<meta charset="UTF-8">
<title>셀럽 추천 리스트</title>
</head>
<body>
	<div class="container">
		<div style="text-align: right; margin-bottom: 20px;">
			<a href="celebForm.jsp"
				style="padding: 10px 16px; background-color: #e6f0d7; color: black; text-decoration: none; border-radius: 8px;">작성하기</a>
		</div>
		<div class="grid">
			<c:forEach var="celeb" items="${celebList}">
				<!-- <a class="card" href="celebDetail?celebId=${celeb.celeb_rec_id}">  -->
					<a class="card" href="${pageContext.request.contextPath}/celebDetail">
					<!-- 북마크 아이콘 --> <i class="fas fa-bookmark bookmark-icon"></i> <img
					src="${celeb.celeb_image_url}" alt="${celeb.celeb_name} 이미지" />
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