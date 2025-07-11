<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" /> <%-- 외부 CSS 파일 링크 --%>
<%@ include file="css/main_css.jsp"%> <%-- main_css를 include --%>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<meta charset="UTF-8">
<title>셀럽 추천 리스트</title>
<style>
/* 기존 celebList.css에 정의된 스타일이 여기에 복사되지 않도록 주의하세요. */
/* 아래 스타일은 celebList.css에 추가되거나, 해당 파일에서 정의되어 있어야 합니다. */

/* === 새로 추가될 또는 확인해야 할 CSS === */
.action-buttons {
    display: flex;
    justify-content: flex-end;
    gap: 10px;
    margin-bottom: 20px;
}
.action-buttons button, .action-buttons a {
    padding: 10px 16px;
    background-color: #e6f0d7;
    color: black;
    text-decoration: none;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.2s ease;
}
.action-buttons button:hover, .action-buttons a:hover {
    background-color: #cce0b8;
}

/* 개별 카드 내 삭제 버튼 스타일 */
.card-actions {
    position: absolute; /* .celeb-card-container 내에서 절대 위치 */
    top: 10px;
    right: 10px;
    z-index: 10; /* 다른 요소 위에 표시 */
    /* ⭐ 기본적으로 숨김 ⭐ */
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease, visibility 0.3s ease;
}
.card-actions .delete-btn {
    background-color: rgba(255, 0, 0, 0.7); /* 빨간색 배경 */
    color: white;
    border: none;
    border-radius: 5px;
    padding: 5px 8px;
    font-size: 0.8em;
    cursor: pointer;
    transition: background-color 0.2s ease;
}
.card-actions .delete-btn:hover {
    background-color: rgba(255, 0, 0, 0.9);
}

/* ⭐ '선택 삭제' 모드일 때 개별 삭제 버튼 표시 ⭐ */
body.delete-mode-active .card-actions {
    opacity: 1;
    visibility: visible;
}


/* --- 이미지/카드 크기 문제 해결을 위한 CSS (이전에 제안했던 부분, 필요하다면 celebList.css에 반영) --- */
.celeb-card-container { /* 각 셀럽 카드를 감싸는 div (position:relative를 가짐) */
    position: relative; 
    background-color: #fcfcfc;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    display: flex;
    flex-direction: column;
    transition: transform 0.2s ease-in-out;
    /* cursor: pointer; */ /* 링크가 있으므로 컨테이너 커서는 제거 */
    
    /* --- 이미지/카드 크기 문제 해결을 위함 (이전 제안) --- */
    /* height: 350px; */ /* 모든 카드의 높이를 고정 (필요 시 주석 해제하여 사용) */
}

.celeb-card-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

/* 실제 링크가 되는 카드 부분 */
.card { /* 이전에는 a.card였는데 이제 div.celeb-card-container 안의 a.card가 됨 */
    text-decoration: none; /* 링크 밑줄 제거 */
    color: inherit; /* 텍스트 색상 상속 */
    display: flex; /* 내부 요소 세로 정렬 */
    flex-direction: column;
    flex-grow: 1; /* 남은 공간 채우기 */
    cursor: pointer; /* 링크에 포인터 커서 */
}

/* 이미지 스타일 */
.card img {
    width: 100%; /* 부모 너비에 꽉 채움 */
    height: 280px; /* 이미지 높이 고정 (필요 시) */
    object-fit: cover; /* 이미지가 잘리더라도 비율 유지하며 컨테이너 채움 */
    border-bottom: 1px solid #eee;
}

/* 카드 내용 부분 */
.card-content {
    padding: 15px;
    text-align: left;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}
.card-title {
    font-size: 1.2em;
    font-weight: bold;
    color: #444;
    margin-bottom: 8px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
.card-desc {
    font-size: 0.9em;
    color: #666;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* 텍스트 3줄 초과 시 ... */
    -webkit-box-orient: vertical;
}

/* 그리드 레이아웃 */
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    justify-content: center;
    padding: 20px 0;
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
			<button id="join-btn" onclick="location.href='register.jsp'">회원가입</button>
			<button id="login-btn" onclick="location.href='login.jsp'">로그인</button>
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
		<div class="action-buttons">
			<a href="celebForm.jsp" class="create-btn">작성하기</a>
			<button id="deleteSelectedBtn" class="delete-selected-btn">선택 삭제</button>
		</div>
		
		<div class="grid">
			<c:forEach var="celeb" items="${celebList}">
                <div class="celeb-card-container" data-celeb-id="${celeb.celebRecId}"> 
                    <i class="fas fa-bookmark bookmark-icon"></i>
                    
                    <div class="card-actions">
                        <button class="delete-btn">삭제</button> 
                    </div>
                    
                    <a class="card" href="celebDetail.jsp?celebId=${celeb.celebRecId}">
                        <img src="${celeb.celebImageUrl}" alt="${celeb.celebName} 이미지" />
                        <div class="card-content">
                            <div class="card-title">${celeb.celebName}</div>
                            <div class="card-desc">${celeb.celebDescription}</div>
                        </div>
                    </a>
                </div>
			</c:forEach>
		</div>
		<div style="height: 2000px;"></div>

	</div>

	<button id="topBtn" title="맨 위로 이동">
		<i class="fas fa-arrow-up"></i>
	</button>
	<script>
	document.addEventListener("DOMContentLoaded", () => {
		// TOP 버튼 스크롤
		document.getElementById("topBtn").addEventListener("click", () => {
			window.scrollTo({ top: 0, behavior: 'smooth' });
		});

        // ⭐ 핵심: '.grid' 컨테이너에 이벤트 위임 리스너 등록 ⭐
        document.querySelector('.grid').addEventListener('click', async (event) => {
            // 클릭된 요소가 delete-btn 클래스를 가지고 있는지 확인
            if (event.target.classList.contains('delete-btn')) {
                event.preventDefault(); // 기본 동작 방지 (예: 부모 링크 이동)
                event.stopPropagation(); // 이벤트 버블링 방지 (부모 링크 클릭 방지)

                // ⭐ 가장 가까운 .celeb-card-container 부모에서 celebRecId 가져오기 ⭐
                const celebCardContainer = event.target.closest('.celeb-card-container');
                const celebRecId = celebCardContainer ? celebCardContainer.dataset.celebId : null;
                
                // --- 디버깅을 위한 console.log ---
                console.log("------------------------------------------");
                console.log("클릭 이벤트 발생:", event);
                console.log("클릭된 요소 (event.target):", event.target);
                console.log("클릭된 요소의 클래스 리스트:", event.target.classList);
                console.log("closest('.celeb-card-container'):", celebCardContainer);
                console.log("celebCardContainer.dataset.celebId:", celebRecId);
                // --- 디버깅 코드 끝 ---

                if (!celebRecId || celebRecId.trim() === '' || isNaN(parseInt(celebRecId))) {
                    alert('삭제할 셀럽 ID를 찾을 수 없거나 형식이 올바르지 않습니다.');
                    return;
                }

                const isConfirmed = confirm('정말로 이 셀럽 추천 글을 삭제하시겠습니까?');
                if (!isConfirmed) {
                    return;
                }

                try {
                    const deleteUrl = `celebList/` + celebRecId; // 문자열 결합 방식으로 변경
                    console.log("생성될 DELETE 요청 URL:", deleteUrl); // 수정된 URL 출력

                    const response = await fetch(deleteUrl, {
                        method: 'DELETE',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    });

                    let apiResponse = {};
                    if (response.status !== 204) {
                        apiResponse = await response.json(); 
                    }
                    
                    if (response.ok) {
                        alert(apiResponse.message || '셀럽 추천 글이 성공적으로 삭제되었습니다!');
                        window.location.reload(); // 페이지 새로고침하여 목록 업데이트
                    } else {
                        alert(apiResponse.message || `삭제 실패: ${response.statusText}`);
                        console.error('API 응답 오류:', apiResponse);
                    }
                } catch (error) {
                    console.error('삭제 요청 중 오류 발생:', error);
                    alert('삭제 요청 중 통신 오류가 발생했습니다.');
                }
            }
        });

        // ⭐ '선택 삭제' 버튼 클릭 시 개별 삭제 버튼을 토글하는 로직 ⭐
        document.getElementById('deleteSelectedBtn').addEventListener('click', () => {
            document.body.classList.toggle('delete-mode-active');
            // 선택 삭제 버튼 텍스트 변경 (선택 사항)
            const deleteBtn = document.getElementById('deleteSelectedBtn');
            if (document.body.classList.contains('delete-mode-active')) {
                deleteBtn.textContent = '삭제 모드 종료';
            } else {
                deleteBtn.textContent = '선택 삭제';
            }
        });
	});
</script>

</body>
</html>