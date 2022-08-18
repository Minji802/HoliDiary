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
	<div id="find_pw_page_box">
		<div class="find_pw_go_login">
			<a href="login.go">로그인 페이지로</a>
		</div>
		<div class="find_id_go_find_id">
			<a href="find.id.go">아이디 찾기</a>
		</div>
		<form action="find.pw.do" method="post" onsubmit="return findPWValidCheck()">
		<div id="find_pw_box">
			<div class="find_pw_error_box">
				<span id="find_pw_error"></span>
			</div>
			<div class="find_pw_id_box">
				<input placeholder="아이디" name="userID" autocomplete="off" id="find_pw_id">
			</div>
			<div class="find_pw_email_box">
				<input placeholder="이메일" name="userEmail" autocomplete="off" id="find_pw_email">
			</div>
			<div class="find_pw_btn_box">
				<button>비밀번호 찾기</button>
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>