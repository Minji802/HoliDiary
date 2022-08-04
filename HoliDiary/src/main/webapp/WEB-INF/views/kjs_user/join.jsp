<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="content_join">
	
	<!-- 유효성 검사는 마지막에 -->
		
		<form action="join.do" method="post" enctype="multipart/form-data">
			<div id="join_box">
			회원가입 ${r}
				<div>
					이름 <input name="userName" autocomplete="off">
				</div>
				<div>
					닉네임 <input name="userNickname" autocomplete="off">
				</div>
				<div>
					아이디 <input name="userID" autocomplete="off">
				</div>
				<div>
					비밀번호 <input name="userPW" autocomplete="off">
				</div>
				<div>
					비밀번호 확인 <input name="pwCheck" autocomplete="off">
				</div>
				<div>
					핸드폰번호 <input id="phoneNum" name="userPhoneNumber" autocomplete="off">
				</div>
				<div>
					이메일 <input name="userEmail" autocomplete="off">
				</div>
				<div>
					프로필 사진 <input type="file" name="userImg">
				</div>
				<div>
				<!-- http://localhost/main/popup.open -->
					다이어리 주소 <input name="userDiaryUrl" autocomplete="off">
				</div>
				<div>
					<button>회원가입</button>
				</div>
			</div>
		</form>
	
	</div>
</body>
</html>