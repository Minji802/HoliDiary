<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="styleSheet" href="resources/mj_css/postList.css">
</head>
<body>

	<h1>POST</h1>
	<table id="postListTbl" border=1 style="width: 100%; text-align: center;">
		<tr class="postTbl">
			<td class="postTitle" style="width: 30%">글제목</td>
			<td class="postWriter" style="width: 20%">작성자</td>
			<td class="postDate" style="width: 25%">작성날짜</td>
			<td class="postLike" style="width: 10%">좋아요</td>
			<td class="postNo" style="width: 15%">조회수</td>
		</tr>
		<c:forEach var="posts" items="${DiaryPost }">
			<tr class="postList">
				<td class="postTitle"><a href='post.detail.go?postNum=${posts.postNum } + &userId=${sessionScope.loginUser.userID }'>${posts.postTitle }</a></td>
				<td class="postWriter">${posts.postWriter }</td>
				<td class="postDate">${posts.postDate }</td>
				<td class="postDate">${posts.postRecommend }</td>
				<td class="postViewCount">조회수</td>
			</tr>
		</c:forEach>
	</table>
	

	<script type="text/javascript">
		$(document).ready(function() {
			$('.postList').hover(function() {
				$(this).css("background-color", "#f7f7f7");
			}, function() {
				$(this).css("background-color", "#ffffff");
			});
		});
	</script>
</body>
</html>