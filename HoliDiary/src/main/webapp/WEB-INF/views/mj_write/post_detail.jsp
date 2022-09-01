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
<body>

	<div>
		<h1>${DiaryPost.postTitle }</h1>
	</div>

	<div id="#postDetail" style="width: 100%">
		<div>
			<div id="leftSide" style="width: 100%">
				<div style="width: 10%"></div>
				<div class="postDetailWriter">작성자 : ${DiaryPost.postWriter }</div>
				<input type="hidden" id="postDetailWriter" name="postDetailWriter"
					value="${DiaryPost.postWriter }">
				<div class="postDetailDate">${DiaryPost.postDate }</div>
				<div class="postDetailCategory">카테고리 :
					${DiaryPost.postCategory }</div>
				<div class="postDetailCountry">국가 : ${DiaryPost.postCountry }</div>
				<div class="postDetailView">조회수 ${DiaryPost.postView }</div>
			</div>
		</div>
		<hr>
		<div class="postDetailTxt">${DiaryPost.postTxt }</div>
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
				<button
					onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">수정</button>
				<button
					onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }', '${DiaryPostPaging.nowPage }', '${DiaryPostPaging.cntPerPage }')">삭제</button>
			</c:if>


		</div>
	</div>
	<br>
	<br>
	<div id="goToListDiv">
		<button
			onclick="location.href='post-list?userId=${User.userID}&nowPage=1&cntPerPage=15'"
			id="GoToList">목록으로</button>
	</div>
	<br>

	<hr>
	<input type="hidden" value="${sessionScope.loginUser.userID }"
		id="currentUser">
	<h2>Comment</h2>
	<!-- 댓글작성 -->
	<form id="commentForm" name="commentForm">
		<div style="font-size: 11pt;">
			<strong>${sessionScope.loginUser.userID }</strong>
		</div>
		<div>
			<input type="checkbox" id="commentSecret" name="commentSecret">
			<label for="commentSecret">비밀댓글</label>
		</div>
		<div>
			<input type="hidden" id="postNum" name="postNum"
				value="${DiaryPost.postNum }"> <input type="hidden"
				id="postWriter" name="postWriter" value="${DiaryPost.postWriter }">
			<input type="hidden" id="commentWriter" name="commentWriter"
				value="${sessionScope.loginUser.userID}">
			<textarea name="commentTxt" id="commentTxt" placeholder="댓글을 입력해주세요."
				style="width: 95%; height: 100px;"></textarea>
			<button type="button" onclick="commentSubmit()">등록</button>
		</div>
	</form>

	<!-- 댓글목록 -->
	<form id="commentListForm" name="commentListForm" method="GET">
		<div id="commentList"></div>
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
						alert("누른거 그럼 하트 빨강색");
						$(".heart").toggleClass("is-active");
					} else  {
						alert("안누른거 빈하트");
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
				
			
		$(function() {
			getCommentList();
			goDiary();
		});
		
			
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
						
							html += '<div style="width: 100%; margin-bottom: 30px; border: 1px solid white">';
							html += '<ul style="font-size: 11pt"><strong>'+data[i]["commentWriter"]+'</strong></ul>';
							html += '<p class="arrow_box" value="' + data[i]["commentWriter"] + '" onclick="goDiary()">홈페이지 바로가기</p>';
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
							
							html += '<input type="hidden" id="commentNum" value='+data[i]["commentNum"]+'>';
							html += '<input type="hidden" id="commentParent" value='+data[i]["commentParent"]+'>';
							html += '<input type="hidden" id="postNum" value='+data[i]["postNum"]+'>';
							html += '<ul>'+data[i]["commentDate"]+'</ul>';
							
							if(currentUser == data[i]["commentWriter"])	{
								html += '<button type="button" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
							}
							
							html += '<button type="button" onclick="recommentToggle('+ data[i]["commentParent"] + data[i]["postNum"] +')" style="float: right; text-align: right; margin-left: 20px;">답글</button>';
							html += '</div>';
							html += '<hr>'
							
								
						}
						
					} else {
						 html += "<div>";
			             html += "<div style='width: 100%; height: 100px; text-align: center; margin-top: 50px;'><strong>등록된 댓글이 없습니다.</strong>";
			             html += "</div>";
			             html += "</div>";
					}
					
					$("#commentList").html(html);
				},
				error : function(request, status, error){
					alert("통신실패22222");
				}
			});
			
		}
			
	function goDiary() {
		alert(11);
		/*document.getElementsByClassName("arrow_box");
		$(".arrow_box").on("click",function(){
			alert($(this).text())
		});*/
	}
	
		 
		
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
	 
	 // 답글 작성칸 생성
	 
	 
	 function recommentToggle(commentParent, postNum) {
		 alert(commentParent);
		 alert(postNum);
		/* $("#recommentToggleBtn").click(function() {
			$("#recommentVisible").toggle();
		}); */
	}
			 
			
			
		 
	</script>



</body>
</html>