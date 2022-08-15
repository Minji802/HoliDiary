<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="mj_css/postDetail.css">
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
		<button>수정하기</button>
		<button onclick="history.go(-1)">목록으로</button>
	</div>
	
	<hr>
	
	<div>
		<div><h3>Comment</h3></div>
		<div>작성자</div>
		<div><textarea name="commentTxt" id="commentTxt"></textarea>
		<button>등록</button> </div>
	</div>



</body>
</html>