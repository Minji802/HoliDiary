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
		<div id="join_title_box"><span>회원가입</span></div>
		<form action="join.do" method="post" name="joinForm" onsubmit="return joinCheck()">
			<div id="join_box">
				<span class="join_span">이름<span id="join_name_error"></span></span>
				<div class="join_input_box">
					<input id="join_name" name="userName" autocomplete="off" placeholder="필수">
				</div>
				<span class="join_span">닉네임<span id="join_nickname_error"></span></span>
				<div class="join_input_box">
					<input id="join_nickname" name="userNickname" autocomplete="off" placeholder="필수">
				</div>
				<span class="join_span">아이디<span id="join_id_error"></span></span>
				<div class="join_input_box">
					<input id="join_id" name="userID" autocomplete="off" maxlength="20" placeholder="5~20자 영문 소문자, 숫자">
				</div>
				<span class="join_span">비밀번호<span id="join_pw_error"></span></span>
				<div class="join_input_box">
					<input type="password" id="join_pw" name="userPW" autocomplete="off" maxlength="16" placeholder="8~16자 대 소문자, 숫자 사용">
				</div>
				<span class="join_span">비밀번호 확인<span id="join_pwCheck_error"></span></span>
				<div class="join_input_box">
					<input type="password" id="join_pwCheck" name="pwCheck" autocomplete="off" placeholder="비밀번호를 다시 입력해주세요">
				</div>
				<span class="join_span">핸드폰번호<span id="join_phone_error"></span></span>
				<div class="join_input_box">
					<input id="join_phone" name="userPhoneNumber" maxlength="15" autocomplete="off" placeholder="전화번호 입력">
				</div>
				<span class="join_span">이메일<span id="join_email_error"></span></span>
				<div class="join_input_box">
					<input id="join_email" name="userEmail" autocomplete="off" placeholder="필수">
				</div>
				<div class="join_file_box">
					<input type="hidden" name="userImg" value="person-3093152.jpg">
				</div>
				<div>
				<!-- http://localhost/main/popup.open -->
					<input type="hidden" name="userDiaryUrl" autocomplete="off">
				</div>
				<div class="join_btn_box">
					<button>가입하기</button>
				</div>
			</div>
		</form>
	
	</div>
</body>
</html>