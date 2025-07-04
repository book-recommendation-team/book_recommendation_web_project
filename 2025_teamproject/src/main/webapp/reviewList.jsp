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
<%@ include file="./main2.jsp" %>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
</head>
<body>

	<div class="container">
		<div style="text-align: right; margin-bottom: 20px;">
			<a href="reviewForm.jsp"
				style="padding: 10px 16px; background-color: #e6f0d7; color: black; text-decoration: none; border-radius: 8px;">작성하기</a>
		</div>

		<div class="grid">
			<c:forEach var="review" items="${reviewList}">
				<%-- <div class="card" onclick="location.href='reviewDetail?reviewId=${review.reviewId}'"> --%>
				<div class="card" onclick="location.href='${pageContext.request.contextPath}/reviewDetail'">
					<!-- 북마크 아이콘 -->
					<i class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
						src="${review.coverImageUrl}" alt="배경" /> <img class="cover-img"
						src="${review.coverImageUrl}" alt="표지" />
						
					<div class="card-content">
					<div class="rating">
    <c:forEach begin="1" end="${review.rating}">★</c:forEach>
    <c:forEach begin="1" end="${5 - review.rating}">☆</c:forEach>
</div>
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
