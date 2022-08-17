<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="content_join">
	<div class="join_file_upload_box">

	<div class="join_phrase">
		<span>HOlIDAIRY에 오신걸 환영합니다.</span>
		<span>마지막 프로필 사진을 등록해주세요.</span>
	</div>
		<div class="join_go_home_box">
			<button onclick="goHome()">나중에 등록하기</button>
			<button onclick="popup()">나의 다이어리로 바로 가기</button>
		</div>
		${r}
		
		
		<div id="join_img_box">
			<img id="join_preview_img">
		</div>
			<form action="join.file.upload" method="post" enctype="multipart/form-data">
					<div class="join_file_input_box">
						<input type="file" onchange="readURL(this)" name="userImg">
						<input type="hidden" name="userID" value="${sessionScope.loginUser.userID }">
					</div>
					<div class="join_file_btn_box">
						<button>등록하기</button>
					</div>
			</form>
	</div>
	</div>
	
	<script type="text/javascript">
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('join_preview_img').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('join_preview_img').src = "";
		  }
		}
	</script>
</body>

</html>