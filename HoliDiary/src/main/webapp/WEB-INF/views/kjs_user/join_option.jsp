<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
</head>
<body>

	<div id="content_join_option">
		<div class="go_back_login"><a href="javascript:window.history.back();"> 로그인 페이지로</a></div> 
		<div id="join_option_box">
			<div class="join_page"><button onclick="location.href='join.go'">간편회원가입</button></div>
			<div class="join_social_info"><span>소셜 아이디로 회원가입하기</span></div>
			<div class="join_social">
				<button onclick="joinWithKakao()"><img src="./resources/kjs_img/kakao_login_medium_narrow.png"></button>
				<button id="joinWithNaver"><img src="./resources/kjs_img/naver_login.jpg" style="width: 98%;"></button>
						<!-- 네이버 로그인 버튼 노출 영역 -->
						  <div id="naver_id_login" style="display: none;"></div>
						  <!-- //네이버 로그인 버튼 노출 영역 -->
						  <script type="text/javascript">
						  	var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/callback.join.naver");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setDomain("http://localhost/main");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
						  	
						  		$("#joinWithNaver").click(function(){ 
									var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
									btnNaverLogin.click();
							  	});
						  </script>
					</div>
			</div>
		</div>
	</div>

</body>
</html>