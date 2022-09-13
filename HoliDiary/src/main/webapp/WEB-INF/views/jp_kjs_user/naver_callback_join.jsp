<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<script type="text/javascript">

  var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/jp.social.login.naver");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //console.log(naver_id_login.getProfileData('name'));
    //console.log(naver_id_login.getProfileData('nickname'));
    //console.log(naver_id_login.getProfileData('id'));
    //console.log(naver_id_login.getProfileData('email'));
    //console.log(naver_id_login.getProfileData('profile_image'));
    
    let name = naver_id_login.getProfileData('name');
    let nickname = naver_id_login.getProfileData('nickname');
    let naverID = naver_id_login.getProfileData('id');
    let email = naver_id_login.getProfileData('email');
    let profile_image = naver_id_login.getProfileData('profile_image');
    if(profile_image == null){
    	profile_image = "person-3093152.jpg";
    }
    let id = email.split('@')[0];
    let userStr = naverID.substr(0,7);
    //alert(userStr);
    let pw = Math.random().toString(36).substring(2, 12);
    //console.log(email.split('@')[0]);
    
      $.ajax({
		url : "jp.id.check",
		type : "GET",
		dataType : "text",
		data : {"naverID" : naverID,
				"userID" : id
		},
		success : function(getData){
			//console.log(getData);
			if(getData == 0){
				// 회원가입을 시킨다
 				$.ajax({
					url : "jp.join.naver",
					type : "POST",
					dataType : "json",
					data : {"userID": id, 
						"userPW": pw,
						"userName": name,
						"userPhoneNumber": "없음",
						"userEmail": email,
						"userImg": profile_image,
						"userDiaryUrl": "http://localhost/main/popup.open?userId=" + id,
						"userNickname": nickname + userStr,
						"naverID": naverID
					},
					success : function(result) {
						//console.log(result);
						if(result == 1){
							window.close();
							window.opener.location.href= "http://localhost/main/jp.social.login.naver?naverID=" + naverID + "&naver_token=" + naver_id_login.oauthParams.access_token;
						}
					},
					error : function(request, status, error) {
						console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						swal("会員登録に失敗しました。一般会員登録を利用してください。");
							window.close();
					}
				}); 

			}else if(getData == 2){
				swal("登録している会員です。会員登録をしたことがない場合、会員登録をした後ネイバー連動をしてください。");
				window.close();
			}else{
				swal("すでに登録している会員です。");
				window.close();
			}
		},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			swal("問題が発生しました。もう一度利用してください。");
		} 
  })
     
  }

</script>
	

</body>
</html>