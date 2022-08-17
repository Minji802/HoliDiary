<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script type="text/javascript"
	src="resources/summernote/summernote-lite.js"></script>
<script type="text/javascript"
	src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="styleSheet" href="resources/summernote/summernote-lite.css">
</head>
<body>

	<input type="button" value="Map" onclick="showPopupMap();" />

	<script language="javascript">
		function showPopupMap() {
			let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=800, height=650, top=100, left=270";
			window.open("map.open", "map", options);
		}
	</script>

	<form action="diaryPost.reg.do" method="post" enctype="multipart/form-data">
		<div id="container" style="width: 100%">
			<div class="postTitleWrite" style="font-size: 12pt;">
				제목<input type="text" name="postTitle" class="postTitleWriteContent"
					style="width: 60%; margin-left: 20px; border: 1px solid grey;">                              
			</div>

			<div>
				<input type="hidden" value="${sessionScope.loginUser.userID }"
					name="userId">
				<input type="hidden" name="token" value="${token }">
			</div>

			<div class="diaryPostCategory"
				style="width: 10%; height: 20px; float: right; margin-top: -12px; font-size: 12px">
				<select name="postCategory" id="postCategory">
					<option selected>분류</option>
					<option value="post">Post</option>
				</select>                  
			</div>

			<div class="diaryPostCountry">
				<div class="diaryPostCountry"
					style="width: 10%; height: 20px; float: right; margin-top: -12px; font-size: 12px">
					<select name="postCountry" id="postCountry">
						<option selected>국가</option>
						<option value="유럽">유럽</option>
						<option value="아시아">아시아</option>
						<option value="아메리카">아메리카</option>
						<option value="아프리카">아프리카</option>
						<option value="오세아니아">오세아니아</option>
					</select>                  
				</div>
			</div>

			<div style="margin-top: 30px">
				<textarea id="postTxt" name="postTxt"></textarea>
			</div>
			
			<div id="diaryPostImgFileTbl" style="width: 100%">
				<div class="diaryPostImgFileTitle" style="width: 20%; float: left;">대표이미지(썸네일)</div>
				<div class="diaryPostImgFileInsert" style="width: 20%; float: right;">
				<input type="file" name="postImg"></div> 
			</div>
			
			<div class="row justify-content-md-center">
				<button type="submit" class="writeUpload" style="font-weight: bold"> 등록 </button>
				<button type="button" onclick="history.go(-1)" class="writeCancel"
					style="font-weight: bold"> 취소 </button>
			</div>
		</div>
	</form>
			
	<script type="text/javascript">
		$(document).ready(function() {
			//여기 아래 부분
			$('#postTxt').summernote({
				height: 500,
				focus: true,                
				lang: "ko-KR",	
				placeholder: '포스트를 작성해주세요',
				callbacks : { 
	            	onImageUpload : function(files, editor, welEditable) {
	            // 파일 업로드(다중업로드를 위해 반복문 사용)
	            for (var i = files.length - 1; i >= 0; i--) {
	            uploadSummernoteImageFile(files[i], this);
	            		}
	            	}
	            },
				toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		  });
			
			 function uploadSummernoteImageFile(file, el) {
					data = new FormData();
					data.append("file", file);
					$.ajax({
						data : data,
						type : "POST",
						url : "uploadSummernoteImageFile",
						contentType : false,
						enctype : 'multipart/form-data',
						processData : false,
						success : function(data) {
							$(el).summernote('editor.insertImage', data.url);
						}
					});
				}
			
		});
		
	</script>

			

	

</body>
</html>