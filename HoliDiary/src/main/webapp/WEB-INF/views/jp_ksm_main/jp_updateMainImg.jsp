<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
</head>
<body>

<!-- src에 대체 이미지 주소 -->
<h1>Edit Home</h1>
<form action="mainImg.upload" method="post" enctype="multipart/form-data" onsubmit="return imgValidCheck();">
	<table>
		<tr>
			<td><h3>Diary Main Img</h3></td>
		</tr>
		<tr>
			<td>
				
				<input type="file" name="mainImg" id="mainImg">
				<button class="btn-update-save">修整</button><br><br>
				<img style="width:80px; height:80px; border-radius: 6px;" src="resources/sm_img/${Diary.diaryImg }">
				
				<br>
				<input type="hidden" value="${Diary.diaryUserId }" name="userId">
			</td>
		</tr>
	</table>
</form>

<br>


</body>
</html>