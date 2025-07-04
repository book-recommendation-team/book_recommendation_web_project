<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<link rel="stylesheet" href="./css/celebList.css" />
<%@ include file="css/main_css.jsp"%>
<%@ include file="./main2.jsp" %>
<link rel="icon" href="img/icon2.png" type="image/x-icon">
<head>
<title>셀럽 추천 작성</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #fff;
	padding: 0;
}

.container {
	max-width: 1000px;
	margin: 30px auto;
	padding: 0 16px;
}

h2 {
	text-align: center;
	margin: 60px;
}

input[type="text"], input[type="file"], textarea {
	box-sizing: border-box;
	width: 100%;
	padding: 10px;
	margin-top: 8px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 1rem;
}

.editor-block {
	width: 100%;
	border: 1px solid #ddd;
	padding: 12px;
	border-radius: 8px;
	margin-bottom: 12px;
	background-color: #fff;
}

.editor-block textarea {
	resize: vertical;
	min-height: 80px;
}

.editor-block input[type="file"] {
	background-color: #f4f4f4;
}

.button-box {
	text-align: center;
	margin-top: 24px;
}

.button-box button {
	padding: 10px 20px;
	font-size: 1rem;
	border: none;
	border-radius: 6px;
	margin-left: 10px;
	cursor: pointer;
}

.submit-btn {
	background-color: #e6f0d7;
	color: black;
}

.cancel-btn {
	background-color: #fff;
	color: black;
}

.add-block-btn {
	display: block;
	margin: 0 auto 20px;
	padding: 8px 16px;
	border-radius: 10px;
	background-color: #eff7f8;
	color: black;
	border: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<div class="container">
		<h2>셀럽 추천 글 작성</h2>
		<form action="submitCelebPost" method="post"
			enctype="multipart/form-data">
			<div id="editor-area">
				<div class="editor-block">
			<label>이름</label> <input type="text" name="title" required> 
			<label>설명</label> <input type="text" name="desc" required> 
			<label>썸네일 이미지</label> <input type="file" name="thumbnail" accept="image/*">
					<label>텍스트 입력</label> <textarea name="contentBlock1_text"></textarea>
				</div>
			</div>

			<div style="text-align: center; margin-bottom: 20px;">
				<button type="button" class="add-block-btn"
					onclick="addEditorBlock('text')">+ 텍스트 블록 추가</button>
				<button type="button" class="add-block-btn"
					onclick="addEditorBlock('image')">+ 이미지 블록 추가</button>
				<button type="button" class="add-block-btn"
					onclick="addEditorBlock('link')">+ 링크 블록 추가</button>
			</div>

			<div class="button-box">
				<button type="submit" class="submit-btn">작성하기</button>
				<button type="button" class="cancel-btn" onclick="history.back()">취소</button>
			</div>
		</form>
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
	let blockCount = 1;

	function addEditorBlock(type) {
		blockCount++;
		const editorArea = document.getElementById("editor-area");

		const blockDiv = document.createElement("div");
		blockDiv.className = "editor-block";

		if (type === "text") {
			blockDiv.innerHTML = `
				<label>텍스트 입력</label>
				<textarea name="contentBlock${blockCount}_text"></textarea>
			`;
		} else if (type === "image") {
			blockDiv.innerHTML = `
				<label>이미지 업로드</label>
				<input type="file" name="contentBlock${blockCount}_image" accept="image/*">
			`;
		} else if (type === "link") {
			blockDiv.innerHTML = `
				<label>책 제목</label>
				<input type="text" name="contentBlock${blockCount}_title" />

				<label>저자</label>
				<input type="text" name="contentBlock${blockCount}_author" />

				<label>출판사</label>
				<input type="text" name="contentBlock${blockCount}_publisher" />

				<label>발매일</label>
				<input type="text" name="contentBlock${blockCount}_pubDate" placeholder="예: 2022.07.20" />

				<label>책 표지 이미지</label>
				<input type="file" name="contentBlock${blockCount}_image" accept="image/*" />

				<label>책 링크</label>
				<input type="text" name="contentBlock${blockCount}_link" placeholder="https://..." />

				<label>설명</label>
				<textarea name="contentBlock${blockCount}_desc"></textarea>
			`;
		} else {
			alert("알 수 없는 블록 타입입니다.");
			return;
		}

		editorArea.appendChild(blockDiv);
	}

</script>


</body>
</html>
