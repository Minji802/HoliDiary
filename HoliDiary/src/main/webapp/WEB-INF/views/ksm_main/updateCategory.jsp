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
	<c:forEach var="category" items="${Diary.categoriesArray }"
		varStatus="status">
		<div style="height: 30px" class="categoryList">
			<a href="#" class="il-${status.count }" name="categories">
			<!-- <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16"
				height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
				stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
				class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
         	</svg> -->
          <input class="il-${status.count }" value="${category }"><%-- <span class="il-${status.count }"> ${category } </span> --%>
			<!-- <button class="li-update">수정</button> -->
			<button>삭제</button>
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
	</script>

</body>
</html>