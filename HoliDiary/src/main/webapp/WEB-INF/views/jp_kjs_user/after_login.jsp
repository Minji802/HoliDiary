<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a class="menu_bar_diary_li" href="#" onclick=popup()>
		<img class="menu_diary_img" src="resources/sej_img/free-icon-travel-1706019.png">
		<!-- <p>My 다이어리</p> -->
	</a>
	<a class="menu_bar_li_first" href="#" id="modal_btn" onclick=popup()>${sessionScope.loginUser.userNickname }'s Diary</a>
	<button id="logout_btn" onclick="location.href='jp.logout.do'">LOGOUT</button>
</body>
</html>