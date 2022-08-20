<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/mj_css/postDetail.css">
<link rel="stylesheet" href="resources/mj_css/likeButton.css">
<script type="text/javascript" src="resources/mj_js/likeButton.js"></script>
</head>
<body>

<h1>${Like}</h1>
<h1>${Like.likeCount }</h1>
	<div>
		<h1>${DiaryPost.postTitle }</h1>
	</div>

	<div id="#postDetail" style="width: 100%">
		<div>
			<div id="leftSide" style="width: 100%">
				<div style="width: 10%"></div>
				<div class="postDetailWriter">작성자 : ${DiaryPost.postWriter }</div>
				<div class="postDetailDate">${DiaryPost.postDate }</div>
				<div class="postDetailCategory">카테고리 :
					${DiaryPost.postCategory }</div>
				<div class="postDetailCountry">국가 : ${DiaryPost.postCountry }</div>
				<div class="postDetailView">조회수 0</div>
			</div>
		</div>
		<hr>
		<div class="postDetailTxt">${DiaryPost.postTxt }</div>
	</div>



	<div>
		<!-- 좋아요 -->
		<!-- 로그인 상태일때 하트 클릭가능 -->
		<div id="placement">
			<div class="heart"></div>
			<div class="like_result">${Like.likeCount }</div>
		</div>

		<!-- 수정/삭제버튼 -->
		<div id="rightSide">
    <c:if test="${DiaryPost.postWriter eq sessionScope.loginUser.userID }">
		<button
			onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}')">수정</button>
		<button
			onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }')">삭제</button>
		</c:if>
    
    
			</div>
	</div>
	<br>
	<br>
	<div>
		<button onclick="history.go(-1)" id="GoToList">목록으로</button>
	</div>
	<br>

	<hr>

	<h2>Comment</h2>

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
				<div style="text-align: right; margin-right: 50px">삭제</div>
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