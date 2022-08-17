<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>카테고리 편집</h3>

	<%-- ${Diary }
	<br> ${Diary.diaryUserId }
	<br> ${Diary.categoriesArray }
	<br> --%>

	<h5> [추가] </h5>
	<form action="category.add">
		카테고리 추가: <input type="textarea" name="categories">
		<input type="submit" value="추가">
		<input type="hidden" value="${Diary.diaryUserId }" name="diaryUserId" id="diaryUserId">
	</form>

	<hr>
	
	<h5> [수정 및 삭제] </h5>
	<c:forEach var="category" items="${Diary.categoriesArray }" varStatus="status">
		<div style="height: 30px" class="categoryList" id="">
			<a href="#" class="il-${status.count }" name="categories">
          <input class="il-${status.count }" value="${category }"><%-- <span class="il-${status.count }"> ${category } </span> --%>
			<!-- <button class="li-update">수정</button> -->
			<button class="categoryDelBtn">삭제</button>
			</a>
		</div>
	</c:forEach>
			<button style="background-color: gray;" id="categoryBtn">저장</button>


	<script>
	$(document).on("click","#categoryBtn", function() {
		let newCategory = '';
		$('input', $('.categoryList')).each(function (i, e) {
			newCategory += e.value + '!'
		});
		
		alert(newCategory);
		var diaryUserId = document.getElementById("diaryUserId").value;
		location.href="category.update?newCategory=" + newCategory + "&diaryUserId=" + diaryUserId;
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