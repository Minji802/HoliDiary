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
	$("#mypage_modify").css('display', 'none');
	$("#mypage_subscribe").css('display', 'none');
}

// 마이페이지 정보수정 이동
function showModify(){
	$("#mypage_myinfo").css('display', 'none');
	$("#mypage_modify").css('display', 'block');
	$("#mypage_subscribe").css('display', 'none');
}

// 마이페이지 구독정보 확인
function showSubscribe(){
	$("#mypage_myinfo").css('display', 'none');
	$("#mypage_modify").css('display', 'none');
	$("#mypage_subscribe").css('display', 'block');
}


// 탈퇴
function deleteUser(){
	let ok = confirm('진짜로 삭제?');
	
	if(ok){
		location.href="delete.user";
	}
}