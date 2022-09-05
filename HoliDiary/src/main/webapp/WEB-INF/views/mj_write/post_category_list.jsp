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
		var category = document.getElementById('categoryName').value;
		location.href="category-list?userId=${User.userID}&nowPage=${paging.nowPage}&cntPerPage="+countPost+"&category="+category;
	}
	
	function getList() {
		var category = document.getElementById('categoryName').value;
		location.href="category-list?userId=${User.userID}&nowPage=1&cntPerPage=10&category="+category;
	}

	function getGallery() {
		var category = document.getElementById('categoryName').value;
		location.href="category-gallery?userId=${User.userID}&nowPage=1&cntPerPage=9&category="+category;
	}
</script>

<body>
	
	<input type="radio" name="listType" value="List" checked="checked" onclick="getList()"/>List
	<input type="radio" name="listType" value="Gallery" onclick="getGallery()"/>Gallery
	

	<input type="hidden" id="postWriter" name="postWriter" value="${User.userID}">
	<input type="hidden" id="categoryName" name="categoryName" value="${param.category }">

	<div id="countPost">
		<div style="float: right;">
			<select id="cntPerPage" name="countPost" onchange="countPostChange()">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10 }">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20 }">selected</c:if>>20줄 보기</option>
			</select>
		</div>
	</div>

	<h1>POST</h1>
	<table id="postListTbl" border=1
		style="width: 100%; text-align: center;">
		<tr class="postTbl">
			<td class="postTitle" style="width: 30%">글제목</td>
			<td class="postWriter" style="width: 20%">작성자</td>
			<td class="postDate" style="width: 25%">작성날짜</td>
			<td class="postLike" style="width: 10%">좋아요</td>
			<td class="postNo" style="width: 15%">조회수</td>
		</tr>
		<c:forEach var="dp" items="${DiaryPosts }" varStatus="status">
			<tr class="postList">
				<td class="postTitle"><a
					href='post.detail.go?postNum=${dp.postNum }&userId=${dp.postWriter }'>${dp.postTitle }</a></td>
				<td class="postWriter">${dp.postWriter }</td>
				<td class="postDate">${dp.postDate }</td>
				<td class="postDate">${dp.postRecommend }</td>
				<td class="postViewCount">${dp.postView }</td>
			</tr>
		</c:forEach>
	</table>

	<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
		<c:if test="${paging.startPage != 1 }">
			<a href="category-list?userId=${User.userID}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage }&category=${param.category }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="category-list?userId=${User.userID}&nowPage=${p }&cntPerPage=${paging.cntPerPage }&category=${param.category }">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="category-list?userId=${User.userID}&nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage }&category=${param.category }">&gt;</a>
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