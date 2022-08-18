<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<div>--------------------------------------------------------------------</div>
	
	
	<%-- <img alt="대체이미지 실험" src="${DiaryPost.postImg }" onerror=this.src="resources/alterImg/Landscape-Color.jpg"> --%>

	<hr>

	<h3>Comment</h3>
	
	<div>
		<textarea name="commentTxt" id="commentTxt"></textarea>
		<button>등록</button>
	</div>

	<h1>${Comment }</h1>
	
	<div id="comment">
		<div>
		</div>

		<c:forEach items="${Comment }" var="Comment">
			<div>${Comment.commentTxt }</div>
		</c:forEach>


	</div>

	<hr>

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