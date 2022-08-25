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
			<div class="like_result">${DiaryPost.postRecommend }</div>
			<input type="hidden" id="postNum" value="${DiaryPost.postNum }">
			<input type="hidden" id="userID"
				value="${sessionScope.loginUser.userID}"> <input
				type="hidden" id="postWriter" value="${DiaryPost.postWriter}">
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
					onclick="updateDiaryPost('${DiaryPost.postWriter }', '${DiaryPost.postNum}')">수정</button>
				<button
					onclick="deleteDiaryPost('${DiaryPost.postNum}', '${DiaryPost.postWriter }', '${DiaryPost.postWriter }')">삭제</button>
			</c:if>


		</div>
	</div>
	<br>
	<br>
	<div id="goToListDiv">
		<button onclick="location.href='post-list?userId=${User.userID}'"
			id="GoToList">목록으로</button>
	</div>
	<br>

	<hr>

	<h2>Comment</h2>
	<!-- 댓글작성 -->
	<form id="commentForm" name="commentForm" method="get">
		<div>
			<strong>${sessionScope.loginUser.userID }</strong>
		</div>
		<div>
			<input type="hidden" id="postNum" name="postNum"
				value="${DiaryPost.postNum }"> <input type="hidden"
				id="userId" name="userId" value="${DiaryPost.postWriter }">
			<input type="hidden" id="commentWriter" name="commentWriter"
				value="${sessionScope.loginUser.userID}">
			<textarea name="commentTxt" id="commentTxt" placeholder="댓글을 입력해주세요."
				style="width: 95%; height: 100px;"></textarea>
			<button type="submit" id="commentSubmit">등록</button>
		</div>
	</form>

	<!-- 댓글목록 -->
	<form id="commentListForm" name="commentListForm" method="GET">
		<div id="commentList"></div>
	</form>


	<script type="text/javascript">
		function deleteDiaryPost(n, postWriter, userId) {
			var ok = confirm("정말 삭제하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.delete?postNum=" + n
						+ "&postWriter=" + postWriter + "&userId=" + userId;
			}
		}

		function updateDiaryPost(userId, n) {
			var ok = confirm("정말 수정하시겠습니까?");
			if (ok) {
				location.href = "diaryPost.update.go?userId=" + userId
						+ "&postNum=" + n;
			}
		}
		
		/*좋아요 기능*/
		$(function() {

			var postNum = document.getElementById("postNum").value;
			var userID = document.getElementById("userID").value;
			var postWriter = document.getElementById("postWriter").value;

			$(".heart").on("click", function() {
				console.log(postNum);
				console.log(userID);
				console.log(postWriter);

				$(this).toggleClass("is-active");
				likeupdate();
			});

			function likeupdate() {
				$.ajax({
					url : "updateLike.do",
					type : "GET",
					dataType : "json",
					data : {
						'postNum' : postNum,
						'userId' : userID,
						'postWriter' : postWriter
					},
					success : function(likeCount) {
						if (likeCount == 0) {
							alert("추천완료.");
							location.reload(true);
						} else if (likeCount == 1) {
							alert("추천취소");
							location.reload(true);
						}
					},
					error : function(request, status, error) {
						alert("ajax 실패1");
					}

				});
			}

		});
		
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
		 $(function() {

			$(function() {
				getCommentList();
			})
 			
			$("#commentSubmit").on("click", function() {
				
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
					},
					error : function(request, status, error) {
					}

				});
			});
		
		function getCommentList() {
			
			$.ajax({
				type : 'GET',
				url : 'commentList.do',
				dataType : 'json',
				data : $("#commentForm").serialize(),
				success : function(data) {
					var html = "";
					
					if(data.length > 0) {
							for (var i = 0; i < data.length; i++) {
						
							html += '<div style="width: 100%; margin-bottom: 30px; border: 1px solid white">';
							html += '<ul><strong>'+data[i]["commentWriter"]+'</strong></ul>';
							html += '<ul>'+data[i]["commentTxt"]+'</ul>';
							html += '<ul>'+data[i]["commentDate"]+'</ul>';
							html += '<button style="float: right; text-align: right; margin-left: 20px;">답글</button>';
							
							/*var diasble="";
							if(${sessionScope.loginUser.userID} != data['commentWriter'])
							{diasble="disabled"}*/
							html += '<button class="commentDelete" style="float: right; text-align: right; margin-left: 20px;">삭제</button>';
							/*html += '<button class="commentDelete"'+ diasble + 'data-del=' + data["commentNum"] + 'value=' + data["commentNum"] + 'style="float: right; text-align: right; margin-left: 20px;">삭제</button>';*/
							html += '</div>';
							html += '<hr>';
								
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
		
		
		$(".commentDelete").on("click", function() {
			
			var commentNum = $(this).attr("data-del");
			var sendData = {"commentNum": commentNum}
			
			$.ajax({
				type: "GET",
				url: "commentDelete.do",
				data : $("#commentForm").serialize(),
				dataType: "text",
				success: function(data) {
					console.log(data)
					$("#commentList").html('');
					commentList();
				}
			});
		
		
	 });
 });
		 
	</script>



</body>
</html>