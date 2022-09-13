// 카카오 소셜 로그인을 위한 초기 설정
Kakao.init('4341fa67ca594172a2669bd0ccaf89fc');
//console.log('카카오톡 권한 : ' + Kakao.isInitialized());

// 카카오톡으로 로그인 하기
function loginWithKakao() {
	
	  Kakao.Auth.login({
      success: function(authObj) {
        //alert(JSON.stringify(authObj));
        Kakao.API.request({
		          url: '/v2/user/me',
		          success: function(res) {
		            //console.log(JSON.stringify(res));
		            let kakaoID = res.id;
		            let email = res.kakao_account["email"];
		            let id = email.split('@')[0];
		            $.ajax({
		        		url : "jp.id.check",
		        		type : "GET",
		        		dataType : "text",
		        		data : {"kakaoID" : kakaoID, "userID" : id},
		        		success : function(getData){
		        			//alert(getData);
		        			if(getData == 1){
		        				Kakao.Auth.authorize({
		        					redirectUri: 'http://localhost/main/jp.social.kakao'
		        				})
		        			}else if(getData == 2 || getData == 0){
		        				swal("会員登録をしてください");
		        			}
		        		},
		        		error : function(request,status,error) {
		        			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        		}
		        	});
		          },
		          fail: function(error) {
		        	  console,log('login success, but failed to request user information: ' +
				                JSON.stringify(error))
		          },
		        })
      },
      fail: function(err) {
    	  swal(JSON.stringify(err));
      },
    })
	
	
	
	
    
  }

// 카카오로 회원가입
function joinWithKakao() {
	Kakao.Auth.login({
	      success: function(authObj) {
	        //alert(JSON.stringify(authObj))
	        Kakao.API.request({
			          url: '/v2/user/me',
			          success: function(res) {
			            //alert(JSON.stringify(res))
			            let kakaoID = res.id;
			            let email = res.kakao_account["email"];
			            let id = email.split('@')[0];
			            $.ajax({
			        		url : "jp.id.check",
			        		type : "GET",
			        		dataType : "text",
			        		data : {"kakaoID" : kakaoID, "userID" : id},
			        		success : function(getData){
			        			console.log(getData);
			        			if(getData == 1){
			        				swal("すでに登録している会員です。");
			        			}else if(getData == 2){
			        				swal("登録している会員です。会員登録をしたことがない場合、会員登録をした後カカオトーク連動をしてください。");
			        			} else {
			        				Kakao.Auth.authorize({
			        					redirectUri: 'http://localhost/main/jp.social.kakao'
			        				})
			        			}
			        		},
			        		error : function(request,status,error) {
			        			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			        			swal("問題が発生しました。もう一度利用してください。");
			        		}
			        	});
			          },
			          fail: function(error) {
			        	  console,log('login success, but failed to request user information: ' +
					                JSON.stringify(error))
					      swal("問題が発生しました。もう一度利用してください。");
			          },
			        })
	      },
	      fail: function(err) {
	    	  //swal(JSON.stringify(err));
	    	  swal("問題が発生しました。もう一度利用してください。");
	      },
	    })
}
