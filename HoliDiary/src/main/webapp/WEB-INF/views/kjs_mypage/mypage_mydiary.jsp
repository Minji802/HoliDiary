<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div class="mypage_index"
				onclick="showMyinfo()">
				<span>My Page</span>
			</div>
			<div  class="mypage_index"
				onclick="showFollowing()">
				<span>나의구독</span>
			</div>
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showFollower()">
				<span style="color: #6667AB;">다이어리 통계</span>
			</div>
			<div class="mypage_content_box">
				<div id="mypage_follower">
					<div>나를 구독하는 사람들</div>
					<div>나를 구독하는 통계</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>