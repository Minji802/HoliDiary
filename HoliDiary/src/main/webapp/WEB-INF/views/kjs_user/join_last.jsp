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

	<div class="join_welcome">
		<span>HOlIDAIRY에 오신걸 환영합니다.</span><br>
		<span>마지막 프로필 사진을 등록해주세요.</span>
	</div>
		<div id="join_img_box">
			<img id="join_preview_img">
		</div>
			<form action="join.file.upload" method="post" enctype="multipart/form-data">
					<div class="join_file_input_box">
						<input class="join_upload_name" value="첨부파일" placeholder="첨부파일">
    					<label for="join_img_file">파일찾기</label> 
						<input type="file" onchange="readURL(this)" name="userImg" id="join_img_file">
						<input type="hidden" name="userID" value="${sessionScope.loginUser.userID }">
					</div>
					<div class="join_file_btn_box">
						<button class="join_go_home_btn" onclick="goHome()">나중에 등록하기</button>
						<button class="join_file_reg_btn">등록하기</button>
					</div>
			</form>
	</div>
	</div>
	
	<script type="text/javascript">
	// 바로 사진 보이기
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
	
	//첨부파일 명 보이기
	$(function() {
		$("#join_img_file").on('change',function(){
			  var fileName = $("#join_img_file").val();
			  $(".join_upload_name").val(fileName);
			});
	})
	</script>
</body>

</html>