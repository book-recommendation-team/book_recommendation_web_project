<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User" %> <%-- [수정] User 모델 클래스를 사용하기 위해 임포트 추가 --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>WITHUS</title>
    <%@ include file="css/main_css.jsp" %>
    <link rel="icon" href="img/icon2.png" type="image/x-icon">
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</head>

<body> <%-- [수정] 닫는 태그는 footer에서 처리하므로 여기선 시작 태그만 둡니다. --%>
<header>
    <div id="logo">
        <a href="main.jsp">
            <img src="img/logo.png" alt="로고">
        </a>
    </div>

    <div class="search-group">
        <input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
        <button id="search-btn">검색</button>
    </div>

    <div id="user-buttons">
        <%-- [수정] A 파일의 세션 체크 로직을 그대로 가져와 로그인 상태에 따라 다른 버튼을 표시합니다. --%>
        <%
            // 세션에서 로그인된 User 객체를 가져옵니다.
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            if (loggedInUser == null) {
                // 로그인되어 있지 않은 경우: 회원가입, 로그인 버튼 표시
        %>
                <button id="join-btn" onclick="location.href='register.jsp'">회원가입</button>
                <button id="login-btn" onclick="location.href='login.jsp'">로그인</button>
        <%
            } else {
                // 로그인되어 있는 경우: 닉네임, 마이페이지, 로그아웃 버튼 표시
        %>
                <span style="font-weight: bold; margin-right: 10px;">환영합니다, <%= loggedInUser.getNickname() %>님!</span>
                <button id="mypage-btn" onclick="location.href='mypage.jsp'">마이페이지</button>
                <button id="logout-btn">로그아웃</button>
        <%
            }
        %>
    </div>
</header>

<nav>
    <%-- [수정] A 파일의 동적 링크들을 그대로 적용합니다. --%>
    <a href="#">(AI) 책 추천</a>
    <a href="${pageContext.request.contextPath}/reviewList">리뷰</a>
    <a href="#">플레이리스트</a>
    <a href="${pageContext.request.contextPath}/celebList">셀럽추천</a>
    <a href="<%= (loggedInUser != null ? "mypage.jsp" : "login.jsp") %>">마이페이지</a>
</nav>

<%-- [추가] 이 헤더 파일에 포함된 '로그아웃' 버튼의 기능을 위한 스크립트입니다. --%>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const logoutBtn = document.getElementById('logout-btn');
    if (logoutBtn) {
        logoutBtn.addEventListener('click', () => {
            const isConfirmed = confirm('로그아웃 하시겠습니까?');
            if (isConfirmed) {
                // LogoutServlet으로 로그아웃 요청을 보냅니다.
                window.location.href = '${pageContext.request.contextPath}/logout';
            }
        });
    }
});
</script>

<%-- 닫는 </body>와 </html> 태그는 main_footer.jsp에 있어야 하므로 여기서는 제거합니다. --%>