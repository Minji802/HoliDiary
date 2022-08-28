<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div  class="mypage_index"
				onclick="showMyinfo()">
				<span>My Page</span>
			</div>
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showFollowing()">
				<span style="color: #6667AB;">My Subscribe</span>
			</div>
			<div class="mypage_index"
				onclick="showFollower()">
				<span>My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_mysub_title">나의 구독</div>
				</div>
				<c:forEach var="subscribe" items="${subscribes}">
				<div>${subscribe.userID}</div>
				<div>${subscribe.userImg}</div>
				<div>${subscribe.userNickname}</div>
				<div>${subscribe.diaryTitle}</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>