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
		
/* 공유기능 */
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
    // clipboard에 데이터 복사
    var copy = document.execCommand('copy');
    // 사용자 알림
    if(copy) {
    	alert("마이다이어리 주소가 복사되었습니다.");
    }
});
		
/* 트위터 */
function shareTwitter() {
	var postNum = document.getElementById("postNum").value;
	var userId = document.getElementById("postWriter").value;
	var sendUrl = "localhost/main/post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할
																								// URL
	console.log(sendUrl);
	window.open("https://twitter.com/intent/tweet?text=HoliDiary에서 나만의 여행 후기를 남겨보세요!😊 &url=" + sendUrl);
}
		
/* 페이스북 */
function shareFacebook() {
	var postNum = document.getElementById("postNum").value;
	var userId = document.getElementById("postWriter").value;
	var sendUrl = "localhost/main/post.detail.go?postNum="+postNum+"&userId="+userId; // 전달할
																								// URL
	window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}
		
/* 좋아요 기능 */
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
				$(".heart").toggleClass("is-active");
			} else  {

			}
		},
		error : function(request, status, error) {
			alert("ajax 실패1");
		}
	});	
}
		
/* 모달창 */
const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
  }

const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }

document.querySelector(".like_result").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".bg").addEventListener("click", close);
		
		  
/* 댓글창 */
function commentSubmit() {
		 
	// 비밀댓글 체크여부
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
				// alert("댓글 등록 실패");
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
			console.log(data);
				
			if(data.length > 0) {
				for (var i = 0; i < data.length; i++) {
				
					html += '<div class ="commentBox" style="width: 100%; margin-bottom: 30px; border: 1px solid white">';
					html += '<ul class="commentName" style="font-size: 11pt"><strong>'+data[i]["commentWriter"]+'</strong></ul>';
							
					html += '<div class="popupLayer" tabindex="1">';
					html += '<span onclick="closeLayer(this)" style="float:right; cursor:pointer; font-size:1.5em" title="닫기"></span>';
					html += '<p class="arrow_box" style="float:left; margin-top: -7px;" onclick="goThere('+"'"+data[i]["commentWriter"]+"'"+')">'+data[i]["commentWriter"]+'의 다이어리 바로가기</p>';
					html += '</div>'
							
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
						html += '<button class="commentUpdateBtn" class="postDetailUpDel-Btn" type="button" value="1" onclick="commentUpdate(this,' + data[i]["commentNum"] + ','  + "'" + data[i]["commentTxt"] + "'" + ')" style="float: right; text-align: right; margin-left: 20px; ">수정</button>';
							
						html += '<div class="updateCommentDIV" style="position: relative; margin-top: 20px; margin-left: 20px; display:none;">';
						html += '<form id="commentUpdateForm" name="commentUpdateForm">';
						html += '<div style="font-size: 11pt;">';
						html += '<strong>' + data[i]["commentWriter"] + '</strong>';
						html += '</div>';
						html += '<div>';
						html +=	'<input type="hidden" id="postNum_update" name="postNum" value="' + data[i]["postNum"] + '">'; 
						html +=	'<input type="hidden" id="commentNum_update" name="commentNum" value="' + data[i]["commentNum"] + '">'; 
						html +=	'<input type="hidden" id="commentWriter_update" name="commentWriter" value="' + data[i]["commentWriter"] + '">';
						html +=	'<textarea name="commentTxt" placeholder="' + data[i]["commentTxt"] + '" class="commentTxt_update" maxlength="800" style="width: 95%; height: 100px; resize: none;">';
						html += '</textarea>';
						html +=	'<button type="button" onclick="commentTxtUpdate(this, '+ data[i]["commentNum"] + ',' + "'" + data[i]["commentTxt"] + "'" + ')">수정</button>';
						html += '</div>';
						html += '</form>';
						html += '</div>'
						
					}  else if(postMaster == currentUser) {
						html += '<button type="button" class="postDetailUpDel-Btn" onclick="commentDelete('+ data[i]["commentNum"] +')" style="float: right; text-align: right; margin-left: 20px;">삭제</button>'; 
					}
						
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
			console.log('댓글로드');
			goDiary();
		},
		error : function(request, status, error){
			alert("통신실패22222");
		}
	});
		
}
		
function commentUpdate(obj, commentNum, commentTxt) {
	let btnElement = $(obj);
	console.log($(btnElement).val());
		
	let myDiv = $(obj).parent().find('.updateCommentDIV');
	if($(btnElement).val() == 1){ 		
		console.log($(btnElement).val());
       	console.log('val 1일때');
        $(myDiv).css("display","block");
        $(btnElement).val('0');
             
    }else{ 		
       	console.log($(btnElement).val());
       	console.log('val 0일때');
       	$(myDiv).css("display","none");
       	$(btnElement).val('1');
    }  
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
		var divLeft = e.offsetX;
		var divTop = e.offsetYY;

		console.log(divLeft);
		console.log(divTop);
			
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
	 
function commentTxtUpdate(obj, commentNum, commentTxt) {
	 var commentTxt_update = $(obj).parent().parent().find(".commentTxt_update");
	 var commentText = commentTxt_update.val();
	 console.log("1" + commentTxt_update.val());
	 console.log("2" + commentNum);
	 console.log("3" + commentTxt);
		 $.ajax({
			
			 url : "commentUpdate.do",
			type : "GET",
			dataType : "text",
			data : {
				"commentNum": commentNum,
				"commentTxt" : commentText
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
			
	 
			 
		