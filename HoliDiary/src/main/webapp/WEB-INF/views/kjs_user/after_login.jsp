<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="after_login_box">
		${sessionScope.loginUser.userNickname }님
	</div>
	<div class="logout_box">
		<button id="logout_btn" onclick="location.href='logout.do'">로그아웃</button>
	</div>

</body>
</html>