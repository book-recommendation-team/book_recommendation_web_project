<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    request.setAttribute("celebName", "박찬욱");
    request.setAttribute("celebDescription", "영화감독 박찬욱의 인생 책들");
    request.setAttribute("thumbnail", request.getContextPath() + "/img/박찬욱.jpg");

    List<Map<String, String>> blocks = new ArrayList<>();

    Map<String, String> block1 = new HashMap<>();
    block1.put("type", "text");
    block1.put("value", "독서는 내 영화의 자양분이며, 문학은 영화를 만드는 힘의 원천이다.");
    blocks.add(block1);

    Map<String, String> block2 = new HashMap<>();
    block2.put("type", "image");
    block2.put("value", "/img/오너러블스쿨보이.png");
    blocks.add(block2);

    Map<String, String> block3 = new HashMap<>();
    block3.put("type", "book");
    block3.put("title", "오너러블 스쿨보이");
    block3.put("author", "존 르카레");
    block3.put("publisher", "열린책들");
    block3.put("pubDate", "2022.07.20");
    block3.put("image", "/img/오너러블 스쿨보이.jpg");
    block3.put("link", "https://product.kyobobook.co.kr/detail/S000061448966");
    block3.put("desc", "사상 최고 첩보 시리즈 카를라 3부작의 두 번째 작품 출간");
    blocks.add(block3);
    
    Map<String, String> block4 = new HashMap<>();
    block4.put("type", "image");
    block4.put("value", "/img/이민자들.png");
    blocks.add(block4);

    Map<String, String> block5 = new HashMap<>();
    block5.put("type", "book");
    block5.put("title", "이민자들");
    block5.put("author", "W. G. 제발트");
    block5.put("publisher", "창비");
    block5.put("pubDate", "2018.03.22");
    block5.put("image", "/img/이민자들.jpg");
    block5.put("link", "https://product.kyobobook.co.kr/detail/S000000612803");
    block5.put("desc", "제발트 탄생 75주년 기념 개정판 출간");
    blocks.add(block5);
    
    Map<String, String> block6 = new HashMap<>();
    block6.put("type", "image");
    block6.put("value", "/img/괴물들.png");
    blocks.add(block6);

    Map<String, String> block7 = new HashMap<>();
    block7.put("type", "book");
    block7.put("title", "괴물들");
    block7.put("author", "클레어 데더러");
    block7.put("publisher", "을유문화사");
    block7.put("pubDate", "2024.09.30");
    block7.put("image", "/img/괴물들.jpg");
    block7.put("link", "https://product.kyobobook.co.kr/detail/S000214356477");
    block7.put("desc", "위대한 걸작을 탄생시킨 괴물 예술가를 어떻게 마주할 것인가?");
    blocks.add(block7);
    
    Map<String, String> block8 = new HashMap<>();
    block8.put("type", "image");
    block8.put("value", "/img/브라이턴록.png");
    blocks.add(block8);

    Map<String, String> block9 = new HashMap<>();
    block9.put("type", "book");
    block9.put("title", "브라이턴 록");
    block9.put("author", "그레이엄 그린");
    block9.put("publisher", "현대문학");
    block9.put("pubDate", "2021.04.23");
    block9.put("image", "/img/브라이턴 록.jpg");
    block9.put("link", "https://product.kyobobook.co.kr/detail/S000001945339");
    block9.put("desc", "악의 본성을 탐구한 걸작 미스터리");
    blocks.add(block9);
    
    Map<String, String> block10 = new HashMap<>();
    block10.put("type", "image");
    block10.put("value", "/img/지속의순간들.png");
    blocks.add(block10);

    Map<String, String> block11 = new HashMap<>();
    block11.put("type", "book");
    block11.put("title", "지속의 순간들");
    block11.put("author", "제프 다이어");
    block11.put("publisher", "을유문화사");
    block11.put("pubDate", "2022.03.05");
    block11.put("image", "/img/지속의 순간들.jpg");
    block11.put("link", "https://product.kyobobook.co.kr/detail/S000000576590");
    block11.put("desc", "사진을 찍지 않는 사진 비평가만의 새롭고 독특한 시선");
    blocks.add(block11);
    
    Map<String, String> block12 = new HashMap<>();
    block12.put("type", "image");
    block12.put("value", "/img/관촌수필.png");
    blocks.add(block12);

    Map<String, String> block13 = new HashMap<>();
    block13.put("type", "book");
    block13.put("title", "관촌수필");
    block13.put("author", "이문구");
    block13.put("publisher", "문학과지성사");
    block13.put("pubDate", "2018.09.03");
    block13.put("image", "/img/관촌수필.jpg");
    block13.put("link", "https://product.kyobobook.co.kr/detail/S000000570374");
    block13.put("desc", "우리 문학 토양을 단단하고 풍요롭게 다져온 작품을 만나다.");
    blocks.add(block13);
    
    Map<String, String> block14 = new HashMap<>();
    block14.put("type", "image");
    block14.put("value", "/img/정확한 사랑의 실험.png");
    blocks.add(block14);

    Map<String, String> block15 = new HashMap<>();
    block15.put("type", "book");
    block15.put("title", "정확한 사랑의 실험");
    block15.put("author", "신형철");
    block15.put("publisher", "마음산책");
    block15.put("pubDate", "2014.10.01");
    block15.put("image", "/img/정확한 사랑의 실험.jpg");
    block15.put("link", "https://product.kyobobook.co.kr/detail/S000000938887");
    block15.put("desc", "이야기 속에 숨어 있는 인간의 비밀을 ‘정확한 문장’으로 말한다!");
    blocks.add(block15);
    
    Map<String, String> block16 = new HashMap<>();
    block16.put("type", "image");
    block16.put("value", "/img/창백한 언덕 풍경.png");
    blocks.add(block16);

    Map<String, String> block17 = new HashMap<>();
    block17.put("type", "book");
    block17.put("title", "창백한 언덕 풍경");
    block17.put("author", "가즈오 이시구로");
    block17.put("publisher", "민음사");
    block17.put("pubDate", "2012.11.30");
    block17.put("image", "/img/창백한 언덕 풍경.jpg");
    block17.put("link", "https://product.kyobobook.co.kr/detail/S000000621324");
    block17.put("desc", "흐릿한 기억 속에서 재생되는 과거의 상처!");
    blocks.add(block17);

    request.setAttribute("contentBlocks", blocks);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>셀럽 추천 상세</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<%@ include file="css/main_css.jsp"%>
<%@ include file="./main2.jsp" %>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
}

.container {
	max-width: 1000px;
	margin: 30px auto;
	padding: 0 16px;
}

h1 {
	font-size: 2rem;
	margin-bottom: 10px;
	color: #333;
}

.desc {
	font-size: 1rem;
	color: #666;
	margin-bottom: 100px;
}

.thumbnail-container {
	text-align: center;
	margin: 30px 0;
}

.thumbnail-container img {
	width: 600px;
	height: auto;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.content-blocks {
	align-items: center;
	margin-top: 30px;
}

.text-block {
	text-align: center;
	max-width: 600px;
	background-color: #fff;
	border-radius: 10px;
	padding: 18px;
	margin: 40px auto;  /* ← 여기! auto를 추가해야 가운데 정렬됨 */
	font-size: 1rem;
	line-height: 1.6;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}


.img-block {
	text-align: center; /* 블록 안에서 가운데 정렬 */
	margin: 20px 0;
}

.img-block img {
	max-width: 600px;
	width: 100%;
	height: auto;
	border-radius: 6px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.book-card {
	max-width: 500px;
	margin: 30px auto; /* ← 가운데 정렬을 위해 auto 추가! */
	display: flex;
	gap: 20px;
	align-items: center;
	border: 1px solid #ddd;
	padding: 16px;
	border-radius: 10px;
	cursor: pointer;
	transition: box-shadow 0.2s ease;
	background-color: #fafafa;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
}

.book-card:hover {
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.book-card img {
	width: 90px;
	height: auto;
	border-radius: 6px;
}

.book-info {
	flex-grow: 1;
}

.book-title {
	font-size: 1.2rem;
	font-weight: bold;
	margin-bottom: 4px;
}

.book-meta {
	font-size: 0.9rem;
	color: #555;
	margin: 2px 0;
}

.book-desc {
	margin-top: 8px;
	font-size: 0.95rem;
	color: #333;
}
</style>
</head>
<body>
	<div class="container">
		<h1>${celebName}</h1>
		<p class="desc">${celebDescription}</p>

		<div class="thumbnail-container">
			<img src="${thumbnail}" alt="셀럽 썸네일">
		</div>

		<div class="content-blocks">
			<c:forEach var="block" items="${contentBlocks}">
				<c:choose>
					<c:when test="${block.type == 'text'}">
						<div class="text-block">${block.value}</div>
					</c:when>
					<c:when test="${block.type == 'image'}">
						<div class="img-block">
							<img src="${pageContext.request.contextPath}${block.value}"
								alt="내용 이미지" />
						</div>
					</c:when>
					<c:when test="${block.type == 'book'}">
						<div class="book-card"
							onclick="window.open('${block.link}', '_blank')">
							<img src="${pageContext.request.contextPath}${block.image}"
								alt="${block.title}" />
							<div class="book-info">
								<div class="book-title">${block.title}</div>
								<p class="book-meta">저자: ${block.author}</p>
								<p class="book-meta">출판: ${block.publisher}</p>
								<p class="book-meta">발매: ${block.pubDate}</p>
								<p class="book-desc">${block.desc}</p>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
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
</body>
</html>
