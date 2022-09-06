<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/mj_css/postDetail.css">
<link rel="stylesheet" href="resources/mj_css/likeButton.css">
</head>
<body">

	<div class="postTitle">
		<h1>${DiaryPost.postTitle }</h1>
	</div>

	<div>
		<div id="#postDetail" style="width: 100%">
			<div>
				<div id="leftSide" style="width: 100%">
					<div class="postDetailWriter">Writer: ${DiaryPost.postWriter }</div>
					<input type="hidden" id="postDetailWriter" name="postDetailWriter"
						value="${DiaryPost.postWriter }">
					<div class="postDetailDate">Date: ${DiaryPost.postDate }</div>
					<div class="postDetailCategory">Category:
						${DiaryPost.postCategory }</div>
					<div class="postDetailCountry">Country:
						${DiaryPost.postCountry }</div>
					<div class="postDetailView">Views ${DiaryPost.postView }</div>
				</div>
			</div>
		</div>
		<div>
			<hr>
			<div class="postDetailTxt">${DiaryPost.postTxt }</div>
		</div>
	</div>



	<div>
		<!-- 좋아요 -->
		<!-- 로그인 상태일때 하트 클릭가능 -->
		<div id="placement">
			<div class="heart"></div>
			<div class="like_result">
				<span id="likeCnt">${DiaryPost.postRecommend }</span>
			</div>
			<input type="hidden" id="postRecommend"
				value="${DiaryPost.postRecommend }"> <input type="hidden"
				id="postNum" value="${DiaryPost.postNum }"> <input
				type="hidden" id="userID" value="${sessionScope.loginUser.userID}">
			<input type="hidden" id="postWriter" value="${DiaryPost.postWriter}">
		</div>

		<!-- 모달창 -->
		<div class="modal hidden">
			<div class="bg"></div>
			<div class="modalBox">
				<p>
					<c:forEach items="${Like }" var="Like">
						<li>${Like.userId }</li>
					</c:forEach>
				</p>
				<button class="closeBtn">✖</button>
			</div>
		</div>

		<!-- 수정/삭제버튼 -->
		<div id="rightSide">
			<c:if
				test="${DiaryPost.postWriter eq sessionScope.loginUser.userID }">
				<button class="postDetailUpDel-Btn"
					onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">수정</button>
				<button class="postDetailUpDel-Btn"
					onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">삭제</button>
			</c:if>
			
			<!-- 공유버튼 -->
			<a href="javascript:doDisplay();" class="postDetailShare-Btn">공유하기</a><br /> <br />
			<div id="myDIV"
				style="display: none; float: right; text-align: right; position: relative;">
				<div id="mapage_mydiaryURL">
					<input id="mp_mydiary_copyURL"
						value="localhost/main/post.detail.go?postNum=${DiaryPost.postNum }&userId=${DiaryPost.postWriter }"
						readonly />
					<button type="button" id="mp_mydiary_copy_btn">copy</button>
					
					<div style="float: right;">
						<div style="margin-right: 15px;">
							<img alt="트위터" src="resources/btnDesign/icon-twitter.png">
							<img alt="페이스북" src="resources/btnDesign/icon-facebook.png">
						</div>
						<div style="margin-top: -50px;">
							<a id="btnTwitter" class="link-icon2 twitter"
								href="javascript:shareTwitter()">twitter</a> <a id="btnFacebook"
								class="link-icon2 facebook" href="javascript:shareFacebook()">facebook</a><br>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="goToListDiv" style="margin-top: 165px;">
		<button class="goToList-Btn" 
			onclick="location.href='post-list?userId=${User.userID}&nowPage=1&cntPerPage=15'"
			id="GoToList">목록으로</button>
		<br>
	</div>
		<hr>
	<input type="hidden" value="${sessionScope.loginUser.userID }"
		id="currentUser">

	<h2>Comment</h2>
	<!-- 댓글작성 -->
	<form id="commentForm" name="commentForm">
		<div style="font-size: 11pt;">
			<strong>${sessionScope.loginUser.userID }</strong>
		</div>
		<div style="float: right;">
			<input type="checkbox" id="commentSecret" name="commentSecret">
			<label for="commentSecret">비밀댓글</label>
		</div>
		<div>
			<input type="hidden" id="postNum" name="postNum"
				value="${DiaryPost.postNum }"> <input type="hidden"
				id="postWriter" name="postWriter" value="${DiaryPost.postWriter }">
			<input type="hidden" id="commentWriter" name="commentWriter"
				value="${sessionScope.loginUser.userID}">
			<textarea name="commentTxt" id="commentTxt" placeholder="댓글을 입력해주세요 (800자 이내)"
				maxlength="800" style="width: 100%; height: 80px; resize: none;"></textarea>
			<button class="postDetailReg-Btn" style="float: right" type="button" onclick="commentSubmit()">등록</button>
		</div>
	</form>
	<div style="height: 50px;"></div>

	<!-- 댓글목록 -->
	<form id="commentListForm" name="commentListForm" method="GET">
		<div id="commentList" style="position: relative;"></div>
	</form>

	<!-- 대댓글작성 -->
	<div id="recommentVisible"
		style="width: 97%; margin-left: 25px; display: none;">
		<form id="recommentForm" name="recommentForm">
			<div>
				<strong>${sessionScope.loginUser.userID }</strong>
			</div>
			<div>
				<input type="hidden" id="postNum" name="postNum"
					value="${DiaryPost.postNum }"> <input type="hidden"
					id="userId" name="userId" value="${DiaryPost.postWriter }">
				<input type="hidden" id="commentParent" name="commentParent"
					value="${Comment.commentParent}"> <input type="hidden"
					id="commentWriter" name="commentWriter"
					value="${sessionScope.loginUser.userID}">
				<textarea name="commentTxt" id="commentTxt"
					placeholder="댓글을 입력해주세요." style="width: 95%; height: 100px;"></textarea>
				<button type="button" onclick="recommentSubmit()">등록</button>
				<button type="button" onclick="recommentCancel()">취소</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		function deleteDiaryPost(n, postWriter, userId, nowPage, cntPerPage) {
			var ok = confirm("정말 삭제하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.delete?postNum=" + n
						+ "&postWriter=" + postWriter + "&userId=" + userId + "&nowPage=" + 1 + "&cntPerPage=" + 15;
			}
		}

		function updateDiaryPost(userId, n, nowPage, cntPerPage) {
			var ok = confirm("정말 수정하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.update.go?&postNum=" + n + "&userId=" + userId;
			}
		}
		
		/*공유기능*/
		var bDisplay = true;
		function doDisplay(){ 	
            var con = document.getElementById("myDIV"); 	
            if(bDisplay){ 		
                con.style.display = 'none';
                bDisplay = !bDisplay;
                
            }else{ 		
                con.style.display = 'block'; 	
                bDisplay = !bDisplay;
            } 
        } 
		
		// 마이다이어리 복붙
		$("#mp_mydiary_copy_btn").click(function() {
		    // input에 담긴 데이터를 선택
		    $('#mp_mydiary_copyURL').select();
		    //  clipboard에 데이터 복사
		    var copy = document.execCommand('copy');
		    // 사용자 알림
		    if(copy) {
		    	alert("마이다이어리 주소가 복사되었습니다.");
		    }
		});
		
		/*트위터*/
		function shareTwitter() {
			var postNum = document.getElementById("postNum").value;
			var userId = document.getElementById("postWriter").value;
   			var sendUrl = "localhost/main/post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할 URL
   			console.log(sendUrl);
   			window.open("https://twitter.com/intent/tweet?text=HoliDiary에서 나만의 여행 후기를 남겨보세요!😊 &url=" + sendUrl);
		}
		
		/*페이스북*/
		function shareFacebook() {
			var postNum = document.getElementById("postNum").value;
			var userId = document.getElementById("postWriter").value;
    		var sendUrl = "localhost/main/post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할 URL
    		window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
		}
		
		/*좋아요 기능*/
		$(function() {
			var postNum = document.getElementById("postNum").value;
			var userID = document.getElementById("userID").value;
			var postWriter = document.getElementById("postWriter").value;
			var postRecommend = document.getElementById("postRecommend").value;
			checkLike2(postNum,userID);
			alert(11);
			$(".heart").on("click", function() {
				$(this).toggleClass("is-active");
				likeupdate();
			});

			function likeupdate() {
				let likeCnt = $("#likeCnt");
				$.ajax({
					url : "updateLike.do",
					type : "GET",
					dataType : "json",
					data : {
						'postNum' : postNum,
						'userId' : userID,
						'postWriter' : postWriter,
						'postRecommend' : postRecommend
					},
					success : function(likeResult) {
						if (likeResult == 0) {
							console.log("추천함");
							$(likeCnt).html(parseInt($(likeCnt).text())+1);
							
							
						} else if (likeResult == 1) {
							console.log("추천취소");
							$(likeCnt).html($(likeCnt).text()-1);
						}
					},
					error : function(request, status, error) {
						alert("ajax 실패1");
					}

				});
			}
			
		});
		
		function checkLike2(postNum,userID) {
			
			$.ajax({
				url : "checkLike.do",
				type : "GET",
				dataType : "text",
				data : {
					'postNum' : postNum,
					'userId' : userID
				},
				success : function(check) {
					if (check == 1) {
						//alert("누른거 그럼 하트 빨강색");
						$(".heart").toggleClass("is-active");
					} else  {
						//alert("안누른거 빈하트");
					}
				},
				error : function(request, status, error) {
					alert("ajax 실패1");
				}

			});	
		}
		
		/*모달창*/
		const open = () => {
		    document.querySelector(".modal").classList.remove("hidden");
		  }

		  const close = () => {
		    document.querySelector(".modal").classList.add("hidden");
		  }

		  document.querySelector(".like_result").addEventListener("click", open);
		  document.querySelector(".closeBtn").addEventListener("click", close);
		  document.querySelector(".bg").addEventListener("click", close);
		
		  
		 /*댓글창*/
		function commentSubmit() {
			 
			 //비밀댓글 체크여부
			 //var commentSecret = 0;
			 if($("#commentSecret").is(":checked")){
			 	$("#commentSecret").val() == 1;
			 } else {
			 	$("#commentSecret").val() == 0;
			 }
			if($("#commentTxt").val() == ''){
				alert('내용을 입력해주세요!');
				$("#commentTxt").focus();
			}

			$.ajax({
				url : "comment.do",
				type : "GET",
				dataType : "text",
				data : $("#commentForm").serialize(),
				success : function(data) {
					if (data == 1){
						getCommentList();
						$("#commentTxt").val('');
					} else {
						//alert("댓글 등록 실패");
					}
				}

			});
		}
			
		function getCommentList() {
			
			$.ajax({
				type : 'GET',
				url : 'commentList.do',
				dataType : 'json',
				data : $("#commentForm").serialize(),
				success : function(data) {
					var html = "";
					let postMaster = $("#postDetailWriter").val();
					let currentUser = $("#currentUser").val();
					//alert(postMaster);
					//alert(data[0]["commentWriter"]);
					console.log(data);
					
					if(data.length > 0) {
						for (var i = 0; i < data.length; i++) {
						
							html += '<div class ="commentBox" style="width: 100%; margin-bottom: 30px; border: 1px solid white">';
							html += '<ul class="commentName" style="font-size: 11pt"><strong>'+data[i]["commentWriter"]+'</strong></ul>';
							
							
							/* html += '<div class="popupLayer">'
							html += '<div>'
							html += '<p class="arrow_box" value="' + data[i]["commentWriter"] + '">홈페이지 바로가기</p>';
							html += '</div>'
							html += '</div>' */
							
							
							html += '<div class="popupLayer" tabindex="1">';
							html += '<span onclick="closeLayer(this)" style="float:right; cursor:pointer; font-size:1.5em" title="닫기"></span>';
//							html += '<p class="arrow_box" onclick="'+'location.href="popupHomeGo?userId="'+ data[i]["commentWriter"] + '>홈페이지 바로가기</p>';
							html += '<p class="arrow_box" style="float:left; margin-top: -7px;" onclick="goThere('+"'"+data[i]["commentWriter"]+"'"+')">'+data[i]["commentWriter"]+'의 다이어리 바로가기</p>';
							html += '</div>'
							
							
							//html += '<button type="button" onclick="goDiary('+ data[i]["commentWriter"] +')"> 홈페이지 바로가기 </button>';
							html += '<br>';
							
							if (data[i]["commentSecret"] == true) {
								if(currentUser == data[i]["commentWriter"])	{
									html += '<ul>'+data[i]["commentTxt"]+'</ul>';
								} else if(postMaster == currentUser) {
									html += '<ul>'+data[i]["commentTxt"]+'</ul>';
								} else {
									html += '<ul>비밀댓글입니다.</ul>';
								}
							} else if (data[i]["commentSecret"] == false){
								html += '<ul>'+data[i]["commentTxt"]+'</ul>';
							}
							
							html += '<input type="hidden" id="commentNum" class="commentNum" value='+data[i]["commentNum"]+'>';
							html += '<input type="hidden" id="commentParent" value='+data[i]["commentParent"]+'>';
							html += '<input type="hidden" id="postNum" value='+data[i]["postNum"]+'>';
							html += '<br><ul>'+data[i]["commentDate"]+'</ul>';
							
							if(currentUser == data[i]["commentWriter"])	{
								html += '<button type="button" class="postDetailUpDel-Btn" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
								html += '<button id="commentUpdateBtn" class="postDetailUpDel-Btn" type="button" onclick="commentUpdate('+ data[i]["postNum"] + ',' + data[i]["commentNum"] + ',' + "'" + data[i]["commentWriter"] + "'" + ',' + "'" + data[i]["commentTxt"] + "'" + ')" style="float: right; text-align: right; margin-left: 20px;">수정</button>';
							}  else if(postMaster == currentUser) {
								html += '<button type="button" class="postDetailUpDel-Btn" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
							}
							
							/*html += '<div id="updateCommentDIV" style="position: relative;">';
							html += '<form id="commentUpdateForm" name="commentUpdateForm">';
							html += '<div style="font-size: 11pt;">';
							html += '<strong>' + data[i]["commentWriter"] + '</strong>';
							html += '</div>';
							html += '<div>';
							html +=	'<input type="hidden" id="postNum_update" name="postNum" value="' + data[i]["postNum"] + '">'; 
							html +=	'<input type="hidden" id="commentNum_update" name="commentNum" value="' + data[i]["commentNum"] + '">'; 
							html +=	'<input type="hidden" id="commentWriter_update" name="commentWriter" value="' + data[i]["commentWriter"] + '">';
							html +=	'<textarea name="commentTxt" id="commentTxt_update" maxlength="800" style="width: 95%; height: 100px; resize: none;">';
							html += data[i]["commentTxt"];
							html += '</textarea>';
//							html +=	'<button type="button" onclick="commentTxtUpdate('+ data[i]["postNum"] + ',' + data[i]["commentNum"] + ',' + "'" + data[i]["commentWriter"] + "'" + ',' + "'" + data[i]["commentTxt"] + "'" + ')">수정</button>';
							html +=	'<button type="button" onclick="commentTxtUpdate('+ data[i]["commentNum"] + ',' + "'" + data[i]["commentTxt"] + "'" + ')">수정</button>';
							html += '</div>';
							html += '</form>';
							html += '</div>'
							
							html += '</div>';
							html += '<hr>'*/
								
						}
						
					} else {
						 html += "<div>";
			             html += "<div style='width: 100%; height: 100px; text-align: center; margin-top: 50px;'><strong>등록된 댓글이 없습니다.</strong>";
			             html += "</div>";
			             html += "</div>";
					}
					
					$("#commentList").html(html);
					console.log('댓글로드');
					goDiary();
				},
				error : function(request, status, error){
					alert("통신실패22222");
				}
			});
			
		}
		
		
	var bDisplay2 = true;	
	function commentUpdate(postNum, commentNum, commentWriter, commentTxt) {
		
		console.log(commentNum);
		console.log(postNum);
		console.log(commentWriter);
		console.log(commentTxt);
		
		var con = document.getElementById("updateCommentDIV"); 	
        if(bDisplay2){ 		
            con.style.display = 'none';
            bDisplay2 = !bDisplay2;
            
        }else{ 		
            con.style.display = 'block'; 	
            bDisplay2 = !bDisplay2;
        } 
		
		alert('33333333333333333');
		
		
		//$("#commentNum" + commentNum).replaceWith(html);
		//$("commentNum" + commentNum + "#commentTxt").focus();
		
		alert('안돼????????');
	}
		
	
		
	function goThere(a) {
		location.href="popupHomeGo?userId="+a;
	}	
		
	function closeLayer(obj) {
		$(obj).parent().parent().hide();
	}

			
	function goDiary() {
			let myStrong = $(".commentName").children();
			let popupLayer;
		$(myStrong).on("click", function(e) {
			popupLayer = $(this).parent().parent().find(".popupLayer");
			console.log(popupLayer);
			/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;
			var oWidth = $(popupLayer).width();
			var oHeight = $(popupLayer).height();

			// 레이어가 나타날 위치를 셋팅한다.
//			var divLeft = e.clientX;
//			var divTop = e.clientY;
			var divLeft = e.offsetX;
			var divTop = e.offsetYY;

 			console.log(divLeft);
 			console.log(divTop);
			// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			//if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
			//if( divTop + oHeight > sHeight ) divTop -= oHeight;

			// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
			//if( divLeft < 0 ) divLeft = 0;
			//if( divTop < 0 ) divTop = 0;
			
			$(popupLayer).css({
				"width": 200,
				"height": 30,
				"top": divTop,
				"left": divLeft,
				"position": "absolute"
			}).show();

			$(popupLayer).focus();
			$(popupLayer).blur(function() {
				$(this).hide();
			});
			
		});
	}
	
	$(function() {
		getCommentList();
		console.log('레디호출끝')
	});
		
	 function commentDelete(commentNum) {
		var ok = confirm("정말 삭제하시겠습니까?");
		alert(commentNum);
		if (ok) {
			$.ajax({
				type: "GET",
				url: "commentDelete.do",
				data : {"commentNum": commentNum},
				dataType: "text",
				success: function(data) {
					console.log("삭제성공")
					getCommentList();
				}
			});
		}
	}
	 
	 function commentTxtUpdate(commentNum, commentTxt) {
		 
			$.ajax({
				url : "commentUpdate.do",
				type : "GET",
				dataType : "text",
				data : {
					"commentNum": commentNum,
					"commentTxt" : commentTxt
				},
				success : function(data) {
					console.log(data);
					if (data == 1){
						alert('댓글 수정 성공');
						getCommentList();
					} else {
						alert("댓글 수정 실패");
					}
				}

			});
	}
	 
			 
			
			
		 
	</script>
</body>
</html>