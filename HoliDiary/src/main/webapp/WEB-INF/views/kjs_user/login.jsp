<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 로그인 관련 기능 전체 감싸는 div : 가운데 정렬 위한 div-->
	<div id="content_login">
		<div id="login_page_box">
			<!-- 회원가입 -->
			<div class="join_btn">
				<button type="button" onclick="location.href='join.option'">회원가입</button>
			</div>
				<div id="login_box">
			<!-- 로그인 기능 -->
			<form action="login.do" method="post" onsubmit="return loginValidCheck();">
					<div class="login_id">
						<input placeholder="아이디" name="userID" autocomplete="off" id="loginID">
					</div>
					
					<div class="login_pw">
						<input type="password" placeholder="비밀번호" name="userPW" autocomplete="off" id="loginPW">
					</div>
					<div class="login_btn_box">
						<button>로그인</button>
					</div>
					<c:choose>
						<c:when test="${empty r}">
							<div><span id="login_error" style="font-family:'GangwonEdu_OTFBoldA';"></span></div>
						</c:when>
						<c:when test="${r eq '로그인실패'}">
							<div><span id="login_error" style="font-family:'GangwonEdu_OTFBoldA'; color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</span></div>
						</c:when>
					</c:choose>
			</form>
					<!-- 소셜 로그인 기능 -->
				<div class="social_login_box">
					<div class="social_login_info"><span>소셜 아이디로 로그인하기</span></div>
					<a onclick="loginWithKakao()"><img class="socialLoginImg" src="./resources/kjs_img/kakao_login_round.png"></a>
					<a id="loginWithNaver"><img class="socialLoginImg" src="./resources/kjs_img/naver_login_round.png"></a>
					<!-- 네이버 로그인 버튼 노출 영역 -->
					  <div id="naver_id_login" style="display: none;"></div>
					  <!-- //네이버 로그인 버튼 노출 영역 -->
					  <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/callback.login.naver");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setDomain("http://localhost/main");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  	
					  	
					  	$("#loginWithNaver").click(function(){ 
							var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
							btnNaverLogin.click();
					  	});
					  </script>
				</div>
				</div>
			<div class="missing_user_box">
				<div class="missing_user_a">
					<a href="find.id.go">아이디 찾기</a>
				</div>
				<div class="missing_user_a">
					<a href="find.pw.go">비밀번호 찾기</a>
				</div>
			</div>
			
		</div>
	

	</div>
</body>
</html>