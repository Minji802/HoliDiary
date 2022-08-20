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
			<div class="mypage_index" id="mypage_index_info" onclick="showMyinfo()"><span style="color: #6667AB;">My Page</span></div>
			<div class="mypage_index" id="mypage_index_modi" onclick="showModify()"><span>정보수정</span></div>
			<div class="mypage_index" id="mypage_index_sub" onclick="showSubscribe()"><span>구독정보</span></div>
			<div class="mypage_content_box">
				<div id="mypage_myinfo">
					<div class="mypage_myinfo_title">나의 정보</div>
					<div class="mypage_myinfo_img"><img alt="${sessionScope.loginUser.userImg }" src="./resources/kjs_profileImg/${sessionScope.loginUser.userImg }"></div>
					<div>아이디 ${sessionScope.loginUser.userID}</div>
					<div>이름 ${sessionScope.loginUser.userName}</div>
					<div>닉네임 ${sessionScope.loginUser.userNickname}</div>
					<div>핸드폰 ${sessionScope.loginUser.userPhoneNumber}</div>
				</div>
				<div id="mypage_modify">
					<div>비밀번호 확인</div>
					<div>정보수정을 위해서 비밀번호 확인이 필요합니다.</div>
					<div><input placeholder="비밀번호"></div>
					<button>입력</button>
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