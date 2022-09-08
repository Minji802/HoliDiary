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
		location.href = "post-list.past?userId=${User.userID}&nowPage=${paging.nowPage}&cntPerPage="
				+ countPost;
	}

	function getList() {
		location.href = "post-list?userId=${User.userID}&nowPage=1&cntPerPage=10";
	}

	function getGallery() {
		location.href = "post-Gallery?userId=${User.userID}&nowPage=1&cntPerPage=9";
	}

	function recentList() {
		var countPost = document.getElementById('cntPerPage').value;
		location.href = "post-list?userId=${User.userID}&nowPage=1&cntPerPage=10";
	}

	function pastList() {
		var countPost = document.getElementById('cntPerPage').value;
		location.href = "post-list.past?userId=${User.userID}&nowPage=1&cntPerPage=10";
	}

	function recommendList() {
		var countPost = document.getElementById('cntPerPage').value;
		location.href = "post-list.recommend?userId=${User.userID}&nowPage=1&cntPerPage=10";
	}
</script>

<body>

	<h1>POST</h1>

	<div class="checks" style="text-align: right; margin-top: -25px;">
		<input type="radio" id="ex_rd1" name="listType" value="List"
			checked="checked" onclick="getList()" /> <label for="ex_rd1">List</label>&nbsp;
		<input type="radio" id="ex_rd2" name="listType" value="Gallery"
			onclick="getGallery()" /> <label for="ex_rd2">Gallery</label>
	</div>

	<input type="hidden" id="postWriter" name="postWriter"
		value="${User.userID}">

	<div id="postListOrder">
		<p>
			<button class="postListOrderA" onclick="recentList();">최신순</button>
			&nbsp;&nbsp;&nbsp;
			<button class="postListOrderA" style="font-weight: 600"
				onclick="pastList();">과거순</button>
			&nbsp;&nbsp;&nbsp;
			<button class="postListOrderA" onclick="recommendList();">추천순</button>
		</p>
	</div>

	<div id="countPost" style="height: 50px;">
		<div style="float: right; margin-top: 10px;">
			<select id="cntPerPage" name="countPost" onchange="countPostChange()">
				<option value="10"
					<c:if test="${paging.cntPerPage == 10 }">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20 }">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
	</div>

	<div id="ajaxForPostList">
		<table id="postListTbl" border=0
			style="width: 100%; text-align: center; border-collapse: collapse;">
			<tr class="postTbl">
				<td class="postTitle" style="width: 30%">Title</td>
				<td class="postWriter" style="width: 20%">Writer</td>
				<td class="postDate" style="width: 25%">Date</td>
				<td class="postLike" style="width: 10%">Likes</td>
				<td class="postNo" style="width: 15%">Views</td>
			</tr>
			<c:if test="${DiaryPosts.size() != 0}">
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
			</c:if>
			<c:if test="${DiaryPosts.size()==0}">
				<tr style="height: 400px;">
					<td class="nonePost2" colspan="5" rowspan="10">등록된 포스트가 없습니다</td>
				</tr>
			</c:if>
		</table>
	</div>

	<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="post-list.past?userId=${User.userID}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						href="post-list.past?userId=${User.userID}&nowPage=${p }&cntPerPage=${paging.cntPerPage }">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a
				href="post-list.past?userId=${User.userID}&nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage }">&gt;</a>
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