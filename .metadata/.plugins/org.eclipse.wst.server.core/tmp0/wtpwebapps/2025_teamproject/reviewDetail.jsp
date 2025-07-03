<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    request.setAttribute("title", "자살 일기");
    request.setAttribute("author", "존 르카레");
    request.setAttribute("coverImageUrl", request.getContextPath() + "/img/자살일기.jpg");
    request.setAttribute("reviewText", "이 책은 내 인생을 바꿨습니다. 정말 강력히 추천하고 싶어요.");

    List<Map<String, String>> blocks = new ArrayList<>();

    Map<String, String> block1 = new HashMap<>();
    block1.put("type", "text");
    block1.put("value", "이 구절이 특히 인상 깊었어요.");
    blocks.add(block1);

    request.setAttribute("contentBlocks", blocks);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 상세</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="./css/celebList.css" />
    <%@ include file="css/main_css.jsp" %>
    <link rel="icon" href="img/icon2.png" type="image/x-icon">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }
        h1 {
            font-size: 2rem;
            margin-bottom: 10px;
            color: #333;
        }
        .meta {
            color: #666;
            margin-bottom: 20px;
        }
        .thumbnail-container {
            text-align: center;
            margin: 30px 0;
        }
        .thumbnail-container img {
            max-width: 300px;
            border-radius: 6px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .review-text {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            margin: 40px 0;
            font-size: 1rem;
            line-height: 1.6;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }
        .content-blocks {
            margin-top: 30px;
        }
        .text-block {
            text-align: center;
            max-width: 600px;
            margin: 30px auto;
            padding: 16px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }
        .img-block {
            text-align: center;
            margin: 30px 0;
        }
        .img-block img {
            max-width: 600px;
            width: 100%;
            border-radius: 6px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .book-card {
            max-width: 500px;
            margin: 30px auto;
            display: flex;
            gap: 20px;
            align-items: center;
            border: 1px solid #ddd;
            padding: 16px;
            border-radius: 10px;
            background-color: #fafafa;
            cursor: pointer;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
        }
        .book-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .book-card img {
            width: 90px;
            border-radius: 6px;
        }
        .book-info {
            flex-grow: 1;
        }
        .book-title {
            font-weight: bold;
            font-size: 1.1rem;
            margin-bottom: 4px;
        }
        .book-meta {
            font-size: 0.9rem;
            color: #555;
        }
        .book-desc {
            margin-top: 8px;
            color: #333;
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
    <a href="#">(AI) 책 추천</a>
    <a href="${pageContext.request.contextPath}/reviewList">리뷰</a>
    <a href="#">플레이리스트</a>
    <a href="${pageContext.request.contextPath}/celebList">셀럽추천</a>
    <a href="#">마이페이지</a>
</nav>

<div class="container">
    <h1>${title}</h1>
    <p class="meta">저자: ${author}</p>

    <div class="thumbnail-container">
        <img src="${coverImageUrl}" alt="책 표지" />
    </div>

    <div class="review-text">${reviewText}</div>

    <div class="content-blocks">
        <c:forEach var="block" items="${contentBlocks}">
            <c:choose>
                <c:when test="${block.type == 'text'}">
                    <div class="text-block">${block.value}</div>
                </c:when>
                <c:when test="${block.type == 'image'}">
                    <div class="img-block">
                        <img src="${pageContext.request.contextPath}${block.value}" alt="내용 이미지" />
                    </div>
                </c:when>
                <c:when test="${block.type == 'book'}">
                    <div class="book-card" onclick="window.open('${block.link}', '_blank')">
                        <img src="${pageContext.request.contextPath}${block.image}" alt="${block.title}" />
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
