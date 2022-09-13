<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showMyinfo()">
				<span style="color: #6667AB;">My Page</span>
			</div>
			<div  class="mypage_index"
				onclick="showFollowing()">
				<span>My Subscribe</span>
			</div>
			<div class="mypage_index"
				onclick="showFollower()">
				<span>My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_changePW_title">
						<span>パスワード変更</span><span style="font-size: 12pt; color: red; margin-left: 20px;">${result}</span>
					</div>
					<form action="update.pw" method="post" onsubmit="return changePWValidCheck()">
					<div class="mypage_changePW_content_box">
						<div class="mypage_changePW_input_box">
							<div>
								<span>新しいパスワード</span>
								<span class="mypage_changePW_error" id="mypage_newPW_error"></span>
							</div>
							<input type="password" id="mypage_new_pw" name="userPW" placeholder="英語小文字、半角数字で号8〜16文字" maxlength="16">
						</div>
						<div class="mypage_changePW_input_box">
							<div>
								<span>パスワード確認</span><span class="mypage_changePW_error" id="mypage_newPWCheck_error"></span>
							</div>
							<input type="password" id="mypage_pw_check" placeholder="確認のためパスワードを再入力してください">
						</div>
						<div class="mypage_changePW_input_box">
							<div>
								<span>現在のパスワード</span><span class="mypage_changePW_error" id="mypage_oldPW_error"></span>
							</div>
							<input type="password" id="mypage_old_pw" placeholder="現在のパスワード確認">
							<input type="hidden" id="mypage_id" name="userID" value="${sessionScope.loginUser.userID}">
						</div>
						<div class="mypage_changePW_btn">
							<button>パスワード変更</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>