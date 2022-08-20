<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="content_mypage">

		<div id="mypage_page_box">
			<div class="mypage_index"><span>My Page</span></div>
			<div class="mypage_index"><span>정보수정</span></div>
			<div class="mypage_index"><span>구독정보</span></div>
			<div class="mypage_content_box">
				<div id="mypage_myinfo">
					<div>나의 정보 가져오기</div>
					<div><img src="resources/kjs_profileImg/${sessionScope.loginUser.userImg }"></div>
					<div>${sessionScope.loginUser.userID}</div>
					<div>${sessionScope.loginUser.userName}</div>
					<div>${sessionScope.loginUser.userPhoneNumber}</div>
					<div>${sessionScope.loginUser.userNickname}</div>
				</div>
				<div id="mypage_modify_checkPW">
					<div>비밀번호 확인</div>
					<div><input></div>
				</div>
				<div id="mypage_modify">
					<div>정보 수정하기</div>
					<div><img src="resources/kjs_profileImg/${sessionScope.loginUser.userImg }"></div>
					<div>${sessionScope.loginUser.userID}</div>
					<div>${sessionScope.loginUser.userName}</div>
					<div>${sessionScope.loginUser.userPhoneNumber}</div>
					<div>${sessionScope.loginUser.userNickname}</div>
					<button onclick="">수정</button>
					<button onclick="deleteUser()">탈퇴</button>
				</div>
				<div id="mypage_subscribe">
					<div>구독정보</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>