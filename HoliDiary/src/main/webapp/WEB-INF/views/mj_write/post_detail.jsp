<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<link rel="stylesheet" href="resources/mj_css/postDetail.css">
</head>
<body>

	<div>
		<h1>${DiaryPost.postTitle }</h1>
	</div>

	<table id="postDetail" border="1" style="width: 100%; height: 90%;">
		<tr style="height: 50px">
			<td class="postDetailWriter">작성자 : ${DiaryPost.postWriter }</td>
			<td class="postDetailDate">${DiaryPost.postDate }</td>
		</tr>
		<tr style="height: 50px">
			<td class="postDetailWriter">카테고리 : ${DiaryPost.postCategory }</td>
			<td class="postDetailDate">국가 : ${DiaryPost.postCountry }</td>
		</tr>
		<tr>
			<td class="postDetailTxt" colspan="2">${DiaryPost.postTxt }</td>
		</tr>
	</table>

	<div>
		<button>좋아요</button>
		<button
			onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}')">수정</button>
		<button
			onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }')">삭제</button>

	</div>
	<div>
		<button onclick="history.go(-1)">목록으로</button>
	</div>


	<hr>

	<h3>Comment</h3>

	<div>
		<textarea name="commentTxt" id="commentTxt"></textarea>
		<button id="commentSubmit">등록</button>
	</div>

	<c:forEach items="${Comment}" var="c">
		<div id="comment">
			<div style="width: 100%; margin-bottom: 30px; border: 1px solid red">
				<ul>${c.commentWriter }</ul>
				<ul>${c.commentTxt }</ul>
				<ul>${c.commentDate }</ul>
				<div style="text-align: right; margin-right: 50px">좋아요</div>
				<div style="text-align: right; margin-top: -17.5px;">답글</div>
			</div>
			<hr>
		</div>
	</c:forEach>


	<script type="text/javascript">
		function deleteDiaryPost(n, postWriter, userId) {
			var ok = confirm("정말 삭제하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.delete?postNum=" + n
						+ "&postWriter=" + postWriter + "&userId=" + userId;
			}
		}

		function updateDiaryPost(userId, n) {
			var ok = confirm("정말 수정하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.update.go?userId=" + userId
						+ "&postNum=" + n;
			}
		}
		
		
		
		
	</script>



</body>
</html>