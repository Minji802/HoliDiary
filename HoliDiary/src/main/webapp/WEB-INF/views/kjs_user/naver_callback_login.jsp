<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<script type="text/javascript">

  var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/social.login.naver");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  sessionStorage.setItem("naver_token",naver_id_login.oauthParams.access_token)
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //console.log(naver_id_login.getProfileData('name'));
    //console.log(naver_id_login.getProfileData('nickname'));
    //console.log(naver_id_login.getProfileData('id'));
    //console.log(naver_id_login.getProfileData('email'));
    //console.log(naver_id_login.getProfileData('profile_image'));
    
    let naverID = naver_id_login.getProfileData('id');
    let email = naver_id_login.getProfileData('email');
    let id = email.split('@')[0];
    console.log(naverID);
    console.log(id);

    $.ajax({
		url : "id.check",
		type : "GET",
		dataType : "text",
		data : {"naverID" : naverID, "userID" : id},
		success : function(getData){
			console.log(getData);
			if(getData == 1){
				window.close();
				window.opener.location.href = "http://localhost/main/social.login.naver?naverID=" + naverID + "&naver_token=" + naver_id_login.oauthParams.access_token;
			}else{
				swal("회원가입을 먼저 진행해주세요");
				//window.close();
			}
			},
		error : function(request,status,error) {
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			swal("문제가 발생했습니다. 다시 시도해주세요.");
			//window.close();
		} 
  })
     
  }
</script>
	
</body>
</html>