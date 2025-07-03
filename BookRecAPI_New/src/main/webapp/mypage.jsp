<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WITHUS - 마이페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/icon2.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mypage.css">
<%@ include file="css/main_css.jsp"%>
</head>
<body>
	<header>
		<div id="logo">
			<a href="main.jsp"> <img src="${pageContext.request.contextPath}/img/logo.png" alt="로고">
			</a>
		</div>
		<input type="text" id="search-box" placeholder="검색어를 입력하세요..." />
		<div id="user-buttons">
			<%
			User loggedInUser = (User) session.getAttribute("loggedInUser");
			if (loggedInUser == null) {
			%>
			<button id="join-btn" onclick="location.href='register.jsp'">회원가입</button>
			<button id="login-btn" onclick="location.href='login.jsp'">로그인</button>
			<%
			} else {
			%>
			<span style="font-weight: bold; margin-right: 10px;">환영합니다, <%=loggedInUser.getNickname()%>님!
			</span>
			<button id="mypage-btn" onclick="location.href='mypage.jsp'">마이페이지</button>
			<button id="logout-btn">로그아웃</button>
			<%
			}
			%>
		</div>
	</header>

	<nav>
		<a href="#">(AI) 책 추천</a> <a href="${pageContext.request.contextPath}/reviewList">리뷰</a> <a href="#">플레이리스트</a> <a href="${pageContext.request.contextPath}/celebList">셀럽추천</a> <a href="<%=(loggedInUser != null ? "mypage.jsp" : "login.jsp")%>">마이페이지</a>
	</nav>

	<div class="main-content-wrapper">
		<div class="sidebar">
			<div class="profile">
				<img src="${pageContext.request.contextPath}/img/사진.jpg" alt="프로필사진" class="image">
				<%
				String nicknameDisplay = "Guest"; // 기본값
				if (loggedInUser != null) {
					nicknameDisplay = loggedInUser.getNickname();
				}
				%>
				<p class="nickname-display"><%=nicknameDisplay%></p>
				<div class="link-group">
					<a href="#" class="a">찜</a>
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
					<%-- 비밀번호 변경 메뉴는 이제 회원정보수정으로 통합되므로 이 항목은 삭제 --%>
					<%-- <li><a href="#" data-content="change-id-pw">비밀번호 변경</a></li> --%>
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

				<%-- '아이디/비밀번호 변경' 섹션은 완전히 제거 --%>
				<%--
				<div id="change-id-pw-content" class="content-section">
					...
				</div>
				--%>

				<div id="edit-profile-content" class="content-section">
					<h2>회원정보수정</h2>
					<p>회원 정보 수정을 위해 비밀번호를 입력해주세요.</p>
					<form id="edit-profile-password-form" class="password-check-form">
						<label for="edit-profile-confirm-pw">비밀번호:</label>
						<input type="password" id="edit-profile-confirm-pw" name="edit-profile-confirm-pw" required>
						<button type="submit">확인</button>
					</form>
				</div>

				<div id="withdraw-content" class="content-section">
					<h2>회원 탈퇴</h2>
					<form id="withdraw-form" class="password-check-form">
						<p>회원 탈퇴 시 모든 정보가 삭제되며 복구할 수 없습니다.</p>
						<label for="withdraw-reason">탈퇴 사유 (선택 사항):</label>
						<textarea id="withdraw-reason" name="withdraw-reason" rows="5" placeholder="탈퇴하시려는 이유를 알려주시면 서비스 개선에 큰 도움이 됩니다."></textarea>
						<label for="withdraw-password">비밀번호:</label>
						<input type="password" id="withdraw-password" name="withdraw-password" required>
						<label for="confirm-withdraw"> <input type="checkbox" id="confirm-withdraw" required> 회원 탈퇴에 동의합니다.</label>
						<button type="submit">회원 탈퇴</button>
					</form>
				</div>

				<div id="edit-profile-detail-content" class="content-section">
					<h2>회원 정보 상세 수정</h2>
					<p>회원 정보를 수정합니다.</p>
					<form id="edit-profile-detail-form">
						<label for="detail-id">아이디:</label>
						<input type="text" id="detail-id" name="detail-id" value="<%=loggedInUser != null ? loggedInUser.getUsername() : ""%>" readonly>

						<%-- 새 비밀번호 입력 필드 추가 --%>
						<label for="detail-new-password">새 비밀번호:</label>
						<input type="password" id="detail-new-password" name="detail-new-password" placeholder="새 비밀번호 입력 (변경 시)">
						<label for="detail-confirm-new-password">새 비밀번호 확인:</label>
						<input type="password" id="detail-confirm-new-password" name="detail-confirm-new-password" placeholder="새 비밀번호 다시 입력">
						
						<label for="detail-nickname">닉네임:</label>
						<input type="text" id="detail-nickname" name="detail-nickname" value="<%=nicknameDisplay%>">

						<label for="detail-gender">성별:</label>
						<input type="radio" id="gender-male" name="detail-gender" value="M" <%=(loggedInUser != null && "M".equals(loggedInUser.getGender())) ? "checked" : ""%>> <label for="gender-male" style="display: inline;">남성</label>
						<input type="radio" id="gender-female" name="detail-gender" value="F" <%=(loggedInUser != null && "F".equals(loggedInUser.getGender())) ? "checked" : ""%>> <label for="gender-female" style="display: inline;">여성</label>
						<input type="radio" id="gender-other" name="detail-gender" value="O" <%=(loggedInUser != null && "O".equals(loggedInUser.getGender())) ? "checked" : ""%>> <label for="gender-other" style="display: inline;">선택 안 함</label>
						<br> <br> <label for="detail-email">이메일:</label>
						<input type="email" id="detail-email" name="detail-email" value="<%=loggedInUser != null ? loggedInUser.getEmail() : ""%>">

						<label for="detail-name">이름:</label>
						<input type="text" id="detail-name" name="detail-name" value="홍길동" readonly> <%-- 이름도 변경 불가로 설정 --%>

						<label for="detail-mbti">MBTI:</label>
						<select id="detail-mbti" name="detail-mbti">
							<option value="">선택</option>
							<%
							String userMbti = (loggedInUser != null) ? loggedInUser.getMbti() : "";
							String[] validMbti = {"ISTJ", "ISFJ", "INFJ", "INTJ", "ISTP", "ISFP", "INFP", "INTP", "ESTP", "ESFP", "ENFP", "ENTP", "ESTJ", "ESFJ", "ENFJ", "ENTJ"};
							for (String mbtiOption : validMbti) {
							%>
							<option value="<%=mbtiOption%>" <%=mbtiOption.equals(userMbti) ? "selected" : ""%>>
								<%=mbtiOption%>
							</option>
							<%
							}
							%>
						</select> <label for="detail-hobbies">취미/관심사:</label>
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

				<div id="customer-service-content" class="content-section">
					<h2>고객센터</h2>
					<p>문의사항이나 불편한 점을 알려주시면 친절하게 도와드리겠습니다.</p>
					<form id="customer-service-form">
						<label for="cs-subject">제목:</label> <input type="text" id="cs-subject" name="cs-subject" placeholder="문의 제목을 입력해주세요.">
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
				<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a> | <a href="#">고객센터</a>
			</div>
		</div>
	</footer>

	<script>
		function prevImage() { console.log('이전 이미지'); }
		function toggleSlide() { console.log('슬라이드 토글'); }
		function nextImage() { console.log('다음 이미지'); }

		document.addEventListener('DOMContentLoaded', function() {
			const sidebarLinks = document.querySelectorAll('.sidebar-menu a');
			const contentSections = document.querySelectorAll('.content-section');
			const initialContentId = 'recent-history-content';
			const initialSidebarLink = document.querySelector('.sidebar-menu a[data-content="recent-history"]');
			const initialContentSection = document.getElementById(initialContentId);

			const currentUserId = <%=loggedInUser != null ? loggedInUser.getUserId() : "null"%>;
			if (currentUserId === null) {
				console.warn("User ID not found in session for JavaScript. Some functionalities may be limited. Please ensure user is logged in.");
			}

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
							document.getElementById('edit-profile-confirm-pw').value = '';
                            // 회원정보수정 상세 폼은 초기에는 숨김
                            document.getElementById('edit-profile-detail-content').style.display = 'none';
						}
					}
					// 나머지 메뉴 클릭 시: 해당 섹션 바로 표시 (기존 '비밀번호 변경' 로직은 이제 없음)
					else {
						const targetSection = document.getElementById(targetContentId);
						if (targetSection) {
							targetSection.style.display = 'block';
							targetSection.classList.add('active');
						}
					}
					deactivateAllSidebarLinks();
					this.classList.add('active'); // 클릭한 링크에 active 클래스 추가
				});
			});

			// '회원정보수정' 비밀번호 확인 폼 제출 이벤트 (백엔드 연동)
			const editProfilePasswordForm = document.getElementById('edit-profile-password-form');
			if (editProfilePasswordForm) {
				editProfilePasswordForm.addEventListener('submit', async function(event) {
					event.preventDefault();

					const passwordInput = document.getElementById('edit-profile-confirm-pw');
					const enteredPassword = passwordInput.value;

					if (currentUserId === null) {
						alert('로그인 정보가 유효하지 않습니다. 다시 로그인해주세요.');
						window.location.href = '${pageContext.request.contextPath}/login.jsp';
						return;
					}

					try {
						const response = await fetch('${pageContext.request.contextPath}/verifyPassword', {
							method: 'POST',
							headers: { 'Content-Type': 'application/json' },
							body: JSON.stringify({ userId: currentUserId, password: enteredPassword })
						});

						const result = await response.json();

						if (response.ok && result.success) {
							alert('비밀번호가 확인되었습니다. 회원 정보 상세 수정 페이지로 이동합니다.');
							hideAllContentSections(); // 모든 섹션 숨김
							const detailEditSection = document.getElementById('edit-profile-detail-content');
							if (detailEditSection) {
								detailEditSection.style.display = 'block'; // 상세 수정 폼만 보이게 함
								detailEditSection.classList.add('active');
							}
                            // 사이드바 '회원정보수정' 링크 활성화 유지
                            deactivateAllSidebarLinks();
                            document.querySelector('.sidebar-menu a[data-content="edit-profile"]').classList.add('active');

						} else {
							alert(result.message || '비밀번호가 올바르지 않습니다.');
						}
					} catch (error) {
						console.error('비밀번호 확인 중 오류 발생:', error);
						alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
					} finally {
						passwordInput.value = '';
					}
				});
			}
			
			// ⭐⭐⭐ '회원정보 상세 수정' 폼 제출 이벤트 (프로필 정보 및 선택적 비밀번호 변경) ⭐⭐⭐
			const editProfileDetailForm = document.getElementById('edit-profile-detail-form');
			if (editProfileDetailForm) {
				editProfileDetailForm.addEventListener('submit', async function(event) {
					event.preventDefault();

					const newPasswordInput = document.getElementById('detail-new-password');
					const confirmNewPasswordInput = document.getElementById('detail-confirm-new-password');
					const newPassword = newPasswordInput.value;
					const confirmNewPassword = confirmNewPasswordInput.value;

					// 프로필 정보 (닉네임, 이메일, 성별, MBTI)
					const nickname = document.getElementById('detail-nickname').value;
					const email = document.getElementById('detail-email').value;
					const gender = document.querySelector('input[name="detail-gender"]:checked')?.value || '';
					const mbti = document.getElementById('detail-mbti').value;

					let profileUpdateSuccess = false;
					let passwordChangeSuccess = true; // 비밀번호 변경 시도하지 않으면 성공으로 간주

					if (currentUserId === null) {
						alert('로그인 정보가 유효하지 않습니다. 다시 로그인해주세요.');
						window.location.href = '${pageContext.request.contextPath}/login.jsp';
						return;
					}

					// 1. 프로필 정보 업데이트 (항상 실행)
					try {
						const profileUpdateResponse = await fetch('${pageContext.request.contextPath}/updateUserProfile', { // 기존 updateUserProfile 서블릿
							method: 'POST',
							headers: { 'Content-Type': 'application/json' },
							body: JSON.stringify({
								userId: currentUserId,
								nickname: nickname,
								email: email,
								gender: gender,
								mbti: mbti
							})
						});
						const profileUpdateResult = await profileUpdateResponse.json();

						if (profileUpdateResponse.ok && profileUpdateResult.success) {
							profileUpdateSuccess = true;
						} else {
							alert('프로필 정보 업데이트 실패: ' + (profileUpdateResult.message || '알 수 없는 오류'));
						}
					} catch (error) {
						console.error('프로필 정보 업데이트 중 오류 발생:', error);
						alert('프로필 정보 업데이트 중 서버 오류가 발생했습니다.');
					}

					// 2. 비밀번호 변경 (새 비밀번호 필드가 채워져 있을 경우만)
					if (newPassword) { // 새 비밀번호 필드가 비어있지 않다면
						if (newPassword.length < 8 || !/[!@#$%^&*()]/.test(newPassword)) {
							alert('새 비밀번호는 최소 8자 이상이어야 하며 특수문자를 포함해야 합니다.');
							passwordChangeSuccess = false; // 비밀번호 유효성 검사 실패
						} else if (newPassword !== confirmNewPassword) {
							alert('새 비밀번호와 확인 비밀번호가 일치하지 않습니다.');
							passwordChangeSuccess = false; // 비밀번호 불일치
						}

						if (passwordChangeSuccess) { // 유효성 검사 통과 시
							try {
								const passwordChangeResponse = await fetch('${pageContext.request.contextPath}/changePassword', { // ChangePassword 서블릿
									method: 'POST',
									headers: { 'Content-Type': 'application/json' },
									body: JSON.stringify({
										userId: currentUserId,
										newPassword: newPassword
									})
								});
								const passwordChangeResult = await passwordChangeResponse.json();

								if (passwordChangeResponse.ok && passwordChangeResult.success) {
									// 성공!
								} else {
									alert('비밀번호 변경 실패: ' + (passwordChangeResult.message || '알 수 없는 오류'));
									passwordChangeSuccess = false; // 비밀번호 변경 실패
								}
							} catch (error) {
								console.error('비밀번호 변경 중 오류 발생:', error);
								alert('비밀번호 변경 중 서버 오류가 발생했습니다.');
								passwordChangeSuccess = false;
							}
						}
					}

					// 최종 결과에 따른 메시지 및 처리
					if (profileUpdateSuccess && passwordChangeSuccess) {
						alert('회원 정보 및 비밀번호가 성공적으로 업데이트되었습니다. 다시 로그인해주세요.');
						window.location.href = '${pageContext.request.contextPath}/api/auth/logout'; // 비밀번호 변경 시 로그아웃
					} else if (profileUpdateSuccess) {
						alert('프로필 정보만 성공적으로 업데이트되었습니다.');
                        // 페이지 새로고침 또는 UI 업데이트 필요 (닉네임 등 변경 반영)
                        location.reload(); // 간단하게 페이지 새로고침
					} else {
						alert('회원 정보 업데이트가 완료되지 않았습니다.');
					}

					// 비밀번호 입력 필드 초기화 (성공/실패 여부와 관계없이)
					newPasswordInput.value = '';
					confirmNewPasswordInput.value = '';
				});
			}


			// '회원 탈퇴' 폼 제출 이벤트 (기존과 동일)
			const withdrawForm = document.getElementById('withdraw-form');
			if (withdrawForm) {
				withdrawForm.addEventListener('submit', async function(event) {
					event.preventDefault();

					const passwordInput = document.getElementById('withdraw-password');
					const enteredPassword = passwordInput.value;
					const confirmCheckbox = document.getElementById('confirm-withdraw');

					if (!confirmCheckbox.checked) {
						alert('회원 탈퇴에 동의해야 합니다.');
						return;
					}

					if (currentUserId === null) {
						alert('로그인 정보가 유효하지 않습니다. 다시 로그인해주세요.');
						window.location.href = '${pageContext.request.contextPath}/login.jsp';
						return;
					}

					try {
						const response = await fetch('${pageContext.request.contextPath}/verifyPassword', {
							method: 'POST',
							headers: { 'Content-Type': 'application/json' },
							body: JSON.stringify({ userId: currentUserId, password: enteredPassword })
						});

						const result = await response.json();

						if (response.ok && result.success) {
							const confirmWithdraw = confirm("탈퇴하시면 모든 정보가 삭제되며, 복구할 수 없습니다. 정말 탈퇴하시겠습니까?");
							if (confirmWithdraw) {
								const withdrawResponse = await fetch('${pageContext.request.contextPath}/withdrawUser', {
									method: 'POST',
									headers: { 'Content-Type': 'application/json' },
									body: JSON.stringify({ userId: currentUserId })
								});
								const withdrawResult = await withdrawResponse.json();

								if (withdrawResponse.ok && withdrawResult.success) {
									alert('회원 탈퇴가 완료되었습니다.');
									window.location.href = '${pageContext.request.contextPath}/logout';
								} else {
									alert(withdrawResult.message || '회원 탈퇴 처리 중 오류가 발생했습니다.');
								}
							} else {
								alert('회원 탈퇴가 취소되었습니다.');
							}
						} else {
							alert(result.message || '비밀번호가 올바르지 않습니다.');
						}
					} catch (error) {
						console.error('회원 탈퇴 비밀번호 확인 또는 처리 중 오류 발생:', error);
						alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
					} finally {
						passwordInput.value = '';
					}
				});
			}

			// '고객센터' 폼 제출 이벤트 (기존과 동일)
			const customerServiceForm = document.getElementById('customer-service-form');
			if (customerServiceForm) {
				customerServiceForm.addEventListener('submit', function(event) {
					event.preventDefault();
					
					const subject = document.getElementById('cs-subject').value;
					const message = document.getElementById('cs-message').value;

					if (subject.trim() === '' || message.trim() === '') {
						alert('제목과 내용을 모두 입력해주세요.');
						return;
					}

					alert('문의가 성공적으로 접수되었습니다. 최대한 빠른 시일 내에 답변드리겠습니다.');
					document.getElementById('cs-subject').value = '';
					document.getElementById('cs-message').value = '';
				});
			}

			// 초기 로드 시 '찜목록' 활성화
			hideAllContentSections();
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