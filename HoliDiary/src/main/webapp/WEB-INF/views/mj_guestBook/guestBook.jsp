<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/mj_css/postDetail.css">
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
					placeholder="방명록을 입력해주세요 (800자 이내)" maxlength="800" style="width: 100%; height: 80px; resize: none;"></textarea>
				<button class="postDetailReg-Btn" type="button" onclick="guestBookSubmit()" style="float: right;">등록</button>
			</div>
		</form>
		
		<div style="height: 50px;"></div>

		<hr>

		<!-- 방명록 목록 -->
		<form id="guestBookListForm" name="guestBookListForm" method="GET">
			<div id="guestBookList"></div>
		</form>

	</div>


	<script type="text/javascript">
		function guestBookSubmit() {
			
			let guestBookWriter = document.getElementById("guestBookWriter").value;
			let guestBookOwner = document.getElementById("guestBookOwner").value;
			let guestBookTxt = $("#guestBookTxt").val().replaceAll("\n", "<br>");
			

			if ($("#guestBookTxt").val() == '') {
				alert('내용을 입력해주세요!');
				$("#guestBookTxt").focus();
			}

			$.ajax({
				url : "guestBoodReg.do",
				type : "GET",
				dataType : "text",
				data : {
					"guestBookWriter": guestBookWriter,
					"guestBookOwner": guestBookOwner,
					"guestBookTxt": guestBookTxt
				},
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
			
			//let owner = document.getElementById("guestBookOwner").value;
			
			$.ajax({
				type : 'GET',
				url : 'guestBookList.do',
				dataType : 'json',
				data : $("#guestBookForm").serialize(),
				success : function(data) {
					var html = "";
					let currentUser = $("#currentUser").val();
					let guestBookMaster = $("#guestBookOwner").val();
					console.log(data);
					
					if(data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							html += '<div style="width: 100%; margin-bottom: 30px;">';
							html += '<br>';
							html += '<ul class="guestBookWriterClass" style="font-size: 11pt;">';
							html +=	'<strong>' + data[i]["guestBookWriter"] + '</strong>'
							html += '</ul>';
							
							html += '<div class="popupLayer" tabindex="1">';
							html += '<span onclick="closeLayer(this)" style="float:right; cursor:pointer; font-size:1.5em" title="닫기"></span>';
							html += '<p class="arrow_box" style="float:left; margin-top: -7px;" onclick="goThere('+"'"+data[i]["guestBookWriter"]+"'"+')">'+data[i]["guestBookWriter"]+'의 다이어리 바로가기</p>';
							html += '</div>'
							
							html += '<br>';
							html += '<div>' + data[i]["guestBookTxt"] + '</div>';
							html += '<br>';
							html += '<div style="color: grey;">' + data[i]["guestBookDate"] + '</div>';
							
							if(currentUser == data[i]["guestBookWriter"])	{
								html += '<button type="button" class="postDetailUpDel-Btn" onclick="guestBookDelete('+ data[i]["guestBookNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
							} else if (guestBookMaster == currentUser){
								html += '<button type="button" class="postDetailUpDel-Btn" onclick="guestBookDelete('+ data[i]["guestBookNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
								
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
					goDiary();
				},
				error : function(request, status, error){
					alert("통신실패22222");
				}
			});
	
		}
		
		function goThere(a) {
			location.href="popupHomeGo?userId="+a;
		}	
			
		function closeLayer(obj) {
			$(obj).parent().parent().hide();
		}

				
		function goDiary() {
				let bookWriter = $(".guestBookWriterClass").children();
				let popupLayer2;
			$(bookWriter).on("click", function(e) {
				popupLayer2 = $(this).parent().parent().find(".popupLayer");
				console.log(popupLayer2);
				/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
				var sWidth = window.innerWidth;
				var sHeight = window.innerHeight;
				var oWidth = $(popupLayer2).width();
				var oHeight = $(popupLayer2).height();

				// 레이어가 나타날 위치를 셋팅한다.
				var divLeft = e.offsetX;
				var divTop = e.offsetYY;

	 			console.log(divLeft);
	 			console.log(divTop);
				
				$(popupLayer2).css({
					"width": 200,
					"height": 30,
					"top": divTop,
					"left": divLeft,
					"position": "absolute"
				}).show();

				$(popupLayer2).focus();
				$(popupLayer2).blur(function() {
					$(this).hide();
				});
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