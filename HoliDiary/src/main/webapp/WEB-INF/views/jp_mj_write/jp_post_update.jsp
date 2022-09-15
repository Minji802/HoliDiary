<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>HOLIDIARY</title>
</head>
<body>

	<input type="button" value="Map" onclick="showPopupMap();" />

	<script language="javascript">
		function showPopupMap() {
			let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=800, height=650, top=100, left=270";
			window.open("jp_map.open", "map", options);
		}
	</script>

	<form action="jp_diaryPost.update.do?postNum=${DiaryPost.postNum }&nowPage=1&cntPerPage=15" method="post">
		<div id="container" style="width: 100%">
			<div class="postTitleWrite" style="font-size: 12pt;">
				제목<input type="text" name="postTitle" class="postTitleWriteContent"
					value="${DiaryPost.postTitle }"
					style="width: 60%; margin-left: 20px; border: 1px solid grey;">                              
			</div>

			<div>
				<input type="hidden" value="${sessionScope.loginUser.userID }"
					name="userId">
				<input type="hidden" name="token" value="${token }">
			</div>

			<div class="diaryPostCategory"
				style="width: 10%; height: 20px; float: right; margin-top: -12px; font-size: 12px">
				
				<c:if test="${!empty Diary.categoriesArray }">
				<select name="postCategory" id="postCategory">
					<option selected>分類</option>
					<option value="post">Post</option>
					<c:forEach var="category" varStatus="status" items="${Diary.categoriesArray }">
					<option class="item-link il-${status.count }" id="pageLink" value="${category }"> 
					${category }
					</option>
					</c:forEach>
				</select>
				</c:if>                  
			</div>

			<div class="diaryPostCountry">
				<div class="diaryPostCountry"
					style="width: 10%; height: 20px; float: right; margin-top: -12px; font-size: 12px">
					<select name="postCountry" id="postCountry">
						<option selected>Countries</option>
						<option value="유럽">Europe</option>
						<option value="아시아">Asia</option>
						<option value="아메리카">America</option>
						<option value="아프리카">Africa</option>
						<option value="오세아니아">Oceania</option>
					</select>                  
				</div>
			</div>

			<div style="margin-top: 30px">
				<textarea id="postTxt" name="postTxt" maxlength="10000"></textarea>
			</div>
			
			<input type="hidden" id="postImg" name="postImg" value="${DiaryPost.postImg }">
			
			<div class="row justify-content-md-center">                                                                                                                          
				<button type="submit" class="writeUpload" style="font-weight: bold"> 修正 </button>
				<button type="button" onclick="history.go(-1)" class="writeCancel"
					style="font-weight:  bold"> キャンセル </button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			//여기 아래 부분
			$('#postTxt').summernote({
				height : 450,
				focus : true,
				lang : "ko-KR",
				placeholder : '作成してください',
				callbacks : {
					onImageUpload : function(files, editor,welEditable) {
						// 파일 업로드(다중업로드를 위해 반복문 사용)
						for (var i = 0; i < files.length; i++) {
							uploadSummernoteImageFile(files[i],this);}
					}
				},
				toolbar : [
					// [groupName, [list of button]]
					[ 'fontname',[ 'fontname' ] ],
					[ 'fontsize',[ 'fontsize' ] ],
					['style',[
							'bold',
							'italic',
							'underline',
							'strikethrough',
							'clear' ] ],
					['color',[ 'forecolor','color' ] ],
					[ 'table', [ 'table' ] ],
					['para',[ 'ul', 'ol','paragraph' ] ],
					[ 'height',[ 'height' ] ],
					['insert',[ 'picture','link','video' ] ],
					['view',[ 'fullscreen','help' ] ] ],
				fontNames : [ 'Arial','Arial Black','Comic Sans MS','Courier New'],
				fontSizes : [ '8', '9', '10','11', '12', '14', '16',
							'18', '20', '22', '24','28', '30', '36', '50','72' ],
			});
			
			$("#postTxt").summernote('code', '${DiaryPost.postTxt}')

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
						$("#postImg").val(data.url)
					}
				});
			}
	});
	</script>





</body>
</html>