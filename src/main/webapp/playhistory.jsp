<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.User"%>
<%-- JSTL 사용을 위한 태그 라이브러리 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
User loggedInUser = (User) session.getAttribute("loggedInUser");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인문/역사 - 책 추천</title>
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
		<div class="page-header">
			<a href="playlistmain.jsp" class="back-button" title="뒤로가기"> <i
				class="fas fa-arrow-left"></i>
			</a>
			<div class="page-title">인문/역사</div>
		</div>

		<div class="main-content">
			<div class="video-section">
				<h2 class="video-title">플레이 리스트</h2>
				<div class="video-container">
					<iframe
						src="https://www.youtube.com/embed/YPKSQxXJPMU?si=RvND3CrpVBeYm6ri"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; 
                    encrypted-media; gyroscope; picture-in-picture; web-share"
						referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</div>

			<div class="books-section">
				<h2 class="books-title">📖 이번 달 추천 도서</h2>
				<div class="featured-book">

					<%-- 추천 도서 링크 수정 --%>
					<c:url var="featuredBookUrl" value="/bookClick">
						<c:param name="id" value="58" />
						<c:param name="title" value="넥서스" />
						<c:param name="author" value="유발 하라리" />
						<c:param name="image"
							value="${pageContext.request.contextPath}/img/dur5.jpg" />
						<c:param name="link"
							value="https://search.shopping.naver.com/book/catalog/48538749622" />
					</c:url>

					<a href="${featuredBookUrl}" class="featured-book-image"
						data-book-id="58"> <img src="img/dur5.jpg" alt="넥서스">
					</a>
					<div class="featured-book-info">
						<div class="featured-book-title">넥서스</div>
						<div class="featured-book-author">저자: 유발 하라리</div>
						<div class="featured-book-rating">
							<span class="stars">★ 9.3</span> <span>(297)</span>
						</div>
						<div class="featured-book-description">글로벌 베스트셀러 『사피엔스』 『호모
							데우스』 『21세기를 위한 21가지 제언』으로 우리 시대 가장 중요한 사상가의 반열에 오른 유발 하라리 교수가 압도적
							통찰로 AI 혁명의 의미와 본질을 꿰뚫어 보고 인류에게 남은 기회를 냉철하게 성찰하는 신작으로 돌아왔다. 생태적
							붕괴와 국제정치적 긴장에 이어 친구인지 적인지 모를 AI 혁명까지, 인간 본성의 어떤 부분이 우리를 자기 파괴의 길로
							내모는 것일까? AI는 이전 정보 기술과 무엇이 다르고, 왜 위험할까? 멸종을 향해 달려가는 가장 영리한 동물, 우리
							사피엔스는 생존과 번영의 길을 찾을 수 있을까?</div>
					</div>
				</div>
			</div>
		</div>

		<div class="cards-section">
			<h2 class="cards-title">📚 WITHUS의 추천 인문/역사</h2>
			<div class="grid">

				<%-- 카드 1 --%>
				<c:url var="clickUrl_1" value="/bookClick">
					<c:param name="id" value="59" />
					<c:param name="title" value="사피엔스" />
					<c:param name="author" value="유발 하라리" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32441695627" />
				</c:url>
				<a class="card" href="${clickUrl_1}" data-book-id="59"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">사피엔스</div>
						<div class="book-author">유발 하라리</div>
						<div class="review-preview">인류의 역사와 미래를 거시적으로 조망</div>
					</div>
				</a>

				<%-- 카드 2 --%>
				<c:url var="clickUrl_2" value="/bookClick">
					<c:param name="id" value="60" />
					<c:param name="title" value="역사란 무엇인가" />
					<c:param name="author" value="E.H. 카" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur1.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32436139335" />
				</c:url>
				<a class="card" href="${clickUrl_2}" data-book-id="60"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur1.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur1.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">역사란 무엇인가</div>
						<div class="book-author">E.H. 카</div>
						<div class="review-preview">역사학의 고전이자 필독서</div>
					</div>
				</a>

				<%-- 카드 3 --%>
				<c:url var="clickUrl_3" value="/bookClick">
					<c:param name="id" value="61" />
					<c:param name="title" value="로마 제국 쇠망사" />
					<c:param name="author" value="에드워드 기번" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur2.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32466981881" />
				</c:url>
				<a class="card" href="${clickUrl_3}" data-book-id="61"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur2.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur2.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">로마 제국 쇠망사</div>
						<div class="book-author">에드워드 기번</div>
						<div class="review-preview">서양 고전 역사의 기념비적 저작</div>
					</div>
				</a>

				<%-- 카드 4 --%>
				<c:url var="clickUrl_4" value="/bookClick">
					<c:param name="id" value="62" />
					<c:param name="title" value="총, 균, 쇠" />
					<c:param name="author" value="재레드 다이아몬드" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur3.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32436139206" />
				</c:url>
				<a class="card" href="${clickUrl_4}" data-book-id="62"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur3.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur3.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">총, 균, 쇠</div>
						<div class="book-author">재레드 다이아몬드</div>
						<div class="review-preview">문명의 흥망성쇠를 환경적 관점에서 분석</div>
					</div>
				</a>

				<%-- 카드 5 --%>
				<c:url var="clickUrl_5" value="/bookClick">
					<c:param name="id" value="63" />
					<c:param name="title" value="나의 문화유산답사기" />
					<c:param name="author" value="유홍준" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur4.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32485593026" />
				</c:url>
				<a class="card" href="${clickUrl_5}" data-book-id="63"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur4.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur4.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">나의 문화유산답사기</div>
						<div class="book-author">유홍준</div>
						<div class="review-preview">한국 문화유산의 아름다움을 대중에게 알림</div>
					</div>
				</a>

				<%-- 카드 6 --%>
				<c:url var="clickUrl_6" value="/bookClick">
					<c:param name="id" value="64" />
					<c:param name="title" value="넥서스" />
					<c:param name="author" value="유발 하라리" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur5.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/48538749622" />
				</c:url>
				<a class="card" href="${clickUrl_6}" data-book-id="64"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur5.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur5.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">넥서스</div>
						<div class="book-author">유발 하라리</div>
						<div class="review-preview">정보와 권력의 미래를 예측하는 통찰력 있는 분석</div>
					</div>
				</a>

				<%-- 카드 7 --%>
				<c:url var="clickUrl_7" value="/bookClick">
					<c:param name="id" value="65" />
					<c:param name="title" value="서양미술사" />
					<c:param name="author" value="에른스트 H. 곰브리치" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur6.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887754" />
				</c:url>
				<a class="card" href="${clickUrl_7}" data-book-id="65"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur6.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur6.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">서양미술사</div>
						<div class="book-author">에른스트 H. 곰브리치</div>
						<div class="review-preview">미술사의 바이블로 불리는 대표적인 입문서</div>
					</div>
				</a>

				<%-- 카드 8 --%>
				<c:url var="clickUrl_8" value="/bookClick">
					<c:param name="id" value="66" />
					<c:param name="title" value="문화의 수수께끼" />
					<c:param name="author" value="마빈 해리스" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur7.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32488887857" />
				</c:url>
				<a class="card" href="${clickUrl_8}" data-book-id="66"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur7.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur7.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">문화의 수수께끼</div>
						<div class="book-author">마빈 해리스</div>
						<div class="review-preview">다양한 문화 현상을 인류학적 관점에서 해석</div>
					</div>
				</a>

				<%-- 카드 9 --%>
				<c:url var="clickUrl_9" value="/bookClick">
					<c:param name="id" value="67" />
					<c:param name="title" value="죽은 경제학자의 살아있는 아이디어" />
					<c:param name="author" value="토드 부크홀츠" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur8.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32441695719" />
				</c:url>
				<a class="card" href="${clickUrl_9}" data-book-id="67"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur8.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur8.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">죽은 경제학자의 살아있는 아이디어</div>
						<div class="book-author">토드 부크홀츠</div>
						<div class="review-preview">경제사상사를 쉽고 재미있게 풀어냄</div>
					</div>
				</a>

				<%-- 카드 10 --%>
				<c:url var="clickUrl_10" value="/bookClick">
					<c:param name="id" value="68" />
					<c:param name="title" value="21세기 자본" />
					<c:param name="author" value="토마 피케티" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur9.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32474415891" />
				</c:url>
				<a class="card" href="${clickUrl_10}" data-book-id="68"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur9.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur9.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">21세기 자본</div>
						<div class="book-author">토마 피케티</div>
						<div class="review-preview">불평등 문제를 역사적 데이터로 분석</div>
					</div>
				</a>

				<%-- 카드 11 --%>
				<c:url var="clickUrl_11" value="/bookClick">
					<c:param name="id" value="69" />
					<c:param name="title" value="유럽 도시 기행1" />
					<c:param name="author" value="유시민" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur10.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32482037989" />
				</c:url>
				<a class="card" href="${clickUrl_11}" data-book-id="69"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur10.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur10.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">유럽 도시 기행1</div>
						<div class="book-author">유시민</div>
						<div class="review-preview">유럽 도시들의 역사와 문화를 깊이 있게 탐방</div>
					</div>
				</a>

				<%-- 카드 12 --%>
				<c:url var="clickUrl_12" value="/bookClick">
					<c:param name="id" value="70" />
					<c:param name="title" value="사마천 사기" />
					<c:param name="author" value="사마천" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur11.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486927391" />
				</c:url>
				<a class="card" href="${clickUrl_12}" data-book-id="70"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur11.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur11.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">사마천 사기</div>
						<div class="book-author">사마천</div>
						<div class="review-preview">중국 역사서의 걸작이자 동양 사학의 출발점</div>
					</div>
				</a>

				<%-- 카드 13 --%>
				<c:url var="clickUrl_13" value="/bookClick">
					<c:param name="id" value="71" />
					<c:param name="title" value="조선왕조실록" />
					<c:param name="author" value="대중을 위한 번역본" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur12.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/44476735622" />
				</c:url>
				<a class="card" href="${clickUrl_13}" data-book-id="71"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur12.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur12.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">조선왕조실록</div>
						<div class="book-author">대중을 위한 번역본</div>
						<div class="review-preview">한국사의 방대한 기록물</div>
					</div>
				</a>

				<%-- 카드 14 --%>
				<c:url var="clickUrl_14" value="/bookClick">
					<c:param name="id" value="72" />
					<c:param name="title" value="물질의 세계" />
					<c:param name="author" value="에드 콘웨이" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/a1.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/42529329623" />
				</c:url>
				<a class="card" href="${clickUrl_14}" data-book-id="72"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/a1.jpg" alt="배경" /> <img class="cover-img"
					src="img/a1.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">물질의 세계</div>
						<div class="book-author">에드 콘웨이</div>
						<div class="review-preview">현대 문명을 이루는 물질들의 숨겨진 이야기</div>
					</div>
				</a>

				<%-- 카드 15 --%>
				<c:url var="clickUrl_15" value="/bookClick">
					<c:param name="id" value="73" />
					<c:param name="title" value="삼국유사" />
					<c:param name="author" value="일연" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur13.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32486927393" />
				</c:url>
				<a class="card" href="${clickUrl_15}" data-book-id="73"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur13.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur13.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">삼국유사</div>
						<div class="book-author">일연</div>
						<div class="review-preview">한국 고대사와 불교문화의 소중한 기록</div>
					</div>
				</a>

				<%-- 카드 16 --%>
				<c:url var="clickUrl_16" value="/bookClick">
					<c:param name="id" value="74" />
					<c:param name="title" value="역사의 종말" />
					<c:param name="author" value="프랜시스 후쿠야마" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur14.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32445834817" />
				</c:url>
				<a class="card" href="${clickUrl_16}" data-book-id="74"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur14.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur14.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">역사의 종말</div>
						<div class="book-author">프랜시스 후쿠야마</div>
						<div class="review-preview">냉전 이후 서구 자유민주주의의 승리 선언</div>
					</div>
				</a>

				<%-- 카드 17 --%>
				<c:url var="clickUrl_17" value="/bookClick">
					<c:param name="id" value="75" />
					<c:param name="title" value="세계사를 바꾼 10가지 약" />
					<c:param name="author" value="사토 겐타로" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur18.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/37622287618" />
				</c:url>
				<a class="card" href="${clickUrl_17}" data-book-id="75"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur18.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur18.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">세계사를 바꾼 10가지 약</div>
						<div class="book-author">사토 겐타로</div>
						<div class="review-preview">인류 역사는 ‘질병과 약의 투쟁 역사’다</div>
					</div>
				</a>

				<%-- 카드 18 --%>
				<c:url var="clickUrl_18" value="/bookClick">
					<c:param name="id" value="76" />
					<c:param name="title" value="다시, 역사의 쓸모" />
					<c:param name="author" value="최태성" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur17.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/40540789622" />
				</c:url>
				<a class="card" href="${clickUrl_18}" data-book-id="76"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur17.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur17.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">다시, 역사의 쓸모</div>
						<div class="book-author">최태성</div>
						<div class="review-preview">현재를 이해하기 위한 역사적 통찰력</div>
					</div>
				</a>

				<%-- 카드 19 (※ 원본 링크 오타 수정: https:// 추가) --%>
				<c:url var="clickUrl_19" value="/bookClick">
					<c:param name="id" value="77" />
					<c:param name="title" value="잃어버린 시간을 찾아서" />
					<c:param name="author" value="마르셀 프루스트" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur15.jpg" />
					<c:param name="link"
						value="https://shopping.naver.com/book/catalog/32486926955" />
				</c:url>
				<a class="card" href="${clickUrl_19}" data-book-id="77"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur15.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur15.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">잃어버린 시간을 찾아서</div>
						<div class="book-author">마르셀 프루스트</div>
						<div class="review-preview">기억과 시간의 본질을 탐구</div>
					</div>
				</a>

				<%-- 카드 20 --%>
				<c:url var="clickUrl_20" value="/bookClick">
					<c:param name="id" value="78" />
					<c:param name="title" value="호모데우스" />
					<c:param name="author" value="유발 하라리" />
					<c:param name="image"
						value="${pageContext.request.contextPath}/img/dur19.jpg" />
					<c:param name="link"
						value="https://search.shopping.naver.com/book/catalog/32485593019" />
				</c:url>
				<a class="card" href="${clickUrl_20}" data-book-id="78"> <i
					class="fas fa-bookmark bookmark-icon"></i> <img class="bg-img"
					src="img/dur19.jpg" alt="배경" /> <img class="cover-img"
					src="img/dur19.jpg" alt="표지" />
					<div class="card-content">
						<div class="book-title">호모데우스</div>
						<div class="book-author">유발 하라리</div>
						<div class="review-preview">기술 발전이 가져올 인류의 미래를 예측</div>
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