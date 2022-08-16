<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="content_find_user">
	<div id="find_id_page_box">
		<div class="find_id_go_login">
			<a href="login.go">로그인 페이지로</a>
		</div>
		<div class="find_id_go_find_pw">
			<a href="find.pw.go">비밀번호 찾기</a>
		</div>
		<div id="find_id_box">
			<div class="userID_show_box">
				<span id="userID_show"></span>
			</div>
			<div class="find_id_name_box">
				<input placeholder="이름" autocomplete="off" id="find_id_name">
			</div>
			<div class="find_id_phone_box">
				<input placeholder="휴대폰번호" autocomplete="off" id="find_id_phone">
			</div>
			<div class="find_id_btn_box">
				<button id="find_id_btn" onclick="findID()">아이디 찾기</button>
			</div>
		</div>
	</div>
</div>

</body>
</html>