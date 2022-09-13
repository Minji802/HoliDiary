<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_join_last">
		<div class="join_file_upload_box">
			<div class="join_welcome">
				<span><span style="color: #6667AB; font-size: 20pt;">HOLIDAIRY</span>に
					会員登録ができました。</span><br> <span>最期に、プロフィール写真を登録してください。</span>
			</div>
			<form action="jp.join.file.upload" method="post"
				enctype="multipart/form-data">
				<div style="padding-left: 40px; margin-top: 50px;">
					<div class="join_last_info">
						<div style="display: inline-block; width: 60%">
							<div id="join_img_box">
								<img id="join_preview_img">
							</div>
							<div class="join_file_input_box">
								<input class="join_upload_name" value="첨부파일" placeholder="ファイル">
								<label for="join_img_file">ファイル</label> <input type="file"
									onchange="readURL(this)" name="userImg" id="join_img_file"
									readonly /> <input type="hidden" name="userID"
									value="${sessionScope.loginUser.userID }">
							</div>
						</div>
						<div class="join_last_infotxt_box">
							<div class="join_last_infotxt">
								<span>${sessionScope.loginUser.userName }様</span>
							</div>
							<div class="join_last_infotxt">
								<span>ID</span><br>
								<span>${sessionScope.loginUser.userID }</span>
							</div>
							<div class="join_last_infotxt"> 
								<span>電話番号</span><br>
								<span>${sessionScope.loginUser.userPhoneNumber }</span>
							</div>
							<div class="join_last_infotxt">
								<span>メールアドレス</span><br>
								<span>${sessionScope.loginUser.userEmail }</span>
							</div>
							<div class="join_last_infotxt">
								<span>マイダイアリーURL</span><br>
								<span>${sessionScope.loginUser.userDiaryUrl }</span>
							</div>
						</div>
					</div>
					<div class="join_file_btn_box">
						<button class="join_go_home_btn" onclick="goHome()">後で登録します</button>
						<button class="join_file_reg_btn">登録</button>
					</div>
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
			$("#join_img_file").on('change', function() {
				var fileName = $("#join_img_file").val();
				$(".join_upload_name").val(fileName);
			});
		})
	</script>
</body>

</html>