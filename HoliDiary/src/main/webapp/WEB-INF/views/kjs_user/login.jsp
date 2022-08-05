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
				<div class="login_id">
					<input placeholder="ID" name="userID" autocomplete="off">
				</div>
				
				<div class="login_pw">
					<input placeholder="PW" name="userPW" autocomplete="off">
				</div>
				<div class="login_btn">
					<button>로그인</button>
				</div>
				<div class="login_btn">
					<button type="button" onclick="location.href='join.go'">회원가입</button>
				</div>
				<div class="">
					<a href="">아이디 찾기</a>
				</div>
				<div class="">
					<a href="">비밀번호 찾기</a>
				</div>
			</div>
		</form>
		<!-- 소셜 로그인 기능 -->
		<div class="social_login_box">
			<button onclick="loginWithKakao()"><img src="./resources/kjs_img/kakao_login_medium_narrow.png"></button>
			네이버
		</div>
	

	</div>
</body>
</html>