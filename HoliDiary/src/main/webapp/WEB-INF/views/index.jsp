<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/sej_css/index.css">
<link rel="stylesheet" href="resources/sej_css/home.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_join.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_login.css">
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>
<script type="text/javascript" src="resources/sej_js/jquery.js"></script>
<script type="text/javascript" src="resources/sej_js/sej_home.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="resources/sej_js/sej_go.js"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_user.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script type="text/javascript" src="resources/sej_js/sej_slider_script.js"></script>
<link rel="stylesheet" href="resources/sej_css/sej_slider_style.css">
<style type="text/css">
.swiper-button-next {
  background: url(resources/sej_img/slider/free-icon-right.png) no-repeat;
  background-size: 40px 40px;
  background-position: center;
  width: 50px;
  right: 0;
}

.swiper-button-prev {
  background: url(resources/sej_img/slider/free-icon-left.png) no-repeat;
  background-size: 40px 40px;
  background-position: center;
  width: 50px;
  left: 0;
} 

.swiper-button-next::after,
.swiper-button-prev::after {
  display: none;
}
</style>
</head>
<body>
	<div id="background_box">
	
	<div id="menu_bar">
		<label><img class="menu_bar_logo" src="resources/sej_img/slogo1-removebg-preview.png"></label>
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a class="menu_bar_diary_li" href="#" onclick=popup()>
			<img class="menu_diary_img" src="resources/sej_img/free-icon-travel-1706019.png">
			<!-- <p>My 다이어리</p> -->
			</a>
			<a class="menu_bar_li_first" href="#" onclick=popup()>My Diary</a>
			<span class="menu_bar_border"></span>
			<a class="menu_bar_li" href="">마이페이지</a>
			<a class="menu_bar_li" href="">홀리 NOW</a>
			<a class="menu_bar_li" href="">Best 홀리</a>
			<a class="menu_bar_li" href="">아이템샵</a>
			<a class="menu_bar_li" href="#" onclick='location.href="map.go"'>Map(임시)</a>
			
			<!-- 로그인 페이지 공간 입니다 -->
			<div class="menu_bar_user_place">
				<jsp:include page="${loginPage }"></jsp:include>
			</div>
			
	</div>
	
	<!-- HEADER 영역 -->
	<header id="top_header">
		<div class="header_contents_box">
		<a href="javascript:void(0)" onclick="goHome()">
		<img class="header_logo_img" src="resources/sej_img/logofit-removebg-preview.png">
		</a>
		<div class="search_box">
		<div class="search_img">
		<img src="resources/sej_img/search_berry.png">
		</div>
		<input class="search_input" type="text" placeholder="검색">
		</div>

		<div class="top_menu_img_box">
			<a class="top_menu_img_box_a" href="javascript:void(0)" onclick="openNav()"><img class="top_menu_img" src="resources/sej_img/menuIcon_berry.png"></a>
		</div>
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