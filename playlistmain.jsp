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
<title>플레이리스트</title>
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
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 10;
    opacity: 0;
    visibility: hidden;
    transition: opacity 0.3s ease, visibility 0.3s ease;
}
.card-actions .delete-btn {
    background-color: rgba(255, 0, 0, 0.7);
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

/* '선택 삭제' 모드일 때 개별 삭제 버튼 표시 */
body.delete-mode-active .card-actions {
    opacity: 1;
    visibility: visible;
}

/* 카드 사라지는 애니메이션 - 레이아웃 깜빡임 방지 */
.fade-out {
    opacity: 0;
    transform: translateY(30px);
    transition: opacity 1.2s cubic-bezier(0.4, 0.0, 0.2, 1), transform 1.2s cubic-bezier(0.4, 0.0, 0.2, 1);
    pointer-events: none; /* 클릭 방지 */
}

/* 카드가 사라지는 동안 높이 유지 */
.fade-out-shrink {
    height: 0;
    margin: 0;
    padding: 0;
    border: none;
    overflow: hidden;
    transition: height 0.3s ease-out, margin 0.3s ease-out, padding 0.3s ease-out;
}

.celeb-card-container {
    position: relative;	
    background-color: #fcfcfc;
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    display: flex;
    flex-direction: column;
    transition: transform 0.2s ease-in-out, opacity 0.5s ease;
}

.celeb-card-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card {
    text-decoration: none;
    color: inherit;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    cursor: pointer;
}

.card img {
    width: 100%;
    height: 280px;
    object-fit: cover;
    border-bottom: 1px solid #eee;
}

/* 이미지 로딩 실패 시 대체 스타일 */
.card img[src=""], .card img:not([src]), .card img[src*="null"], .card img:not([src]):not(.loaded) {
    background-color: #f5f5f5;
    background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect width="100" height="100" fill="%23f5f5f5"/><text x="50%" y="50%" text-anchor="middle" dy="0.35em" font-family="Arial, sans-serif" font-size="12" fill="%23999">이미지 없음</text></svg>');
    background-repeat: no-repeat;
    background-position: center;
    background-size: 100px 100px;
}

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
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
}

/* 카드 하단 사용자 텍스트 스타일 */
.card-user-text {
    font-size: 0.85em;
    color: #888;
    font-style: italic;
    margin-top: 10px;
    padding-top: 10px;
    border-top: 1px solid #eee;
    line-height: 1.3;
}

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
			href="${pageContext.request.contextPath}/celebList">플레이리스트</a> <a
			href="${pageContext.request.contextPath}/celebList">셀럽추천</a> <a
			href="#">마이페이지</a>
	</nav>
	
	<div class="container">
		<div class="action-buttons">
			<a href="celebForm.jsp" class="create-btn">작성하기</a>
			<button id="deleteSelectedBtn" class="delete-selected-btn">선택 삭제</button>
		</div>
		
		<div class="grid" id="cards-grid">
			<script>
				// 전역변수로 contextPath 정의 (JSP EL 값을 JS에서 사용)
				const contextPath = "<%= request.getContextPath() %>";

				// ⭐ 여기서 카드 데이터를 수정하세요! ⭐
				// userText 필드에 원하는 텍스트를 입력하면 카드 하단에 표시됩니다.
				// linkUrl 필드에 이동할 링크를 설정합니다.
				const customCards = [
					{
						id: 1,
						imageUrl: "img/시.jpg",
						title: "시/소설",
						description: "",
						userText:"짧은 시 한 줄, 마음속 작은 쉼표를 찾아보세요.",
						linkUrl: "playpoetry.jsp"
					},
					{
						id: 2,
						imageUrl: "img/에세이.jpg",
						title: "에세이",
						description: "",
						userText: "일상 속 작은 깨달음. 따뜻한 위로와 성찰을 나눕니다.",
						linkUrl: "playessay.jsp"
					},
					{
						id: 3,
						imageUrl: "img/SF.jpg",
						title: "SF/판타지",
						description: "",
						userText: "상상력의 한계에 도전하는 압도적인 스케일.",
						linkUrl: "playSF.jsp"
					},
					{
						id: 4,
						imageUrl: "img/추리.jpg",
						title: "미스테리/추리",
						description: "",
						userText: "밤을 새우게 할 압도적 몰입감.",
						linkUrl: "playmystery.jsp"
					},
					{
						id: 5,
						imageUrl: "img/history.jpg",
						title: "인문/역사",
						description: "",
						userText: "오늘을 만든 어제. 깊이 있는 통찰로.",
						linkUrl: "playhistory.jsp"
					},
					{
						id: 6,
						imageUrl: "img/철학.jpg",
						title: "철학",
						description: "",
						userText: "삶의 본질을 탐구하며. 생각의 깊이를 더해봅니다.",
						linkUrl: "playphilosophy.jsp"
					},
					{
						id: 7,
						imageUrl: "img/예술.jpg",
						title: "문화/예술",
						description: "",
						userText: "내면의 풍경을 그려내다.",
						linkUrl: "playart.jsp"
					},
					{
						id: 8,
						imageUrl: "img/건강.jpg",
						title: "건강/스포츠",
						description: "",
						userText: "더 나은 당신. 최적의 컨디션을 위한 선택.",
						linkUrl: "playfitness.jsp"
					}
				];
			</script>
			
			<c:choose>
				<c:when test="${not empty celebList}">
					<c:forEach var="celeb" items="${celebList}">
		                <div class="celeb-card-container" data-celeb-id="${celeb.celebRecId}"> 
		                    <i class="fas fa-bookmark bookmark-icon"></i>
		                    
		                    <div class="card-actions">
		                        <button class="delete-btn">삭제</button> 
		                    </div>
		                    
		                    <div class="card">
		                        <img src="${pageContext.request.contextPath}/${celeb.celebImageUrl}" alt="${celeb.celebName} 이미지" class="loaded" />
		                        <div class="card-content">
		                            <div class="card-title">${celeb.celebName}</div>
		                            <div class="card-desc">${celeb.celebDescription}</div>
		                        </div>
		                    </div>
		                </div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					</c:otherwise>
			</c:choose>
		</div>
		<div style="height: 2000px;"></div>
	</div>

	<button id="topBtn" title="맨 위로 이동">
		<i class="fas fa-arrow-up"></i>
	</button>
	
	<script>
	// 전역 변수
	let originalCardsData = [];
	let isNavigating = false; // 네비게이션 중인지 확인하는 플래그

	document.addEventListener("DOMContentLoaded", () => {
		// 커스텀 카드 데이터가 있고 서버 데이터가 없다면 커스텀 데이터로 카드 생성
		if (typeof customCards !== 'undefined' && document.querySelectorAll('.celeb-card-container').length === 0) {
			createCardsFromCustomData();
		}

		// TOP 버튼 스크롤
		document.getElementById("topBtn").addEventListener("click", () => {
			window.scrollTo({ top: 0, behavior: 'smooth' });
		});

		// 카드 클릭 이벤트
		document.querySelector('.grid').addEventListener('click', async (event) => {
			// 삭제 버튼 클릭 처리
			if (event.target.classList.contains('delete-btn')) {
				event.preventDefault();
				event.stopPropagation();
				handleDeleteCard(event.target);
				return;
			}

			// 카드 클릭 처리 (a 태그로 감싸진 카드 전체 클릭)
			const clickedCard = event.target.closest('.celeb-card-container');
			if (clickedCard && !isNavigating) {
				event.preventDefault();
				event.stopPropagation();
				
				// 클릭된 카드의 링크 URL 찾기
				const cardId = clickedCard.dataset.celebId;
				const cardData = customCards.find(card => card.id == cardId);
				
				if (cardData && cardData.linkUrl) {
					isNavigating = true;
					// 모든 카드 사라지기 애니메이션 실행
					await fadeOutAllCardsWithNavigation(cardData.linkUrl);
				}
				return;
			}
		});

		// 선택 삭제 모드 토글
		document.getElementById('deleteSelectedBtn').addEventListener('click', () => {
			document.body.classList.toggle('delete-mode-active');
			const deleteBtn = document.getElementById('deleteSelectedBtn');
			if (document.body.classList.contains('delete-mode-active')) {
				deleteBtn.textContent = '삭제 모드 종료';
			} else {
				deleteBtn.textContent = '선택 삭제';
			}
		});
	});

	// 커스텀 데이터로 카드 생성
	function createCardsFromCustomData() {
		const grid = document.getElementById('cards-grid');
		customCards.forEach(data => {
            let finalImageUrl = data.imageUrl;
            if (!finalImageUrl.startsWith("http://") && !finalImageUrl.startsWith("https://")) {
                finalImageUrl = contextPath + "/" + finalImageUrl;
            }
			const card = createCardElement(data.id, finalImageUrl, data.title, data.description, data.userText, data.linkUrl);
			grid.appendChild(card);
		});
	}

	// 카드 엘리먼트 생성 (링크 추가)
	function createCardElement(id, imageUrl, title, desc, userText = '', linkUrl = '') {
		const cardContainer = document.createElement('div');
		cardContainer.className = 'celeb-card-container';
		cardContainer.dataset.celebId = id;
		if (linkUrl) {
			cardContainer.dataset.linkUrl = linkUrl;
		}

		// userText가 있는 경우에만 해당 영역을 추가
		const userTextHtml = userText ? '<div class="card-user-text">' + userText + '</div>' : '';

		cardContainer.innerHTML = 
			'<i class="fas fa-bookmark bookmark-icon"></i>' +
			'<div class="card-actions">' +
				'<button class="delete-btn">삭제</button>' + 
			'</div>' +
			'<div class="card">' +
				'<img src="' + imageUrl + '" alt="' + title + ' 이미지" class="loaded" />' +
				'<div class="card-content">' +
					'<div class="card-title">' + title + '</div>' +
					'<div class="card-desc">' + desc + '</div>' +
					userTextHtml +
				'</div>' +
			'</div>';

		return cardContainer;
	}

	// 모든 카드 페이드아웃 후 네비게이션
	async function fadeOutAllCardsWithNavigation(targetUrl) {
		const cards = document.querySelectorAll('.celeb-card-container');
		
		// 모든 카드를 순차적으로 사라지게 함
		const fadePromises = [];
		cards.forEach((card, index) => {
			const promise = new Promise((resolve) => {
				setTimeout(() => {
					// 1단계: 투명도와 위치 변경
					card.classList.add('fade-out');
					
					// 2단계: 애니메이션 완료 후 높이 줄이기
					setTimeout(() => {
						card.classList.add('fade-out-shrink');
						
						// 3단계: 높이 애니메이션 완료 후 제거
						setTimeout(() => {
							card.remove();
							resolve();
						}, 300);
					}, 1200);
				}, index * 200);
			});
			fadePromises.push(promise);
		});

		// 모든 카드가 사라질 때까지 기다림
		await Promise.all(fadePromises);
		
		// 모든 카드가 사라진 후 페이지 이동
		window.location.href = targetUrl;
	}

	// 기존 모든 카드 페이드아웃 함수 (이미지 클릭용)
	function fadeOutAllCards() {
		const cards = document.querySelectorAll('.celeb-card-container');
		
		cards.forEach((card, index) => {
			setTimeout(() => {
				// 1단계: 투명도와 위치 변경
				card.classList.add('fade-out');
				
				// 2단계: 애니메이션 완료 후 높이 줄이기
				setTimeout(() => {
					card.classList.add('fade-out-shrink');
					
					// 3단계: 높이 애니메이션 완료 후 제거
					setTimeout(() => {
						card.remove();
					}, 300);
				}, 1200);
			}, index * 200);
		});
	}

	// 개별 카드 삭제 처리
	async function handleDeleteCard(deleteBtn) {
		const celebCardContainer = deleteBtn.closest('.celeb-card-container');
		const celebRecId = celebCardContainer ? celebCardContainer.dataset.celebId : null;
		
		console.log("------------------------------------------");
		console.log("클릭된 요소 (deleteBtn):", deleteBtn);
		console.log("closest('.celeb-card-container'):", celebCardContainer);
		console.log("celebCardContainer.dataset.celebId:", celebRecId);

		if (!celebRecId || celebRecId.trim() === '' || isNaN(parseInt(celebRecId))) {
			alert('삭제할 셀럽 ID를 찾을 수 없거나 형식이 올바르지 않습니다.');
			return;
		}

		const isConfirmed = confirm('정말로 이 셀럽 추천 글을 삭제하시겠습니까?');
		if (!isConfirmed) {
			return;
		}

		try {
			const deleteUrl = `${contextPath}/celebList/` + celebRecId;
			console.log("생성될 DELETE 요청 URL:", deleteUrl);

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
				// 페이드아웃 효과 후 제거 - 레이아웃 깜빡임 방지
				celebCardContainer.classList.add('fade-out');
				
				// 투명도 애니메이션 완료 후 높이 줄이기
				setTimeout(() => {
					celebCardContainer.classList.add('fade-out-shrink');
					
					// 높이 애니메이션 완료 후 제거
					setTimeout(() => {
						celebCardContainer.remove();
					}, 300);
				}, 1200);
			} else {
				alert(apiResponse.message || `삭제 실패: ${response.statusText}`);
				console.error('API 응답 오류:', apiResponse);
			}
		} catch (error) {
			console.error('삭제 요청 중 오류 발생:', error);
			alert('삭제 요청 중 통신 오류가 발생했습니다.');
		}
	}
	</script>

</body>
</html>