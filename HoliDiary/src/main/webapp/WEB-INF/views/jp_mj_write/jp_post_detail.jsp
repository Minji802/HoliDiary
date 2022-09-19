<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

	<div class="postTitle">
		<h1>${DiaryPost.postTitle }</h1>
	</div>

	<div>
		<div id="postDetail" style="width: 100%">
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
		<!-- tabindex 속성을 주게되면 해당 속성을 가진 태그에 focus할 수 있게되고 focus가 가는 순간부터 키보드 입력이 가능해진다 -->
		<div class="modal hidden" tabindex="0" >
			<div class="bg"></div>
			<div class="modalBox" style="z-index: 100;">
				<p>
					<c:forEach items="${Like }" var="Like">
						<li><strong>${Like.userId }</strong></li>
						<hr>
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
					onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">修正</button>
				<button class="postDetailUpDel-Btn"
					onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">削除</button>
			</c:if>
			
			<!-- 공유버튼 -->
			<a href="javascript:doDisplay();" class="postDetailShare-Btn">共有する</a><br /> <br />
			<div id="myDIV"
				style="display: none; float: right; text-align: right; position: relative;">
				<div id="mapage_mydiaryURL">
					<input id="mp_mydiary_copyURL"
						value="localhost/main/jp_post.detail.go?postNum=${DiaryPost.postNum }&userId=${DiaryPost.postWriter }"
						readonly />
					<button type="button" id="mp_mydiary_copy_btn">copy</button>
					
					<div style="float: right;">
						<div style="margin-right: 15px;">
							<img alt="twitter" src="resources/btnDesign/icon-twitter.png">
							<img alt="facebook" src="resources/btnDesign/icon-facebook.png">
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
			onclick="location.href='jp_post-list?userId=${User.userID}&nowPage=1&cntPerPage=15'"
			id="GoToList">目録へ</button>
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
			<label for="commentSecret">Secret Comment</label>
		</div>
		<div>
			<input type="hidden" id="postNum" name="postNum"
				value="${DiaryPost.postNum }"> <input type="hidden"
				id="postWriter" name="postWriter" value="${DiaryPost.postWriter }">
			<input type="hidden" id="commentWriter" name="commentWriter"
				value="${sessionScope.loginUser.userID}">
			<textarea name="commentTxt" id="commentTxt" placeholder="コメントを入力してください(800文字以内)"
				maxlength="800" style="width: 100%; height: 80px; resize: none;"></textarea>
			<button id="commentRegBtn" style="float: right" type="button" onclick="commentSubmit()">登録</button>
		</div>
	</form>
	<div style="height: 50px;"></div>

	<!-- 댓글목록 -->
	<form id="commentListForm" name="commentListForm" method="GET">
		<div id="commentList" style="position: relative;"></div>
	</form>


	<script type="text/javascript">
		function deleteDiaryPost(n, postWriter, userId, nowPage, cntPerPage) {
			confirm == swal("本当に削除しますか?", {
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
				                        if(result){
				                        	location.href = "jp_diaryPost.delete?postNum=" + n
				    						+ "&postWriter=" + postWriter + "&userId=" + userId + "&nowPage=" + 1 + "&cntPerPage=" + 15;
				    						alert == swal("掲示物が削除しました");
				                        }else{
				                            $(this).prop("checked", true);
				                            return;
				                        }
				                    })

		}

		function updateDiaryPost(userId, n, nowPage, cntPerPage) {
			confirm == swal("本当に修正しますか？", {
                buttons: {
                      cancel: {
                            text: "キャンセル",
                            value: false,
                            visible: true,
                            closeModal: true,
                          },
                          confirm: {
                            text: "修正",
                            value: true,
                            visible: true,
                            closeModal: true
                          }
                }
                    }).then((result) => {
                        if(result){
                        	location.href = "jp_diaryPost.update.go?&postNum=" + n + "&userId=" + userId;
                        }else{
                            $(this).prop("checked", true);
                            return;
                        }
                    })
			
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
		    	alert == swal("DIARYのアドレスがコピーされました。");
		    }
		});
		
		/*트위터*/
		function shareTwitter() {
			var postNum = document.getElementById("postNum").value;
			var userId = document.getElementById("postWriter").value;
   			var sendUrl = "localhost/main/jp_post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할 URL
   			//console.log(sendUrl);
   			window.open("https://twitter.com/intent/tweet?text=HoliDiaryで自分だけの旅行レビューを書いてみてください!😊 &url=" + sendUrl);
		}
		
		/*페이스북*/
		function shareFacebook() {
			var postNum = document.getElementById("postNum").value;
			var userId = document.getElementById("postWriter").value;
    		var sendUrl = "localhost/main/jp_post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할 URL
    		window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
		}
		
		/*좋아요 기능*/
		$(function() {
			var postNum = document.getElementById("postNum").value;
			var userID = document.getElementById("userID").value;
			var postWriter = document.getElementById("postWriter").value;
			var postRecommend = document.getElementById("postRecommend").value;
			checkLike2(postNum,userID);
			//alert(11);
			$(".heart").on("click", function() {
				$(this).toggleClass("is-active");
				likeupdate();
			});

			function likeupdate() {
				let likeCnt = $("#likeCnt");
				$.ajax({
					url : "jp_updateLike.do",
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
							$(likeCnt).html(parseInt($(likeCnt).text())+1);
							alert == swal("いいね！しました")
							location.reload(true);
							
						} else if (likeResult == 1) {
							$(likeCnt).html($(likeCnt).text()-1);
							alert == swal("いいね！をキャンセルしました")
							location.reload(true);
						}
					},
					error : function(request, status, error) {
					}

				});
			}
			
		});
		
		
		function checkLike2(postNum,userID) {
			
			$.ajax({
				url : "jp_checkLike.do",
				type : "GET",
				dataType : "text",
				data : {
					'postNum' : postNum,
					'userId' : userID
				},
				success : function(check) {
					if (check == 1) {
						$(".heart").toggleClass("is-active");
					} else if (check == null){
						$(".heart").toggleClass();
					}
				},
				error : function(request, status, error) {
					//alert("ajax 실패1");
					//console.log(request.responseText);
					//console.log(request.status);
					//console.log(error);
				}

			});	
		}
		
		/*MODAL*/	
		const $modal = document.querySelector('.modal');

		//$modal.style.display ='flex';
		
		const open = () => {
			$modal.classList.remove("hidden");
			$modal.focus();
		  }

		const close = () => {
			$modal.classList.add("hidden");
			
		}

		  document.querySelector(".like_result").addEventListener("click", open);
		  document.querySelector(".closeBtn").addEventListener("click", close);
		  document.querySelector(".bg").addEventListener("click", close);
		  $modal.addEventListener("keydown", close, e => {
	    		//console.log(e);
	    		 if(e.key==='Escape') $modal.style.display = 'none';
			});
		  
		  
		 /*Comment*/
		function commentSubmit() {
			 
			let postNum = document.getElementById("postNum").value;
			let postWriter = document.getElementById("postWriter").value;
			let commentWriter = document.getElementById("commentWriter").value;
			let commentTxt = $("#commentTxt").val().replaceAll("\n", "<br>");
			let commentSecret = 0;
			
			 // Secret Comment Checking
			 if($("#commentSecret").is(":checked")){
				 commentSecret = 1;
			 }
			 
			if($("#commentTxt").val() == ''){
				alert == swal('内容を入力してください!');
				$("#commentTxt").focus();
			}

			$.ajax({
				url : "jp_comment.do",
				type : "GET",
				dataType : "text",
				data : {
					"postNum": postNum,
					"postWriter": postWriter,
					"commentWriter": commentWriter,
					"commentTxt": commentTxt,
					"commentSecret": commentSecret
				},
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
				url : 'jp_commentList.do',
				dataType : 'json',
				data : $("#commentForm").serialize(),
				success : function(data) {
					var html = "";
					let postMaster = $("#postDetailWriter").val();
					let currentUser = $("#currentUser").val();
					//console.log(data);
					
					if(data.length > 0) {
						for (var i = 0; i < data.length; i++) {
						
							html += '<div class ="commentBox" style="width: 100%; margin-bottom: 30px;">';
							html += '<ul class="commentName" style="font-size: 11pt"><strong>'+data[i]["commentWriter"]+'</strong></ul>';
							
							html += '<div class="popupLayer" tabindex="1">';
							html += '<span onclick="closeLayer(this)" style="float:right; cursor:pointer; font-size:1.5em" title="Close"></span>';
							html += '<p class="arrow_box" style="float:left; margin-top: -7px;" onclick="goThere('+"'"+data[i]["commentWriter"]+"'"+')">'+data[i]["commentWriter"]+'のDiary</p>';
							html += '</div>'
							
							
							html += '<br>';
							
							if (data[i]["commentSecret"] == true) {
								if(currentUser == data[i]["commentWriter"])	{
									html += '<ul>'+data[i]["commentTxt"]+'</ul>';
								} else if(postMaster == currentUser) {
									html += '<ul>'+data[i]["commentTxt"]+'</ul>';
								} else {
									html += '<ul style="text-align: center;">Secret Comment</ul>';
								}
							} else if (data[i]["commentSecret"] == false){
								html += '<ul>'+data[i]["commentTxt"]+'</ul>';
							}
							
							html += '<input type="hidden" id="commentNum" class="commentNum" value='+data[i]["commentNum"]+'>';
							html += '<input type="hidden" id="commentParent" value='+data[i]["commentParent"]+'>';
							html += '<input type="hidden" id="postNum" value='+data[i]["postNum"]+'>';
							html += '<br><ul>'+data[i]["commentDate"]+'</ul>';
							
							if(currentUser == data[i]["commentWriter"])	{
								html += '<button type="button" class="commentDeleteBtn" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">削除</button>'; 
								html += '<button class="commentUpdateBtn" type="button" value="1" onclick="commentUpdate(this,' + data[i]["commentNum"] + ','  + "'" + data[i]["commentTxt"] + "'" + ')" style="float: right; text-align: right; margin-left: 20px; ">修正</button>';
							
								html += '<div class="updateCommentDIV" style="position: relative; margin-top: 20px; margin-left: 20px; display:none;">';
								html += '<form id="commentUpdateForm" name="commentUpdateForm">';
								html += '<div style="font-size: 11pt;">';
								html += '<strong>' + data[i]["commentWriter"] + '</strong>';
								html += '</div>';
								html += '<div>';
								html +=	'<input type="hidden" id="postNum_update" name="postNum" value="' + data[i]["postNum"] + '">'; 
								html +=	'<input type="hidden" id="commentNum_update" name="commentNum" value="' + data[i]["commentNum"] + '">'; 
								html +=	'<input type="hidden" id="commentWriter_update" name="commentWriter" value="' + data[i]["commentWriter"] + '">';
								html +=	'<textarea name="commentTxt" placeholder="修正するコメントを入力してください(800文字以内)" class="commentTxt_update" maxlength="800" style="width: 94%; height: 100px; resize: none;">';
								html += '</textarea>';
								html +=	'<button type="button" class="commentUpdateCompleteBtn" onclick="commentTxtUpdate(this, '+ data[i]["commentNum"] + ',' + "'" + data[i]["commentTxt"] + "'" + ')">修正</button>';
								html += '</div>';
								html += '</form>';
								html += '</div>';
							
							
							}  else if(postMaster == currentUser) {
								html += '<button type="button" class="commentDeleteBtn" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">削除</button>'; 
							}
						
							
							
							html += '</div>';
							html += '<hr>';
								
						}
						
					} else {
						 html += "<div>";
			             html += "<div style='width: 100%; height: 100px; text-align: center; margin-top: 50px;'><strong>登録されたコメントがありません。</strong>";
			             html += "</div>";
			             html += "</div>";
					}
					
					$("#commentList").html(html);
					//console.log('댓글로드');
					goDiary();
				},
				error : function(request, status, error){
					//alert("통신실패22222");
				}
			});
			
		}
		
		
	function commentUpdate(obj, commentNum, commentTxt) {
		let btnElement = $(obj);
		//console.log($(btnElement).val());
		
		let myDiv = $(obj).parent().find('.updateCommentDIV');
          if($(btnElement).val() == 1){ 		
        	 //console.log($(btnElement).val());
        	 //console.log('val 1일때');
           $(myDiv).css("display","block");
           $(btnElement).val('0');
             
         }else{ 		
        	 //console.log($(btnElement).val());
        	 //console.log('val 0일때');
           $(myDiv).css("display","none");
           $(btnElement).val('1');
         }  
	}
		
	function goThere(a) {
		location.href="jp_popupHomeGo?userId="+a;
	}	
		
	function closeLayer(obj) {
		$(obj).parent().parent().hide();
	}

			
	function goDiary() {
			let myStrong = $(".commentName").children();
			let popupLayer;
		$(myStrong).on("click", function(e) {
			popupLayer = $(this).parent().parent().find(".popupLayer");
			//console.log(popupLayer);
			/* クリックするとクリックする位置にレイアウトが現れる */
			var sWidth = window.innerWidth;
			var sHeight = window.innerHeight;
			var oWidth = $(popupLayer).width();
			var oHeight = $(popupLayer).height();

			// レイアウトが現れる位置をセッティングする
			var divLeft = e.offsetX;
			var divTop = e.offsetYY;

 			//console.log(divLeft);
 			//console.log(divTop);
			
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
		//console.log('레디호출끝')
	});
		
	 function commentDelete(commentNum) {
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
            				url: "jp_commentDelete.do",
            				data : {"commentNum": commentNum},
            				dataType: "text",
            				success: function(data) {
            					//console.log("삭제성공")
            					getCommentList();
            				}
            			});
            		}
                });
		
		//alert(commentNum);
		
	}
	 
	function commentTxtUpdate(obj, commentNum, commentTxt) {
		 var commentTxt_update = $(obj).parent().parent().find(".commentTxt_update");
		 var commentText = commentTxt_update.val().replaceAll("\n", "<br>");
		 //console.log("1" + commentTxt_update.val());
		 //console.log("2" + commentNum);
		 //console.log("3" + commentTxt);
				 $.ajax({
				
				url : "jp_commentUpdate.do",
				type : "GET",
				dataType : "text",
				data : {
					"commentNum": commentNum,
					"commentTxt" : commentText
				},
				success : function(data) {
					//console.log(data);
					if (data == 1){
						alert == swal("コメントを修正しました。");
						getCommentList();
					} else {
						alert == swal("コメント修正が失敗しました。");
					}
				}

			}); 
	}
			
	 
			 
			
			
		 
	</script>
</body>
</html>