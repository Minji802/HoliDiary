<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<style type="text/css">
hr {
	width: 100%;
}

.hr-dashed {
  border : 1px;
  border-top: 3px dashed #616161;
}
</style>
</head>
<body>

	<h1>Edit Category</h1><br>

	<form action="jp_category.add" onsubmit="return categoryValidCheck();">
		<input type="text" id="categoryName" name="categories" placeholder="カテゴリー名を入力してください。" maxlength="10" style="border-bottom: solid 1px; width: 200px;">
		<input type="submit" value="追加" class="btn-update-save">
		<input type="hidden" value="${Diary.diaryUserId }" name="diaryUserId" id="diaryUserId">
	</form><br>

	<br><hr style="height: 1px; border:0; border-top: 3px dashed gray;"><br><br>
	
	<c:forEach var="category" items="${Diary.categoriesArray }" varStatus="status">
		<div style="height: 30px" class="categoryList" id="">
			<a href="#" class="il-${status.count }" name="categories">
          <input class="il-${status.count }" value="${category }" type="text" maxlength="10" style="border-bottom: solid 1px; width: 200px;">
			<button class="categoryDelBtn" style="color: red;">✕</button>
			</a>
		</div>
	</c:forEach>
			<button style="background-color: #7d7d7d;" id="categoryBtn" class="btn-update-save">保存</button>


	<script>
	$(document).on("click","#categoryBtn", function() {
		let newCategory = '';
		$('input', $('.categoryList')).each(function (i, e) {
			newCategory += e.value + '!'
		});
		
		//alert(newCategory);
		var diaryUserId = document.getElementById("diaryUserId").value;
		location.href="jp_category.update?newCategory=" + newCategory + "&diaryUserId=" + diaryUserId;
	});
	
	
	$(document).on("click", ".categoryDelBtn", function(){
		$('input', $('.categoryList')).each(function(i, e){		
			//thisCategory = e.value + '!'
		});
		
		$(this).click(function() {
		$(this).prev().remove()
		$(this).remove()
		let thisCategory = $(this).parent().find('input').val() + '!'
		});			
	});
	</script>

</body>
</html>