<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    /* 세션 사용자·컨텍스트 경로 변수 */
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SF/판타지 - 책 추천</title>
    <%@ include file="css/main_css.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="img/icon2.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="<%= contextPath %>/css/playlist.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <nav>
        <a href="<%=contextPath%>/aiRecommend.jsp">(AI) 책 추천</a>
        <a href="<%=contextPath%>/reviewList">리뷰</a>
        <a href="<%=contextPath%>/playlistmain.jsp">플레이리스트</a>
        <a href="<%=contextPath%>/celebList">셀럽추천</a>
        <a href="<%=contextPath%>/mypage.jsp">마이페이지</a>
    </nav>

    <div class="container">
        <!-- 뒤로가기 버튼 & 페이지 타이틀 -->
        <a href="playlistmain.jsp" class="back-button" title="뒤로가기">
            <i class="fas fa-arrow-left"></i>
        </a>
        <div class="page-title">SF/판타지</div>

        <!-- 메인 영상 + 특집 도서 -->
        <div class="main-content">
            <div class="video-section">
                <h2 class="video-title">플레이 리스트</h2>
                <div class="video-container">
                    <iframe src="https://www.youtube.com/embed/_XFeRhG3gow?si=kZHK6a7LSqeckQEE"
                            title="YouTube video player" frameborder="0"
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                            referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
                    </iframe>
                </div>
            </div>

            <div class="books-section">
                <h2 class="books-title">📖 이번 달 추천 도서</h2>

                <!-- 특집(Featured) 도서 링크 생성 -->
                <c:url var="featuredBookUrl" value="/bookClick">
                    <c:param name="id" value="142"/>
                    <c:param name="title" value="듄"/>
                    <c:param name="author" value="프랭크 허버트"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s4.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32488887752"/>
                </c:url>

                <div class="featured-book">
                    <a href="${featuredBookUrl}" class="featured-book-image" data-book-id="142">
                        <img src="img/s4.jpg" alt="듄">
                    </a>
                    <div class="featured-book-info">
                        <div class="featured-book-title">듄</div>
                        <div class="featured-book-author">저자: 프랭크 허버트</div>
                        <div class="featured-book-rating">
                            <span class="stars">★ 9.6</span>
                            <span>(23)</span>
                        </div>
                        <div class="featured-book-description">
                            3만 년에 걸친 인류사를 그려낸 사막 행성 서사시. SF의 지평을 넓힌 걸작 연대기.
                        </div>
                    </div>
                </div>
            </div><!-- .books-section -->
        </div><!-- .main-content -->

        <!-- 카드형 도서 목록 -->
        <div class="cards-section">
            <h2 class="cards-title">🚀 WITHUS의 추천 SF/판타지</h2>
            <div class="grid">

                <%-- 카드 1 --%>
                <c:url var="clickUrl_1" value="/bookClick">
                    <c:param name="id" value="143"/>
                    <c:param name="title" value="반지의 제왕 1"/>
                    <c:param name="author" value="J.R.R. 톨킨"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s1.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486927389"/>
                </c:url>
                <a class="card" href="${clickUrl_1}" data-book-id="143">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s1.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s1.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">반지의 제왕 1</div>
                        <div class="book-author">J.R.R. 톨킨</div>
                        <div class="review-preview">판타지 장르의 절대적 고전 ①</div>
                    </div>
                </a>

                <%-- 카드 2 --%>
                <c:url var="clickUrl_2" value="/bookClick">
                    <c:param name="id" value="144"/>
                    <c:param name="title" value="반지의 제왕 2"/>
                    <c:param name="author" value="J.R.R. 톨킨"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s2.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486927389"/>
                </c:url>
                <a class="card" href="${clickUrl_2}" data-book-id="144">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s2.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s2.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">반지의 제왕 2</div>
                        <div class="book-author">J.R.R. 톨킨</div>
                        <div class="review-preview">판타지 장르의 절대적 고전 ②</div>
                    </div>
                </a>

                <%-- 카드 3 --%>
                <c:url var="clickUrl_3" value="/bookClick">
                    <c:param name="id" value="145"/>
                    <c:param name="title" value="파운데이션"/>
                    <c:param name="author" value="아이작 아시모프"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s3.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32470076210"/>
                </c:url>
                <a class="card" href="${clickUrl_3}" data-book-id="145">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s3.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s3.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">파운데이션</div>
                        <div class="book-author">아이작 아시모프</div>
                        <div class="review-preview">SF 우주 서사의 대명사</div>
                    </div>
                </a>

                <%-- 카드 4 --%>
                <c:url var="clickUrl_4" value="/bookClick">
                    <c:param name="id" value="146"/>
                    <c:param name="title" value="듄"/>
                    <c:param name="author" value="프랭크 허버트"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s4.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32488887752"/>
                </c:url>
                <a class="card" href="${clickUrl_4}" data-book-id="146">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s4.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s4.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">듄</div>
                        <div class="book-author">프랭크 허버트</div>
                        <div class="review-preview">생태·정치·종교가 얽힌 SF 걸작</div>
                    </div>
                </a>

                <%-- 카드 5 --%>
                <c:url var="clickUrl_5" value="/bookClick">
                    <c:param name="id" value="147"/>
                    <c:param name="title" value="어스시의 마법사"/>
                    <c:param name="author" value="어슐러 르 귄"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s5.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32485593025"/>
                </c:url>
                <a class="card" href="${clickUrl_5}" data-book-id="147">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s5.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s5.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">어스시의 마법사</div>
                        <div class="book-author">어슐러 르 귄</div>
                        <div class="review-preview">마법·정체성·균형의 서사시</div>
                    </div>
                </a>

                <%-- 카드 6 --%>
                <c:url var="clickUrl_6" value="/bookClick">
                    <c:param name="id" value="148"/>
                    <c:param name="title" value="1984"/>
                    <c:param name="author" value="조지 오웰"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s6.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32466981997"/>
                </c:url>
                <a class="card" href="${clickUrl_6}" data-book-id="148">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s6.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s6.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">1984</div>
                        <div class="book-author">조지 오웰</div>
                        <div class="review-preview">디스토피아 경전</div>
                    </div>
                </a>

                <%-- 카드 7 --%>
                <c:url var="clickUrl_7" value="/bookClick">
                    <c:param name="id" value="149"/>
                    <c:param name="title" value="멋진 신세계"/>
                    <c:param name="author" value="올더스 헉슬리"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s7.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32482038166"/>
                </c:url>
                <a class="card" href="${clickUrl_7}" data-book-id="149">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s7.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s7.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">멋진 신세계</div>
                        <div class="book-author">올더스 헉슬리</div>
                        <div class="review-preview">기술 문명과 인간성의 비극</div>
                    </div>
                </a>

                <%-- 카드 8 --%>
                <c:url var="clickUrl_8" value="/bookClick">
                    <c:param name="id" value="150"/>
                    <c:param name="title" value="해리 포터 시리즈"/>
                    <c:param name="author" value="J.K. 롤링"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s8.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32445834873"/>
                </c:url>
                <a class="card" href="${clickUrl_8}" data-book-id="150">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s8.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s8.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">해리 포터 시리즈</div>
                        <div class="book-author">J.K. 롤링</div>
                        <div class="review-preview">현대 판타지 문화 아이콘</div>
                    </div>
                </a>

                <%-- 카드 9 --%>
                <c:url var="clickUrl_9" value="/bookClick">
                    <c:param name="id" value="151"/>
                    <c:param name="title" value="우리가 빛의 속도로 갈 수 없다면"/>
                    <c:param name="author" value="김초엽"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s9.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32487161393"/>
                </c:url>
                <a class="card" href="${clickUrl_9}" data-book-id="151">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s9.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s9.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">우리가 빛의 속도로 갈 수 없다면</div>
                        <div class="book-author">김초엽</div>
                        <div class="review-preview">한국 SF의 새로운 가능성</div>
                    </div>
                </a>

                <%-- 카드 10 --%>
                <c:url var="clickUrl_10" value="/bookClick">
                    <c:param name="id" value="152"/>
                    <c:param name="title" value="지구 끝의 온실"/>
                    <c:param name="author" value="김초엽"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s10.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32436139200"/>
                </c:url>
                <a class="card" href="${clickUrl_10}" data-book-id="152">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s10.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s10.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">지구 끝의 온실</div>
                        <div class="book-author">김초엽</div>
                        <div class="review-preview">기후 변화와 인류 미래</div>
                    </div>
                </a>

                <%-- 카드 11 --%>
                <c:url var="clickUrl_11" value="/bookClick">
                    <c:param name="id" value="153"/>
                    <c:param name="title" value="은하수를 여행하는 히치하이커를 위한 안내서"/>
                    <c:param name="author" value="더글러스 애덤스"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s11.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486927238"/>
                </c:url>
                <a class="card" href="${clickUrl_11}" data-book-id="153">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s11.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s11.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">은하수를 여행하는 히치하이커를 위한 안내서</div>
                        <div class="book-author">더글러스 애덤스</div>
                        <div class="review-preview">유머·기발함 가득 SF 코미디</div>
                    </div>
                </a>

                <%-- 카드 12 --%>
                <c:url var="clickUrl_12" value="/bookClick">
                    <c:param name="id" value="154"/>
                    <c:param name="title" value="파리대왕"/>
                    <c:param name="author" value="윌리엄 골딩"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s12.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32485593024"/>
                </c:url>
                <a class="card" href="${clickUrl_12}" data-book-id="154">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s12.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s12.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">파리대왕</div>
                        <div class="book-author">윌리엄 골딩</div>
                        <div class="review-preview">문명·야만의 경계 탐구</div>
                    </div>
                </a>

                <%-- 카드 13 --%>
                <c:url var="clickUrl_13" value="/bookClick">
                    <c:param name="id" value="155"/>
                    <c:param name="title" value="사이보그가 되다"/>
                    <c:param name="author" value="김초엽, 김원영"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s13.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32441695629"/>
                </c:url>
                <a class="card" href="${clickUrl_13}" data-book-id="155">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s13.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s13.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">사이보그가 되다</div>
                        <div class="book-author">김초엽·김원영</div>
                        <div class="review-preview">기술과 인간의 경계 성찰</div>
                    </div>
                </a>

                <%-- 카드 14 --%>
                <c:url var="clickUrl_14" value="/bookClick">
                    <c:param name="id" value="156"/>
                    <c:param name="title" value="스페이스 오디세이"/>
                    <c:param name="author" value="아서 C. 클라크"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s14.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32488887853"/>
                </c:url>
                <a class="card" href="${clickUrl_14}" data-book-id="156">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s14.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s14.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">스페이스 오디세이</div>
                        <div class="book-author">아서 C. 클라크</div>
                        <div class="review-preview">인류 기원·진화 탐구</div>
                    </div>
                </a>

                <%-- 카드 15 --%>
                <c:url var="clickUrl_15" value="/bookClick">
                    <c:param name="id" value="157"/>
                    <c:param name="title" value="백만 광년의 고독 속에서 한 줄의 시를 읽다"/>
                    <c:param name="author" value="류시화"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s15.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486926958"/>
                </c:url>
                <a class="card" href="${clickUrl_15}" data-book-id="157">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s15.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s15.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">백만 광년의 고독 속에서 한 줄의 시를 읽다</div>
                        <div class="book-author">류시화</div>
                        <div class="review-preview">우주적 관점의 사색</div>
                    </div>
                </a>

                <%-- 카드 16 --%>
                <c:url var="clickUrl_16" value="/bookClick">
                    <c:param name="id" value="158"/>
                    <c:param name="title" value="나는 전설이다"/>
                    <c:param name="author" value="리처드 매드슨"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s16.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486927236"/>
                </c:url>
                <a class="card" href="${clickUrl_16}" data-book-id="158">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s16.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s16.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">나는 전설이다</div>
                        <div class="book-author">리처드 매드슨</div>
                        <div class="review-preview">포스트 아포칼립스 원형</div>
                    </div>
                </a>

                <%-- 카드 17 --%>
                <c:url var="clickUrl_17" value="/bookClick">
                    <c:param name="id" value="159"/>
                    <c:param name="title" value="호밀밭의 파수꾼"/>
                    <c:param name="author" value="J.D. 샐린저"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s17.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32485593023"/>
                </c:url>
                <a class="card" href="${clickUrl_17}" data-book-id="159">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s17.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s17.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">호밀밭의 파수꾼</div>
                        <div class="book-author">J.D. 샐린저</div>
                        <div class="review-preview">청소년 성장소설 고전</div>
                    </div>
                </a>

                <%-- 카드 18 --%>
                <c:url var="clickUrl_18" value="/bookClick">
                    <c:param name="id" value="160"/>
                    <c:param name="title" value="시녀 이야기"/>
                    <c:param name="author" value="마거릿 애트우드"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s18.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32470076214"/>
                </c:url>
                <a class="card" href="${clickUrl_18}" data-book-id="160">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s18.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s18.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">시녀 이야기</div>
                        <div class="book-author">마거릿 애트우드</div>
                        <div class="review-preview">페미니즘 디스토피아</div>
                    </div>
                </a>

                <%-- 카드 19 --%>
                <c:url var="clickUrl_19" value="/bookClick">
                    <c:param name="id" value="161"/>
                    <c:param name="title" value="장미의 이름"/>
                    <c:param name="author" value="움베르토 에코"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s19.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32436139198"/>
                </c:url>
                <a class="card" href="${clickUrl_19}" data-book-id="161">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s19.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s19.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">장미의 이름</div>
                        <div class="book-author">움베르토 에코</div>
                        <div class="review-preview">지적 추리소설 걸작</div>
                    </div>
                </a>

                <%-- 카드 20 --%>
                <c:url var="clickUrl_20" value="/bookClick">
                    <c:param name="id" value="162"/>
                    <c:param name="title" value="설국열차"/>
                    <c:param name="author" value="자크 로브"/>
                    <c:param name="image" value="${pageContext.request.contextPath}/img/s20.jpg"/>
                    <c:param name="link" value="https://search.shopping.naver.com/book/catalog/32486927394"/>
                </c:url>
                <a class="card" href="${clickUrl_20}" data-book-id="162">
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    <img class="bg-img"   src="img/s20.jpg" alt="배경"/>
                    <img class="cover-img" src="img/s20.jpg" alt="표지"/>
                    <div class="card-content">
                        <div class="book-title">설국열차</div>
                        <div class="book-author">자크 로브</div>
                        <div class="review-preview">계급 풍자 포스트 아포칼립스</div>
                    </div>
                </a>

            </div><!-- .grid -->
        </div><!-- .cards-section -->
    </div><!-- .container -->

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
