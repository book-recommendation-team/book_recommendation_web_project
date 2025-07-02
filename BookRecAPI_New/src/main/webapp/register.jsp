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
                <label for="gender">성별</label>
                <select id="gender" name="gender">
                    <option value="O">선택 안 함</option>
                    <option value="M">남성</option>
                    <option value="F">여성</option>
                </select>
            </div>
            <div class="input-group">
                <label for="mbti">MBTI (선택 사항)</label>
                <input type="text" id="mbti" name="mbti" placeholder="예: INTP">
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
            const gender = document.getElementById('gender').value;
            const mbti = document.getElementById('mbti').value;
            const errorMessageDiv = document.getElementById('error-message');
            errorMessageDiv.textContent = '';

            try {
                const response = await fetch('api/users', { // 상대 경로로 변경
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
                        mbti: mbti
                    })
                });

                const apiResponse = await response.json();

                if (apiResponse.status === 'success') {
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