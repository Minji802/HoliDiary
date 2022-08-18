<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/sej_css/index.css">
<link rel="stylesheet" href="resources/sej_css/home.css">
<link rel="stylesheet" href="resources/sej_css/home_search.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_join.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_login.css">
<link rel="stylesheet" href="resources/kjs_css/kjs_find_user.css?ver=1">
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>
<script type="text/javascript" src="resources/sej_js/jquery.js"></script>
<script type="text/javascript" src="resources/sej_js/sej_home.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="resources/sej_js/sej_go.js"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_kakao.js?ver=1"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_mypage.js"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_valid.js"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_validCheck.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script type="text/javascript" src="resources/sej_js/sej_slider_script.js"></script>
<link rel="stylesheet" href="resources/sej_css/sej_slider_style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
			<a class="menu_bar_li_first" href="#" id="modal_btn" onclick=popup()>My Diary</a>
			<input type="hidden" value="${sessionScope.loginUser.userID }" id="userID">
			<input type="hidden" value="${Category.categoryUserId }" id="CuserID">
			<span class="menu_bar_border"></span>
			<a class="menu_bar_li" href="javascript:void(0);" onclick="return mypageCheckUser();">마이페이지</a>
			<a class="menu_bar_li" href="javascript:void(0)" onclick="goHolinow()">홀리 NOW</a>
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
		<a href="javascript:void(0)" onclick="goSearch()">
		<img src="resources/sej_img/search_berry.png">
		</a>
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
		<div class="first_footer">
			<div class="first_footer_inner">
				<a href="#">ABOUT US</a> <a href="#">AGREEMENT</a> <a href="#">PRIVACY POLICY</a>
			</div>
		</div>
		<div class="second_footer">
			<div class="second_footer_inner">
				<div class="second_footer_logo_box">
				<a href="https://github.com/Minji802/HoliDiary"><img src="resources/sej_img/slogo1-removebg-preview.png"></a>
				</div>
				<div class="second_footer_contentsBox">
				<div class="second_footer_first_box">
					<span>CS CENTER</span><br>
					위 로고를 클릭하면<br>
					HoliDiary의 GitHub 주소로<br>
					갈 수 있답니다
				</div>
				<div class="second_footer_second_box">
					<span>BANK INFO</span><br>
					후원은 저희에게 큰 힘이 됩니다<br>
					농협 207177-000-0000<br>
					예금주 : ㅇㅇㅇ/ㅇㅇㅇ/ㅇㅇㅇ
				</div>
				<div class="second_footer_third_box">
					<span>COMPANY INFO</span><br>
					PROJECT NAME: HoliDiary<br>
					TEAM MEMBER: 박민지/김수민/김지수/손은주<br>
					GITHUB ADDRESS: <a href="https://github.com/Minji802/HoliDiary">https://github.com/Minji802/HoliDiary</a><br>
					♥최선을 다해서 만들었습니다! HoliDiary 팀 예쁘게 봐주세요♥
				</div>
				</div>
			</div>
		</div>
		<div class="footer_copyright">
			Copyright(C) 2022 HOLIDIARY DESIGN ALL RIGHTS REVERVED / Designed by Holidiary
		</div>
	</footer>
	</div>
	
</body>
</html>