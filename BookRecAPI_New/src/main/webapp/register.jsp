<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 책 추천 웹사이트</title>
    <%@ include file="css/main_css.jsp" %>
    <link rel="icon" href="img/icon2.png" type="image/x-icon">

    <style>
        /* login.jsp와 register.jsp에 공통으로 적용될 스타일 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            background-color: #f8fcf7; /* 약간 더 밝은 배경색 */
            flex-direction: column; /* 로고와 컨테이너를 세로로 정렬 */
        }

        .auth-logo-container { /* 새로 추가된 로고 컨테이너 스타일 */
            margin-bottom: 30px; /* 폼과의 간격 */
            text-align: center;
        }

        .auth-logo-container img {
            width: 200px; /* 로고 크기 */
            height: auto;
            cursor: pointer;
        }

        .login-container, .register-container {
            background-color: #eff7e8;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 450px;
            max-width: 90%;
            text-align: center;
            box-sizing: border-box;
        }

        .login-container h2, .register-container h2 {
            color: #446b3c;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .input-group {
            margin-bottom: 18px;
            text-align: left;
        }

        .input-group label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: bold;
        }

        .input-group input[type="text"],
        .input-group input[type="password"],
        .input-group input[type="email"],
        .input-group select {
            width: calc(100% - 20px);
            padding: 12px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            box-sizing: border-box;
            background-color: #fff;
        }
        
        /* 성별 라디오 버튼 스타일 */
        .input-group.gender-group {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            gap: 15px;
        }
        .input-group.gender-group label {
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 0;
        }
        .input-group.gender-group input[type="radio"] {
            width: auto;
        }

        /* 취미/관심사 체크박스 그룹 스타일 */
        .checkbox-group {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 5px;
        }
        .checkbox-group label {
            display: inline-flex; /* 체크박스와 레이블을 한 줄에 정렬 */
            align-items: center;
            margin-right: 15px; /* 각 체크박스 사이 간격 */
            font-weight: normal; /* 기본 레이블과 다르게 설정 */
            color: #555;
            margin-bottom: 0; /* input-group 내부 label 기본 margin-bottom 제거 */
        }
        .checkbox-group input[type="checkbox"] {
            margin-right: 5px;
            width: auto; /* 체크박스 본연의 크기 유지 */
        }


        .btn-login, .btn-register {
            background-color: #446b3c;
            color: #fff;
            border: none;
            padding: 15px 25px;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s, color 0.3s;
            margin-top: 20px;
        }

        .btn-login:hover, .btn-register:hover {
            background-color: #2e4f25;
        }

        .links-group {
            margin-top: 25px;
            font-size: 14px;
        }

        .links-group a {
            color: #446b3c;
            text-decoration: none;
            margin: 0 10px;
            font-weight: bold;
        }

        .links-group a:hover {
            text-decoration: underline;
        }

        #error-message {
            color: #d9534f;
            margin-top: 15px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="auth-logo-container">
        <a href="main.jsp">
            <img src="img/logo.png" alt="WITHUS 로고">
        </a>
    </div>

    <div class="register-container">
        <h2>회원가입</h2>
        <form id="registerForm">
            <div class="input-group">
                <label for="username">사용자 이름 (아이디)</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="input-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="input-group">
                <label for="nickname">닉네임</label>
                <input type="text" id="nickname" name="nickname" required>
            </div>
            <div class="input-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="name">이름</label> <%-- ✨ 이름 필드 추가 --%>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="input-group">
                <label for="gender">성별</label>
                <select id="gender" name="gender" required> <%-- 성별을 필수 항목으로 변경 --%>
                    <option value="">선택</option> <%-- 기본 '선택' 옵션 추가 --%>
                    <option value="M">남성</option>
                    <option value="F">여성</option>
                    <option value="O">선택 안 함</option>
                </select>
            </div>
            <div class="input-group">
                <label for="mbti">MBTI</label> <%-- MBTI도 필수로 변경, placeholder 제거 --%>
                <select id="mbti" name="mbti" required> <%-- MBTI를 필수 항목으로 변경 --%>
                    <option value="">선택</option>
                    <option value="ISTJ">ISTJ</option>
                    <option value="ISFJ">ISFJ</option>
                    <option value="INFJ">INFJ</option>
                    <option value="INTJ">INTJ</option>
                    <option value="ISTP">ISTP</option>
                    <option value="ISFP">ISFP</option>
                    <option value="INFP">INFP</option>
                    <option value="INTP">INTP</option>
                    <option value="ESTP">ESTP</option>
                    <option value="ESFP">ESFP</option>
                    <option value="ENFP">ENFP</option>
                    <option value="ENTP">ENTP</option>
                    <option value="ESTJ">ESTJ</option>
                    <option value="ESFJ">ESFJ</option>
                    <option value="ENFJ">ENFJ</option>
                    <option value="ENTJ">ENTJ</option>
                </select>
            </div>
            <div class="input-group">
                <label>취미/관심사</label> <%-- ✨ 취미/관심사 필드 추가 --%>
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
                    <label><input type="checkbox" name="hobbies" value="fashion"> 패션</label>
                    <label><input type="checkbox" name="hobbies" value="photography"> 사진</label>
                    <label><input type="checkbox" name="hobbies" value="technology"> IT/기술</label>
                    <label><input type="checkbox" name="hobbies" value="history"> 역사</label>
                    <label><input type="checkbox" name="hobbies" value="writing"> 글쓰기</label>
                    <label><input type="checkbox" name="hobbies" value="education"> 교육</label>
                </div>
            </div>
            <button type="submit" class="btn-register">회원가입</button>
        </form>
        <div id="error-message"></div>

        <div class="links-group">
            <a href="login.jsp">로그인 페이지로</a>
        </div>
    </div>

    <script>
        document.getElementById('registerForm').addEventListener('submit', async function(event) {
            event.preventDefault();

            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            const nickname = document.getElementById('nickname').value;
            const email = document.getElementById('email').value;
            const name = document.getElementById('name').value; // ✨ 이름 값 가져오기
            const gender = document.getElementById('gender').value;
            const mbti = document.getElementById('mbti').value;
            
            // ✨ 선택된 취미/관심사 값들을 콤마로 구분된 문자열로 만듭니다.
            const selectedHobbies = Array.from(document.querySelectorAll('input[name="hobbies"]:checked'))
                                         .map(checkbox => checkbox.value)
                                         .join(',');

            const errorMessageDiv = document.getElementById('error-message');
            errorMessageDiv.textContent = '';

            // 클라이언트 측 유효성 검사 (필수 항목 확인)
            if (!username || !password || !nickname || !email || !name || !gender || !mbti || !selectedHobbies) {
                errorMessageDiv.textContent = '모든 필수 정보를 입력해주세요.';
                return;
            }
            // 비밀번호 복잡성 검사 추가 (예시)
            if (password.length < 8 || !/[!@#$%^&*()]/.test(password)) {
                errorMessageDiv.textContent = '비밀번호는 최소 8자 이상이며 특수문자를 포함해야 합니다.';
                return;
            }


            try {
                // api/users는 회원가입을 처리하는 서블릿의 URL 매핑이라고 가정합니다.
                // 예: @WebServlet("/api/users")
                const response = await fetch('api/users', { 
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        username: username,
                        password: password,
                        nickname: nickname,
                        email: email,
                        gender: gender,
                        mbti: mbti,
                        name: name,          // ✨ 이름 데이터 전송
                        hobbies: selectedHobbies // ✨ 취미/관심사 데이터 전송
                    })
                });

                const apiResponse = await response.json();

                if (apiResponse.success) { // apiResponse.status 대신 success 사용 (일반적인 JSON 응답 형식)
                    alert(apiResponse.message + '\n이제 로그인해주세요!');
                    window.location.href = 'login.jsp';
                } else {
                    errorMessageDiv.textContent = apiResponse.message || '회원가입에 실패했습니다.';
                }
            } catch (error) {
                console.error('회원가입 요청 중 오류 발생:', error);
                errorMessageDiv.textContent = '서버와 통신 중 오류가 발생했습니다.';
            }
        });
    </script>
</body>
</html>