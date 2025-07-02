<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHUS - main</title>
<link rel="icon" href="image/icon2.png" type="image/png">
<link rel="stylesheet" type="text/css" href="teamproject.css">
</head>
<body>
	<header>
		<div id="logo">
			<img src="image/로고.png" alt="로고">
		</div>
		<input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
		<button id="logout-btn" onclick="location.href='Logout.jsp'">로그아웃</button>
	</header>

	<nav>
		<a href="#">(AI) 책 추천</a> <a href="#">리뷰</a> <a href="#">플레이리스트</a>
		<a href="#">셀럽추천</a> <a href="#">마이페이지</a>
	</nav>

	<div class="main-content-wrapper">
		<div class="sidebar">
			<div class="profile">
				<img src="image/사진.jpg" alt="프로필사진" class="image">
				<%
				String nickname = (String) session.getAttribute("userNickname");
				if (nickname == null) {
					nickname = "Guest"; // 로그인하지 않았을 경우 기본값
				}
				%>
				<p class="nickname-display"><%=nickname%></p>
				<div class="link-group">
					<a href="찜_링크" class="a">찜</a>
				</div>
			</div>

			<div class="sidebar-menu">
				<div class="menu-category">라이브러리</div>
				<ul>
					<li class="active"><a href="#" data-content="recent-history">찜목록</a></li>
					<li><a href="#" data-content="order-delivery">리뷰 관리</a></li>
					<li><a href="#" data-content="returns">작가 구독</a></li>
				</ul>

				<div class="menu-category">회원정보</div>
				<ul>
					<li><a href="#" data-content="change-id-pw">아이디/비밀번호 변경</a></li>
					<li><a href="#" data-content="edit-profile">회원정보수정</a></li>
					<li><a href="#" data-content="withdraw">회원탈퇴</a></li>
					<li><a href="#" data-content="customer-service">고객센터</a></li>
					</ul>
			</div>
		</div>

        <div class="right-section-wrapper">
			<div class="top-main-banner">
				<div class="recent-books-header">
					<h2>최근 본 책들</h2>
				</div>
				<div class="recent-books-list">
					<p>최근 본 책 내역이 없습니다.</p>
				</div>

				<div class="banner-controls">
					<button onclick="prevImage()">&#9664;</button>
					<button onclick="nextImage()">&#9654;</button>
				</div>
			</div>

			<div class="main-container">
				<div id="recent-history-content" class="content-section active">
					<h2>찜목록</h2>
					<p>찜한 책 내역이 여기에 표시됩니다.</p>
				</div>

				<div id="order-delivery-content" class="content-section">
					<h2>리뷰 관리</h2>
					<p>작성하신 리뷰들을 관리할 수 있습니다.</p>
					<p>이곳에 리뷰 목록 및 관리 기능이 들어갑니다.</p>
				</div>

				<div id="returns-content" class="content-section">
					<h2>작가 구독 내역</h2>
					<p>구독 중인 작가들의 목록이 여기에 표시됩니다.</p>
				</div>

				<div id="change-id-pw-content" class="content-section">
					<h2>아이디/비밀번호 변경</h2>
					<p>아이디 및 비밀번호 변경을 위해 비밀번호를 입력해주세요.</p>
					<form id="change-id-pw-password-form">
						<label for="change-id-pw-confirm-pw">비밀번호:</label>
						<input type="password" id="change-id-pw-confirm-pw" name="change-id-pw-confirm-pw" required>
						<button type="submit">확인</button>
					</form>
				</div>

				<div id="edit-profile-content" class="content-section">
					<h2>회원정보수정</h2>
					<p>회원 정보 수정을 위해 비밀번호를 입력해주세요.</p>
					<form id="edit-profile-password-form">
						<label for="edit-profile-confirm-pw">비밀번호:</label>
						<input type="password" id="edit-profile-confirm-pw" name="edit-profile-confirm-pw" required>
						<button type="submit">확인</button>
					</form>
				</div>

				<div id="withdraw-content" class="content-section">
					<h2>회원 탈퇴</h2>
					<form id="withdraw-form">
						<p>회원 탈퇴 시 모든 정보가 삭제되며 복구할 수 없습니다.</p>
						<label for="withdraw-reason">탈퇴 사유 (선택 사항):</label>
						<textarea id="withdraw-reason" name="withdraw-reason" rows="5"
							placeholder="탈퇴하시려는 이유를 알려주시면 서비스 개선에 큰 도움이 됩니다."></textarea>
						<label for="withdraw-password">비밀번호:</label>
                        <input type="password" id="withdraw-password" name="withdraw-password" required>
						<label for="confirm-withdraw"> <input type="checkbox"
							id="confirm-withdraw" required> 회원 탈퇴에 동의합니다.
						</label>
						<button type="submit">회원 탈퇴</button>
					</form>
				</div>

                <div id="edit-profile-detail-content" class="content-section">
                    <h2>회원 정보 상세 수정</h2>
                    <p>회원 정보를 수정합니다.</p>
                    <form id="edit-profile-detail-form">
                        <label for="detail-id">아이디:</label>
                        <input type="text" id="detail-id" name="detail-id" value="user_id" readonly>

                        <label for="detail-password">비밀번호:</label>
                        <input type="password" id="detail-password" name="detail-password" placeholder="새 비밀번호 입력 (변경 시)">

                        <label for="detail-nickname">닉네임:</label>
                        <input type="text" id="detail-nickname" name="detail-nickname" value="<%=nickname%>">

                        <label for="detail-gender">성별:</label>
                        <input type="radio" id="gender-male" name="detail-gender" value="male"> <label for="gender-male" style="display:inline;">남성</label>
                        <input type="radio" id="gender-female" name="detail-gender" value="female"> <label for="gender-female" style="display:inline;">여성</label>
                        <input type="radio" id="gender-other" name="detail-gender" value="other"> <label for="gender-other" style="display:inline;">선택 안 함</label>
						<br><br> <label for="detail-email">이메일:</label>
                        <input type="email" id="detail-email" name="detail-email" value="user@example.com">

                        <label for="detail-name">이름:</label>
                        <input type="text" id="detail-name" name="detail-name" value="홍길동">

                        <label for="detail-mbti">MBTI:</label>
                        <select id="detail-mbti" name="detail-mbti">
                            <option value="">선택</option>
                            <option value="ISTJ">ISTJ</option>
                            <option value="ISTP">ISTP</option>
                            <option value="ISFJ">ISFJ</option>
                            <option value="ISFP">ISFP</option>
                            <option value="INTJ">INTJ</option>
                            <option value="INTP">INTP</option>
                            <option value="INFJ">INFJ</option>
                            <option value="INFP">INFP</option>
                            <option value="ESTJ">ESTJ</option>
                            <option value="ESTP">ESTP</option>
                            <option value="ESFJ">ESFJ</option>
                            <option value="ESFP">ESFP</option>
                            <option value="ENTJ">ENTJ</option>
                            <option value="ENTP">ENTP</option>
                            <option value="ENFJ">ENFJ</option>
                            <option value="ENFP">ENFP</option>
                        </select>

                        <label for="detail-hobbies">취미/관심사:</label>
                        <div class="checkbox-group">
                            <label><input type="checkbox" name="hobbies" value="reading"> 독서</label>
                            <label><input type="checkbox" name="hobbies" value="movie"> 영화</label>
                            <label><input type="checkbox" name="hobbies" value="music"> 음악</label>
                            <label><input type="checkbox" name="hobbies" value="sports"> 운동</label>
                            <label><input type="checkbox" name="hobbies" value="travel"> 여행</label>
                            <label><input type="checkbox" name="hobbies" value="gaming"> 게임</label>
                            <label><input type="checkbox" name="hobbies" value="cooking"> 요리</label>
                            <label><input type="checkbox" name="hobbies" value="art"> 미술</label>
                            <label><input type="checkbox" name="hobbies" value="science"> 과학</label>
                            <label><input type="checkbox" name="hobbies" value="coding"> 코딩</label>
                        </div>
                        <button type="submit">정보 저장</button>
                    </form>
                </div>

                <div id="edit-id-password-forms-content" class="content-section">
                    <h2>아이디 및 비밀번호 재설정</h2>
                    <p>아이디와 비밀번호를 재설정할 수 있습니다.</p>
                    <div id="edit-id-password-forms-container">
                        <h3>아이디 재설정</h3>
                        <label for="reset-id">새 아이디:</label>
                        <input type="text" id="reset-id" name="reset-id" placeholder="새 아이디 입력">
                        <button type="button" onclick="alert('아이디 변경 기능은 백엔드 연동 필요');">아이디 변경</button>

                        <h3 style="margin-top: 30px;">비밀번호 재설정</h3>
                        <label for="reset-password">새 비밀번호:</label>
                        <input type="password" id="reset-password" name="reset-password" placeholder="새 비밀번호 입력">
                        <label for="confirm-reset-password">새 비밀번호 확인:</label>
                        <input type="password" id="confirm-reset-password" name="confirm-reset-password" placeholder="새 비밀번호 다시 입력">
                        <button type="button" onclick="alert('비밀번호 변경 기능은 백엔드 연동 필요');">비밀번호 변경</button>
                    </div>
                </div>

                <div id="customer-service-content" class="content-section">
                    <h2>고객센터</h2>
                    <p>문의사항이나 불편한 점을 알려주시면 친절하게 도와드리겠습니다.</p>
                    <form id="customer-service-form">
                        <label for="cs-subject">제목:</label>
                        <input type="text" id="cs-subject" name="cs-subject" placeholder="문의 제목을 입력해주세요.">
                        <label for="cs-message">내용:</label>
                        <textarea id="cs-message" name="cs-message" placeholder="문의 내용을 입력해주세요."></textarea>
                        <button type="submit">문의 제출</button>
                    </form>
                </div>
            </div>
		</div>
	</div>

    <footer>
        <div class="footer-container">
            <p>&copy; 2025 WITHUS. All rights reserved.</p>
            <div class="footer-links">
                <a href="#">이용약관</a> |
                <a href="#">개인정보처리방침</a> |
                <a href="#">고객센터</a>
            </div>
        </div>
    </footer>

	<script>
		function prevImage() {
			console.log('이전 이미지');
		}
		function toggleSlide() {
			console.log('슬라이드 토글');
		}
		function nextImage() {
			console.log('다음 이미지');
		}

		document.addEventListener('DOMContentLoaded', function() {
			const sidebarLinks = document.querySelectorAll('.sidebar-menu a');
			const contentSections = document.querySelectorAll('.content-section');
			const initialContentId = 'recent-history-content';
			const initialSidebarLink = document.querySelector('.sidebar-menu a[data-content="recent-history"]');
			const initialContentSection = document.getElementById(initialContentId);

			function hideAllContentSections() {
				contentSections.forEach(section => {
					section.style.display = 'none';
					section.classList.remove('active');
				});
			}

			function deactivateAllSidebarLinks() {
				sidebarLinks.forEach(link => {
					link.classList.remove('active');
				});
			}

			// 사이드바 링크 클릭 이벤트
			sidebarLinks.forEach(link => {
				link.addEventListener('click', function(event) {
					event.preventDefault();
					const targetContentId = this.dataset.content + '-content';
					hideAllContentSections();
					
					// '회원정보수정' 클릭 시: 비밀번호 확인 폼 먼저 표시
					if (targetContentId === 'edit-profile-content') {
						const passwordForm = document.getElementById('edit-profile-content');
						if (passwordForm) {
							passwordForm.style.display = 'block';
							passwordForm.classList.add('active');
						}
					}
                    // '아이디/비밀번호 변경' 클릭 시: 비밀번호 확인 폼 먼저 표시
                    else if (targetContentId === 'change-id-pw-content') {
                        const passwordForm = document.getElementById('change-id-pw-content');
                        if (passwordForm) {
                            passwordForm.style.display = 'block';
                            passwordForm.classList.add('active');
                        }
                    }
					// 다른 메뉴 클릭 시: 해당 섹션 바로 표시
					else {
						const targetSection = document.getElementById(targetContentId);
						if (targetSection) {
							targetSection.style.display = 'block';
							targetSection.classList.add('active');
						}
					}
					deactivateAllSidebarLinks();
					this.classList.add('active');
				});
			});

			// '회원정보수정' 비밀번호 확인 폼 제출 이벤트
			const editProfilePasswordForm = document.getElementById('edit-profile-password-form');
			if (editProfilePasswordForm) {
				editProfilePasswordForm.addEventListener('submit', function(event) {
					event.preventDefault(); // 기본 폼 제출 동작 방지

					const passwordInput = document.getElementById('edit-profile-confirm-pw');
					const enteredPassword = passwordInput.value;

					// 실제 백엔드 연동 대신 임시로 비밀번호 '1234'로 가정
					if (enteredPassword === '1234') {
						alert('비밀번호가 확인되었습니다. 회원 정보 상세 수정 페이지로 이동합니다.');
						hideAllContentSections(); // 모든 섹션 다시 숨김
						const detailEditSection = document.getElementById('edit-profile-detail-content');
						if (detailEditSection) {
							detailEditSection.style.display = 'block';
							detailEditSection.classList.add('active');
						}
                        passwordInput.value = ''; // 비밀번호 입력 필드 초기화
					} else {
						alert('비밀번호가 올바르지 않습니다.');
						passwordInput.value = ''; // 비밀번호 필드 초기화
					}
				});
			}
            
            // '아이디/비밀번호 변경' 비밀번호 확인 폼 제출 이벤트
            const changeIdPwPasswordForm = document.getElementById('change-id-pw-password-form');
            if (changeIdPwPasswordForm) {
                changeIdPwPasswordForm.addEventListener('submit', function(event) {
                    event.preventDefault(); // 기본 폼 제출 동작 방지

                    const passwordInput = document.getElementById('change-id-pw-confirm-pw');
                    const enteredPassword = passwordInput.value;

                    // 실제 백엔드 연동 대신 임시로 비밀번호 '1234'로 가정
                    if (enteredPassword === '1234') {
                        alert('비밀번호가 확인되었습니다. 아이디 및 비밀번호 재설정 페이지로 이동합니다.');
                        hideAllContentSections(); // 모든 섹션 다시 숨김
                        const editIdPasswordSection = document.getElementById('edit-id-password-forms-content');
                        if (editIdPasswordSection) {
                            editIdPasswordSection.style.display = 'block';
                            editIdPasswordSection.classList.add('active');
                        }
                        passwordInput.value = ''; // 비밀번호 입력 필드 초기화
                    } else {
                        alert('비밀번호가 올바르지 않습니다.');
                        passwordInput.value = ''; // 비밀번호 필드 초기화
                    }
                });
            }

            // '회원 탈퇴' 폼 제출 이벤트
            const withdrawForm = document.getElementById('withdraw-form');
            if (withdrawForm) {
                withdrawForm.addEventListener('submit', function(event) {
                    event.preventDefault(); // 기본 폼 제출 동작 방지

                    const passwordInput = document.getElementById('withdraw-password');
                    const enteredPassword = passwordInput.value;
                    const confirmCheckbox = document.getElementById('confirm-withdraw');

                    if (!confirmCheckbox.checked) {
                        alert('회원 탈퇴에 동의해야 합니다.');
                        return;
                    }

                    // 실제 백엔드 연동 대신 임시로 비밀번호 '1234'로 가정
                    if (enteredPassword === '1234') {
                        const confirmWithdraw = confirm("탈퇴하시면 모든 정보가 삭제되며, 복구할 수 없습니다. 정말 탈퇴하시겠습니까?");
                        if (confirmWithdraw) {
                            alert('회원 탈퇴가 완료되었습니다.');
                            // 여기에 실제 탈퇴 처리 로직 (서버로 데이터 전송 등) 추가
                            // 예: window.location.href = 'logout_or_main_page.jsp';
                        } else {
                            alert('회원 탈퇴가 취소되었습니다.');
                        }
                        passwordInput.value = ''; // 비밀번호 필드 초기화
                    } else {
                        alert('비밀번호가 올바르지 않습니다.');
                        passwordInput.value = ''; // 비밀번호 필드 초기화
                    }
                });
            }

            // '고객센터' 폼 제출 이벤트
            const customerServiceForm = document.getElementById('customer-service-form');
            if (customerServiceForm) {
                customerServiceForm.addEventListener('submit', function(event) {
                    event.preventDefault(); // 기본 폼 제출 동작 방지
                    
                    const subject = document.getElementById('cs-subject').value;
                    const message = document.getElementById('cs-message').value;

                    if (subject.trim() === '' || message.trim() === '') {
                        alert('제목과 내용을 모두 입력해주세요.');
                        return;
                    }

                    alert('문의가 성공적으로 접수되었습니다. 최대한 빠른 시일 내에 답변드리겠습니다.');
                    // 여기에 실제 문의 접수 로직 (서버로 데이터 전송 등) 추가
                    // 폼 필드 초기화
                    document.getElementById('cs-subject').value = '';
                    document.getElementById('cs-message').value = '';
                });
            }


			// 초기 로드 시 '찜목록' 활성화
			hideAllContentSections(); // 모든 섹션을 먼저 숨김
			if (initialContentSection) {
				initialContentSection.style.display = 'block';
				initialContentSection.classList.add('active');
			}
			if (initialSidebarLink) {
				initialSidebarLink.classList.add('active');
			}
		});
	</script>
</body>
</html>