<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 로그인 관련 기능 전체 감싸는 div : 가운데 정렬 위한 div-->
	<div id="content_login">
	
	<!-- 로그인 기능 -->
	<form action="login.do" method="post">
		<div id="login_box">
		${r }
			<div class="login_id">
				<input placeholder="ID" name="id" autocomplete="off">
			</div>
			
			<div class="login_pw">
				<input placeholder="PW" name="pw" autocomplete="off">
			</div>
			<div class="login_btn">
				<button>로그인</button>
			</div>
		</div>
	</form>
	
	<!-- 소셜 로그인 기능 -->
	<div class="social_loing_box">
		네이버
		카카오
	</div>

	</div>
</body>
</html>