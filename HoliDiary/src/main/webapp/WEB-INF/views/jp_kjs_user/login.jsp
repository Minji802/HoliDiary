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
				<button type="button" onclick="location.href='jp.join.option'">会員登録</button>
			</div>
				<div id="login_box">
			<!-- 로그인 기능 -->
			<form action="jp.login.do" method="post" onsubmit="return loginValidCheck();">
					<div class="login_id">
						<input placeholder="ID" name="userID" autocomplete="off" id="loginID">
					</div>
					
					<div class="login_pw">
						<input type="password" placeholder="パスワード" name="userPW" autocomplete="off" id="loginPW">
					</div>
					<div class="login_btn_box">
						<button>LOGIN</button>
					</div>
					<c:choose>
						<c:when test="${empty r}">
							<div><span id="login_error" style="font-family:'M PLUS Rounded 1c'; font-size: 7pt;"></span></div>
						</c:when>
						<c:when test="${r eq '로그인실패'}">
							<div><span id="login_error" style="font-family:'M PLUS Rounded 1c'; font-size: 8pt; color: red;">ログインに失敗しました。「ID」と「パスワード」を確認してください。</span></div>
						</c:when>
					</c:choose>
			</form>
					<!-- 소셜 로그인 기능 -->
				<div class="social_login_box">
					<div class="social_login_info"><span>SNSログイン</span></div>
					<a onclick="loginWithKakao()"><img class="socialLoginImg" src="./resources/kjs_img/kakao_login_round.png"></a>
					<a id="loginWithNaver"><img class="socialLoginImg" src="./resources/kjs_img/naver_login_round.png"></a>
					<!-- 네이버 로그인 버튼 노출 영역 -->
					  <div id="naver_id_login" style="display: none;"></div>
					  <!-- //네이버 로그인 버튼 노출 영역 -->
					  <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/jp.callback.login.naver");
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
					<a href="jp.find.id.go">IDを探す</a>
				</div>
				<div class="missing_user_a">
					<a href="jp.find.pw.go">パスワードをお忘れの方</a>
				</div>
			</div>
			
		</div>
	

	</div>
</body>
</html>