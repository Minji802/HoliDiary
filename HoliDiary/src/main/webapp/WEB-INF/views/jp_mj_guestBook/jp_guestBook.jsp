<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
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
					placeholder="入力してください(800文字以内)" maxlength="800" style="width: 100%; height: 80px; resize: none;"></textarea>
				<button class="guestBookReg-Btn" type="button" onclick="guestBookSubmit()" style="float: right;">登録</button>
			</div>
		</form>
		
		<div style="height: 50px;"></div>

		<hr>

		<!-- 방명록 목록 -->
		<form id="guestBookListForm" name="guestBookListForm" method="GET">
			<div id="guestBookList" style="position: relative;"></div>
		</form>

	</div>


	<script type="text/javascript">
		function guestBookSubmit() {
			
			let guestBookWriter = document.getElementById("guestBookWriter").value;
			let guestBookOwner = document.getElementById("guestBookOwner").value;
			let guestBookTxt = $("#guestBookTxt").val().replaceAll("\n", "<br>");
			

			if ($("#guestBookTxt").val() == '') {
				alert == swal('内容を確認してください');
				$("#guestBookTxt").focus();
			}

			$.ajax({
				url : "jp_guestBoodReg.do",
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
						alert == swal("登録が完了しました");
					} else {
						alert == swal("登録に失敗しました");
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
				url : 'jp_guestBookList.do',
				dataType : 'json',
				data : $("#guestBookForm").serialize(),
				success : function(data) {
					var html = "";
					let currentUser = $("#currentUser").val();
					let guestBookMaster = $("#guestBookOwner").val();
					//console.log(data);
					
					if(data.length > 0) {
						for (var i = 0; i < data.length; i++) {
							html += '<div style="width: 100%; margin-bottom: 30px;">';
							html += '<br>';
							html += '<ul class="guestBookWriterClass" style="font-size: 11pt;">';
							html +=	'<strong>' + data[i]["guestBookWriter"] + '</strong>'
							html += '</ul>';
							
							html += '<div class="popupLayer" tabindex="1">';
							html += '<span onclick="closeLayer(this)" style="float:right; cursor:pointer; font-size:1.5em" title="Close"></span>';
							html += '<p class="arrow_box" style="float:left; margin-top: -7px;" onclick="goThere('+"'"+data[i]["guestBookWriter"]+"'"+')">'+data[i]["guestBookWriter"]+'のDiary</p>';
							html += '</div>'
							
							html += '<br>';
							html += '<div>' + data[i]["guestBookTxt"] + '</div>';
							html += '<br>';
							html += '<div style="color: grey;">' + data[i]["guestBookDate"] + '</div>';
							
							if(currentUser == data[i]["guestBookWriter"])	{
								html += '<button type="button" class="guestBookDelete-Btn" onclick="guestBookDelete('+ data[i]["guestBookNum"] +')" style="float: right; text-align: right; margin-left: 20px;">削除</button>'; 
							} else if (guestBookMaster == currentUser){
								html += '<button type="button" class="guestBookDelete-Btn" onclick="guestBookDelete('+ data[i]["guestBookNum"] +')" style="float: right; text-align: right; margin-left: 20px;">削除</button>'; 
								
							}
							
							html += '</div>';
							html += '<hr>';
						}
					} else {
						 html += "<div>";
			             html += "<div class='guestBookListNone' style='width: 100%; height: 100px; text-align: center; margin-top: 50px;'><strong>まだ登録された芳名帳がありません。</strong>";
			             html += "</div>";
			             html += "</div>";
					}
					
					$("#guestBookList").html(html);
					goDiary();
				},
				error : function(request, status, error){
					//alert("통신실패22222");
				}
			});
	
		}
		
		function goThere(a) {
			location.href="jp_popupHomeGo?userId="+a;
		}	
			
		function closeLayer(obj) {
			$(obj).parent().parent().hide();
		}

				
		function goDiary() {
				let bookWriter = $(".guestBookWriterClass").children();
				let popupLayer2;
			$(bookWriter).on("click", function(e) {
				popupLayer2 = $(this).parent().parent().find(".popupLayer");
				//console.log(popupLayer2);
				/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
				var sWidth = window.innerWidth;
				var sHeight = window.innerHeight;
				var oWidth = $(popupLayer2).width();
				var oHeight = $(popupLayer2).height();

				// 레이어가 나타날 위치를 셋팅한다.
				var divLeft = e.offsetX;
				var divTop = e.offsetYY;

	 			//console.log(divLeft);
	 			//console.log(divTop);
				
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
			confirm == swal("本当に削除しますか？", {
	            buttons: {
	                  cancel: {
	                        text: "キャンセル",
	                        value: false,
	                        visible: true,
	                        closeModal: true,
	                      },
	                      confirm: {
	                        text: "削除",
	                        value: true,
	                        visible: true,
	                        closeModal: true
	                      }
	            }
	                }).then((result) => {
	                	if (result) {
	        				$.ajax({
	        					type: "GET",
	        					url: "jp_guestBookDelete.do",
	        					data : {"guestBookNum": guestBookNum},
	        					dataType: "text",
	        					success: function(data) {
	        						//console.log("삭제성공")
	        						alert == swal("削除が完了しました")
	        						getGuestBookList();
	        					}
	        				});
	        			}
	                });
			
			
		}
	
		
	</script>

</body>
</html>