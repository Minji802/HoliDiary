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
	<h1>Guest Book</h1>
	
	<input type="hidden" value="${sessionScope.loginUser.userID }"
		id="currentUser">
	
	<div>
		<form id="guestBookForm" name="guestBookForm">
			<div style="font-size: 11pt;">
				<strong>${sessionScope.loginUser.userID }</strong>
			</div>
			<br>
			<div>
				<input type="hidden" id="guestBookWriter" name="guestBookWriter"
					value="${sessionScope.loginUser.userID}"> 
				<input
					type="hidden" id="guestBookOwner" name="guestBookOwner"
					value="${User.userID}">
				<textarea name="guestBookTxt" id="guestBookTxt"
					placeholder="방명록을 입력해주세요." style="width: 95%; height: 100px;"></textarea>
				<button type="button" onclick="guestBookSubmit()">등록</button>
			</div>
		</form>

		<hr>

		<!-- 방명록 목록 -->
		<form id="guestBookListForm" name="guestBookListForm" method="GET">
			<div id="guestBookList"></div>
		</form>

	</div>


	<script type="text/javascript">
		function guestBookSubmit() {

			if ($("#guestBookTxt").val() == '') {
				alert('내용을 입력해주세요!');
				$("#guestBookTxt").focus();
			}

			$.ajax({
				url : "guestBoodReg.do",
				type : "GET",
				dataType : "text",
				data : $("#guestBookForm").serialize(),
				success : function(data) {
					if (data == 1) {
						getGuestBookList();
						$("#guestBookTxt").val('');
					} else {
						alert("방명록 등록 실패");
					}
				}

			});
		}
		
		$(function() {
			getGuestBookList();
		});
		
		function getGuestBookList() {
			
			let owner = document.getElementById("guestBookOwner").value;
			
			$.ajax({
				type : 'GET',
				url : 'guestBookList.do',
				dataType : 'json',
				data : {
					'guestBookOwner' : owner
				},
				success : function(data) {
					var html = "";
					let currentUser = $("#currentUser").val();
					console.log(data);
					
					if(data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							html += '<div style="width: 100%; height: 120px;">';
							html += '<br>';
							html += '<div style="font-size: 11pt;">';
							html +=	'<strong>' + data[i]["guestBookWriter"] + '</strong>'
							html += '</div>';
							html += '<br>';
							html += '<div>' + data[i]["guestBookTxt"] + '</div>';
							html += '<br>';
							html += '<div style="color: grey;">' + data[i]["guestBookDate"] + '</div>';
							
							if(currentUser == data[i]["guestBookWriter"])	{
								html += '<button type="button" onclick="guestBookDelete('+ data[i]["guestBookNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
							}
							
							html += '</div>';
							html += '<hr>';
						}
					} else {
						 html += "<div>";
			             html += "<div style='width: 100%; height: 100px; text-align: center; margin-top: 50px;'><strong>등록된 방명록이 없습니다.</strong>";
			             html += "</div>";
			             html += "</div>";
					}
					
					$("#guestBookList").html(html);
				},
				error : function(request, status, error){
					alert("통신실패22222");
				}
			});
	
		}
		
		function guestBookDelete(guestBookNum) {
			var ok = confirm("정말 삭제하시겠습니까?");
			//alert(guestBookNum);
			if (ok) {
				$.ajax({
					type: "GET",
					url: "guestBookDelete.do",
					data : {"guestBookNum": guestBookNum},
					dataType: "text",
					success: function(data) {
						console.log("삭제성공")
						getGuestBookList();
					}
				});
			}
		}
	
		
	</script>

</body>
</html>