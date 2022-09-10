<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>
</head>
<style>
body {
	background-color: #fff;
	background-image: linear-gradient(90deg, transparent 79px, #abced4 79px, #abced4 81px,
		transparent 81px), linear-gradient(#eee .1em, transparent .1em);
	background-size: 100% 1.2em;
}

@font-face {
	font-family: 'GangwonEdu_OTFBoldA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.popupBack {
	text-decoration: none;
	font-size: 25px;
	font-family: 'GangwonEdu_OTFBoldA', 'Noto Sans KR', sans-serif;
	text-align: center;
	margin-top: 200px;
}

.popupBackLoginBtn {
	display: block;
	max-width: 480px;
	max-height: 210px;
	width: auto;
	height: auto;
	margin-top: -50px;
	margin-left: 380px;
}

</style>
<body>

	<div class="popupBack">로그인 후 이용 가능한 기능입니다.</div>
	<div>
		<a href="#" onclick=popupclose()><img class="popupBackLoginBtn" src="resources/sm_img/close-removebg-preview.png"></a>
	</div>

</body>
</html>