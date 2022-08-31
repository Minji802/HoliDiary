<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- src에 대체 이미지 주소 -->

<form action="mainImg.upload" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td><h3>Diary Main Img</h3></td>
		</tr>
		<tr>
			<td>
				<label for="mainImg">
					<div class="btn-img-upload">이미지 업로드하기</div>
				</label>
				<input type="file" name="mainImg" id="mainImg">
				<button class="btn-update-save">수정</button><br><br>
				<img style="width:80px; height:80px; border-radius: 6px;" src="resources/sm_img/${Diary.diaryImg }">
				
				<br>${Diary.diaryImg }
				<input type="hidden" value="${Diary.diaryUserId }" name="userId">
			</td>
		</tr>
	</table>
</form>

</body>
</html>