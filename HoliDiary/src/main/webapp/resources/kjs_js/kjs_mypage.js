//레디
$(function() {
	$(".mypage_index").click(function() {
		$(this).css('background-color', '#FFDE59');
		$(this).find('span').css('color', '#6667AB');
		$(".mypage_index").not($(this)).css('background-color', '#6667AB');
		$(".mypage_index").find('span').not($(this).find('span')).css('color', '#FFDE59');
	});
	
	
});

//마이페이지 회원만 이용가능
function mypageCheckUser(){
	
		let id = $("#userID");
		//alert(id.val());
		
		$.ajax({
			url: 'id.check',
			type : 'GET',
			dataType : 'text',
			data : {'userID' : id.val()},
			success : function(result) {
				console.log(result);
				if(result == 0){
					alert('로그인 후 이용해주세요');
					return false;
				} else{
					location.href="mypage.go";
					return true;
				}
				
			},
			error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			alert('문제가 발생했습니다. 다시 이용해주세요.')
    			return false;
    		}
		});
		
}

// 마이페이지 내 정보 이동

function showMyinfo(){
	$("#mypage_myinfo").css('display', 'block');
	$("#mypage_following").css('display', 'none');
	$("#mypage_follower").css('display', 'none');
}

// 마이페이지 정보수정 이동
function showFollowing(){
	$("#mypage_myinfo").css('display', 'none');
	$("#mypage_following").css('display', 'block');
	$("#mypage_follower").css('display', 'none');
}

// 마이페이지 구독정보 확인
function showFollower(){
	$("#mypage_myinfo").css('display', 'none');
	$("#mypage_following").css('display', 'none');
	$("#mypage_follower").css('display', 'block');
}


// 탈퇴
function deleteUser(){
	
	let pw = $("#mypagePW");
	let id = $("#mypageID");
	
	if(isEmpty(pw)){
		alert('비밀번호를 입력해주세요');
		pw.focus();
	}else{
		$.ajax({
			url: 'pw.check',
			type : 'POST',
			dataType : 'text',
			data : {'userID': id.val(), 'userPW' : pw.val()},
			success : function(result) {
				console.log(result);
				if(result == 1){
					let ok = confirm('정말 탈퇴하시겠습니까? 탈퇴와 동시에 소셜 로그인 연동도 해제됩니다.');
					if(ok){
						location.href="delete.do";
					}
				}else{
					alert('비밀번호를 확인해주세요');
				}
			},
			error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			alert('문제가 발생했습니다. 다시 이용해주세요.')
    			return false;
    		}
		});
	}
}

function modifyUser(){
	
	let pw = $("#mypagePW");
	
	if(isEmpty(pw)){
		alert('비밀번호를 입력해주세요.');
		pw.focus();
		return false;
	}
	
	return true;
}