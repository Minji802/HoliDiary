//레디
$(function() {
	
	// 마이다이어리 복붙 창 열기
	let blank = true;
	$("#mapage_mydiaryURL_box").click(function() {
		if(blank){
			$("#mapage_mydiaryURL").css('display','block');
			blank = !blank;
		}else{
			$("#mapage_mydiaryURL").css('display','none');
			blank = !blank;
		}
	});
	
	// 마이다이어리 복붙
	$("#mp_mydiary_copy_btn").click(function() {
	
	    // input에 담긴 데이터를 선택
	    $('#mp_mydiary_copyURL').select();
	    
	    //  clipboard에 데이터 복사
	    var copy = document.execCommand('copy');
	    
	    // 사용자 알림
	    if(copy) {
	    	swal("マイダイアリーURLがコピーされました。");
	    }
	});
	
	// 마이페이지 카카오 연동 처리
	$("#mypage_kakao_checkbox").click(function(){
		if($(this).is(":checked") == true){
			swal("カカオトークの連動をしますか。", {
				buttons: {
					  cancel: {
						    text: "cancel",
						    value: false,
						    visible: true,
						    closeModal: true,
						  },
						  confirm: {
						    text: "connect",
						    value: true,
						    visible: true,
						    closeModal: true
						  }
				}
					}).then((result) => {
						if(result){
							// 카카오 연결
							  Kakao.Auth.login({
							      success: function(authObj) {
							        //alert(JSON.stringify(authObj));
									            // db값에 kakaID값 넣기
									        	Kakao.Auth.authorize({
									        	redirectUri: 'http://localhost/main/jp.connect.kakao'
									        	});
									          },
							      fail: function(err) {
							    	  swal(JSON.stringify(err));
							      }
							    })
									$(this).prop("checked", true);
						}else{
							$(this).prop("checked", false);
							return;
						}
					})
		}
		if($(this).is(":checked") == false){
		swal("カカオトークでログインした後で解除されます。連動を開場しますか。", {
			buttons: {
				  cancel: {
					    text: "cancel",
					    value: false,
					    visible: true,
					    closeModal: true,
					  },
					  confirm: {
					    text: "disconnect",
					    value: true,
					    visible: true,
					    closeModal: true
					  }
			}
				}).then((result) => {
					if(result){
						$(this).prop("checked", false);
						location.href='jp.disconnect.sns';
					}else{
						$(this).prop("checked", true);
						return;
					}
				})
		}
	});
	
	// 마이페이지 네이버 연동 처리
	$("#mypage_naver_checkbox").click(function(){
		
		if($(this).is(":checked") == true){
			swal("ネイバーの連動をしますか。", {
				buttons: {
					  cancel: {
						    text: "cancel",
						    value: false,
						    visible: true,
						    closeModal: true,
						  },
						  confirm: {
						    text: "connect",
						    value: true,
						    visible: true,
						    closeModal: true
						  }
				}
					}).then((result) => {
						if(result){
							// 네이버 연동
							var btnNaverLogin = document.getElementById("naver_id_login").firstChild;
							btnNaverLogin.click();
							$(this).prop("checked", true);
						}else{
							$(this).prop("checked", false);
							return;
						}
					})
		}
		
		if($(this).is(":checked") == false){
			swal("ネイバーでログインした後で解除されます。連動を開場しますか。", {
				buttons: {
					  cancel: {
						    text: "cancel",
						    value: false,
						    visible: true,
						    closeModal: true,
						  },
						  confirm: {
						    text: "disconnect",
						    value: true,
						    visible: true,
						    closeModal: true
						  }
				}
					}).then((result) => {
						if(result){
							// 네이버 아이디 삭제
							$(this).prop("checked", false);
							location.href='jp.disconnect.sns';
						}else{
							$(this).prop("checked", true);
							return;
						}
					})
		}
	});
	
	// 하이픈 생성(마이페이지 전화번호)
	$("#mypage_phone").keyup(function() {
		var autoHypenPhone = function(str){
		      str = str.replace(/[^0-9]/g, '');
		      var tmp = '';
		      if( str.length < 4){
		          return str;
		      }else if(str.length < 7){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3);
		          return tmp;
		      }else if(str.length < 11){
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 3);
		          tmp += '-';
		          tmp += str.substr(6);
		          return tmp;
		      }else{              
		          tmp += str.substr(0, 3);
		          tmp += '-';
		          tmp += str.substr(3, 4);
		          tmp += '-';
		          tmp += str.substr(7);
		          return tmp;
		      }
		      return str;
		}
		this.value = autoHypenPhone( this.value ); 
	})
	
	//이름 필수
	  $('#mypage_name').blur(function() {
			
			let name = $(this);
			
			if(isEmpty(name)){
				$('#mypage_name_error').text('氏名を入力してください。');
				$('#mypage_name_error').css('color','red');
			}else{
				$('#mypage_name_error').text('');
				$('#mypage_name_error').css('color','blue');
			}
			
			});
	
	//닉네임 중복 및 빈칸
	  $('#mypage_nickname').blur(function() {
			
			let nickname = $(this);
			
			// 닉네임 중복확인
			$.ajax({
				url : "jp.nick.check",
				type : "GET",
				dataType : "text",
				data : {"userNickname" : nickname.val()},
				success : function(getData){
					console.log(getData);
					if(getData == '' || getData == nickname.val()){
						if(isEmpty(nickname)){
							$('#mypage_nickname_error').text('ニックネームを入力してください。');
							$('#mypage_nickname_error').css('color','red');
						}else{
							$('#mypage_nickname_error').text('使えるニックネームです。');
							$('#mypage_nickname_error').css('color','blue');
						}
					}else{
						$('#mypage_nickname_error').text('使えないニックネームです。');
						$('#mypage_nickname_error').css('color','red');
					}
				},
				error : function(request,status,error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			
			});
	  
		//핸드폰 필수
	  $('#mypage_phone').blur(function() {
			
			let name = $(this);
			
			if(isEmpty(name)){
				$('#mypage_phone_error').text('電話番号を入力してください。');
				$('#mypage_phone_error').css('color','red');
			}else{
				$('#mypage_phone_error').text('');
				$('#mypage_phone_error').css('color','blue');
			}
			
			});
	  
		//이메일 필수
	  $('#mypage_email').blur(function() {
			
			let name = $(this);
			
			if(isEmpty(name)){
				$('#mypage_email_error').text('メールアドレスを入力してください。');
				$('#mypage_email_error').css('color','red');
			}else{
				$('#mypage_email_error').text('');
				$('#mypage_email_error').css('color','blue');
			}
			
			});
	
});

//마이페이지 회원만 이용가능
function mypageCheckUser(){
	
		let id = $("#userID");
		//alert(id.val());
		
		$.ajax({
			url: 'jp.id.check',
			type : 'GET',
			dataType : 'text',
			data : {'userID' : id.val()},
			success : function(result) {
				console.log(result);
				if(result == 0){
					swal("ログインしてください。");
					return false;
				} else{
					location.href="jp.mypage.myinfo.go";
					return true;
				}
				
			},
			error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			swal("問題が発生しました。もう一度利用してください。");
    			return false;
    		}
		});
		
}

// 마이페이지 내 정보 이동

function showMyinfo(){
	location.href='jp.mypage.myinfo.go'
}

// 마이페이지 정보수정 이동
function showFollowing(){
	location.href='jp.mypage.mysubscribe.go'
}

// 마이페이지 구독정보 확인
function showFollower(){
	location.href='jp.mypage.mydiary.go'
}


// 탈퇴
function deleteUser(){
	
	let pw = $("#mypage_pW");
	let id = $("#mypage_id");
	
	if(isEmpty(pw)){
		swal("パスワードを入力してください。SNS会員登録をした場合、「パスワードをお忘れの方」でパスワードを再発行してください。");
		pw.focus();
	}else{
		$.ajax({
			url: 'jp.pw.check',
			type : 'POST',
			dataType : 'text',
			data : {'userID': id.val(), 'userPW' : pw.val()},
			success : function(result) {
				console.log(result);
				if(result == 1){
					swal("脱退しますか。SNS連動の解除はネイバーやカカオトークで利用してください。", {
						buttons: {
							  cancel: {
								    text: "cancel",
								    value: false,
								    visible: true,
								    closeModal: true,
								  },
								  confirm: {
								    text: "脱退",
								    value: true,
								    visible: true,
								    closeModal: true
								  }
						}
							}).then((result) => {
								if(result){
									location.href="jp.delete.do";
								}
							})
				}else{
					swal("パスワードを確認してください。");
				}
			},
			error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			swal("問題が発生しました。もう一度利用してください。");
    			return false;
    		}
		});
	}
}

function updateValidCheck(){
	
	let pw = $("#mypage_pW");
	let name = $("#mypage_name");
	let nickname = $("#mypage_nickname");
	let phone = $("#mypage_phone");
	let email = $("#mypage_email");
	
	let nameError = $('#mypage_name_error').css("color");
	let nickError = $('#mypage_nickname_error').css("color");
	let phoneError = $('#mypage_phone_error').css("color");
	let emailError = $('#mypage_email_error').css("color");
	
	
	if(isEmpty(name) || nameError == 'rgb(255, 0, 0)'){
		name.focus();
		if(isEmpty(name)){
			$('#join_name_error').text('氏名を入力してください。');
			$('#join_name_error').css('color','red');
		}
		return false;
	} else if (isEmpty(nickname) || nickError == 'rgb(255, 0, 0)'){
		nickname.focus();
		if(isEmpty(nickname)){
			$('#join_nickname_error').text('ニックネームを入力してください。');
			$('#join_nickname_error').css('color','red');
		}
		return false;
	} else if(isEmpty(phone) || phoneError == 'rgb(255, 0, 0)'){
		phone.focus();
		if(isEmpty(phone)){
			$('#join_phone_error').text('電話番号を入力してください。');
			$('#join_phone_error').css('color','red');
		}
		return false;
	} else if(isEmpty(email) || emailError == 'rgb(255, 0, 0)'){
		email.focus();
		if(isEmpty(email)){
			$('#join_email_error').text('メールアドレスを入力してください。');
			$('#join_email_error').css('color','red');
		}
		return false;
	}
	
	if(isEmpty(pw)){
		swal("パスワードを入力してください。");
		pw.focus();
		return false;
	}
	return true;
}

function changePWValidCheck(){
	
	var flag = true;
	
	let newPW = $("#mypage_new_pw");
	let newPWCheck = $("#mypage_pw_check");
	let oldPW = $("#mypage_old_pw");
	let id = $("#mypage_id")
	
	if(isEmpty(newPW)){
		$('#mypage_newPW_error').text('新しいパスワードを入力してください。');
		$('#mypage_newPW_error').css('color','red');
		newPW.focus();
		return false;
	}else if(lessThan(newPW, 8) || containsHS(newPW)){
		$('#mypage_newPW_error').text('英語小文字、半角数字で号8〜16文字で入力してください。');
		$('#mypage_newPW_error').css('color','red');
		newPW.focus();
		return false;
	}else{
		$('#mypage_newPW_error').text('');
	}
	
	if(isEmpty(newPWCheck)){
		$('#mypage_newPWCheck_error').text('パスワードを入力してください。')
		$('#mypage_newPWCheck_error').css('color','red');
		newPWCheck.focus();
		return false;
	}else if(notEquals(newPW, newPWCheck)){
		$('#mypage_newPWCheck_error').text('パスワードが一致しません。')
		$('#mypage_newPWCheck_error').css('color','red');
		newPWCheck.focus();
		return false;
	}else{
		$('#mypage_newPWCheck_error').text('')
	}
	
	if(isEmpty(oldPW)){
		$('#mypage_oldPW_error').text('現在のパスワードを入力してください。')
		$('#mypage_oldPW_error').css('color','red');
		oldPW.focus();
		return false;
	}else{
		$.ajax({
			url: 'jp.pw.check',
			type : 'POST',
			dataType : 'text',
			data : {'userID': id.val(), 'userPW' : oldPW.val()},
			async: false,
			success : function(result) {
				console.log(result);
				if(result == 1){
					$('#mypage_oldPW_error').text('')
					flag = true;
				}else{
					$('#mypage_oldPW_error').text('パスワードが間違っています。')
					$('#mypage_oldPW_error').css('color','red');
					oldPW.focus();
					flag = false;
				}
			},
			error : function(request,status,error) {
    			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			swal("問題が発生しました。もう一度利用してください。");
    			flag = false;
    		}
		});
		return flag;
	}
	
	return true;
}