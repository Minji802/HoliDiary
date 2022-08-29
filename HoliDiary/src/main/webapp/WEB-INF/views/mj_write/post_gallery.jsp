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
<script type="text/javascript">
	function countPostChange() {
		var countPost = document.getElementById('cntPerPage').value;
		location.href="post-Gallery?userId=${User.userID}&nowPage=${paging.nowPage}&cntPerPage="+countPost;
	}
	
	function getList() {
		location.href="post-list?userId=${User.userID}&nowPage=1&cntPerPage=15";
	}

	function getGallery() {
		location.href="post-Gallery?userId=${User.userID}&nowPage=1&cntPerPage=15";
	}
</script>

<body>
	
	<input type="radio" name="listType" value="List" onclick="getList()"/>List
	<input type="radio" name="listType" value="Gallery" checked="checked" onclick="getGallery()"/>Gallery

	<input type="hidden" id="postWriter" name="postWriter" value="${User.userID}">

	<div id="countPost">
		<div style="float: right;">
			<select id="cntPerPage" name="countPost" onchange="countPostChange()">
				<option value="16"
					<c:if test="${paging.cntPerPage == 16 }">selected</c:if>>16줄 보기</option>
				<option value="24"
					<c:if test="${paging.cntPerPage == 24 }">selected</c:if>>24줄 보기</option>
				<option value="32"
					<c:if test="${paging.cntPerPage == 32 }">selected</c:if>>32줄 보기</option>
			</select>
		</div>
	</div>
	

	<h1>POST</h1>
	<div style="display: inline-table;">
	<c:forEach var="dp" items="${DiaryPosts}" varStatus="status">
		<table id="postListTbl" class="postList" border=1
			style="width: 236px; text-align: center; float: left;">
			<tr>
				<td colspan="2"><img src="${dp.postImg }"
					style="width: 236px; height: 170px;"></td>
			</tr>
			<tr>
				<td class="postTitle" colspan="2"><a
					href='post.detail.go?postNum=${dp.postNum } + &userId=${dp.postWriter }'><strong>${dp.postTitle }</strong></a></td>
			</tr>
			<tr>
				<td class="postWriter" colspan="2">${dp.postWriter }</td>
			</tr>
			<tr>
				<td class="postDate" colspan="2">${dp.postDate }</td>
			</tr>
			<tr>
				<td class="postDate" style="font-size: 9pt;">좋아요 : ${dp.postRecommend }</td>
				<td class="postViewCount" style="font-size: 9pt;">조회수 : ${dp.postView }</td>
			</tr>
		</table>
	</c:forEach>
	</div>

	<div style="text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a href="post-Gallery?userId=${User.userID}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="post-Gallery?userId=${User.userID}&nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="post-Gallery?userId=${User.userID}&nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage }">&gt;</a>
		</c:if>
	</div>
	
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