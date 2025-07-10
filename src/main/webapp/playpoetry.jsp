<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
// [추가] 페이지에서 사용할 변수들을 선언합니다.
User loggedInUser = (User) session.getAttribute("loggedInUser");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시/소설 - 책 추천</title>
<%@ include file="css/main_css.jsp"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="<%=contextPath%>/css/playlist.css">
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

	<div class="container">
		<a href="playlistmain.jsp" class="back-button" title="뒤로가기"> <i
			class="fas fa-arrow-left"></i>
		</a>

		<div class="page-title">시/소설</div>

		<div class="main-content">
			<div class="video-section">
				<h2 class="video-title">플레이 리스트</h2>
				<div class="video-container">
					<iframe
						src="https://www.youtube.com/embed/Ha7964DxrO0?si=6m-fxoCcJWO_U5el"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</div>

			<div class="books-section">
				<h2 class="books-title">📖 이번 달 추천 도서</h2>
				<div class="featured-book">

					<%-- 추천 도서 링크 수정 --%>
					<c:url var="featuredBookUrl" value="/bookClick">
						<c:param name="id" value="121" />
						<c:param name="title" value="캐드" />
						<c:param name="author" value="시튼스 스케치" />
						<c:param name="image"
							value="${pageContext.request.contextPath}/img/추천1.jpg" />
						<c:param name="link"
							value="https://search.shopping.naver.com/book/catalog/48590624623" />
					</c:url>

					<a href="${featuredBookUrl}" class="featured-book-image"
						data-book-id="121"> <img src="img/추천1.jpg" alt="캐드">
					</a>
					<div class="featured-book-info">
						<div class="featured-book-title">캐드</div>
						<div class="featured-book-author">저자: 시튼스 스케치</div>
						<div class="featured-book-rating">
							<span class="stars">★ 9.6</span> <span>(5)</span>
						</div>
						<div class="featured-book-description">정교한 설계 프로그램 '캐드'를 다루는
							건축 디자이너들의 치열한 세계를 그린 소설. 복잡한 도면처럼 얽힌 인물들의 관계와 꿈, 그리고 사랑 속에서 각자의
							이상적인 공간과 삶을 구축해나가는 과정을 섬세하게 담아냈다.</div>
					</div>
				</div>
			</div>
		</div>


		<div class="cards-section">
			<h2 class="cards-title">📚 WITHUS의 추천 도서</h2>
			<div class="grid">

				<%-- 카드 1 --%>
				<c:url var="clickUrl_1" value="/bookClick">
					<c:param name="id" value="122" />
					<c:param name="title" value="하늘과 바람과 별과 시" />
					<c:param name="author" value="윤동주" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl1.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887849" />
				</c:url>
				<a class="card" href="${clickUrl_1}" data-book-id="122"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl1.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl1.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">하늘과 바람과 별과 시</div>
						<div class="book-author">윤동주</div>
						<div class="review-preview">한국 근대시의 정수</div>
					</div>
				</a>

				<%-- 카드 2 --%>
				<c:url var="clickUrl_2" value="/bookClick">
					<c:param name="id" value="123" />
					<c:param name="title" value="진달래꽃" />
					<c:param name="author" value="김소월" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl2.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486927231" />
				</c:url>
				<a class="card" href="${clickUrl_2}" data-book-id="123"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl2.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl2.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">진달래꽃</div>
						<div class="book-author">김소월</div>
						<div class="review-preview">한국 서정시의 대표작</div>
					</div>
				</a>

				<%-- 카드 3 --%>
				<c:url var="clickUrl_3" value="/bookClick">
					<c:param name="id" value="124" />
					<c:param name="title" value="꽃" />
					<c:param name="author" value="김춘수" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl3.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486927242" />
				</c:url>
				<a class="card" href="${clickUrl_3}" data-book-id="124"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl3.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl3.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">꽃</div>
						<div class="book-author">김춘수</div>
						<div class="review-preview">존재론적 탐구를 담은 대표 시집</div>
					</div>
				</a>

				<%-- 카드 4 --%>
				<c:url var="clickUrl_4" value="/bookClick">
					<c:param name="id" value="125" />
					<c:param name="title" value="님의 침묵" />
					<c:param name="author" value="한용운" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl4.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887955" />
				</c:url>
				<a class="card" href="${clickUrl_4}" data-book-id="125"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl4.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl4.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">님의 침묵</div>
						<div class="book-author">한용운</div>
						<div class="review-preview">독립과 사랑을 노래한 민족시</div>
					</div>
				</a>

				<%-- 카드 5 --%>
				<c:url var="clickUrl_5" value="/bookClick">
					<c:param name="id" value="126" />
					<c:param name="title" value="별 헤는 밤" />
					<c:param name="author" value="윤동주" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl5.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887849" />
				</c:url>
				<a class="card" href="${clickUrl_5}" data-book-id="126"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl5.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl5.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">별 헤는 밤</div>
						<div class="book-author">윤동주</div>
						<div class="review-preview">서정성과 저항 정신의 조화</div>
					</div>
				</a>

				<%-- 카드 6 --%>
				<c:url var="clickUrl_6" value="/bookClick">
					<c:param name="id" value="127" />
					<c:param name="title" value="서랍에 저녁을 넣어 두었다" />
					<c:param name="author" value="한강" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl6.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482038161" />
				</c:url>
				<a class="card" href="${clickUrl_6}" data-book-id="127"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl6.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl6.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">서랍에 저녁을 넣어 두었다</div>
						<div class="book-author">한강</div>
						<div class="review-preview">일상의 소중함을 시적으로 담아낸 감성적 에세이</div>
					</div>
				</a>

				<%-- 카드 7 --%>
				<c:url var="clickUrl_7" value="/bookClick">
					<c:param name="id" value="128" />
					<c:param name="title" value="풀꽃" />
					<c:param name="author" value="나태주" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl7.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486927392" />
				</c:url>
				<a class="card" href="${clickUrl_7}" data-book-id="128"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl7.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl7.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">풀꽃</div>
						<div class="book-author">나태주</div>
						<div class="review-preview">짧지만 깊은 울림을 주는 현대시</div>
					</div>
				</a>

				<%-- 카드 8 --%>
				<c:url var="clickUrl_8" value="/bookClick">
					<c:param name="id" value="129" />
					<c:param name="title" value="사랑하라 한번도 상처받지 않은 것처럼" />
					<c:param name="author" value="류시화 엮음" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl8.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486926959" />
				</c:url>
				<a class="card" href="${clickUrl_8}" data-book-id="129"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl8.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl8.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">사랑하라 한번도 상처받지 않은 것처럼</div>
						<div class="book-author">류시화 엮음</div>
						<div class="review-preview">대중에게 사랑받는 외국 시 모음</div>
					</div>
				</a>

				<%-- 카드 9 --%>
				<c:url var="clickUrl_9" value="/bookClick">
					<c:param name="id" value="130" />
					<c:param name="title" value="슬픔이 기쁨에게" />
					<c:param name="author" value="정호승" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl9.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887967" />
				</c:url>
				<a class="card" href="${clickUrl_9}" data-book-id="130"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl9.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl9.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">슬픔이 기쁨에게</div>
						<div class="book-author">정호승</div>
						<div class="review-preview">현실 비판과 따뜻한 시선</div>
					</div>
				</a>

				<%-- 카드 10 --%>
				<c:url var="clickUrl_10" value="/bookClick">
					<c:param name="id" value="131" />
					<c:param name="title" value="입속의 검은 잎" />
					<c:param name="author" value="기형도" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl10.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887851" />
				</c:url>
				<a class="card" href="${clickUrl_10}" data-book-id="131"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl10.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl10.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">입속의 검은 잎</div>
						<div class="book-author">기형도</div>
						<div class="review-preview">도시인의 불안과 절망을 담은 대표작</div>
					</div>
				</a>

				<%-- 카드 11 --%>
				<c:url var="clickUrl_11" value="/bookClick">
					<c:param name="id" value="132" />
					<c:param name="title" value="서시" />
					<c:param name="author" value="윤동주" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl11.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887849" />
				</c:url>
				<a class="card" href="${clickUrl_11}" data-book-id="132"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl11.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl11.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">서시</div>
						<div class="book-author">윤동주</div>
						<div class="review-preview">시대의 아픔을 노래한 대표 서시</div>
					</div>
				</a>

				<%-- 카드 12 --%>
				<c:url var="clickUrl_12" value="/bookClick">
					<c:param name="id" value="133" />
					<c:param name="title" value="나와 나타샤와 흰 당나귀" />
					<c:param name="author" value="백석" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl12.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32461160356" />
				</c:url>
				<a class="card" href="${clickUrl_12}" data-book-id="133"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl12.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl12.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">나와 나타샤와 흰 당나귀</div>
						<div class="book-author">백석</div>
						<div class="review-preview">토속적이고 향토적인 언어</div>
					</div>
				</a>

				<%-- 카드 13 --%>
				<c:url var="clickUrl_13" value="/bookClick">
					<c:param name="id" value="134" />
					<c:param name="title" value="혼모노" />
					<c:param name="author" value="성해나" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl13.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/40540789623" />
				</c:url>
				<a class="card" href="${clickUrl_13}" data-book-id="134"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl13.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl13.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">혼모노</div>
						<div class="book-author">성해나</div>
						<div class="review-preview">현대 사회의 허위와 진실을 탐구하는 예리한 통찰</div>
					</div>
				</a>

				<%-- 카드 14 --%>
				<c:url var="clickUrl_14" value="/bookClick">
					<c:param name="id" value="135" />
					<c:param name="title" value="소년이 온다" />
					<c:param name="author" value="한강" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl14.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482037993" />
				</c:url>
				<a class="card" href="${clickUrl_14}" data-book-id="135"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl14.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl14.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">소년이 온다</div>
						<div class="book-author">한강</div>
						<div class="review-preview">5·18 광주를 배경으로 한 역사의 아픔과 인간성 탐구</div>
					</div>
				</a>

				<%-- 카드 15 --%>
				<c:url var="clickUrl_15" value="/bookClick">
					<c:param name="id" value="136" />
					<c:param name="title" value="급류" />
					<c:param name="author" value="정대건" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl15.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/46881757622" />
				</c:url>
				<a class="card" href="${clickUrl_15}" data-book-id="136"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl15.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl15.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">급류</div>
						<div class="book-author">정대건</div>
						<div class="review-preview">격동하는 시대 속 인간의 삶과 의지를 그린 힘 있는 소설</div>
					</div>
				</a>

				<%-- 카드 16 --%>
				<c:url var="clickUrl_16" value="/bookClick">
					<c:param name="id" value="137" />
					<c:param name="title" value="채식주의자" />
					<c:param name="author" value="한강" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl16.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482038162" />
				</c:url>
				<a class="card" href="${clickUrl_16}" data-book-id="137"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl16.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl16.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">채식주의자</div>
						<div class="book-author">한강</div>
						<div class="review-preview">여성의 의식과 해방을 그린 충격적이고 강렬한 작품</div>
					</div>
				</a>

				<%-- 카드 17 --%>
				<c:url var="clickUrl_17" value="/bookClick">
					<c:param name="id" value="138" />
					<c:param name="title" value="작별하지 않는다" />
					<c:param name="author" value="한강" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl17.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482038160" />
				</c:url>
				<a class="card" href="${clickUrl_17}" data-book-id="138"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl17.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl17.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">작별하지 않는다</div>
						<div class="book-author">한강</div>
						<div class="review-preview">이별과 기억, 존재에 대한 철학적 성찰이 담긴 시적 소설</div>
					</div>
				</a>

				<%-- 카드 18 --%>
				<c:url var="clickUrl_18" value="/bookClick">
					<c:param name="id" value="139" />
					<c:param name="title" value="외눈박이 물고기의 사랑" />
					<c:param name="author" value="류시화" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl18.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486926960" />
				</c:url>
				<a class="card" href="${clickUrl_18}" data-book-id="139"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl18.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl18.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">외눈박이 물고기의 사랑</div>
						<div class="book-author">류시화</div>
						<div class="review-preview">결핍 속에서도 사랑과 이해를 찾아가는 에세이.</div>
					</div>
				</a>

				<%-- 카드 19 --%>
				<c:url var="clickUrl_19" value="/bookClick">
					<c:param name="id" value="140" />
					<c:param name="title" value="내가 사랑하는 사람" />
					<c:param name="author" value="정호승" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl20.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887966" />
				</c:url>
				<a class="card" href="${clickUrl_19}" data-book-id="140"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl20.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl20.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">내가 사랑하는 사람</div>
						<div class="book-author">정호승</div>
						<div class="review-preview">사랑과 존재의 의미</div>
					</div>
				</a>

				<%-- 카드 20 --%>
				<c:url var="clickUrl_20" value="/bookClick">
					<c:param name="id" value="141" />
					<c:param name="title" value="흰" />
					<c:param name="author" value="한강" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/tl21.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482038163" />
				</c:url>
				<a class="card" href="${clickUrl_20}" data-book-id="141"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/tl21.jpg" alt="배경" /> <img class="cover-img"
					src="img/tl21.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">흰</div>
						<div class="book-author">한강</div>
						<div class="review-preview">색깔과 기억을 통해 삶과 죽음을 탐구하는 서정적 산문</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<button id="topBtn" title="맨 위로 이동">
		<i class="fas fa-arrow-up"></i>
	</button>

	<footer>
		<div class="footer-container">
			<div class="footer-links">
				<a href="#">회사소개</a> <a href="#">이용약관</a> <a href="#">개인정보처리방침</a> <a
					href="#">고객센터</a>
			</div>
			<p>© 2024 WithUs. All rights reserved.</p>
		</div>
	</footer>
	<script>
document.addEventListener('DOMContentLoaded', function () {
    // 1. JSP가 서버에서 실행되어 contextPath가 "/BookRec_Final"로 올바르게 설정됩니다.
    const contextPath = "<%=request.getContextPath()%>";
    const isLoggedIn = <%=session.getAttribute("loggedInUser") != null%>;

    async function initializeBookmarks() {
        if (!isLoggedIn) return;

        try {
            // [수정] fetch URL 앞에 contextPath 변수를 포함시킵니다.
            const url = `${'${contextPath}'}/api/users/me/wishlists`;
            
            const response = await fetch(url);
            if (!response.ok) {
                console.error(`찜 목록 로드 실패: ${'${response.status}'}, 요청 URL: ${'${response.url}'}`);
                return;
            }
            const myWishlistItems = await response.json();
            const myWishlistSet = new Set(myWishlistItems.map(item => item.bookId));

            document.querySelectorAll('.bookmark-icon').forEach(icon => {
                const card = icon.closest('[data-book-id]');
                if (card) {
                    const bookId = parseInt(card.dataset.bookId, 10);
                    if (myWishlistSet.has(bookId)) {
                        icon.classList.add('bookmarked');
                    }
                }
            });
        } catch (error) {
            console.error("찜 목록 초기화 중 네트워크 오류:", error);
        }
    }

    document.querySelectorAll('.bookmark-icon').forEach(icon => {
        icon.addEventListener('click', async function (event) {
            event.preventDefault();
            event.stopPropagation();

            if (!isLoggedIn) {
                alert('로그인이 필요한 기능입니다.');
                window.location.href = `${'${contextPath}'}/login.jsp`;
                return;
            }

            const card = this.closest('[data-book-id]');
            if (!card) {
                console.error('클릭한 아이콘의 상위에서 data-book-id를 찾을 수 없습니다.');
                return;
            }
            const bookId = card.dataset.bookId;
            if (!bookId) {
                alert('책 ID를 가져올 수 없습니다. 페이지를 새로고침 해주세요.');
                return;
            }

            try {
                // [수정] 찜 토글 요청 URL 앞에도 contextPath 변수를 포함시킵니다.
                const url = `${'${contextPath}'}/api/users/me/wishlists?bookId=${'${bookId}'}`;

                const response = await fetch(url, {
                    method: 'POST',
                });

                if (!response.ok) {
                    console.error(`찜 처리 실패: ${'${response.status}'}, 요청 URL: ${'${response.url}'}`);
                    throw new Error('서버 요청에 실패했습니다.');
                }
                
                const result = await response.json();
                if (result.status === 'added') {
                    this.classList.add('bookmarked');
                } else {
                    this.classList.remove('bookmarked');
                }
            } catch (error) {
                console.error('찜 처리 중 오류 발생:', error);
                alert('요청 처리 중 오류가 발생했습니다.');
            }
        });
    });

    initializeBookmarks();
});
</script>
</body>
</html>
<script>
document.addEventListener('DOMContentLoaded', function () {
    // 1. JSP가 서버에서 실행되어 contextPath가 "/BookRec_Final"로 올바르게 설정됩니다.
    const contextPath = "<%=request.getContextPath()%>";
    const isLoggedIn = <%=session.getAttribute("loggedInUser") != null%>;

    async function initializeBookmarks() {
        if (!isLoggedIn) return;

        try {
            // [수정] fetch URL 앞에 contextPath 변수를 포함시킵니다.
            const url = `${'${contextPath}'}/api/users/me/wishlists`;
            
            const response = await fetch(url);
            if (!response.ok) {
                console.error(`찜 목록 로드 실패: ${'${response.status}'}, 요청 URL: ${'${response.url}'}`);
                return;
            }
            const myWishlistItems = await response.json();
            const myWishlistSet = new Set(myWishlistItems.map(item => item.bookId));

            document.querySelectorAll('.bookmark-icon').forEach(icon => {
                const card = icon.closest('[data-book-id]');
                if (card) {
                    const bookId = parseInt(card.dataset.bookId, 10);
                    if (myWishlistSet.has(bookId)) {
                        icon.classList.add('bookmarked');
                    }
                }
            });
        } catch (error) {
            console.error("찜 목록 초기화 중 네트워크 오류:", error);
        }
    }

    document.querySelectorAll('.bookmark-icon').forEach(icon => {
        icon.addEventListener('click', async function (event) {
            event.preventDefault();
            event.stopPropagation();

            if (!isLoggedIn) {
                alert('로그인이 필요한 기능입니다.');
                window.location.href = `${'${contextPath}'}/login.jsp`;
                return;
            }

            const card = this.closest('[data-book-id]');
            if (!card) {
                console.error('클릭한 아이콘의 상위에서 data-book-id를 찾을 수 없습니다.');
                return;
            }
            const bookId = card.dataset.bookId;
            if (!bookId) {
                alert('책 ID를 가져올 수 없습니다. 페이지를 새로고침 해주세요.');
                return;
            }

            try {
                // [수정] 찜 토글 요청 URL 앞에도 contextPath 변수를 포함시킵니다.
                const url = `${'${contextPath}'}/api/users/me/wishlists?bookId=${'${bookId}'}`;

                const response = await fetch(url, {
                    method: 'POST',
                });

                if (!response.ok) {
                    console.error(`찜 처리 실패: ${'${response.status}'}, 요청 URL: ${'${response.url}'}`);
                    throw new Error('서버 요청에 실패했습니다.');
                }
                
                const result = await response.json();
                if (result.status === 'added') {
                    this.classList.add('bookmarked');
                } else {
                    this.classList.remove('bookmarked');
                }
            } catch (error) {
                console.error('찜 처리 중 오류 발생:', error);
                alert('요청 처리 중 오류가 발생했습니다.');
            }
        });
    });

    initializeBookmarks();
});
</script>
</body>
</html>