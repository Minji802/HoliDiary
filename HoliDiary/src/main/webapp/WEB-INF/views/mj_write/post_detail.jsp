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
		<div>${sessionScope.loginUser.userID }</div>
		<div>
			<input type="hidden" id="postNum" name="postNum" value="${DiaryPost.postNum }">
			<input type="hidden" id="userId" name="userId" value="${DiaryPost.postWriter }">
			<input type="hidden" id="commentWriter" name="commentWriter" value="${sessionScope.loginUser.userID}">
			<textarea name="commentTxt" id="commentTxt"></textarea>
			<button id="commentSubmit">등록</button>
		</div>
	</form>

	<!-- 댓글목록 -->
	<c:forEach items="${Comment}" var="c">
		<div id="comment">
			<div style="width: 100%; margin-bottom: 30px; border: 1px solid red">
				<ul>${c.commentWriter }</ul>
				<ul>${c.commentTxt }</ul>
				<ul>${c.commentDate }</ul>
				
				<div style="float:right; text-align: right; margin-left: 20px;">답글</div>
				<c:if
				test="${c.commentWriter eq sessionScope.loginUser.userID }">
				<div style="float:right; text-align: right; margin-left: 20px;">삭제</div>
				<div style="float:right; text-align: right; margin-left: 20px;">수정</div>
				</c:if>
			</div>
			<hr>
		</div>
	</c:forEach>


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
						} else if (likeCount == 1) {
							alert("추천취소");
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

		/* 	var postNum = document.getElementById("postNum2").value;
			var CommentWriter = document.getElementById("commentWriter").value;
			var commentTxt = document.getElementById("commentTxt");
 */			
 			console.log(commentWriter);
 
 
			$("#commentSubmit").on("click", function() {
				/* console.log(postNum);
				console.log(userID);
				console.log(commentTxt); */

				$.ajax({
					url : "comment.do",
					type : "GET",
					dataType : "JSON",
					data : $("#commentForm").serialize(),
					success : function(data) {
						alert("댓글 삽입 성공!" + data)
						location.reload(true);
					},
					error : function(request, status, error) {
						alert("ajax 실패(댓글)" + data);
					}

				});
			});

		});
		 
	</script>



</body>
</html>