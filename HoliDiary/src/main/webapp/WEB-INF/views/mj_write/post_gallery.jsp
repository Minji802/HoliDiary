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
		location.href="post-list?userId=${User.userID}&nowPage=1&cntPerPage=10";
	}

	function getGallery() {
		location.href="post-Gallery?userId=${User.userID}&nowPage=1&cntPerPage=9";
	}
</script>

<body>
	
	<h1>POST</h1>
	
	<div class="checks" style="text-align: right; margin-top: -25px;">
	<input type="radio" id="ex_rd1" name="listType" value="List" onclick="getList()"/>
	<label for="ex_rd1">List</label>&nbsp;
	<input type="radio" id="ex_rd2" name="listType" value="Gallery" checked="checked" onclick="getGallery()"/>
	<label for="ex_rd2">Gallery</label>
	</div>
	
	<input type="hidden" id="postWriter" name="postWriter" value="${User.userID}">

	<div id="countPost" style="height: 45px;">
		<div style="float: right; margin-top: 10px;">
			<select id="cntPerPage" name="countPost" onchange="countPostChange()">
				<option value="9"
					<c:if test="${paging.cntPerPage == 9 }">selected</c:if>>9개 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15개 보기</option>
				<option value="21"
					<c:if test="${paging.cntPerPage == 21 }">selected</c:if>>21개 보기</option>
			</select>
		</div>
	</div>
	

	<div style="display: inline-table;">
	<c:forEach var="dp" items="${DiaryPosts}" varStatus="status">
		<table id="postListTbl" class="postList" border=0 
			style="width: 232px; text-align: center; float: left;">
		<tr>
				<td colspan="2"><img src="${dp.postImg }" onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';"
					style="width: 232px; height: 170px;"></td>
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
				<td class="postDate" style="font-size: 9pt; text-align: right;">likes ${dp.postRecommend } /</td>
				<td class="postViewCount" style="font-size: 9pt; text-align: left;">views ${dp.postView }</td>
			</tr>
		</table>
	</c:forEach>
	</div>

	<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
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