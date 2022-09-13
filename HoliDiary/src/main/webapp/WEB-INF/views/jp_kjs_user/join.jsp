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
		<div id="join_title_box"><span>会員登録</span></div>
		<form action="jp.join.do" method="post" name="joinForm" onsubmit="return joinCheck()">
			<div id="join_box">
				<span class="join_span">氏名<span id="join_name_error"></span></span>
				<div class="join_input_box">
					<input id="join_name" name="userName" autocomplete="off" placeholder="必須">
				</div>
				<span class="join_span">ニックネーム<span id="join_nickname_error"></span></span>
				<div class="join_input_box">
					<input id="join_nickname" name="userNickname" autocomplete="off" placeholder="必須">
				</div>
				<span class="join_span">ID<span id="join_id_error"></span></span>
				<div class="join_input_box">
					<input id="join_id" name="userID" autocomplete="off" maxlength="20" placeholder="英語小文字、半角数字で号5〜20文字">
				</div>
				<span class="join_span">パスワード<span id="join_pw_error"></span></span>
				<div class="join_input_box">
					<input type="password" id="join_pw" name="userPW" autocomplete="off" maxlength="16" placeholder="英語小文字、半角数字で号8〜16文字">
				</div>
				<span class="join_span">パスワード確認<span id="join_pwCheck_error"></span></span>
				<div class="join_input_box">
					<input type="password" id="join_pwCheck" name="pwCheck" autocomplete="off" placeholder="確認のためパスワードを再入力してください">
				</div>
				<span class="join_span">電話番号<span id="join_phone_error"></span></span>
				<div class="join_input_box">
					<input id="join_phone" name="userPhoneNumber" maxlength="15" autocomplete="off" placeholder="必須">
				</div>
				<span class="join_span">メールアドレス<span id="join_email_error"></span></span>
				<div class="join_input_box">
					<input id="join_email" name="userEmail" autocomplete="off" placeholder="必須">
				</div>
				<div class="join_file_box">
					<input type="hidden" name="userImg" value="person-3093152.jpg">
				</div>
				<div>
				<!-- http://localhost/main/popup.open -->
					<input type="hidden" name="userDiaryUrl" autocomplete="off">
				</div>
				<div class="join_btn_box">
					<button>登録</button>
				</div>
			</div>
		</form>
	
	</div>
</body>
</html>