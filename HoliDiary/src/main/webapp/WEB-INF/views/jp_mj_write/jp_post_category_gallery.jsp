<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
</head>
<script type="text/javascript">
	function countPostChange() {
		var countPost = document.getElementById('cntPerPage').value;
		var category = document.getElementById('categoryName').value;
		location.href = "category-list?userId=${User.userID}&nowPage=${paging.nowPage}&cntPerPage="
				+ countPost + "&category=" + category;
	}

	function getList() {
		var category = document.getElementById('categoryName').value;
		location.href = "category-list?userId=${User.userID}&nowPage=1&cntPerPage=10&category="
				+ category;
	}

	function getGallery() {
		var category = document.getElementById('categoryName').value;
		location.href = "category-gallery?userId=${User.userID}&nowPage=1&cntPerPage=9&category="
				+ category;
	}
</script>

<body>

	<h1>${param.category }</h1>

	<div class="checks" style="text-align: right; margin-top: -25px;">
		<input type="radio" id="ex_rd1" name="listType" value="List"
			onclick="getList()" /> <label for="ex_rd1">List</label>&nbsp; <input
			type="radio" id="ex_rd2" name="listType" value="Gallery"
			checked="checked" onclick="getGallery()" /> <label for="ex_rd2">Gallery</label>
	</div>

	<input type="hidden" id="postWriter" name="postWriter"
		value="${User.userID}">
	<input type="hidden" id="categoryName" name="categoryName"
		value="${param.category }">

	<div id="countPost" style="height: 45px;">
		<div style="float: right; margin-top: 10px;">
			<select id="cntPerPage" name="countPost" onchange="countPostChange()">
				<option value="9"
					<c:if test="${paging.cntPerPage == 9 }">selected</c:if>>9個で見る</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15個で見る</option>
				<option value="21"
					<c:if test="${paging.cntPerPage == 21 }">selected</c:if>>21個で見る</option>
			</select>
		</div>
	</div>


	<div style="display: inline-table;">
		<c:if test="${DiaryPosts.size() != 0}">
			<c:forEach var="dp" items="${DiaryPosts}" varStatus="status">
				<table id="postListTbl" class="postList" border=0
					style="width: 232px; text-align: center; float: left;">
					<tr>
						<td colspan="2"><img src="${dp.postImg }"
							onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';"
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
						<td class="postDate" style="font-size: 9pt; text-align: right;">likes
							${dp.postRecommend } /</td>
						<td class="postViewCount"
							style="font-size: 9pt; text-align: left;">views
							${dp.postView }</td>
					</tr>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${DiaryPosts.size()==0}">
			<div class="nonePost">登録された掲示物がありません。</div>
		</c:if>
	</div>

	<div style="text-align: center; margin-top: 15px; font-size: 10pt;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="category-gallery?userId=${User.userID}&nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage }&category=${param.category }">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						href="category-gallery?userId=${User.userID}&nowPage=${p }&cntPerPage=${paging.cntPerPage }&category=${param.category }">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a
				href="category-gallery?userId=${User.userID}&nowPage=${paging.endPage + 1}&cntPerPage=${paging.cntPerPage }&category=${param.category }">&gt;</a>
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