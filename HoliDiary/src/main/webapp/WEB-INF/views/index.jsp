<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/sej_css/index.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_login.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_join.css">
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>
<script type="text/javascript" src="resources/jquery.js"></script>
<script type="text/javascript" src="resources/js/sej_home.js"></script>
</head>
<body>
	<div id="background_box">
	
	<div id="menu_bar">
		<label><img class="menu_bar_logo" src="resources/sej_img/slogo1-removebg-preview.png"></label>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="">마이페이지</a>
			<a href="">홀리 NOW</a>
			<a href="">Best 홀리</a>
			<a href="">아이템샵</a>
			<!-- 임시 연결 용 링크 입니다 -->
			<a href="login.go">로그인</a>
			<a href="join.go">회원가입</a>
	</div>
	
	<!-- HEADER 영역 -->
	<header id="top_header">
		<div class="header_contents_box">
		
		<img class="header_logo_img" src="resources/sej_img/logofit-removebg-preview.png">
		<div class="search_box">
		<div class="search_img">
		<img src="resources/sej_img/search_berry.png">
		</div>
		<input class="search_input" type="text" placeholder="검색">
		</div>

		</div>
		
		<div class="top_menu_img_box">
			<a href="javascript:void(0)" onclick="openNav()"><img class="top_menu_img" src="resources/sej_img/menuIcon.png"></a>
		</div>
		
		
	</header>
	
	<!-- Main Contents  -->
	<div id="main_place">
	
	<jsp:include page="${contentPage }"></jsp:include>
	
	</div>
	
	<!-- FOOTER 영역 -->
	<footer id="bottom_footer">
		<h1>푸터 영역</h1>
	</footer>
	</div>
	
</body>
</html>