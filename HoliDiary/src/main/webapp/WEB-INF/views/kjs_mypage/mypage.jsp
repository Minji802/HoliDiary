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
			<div class="mypage_index" id="mypage_index_info"
				onclick="showMyinfo()">
				<span style="color: #6667AB;">My Page</span>
			</div>
			<div class="mypage_index" id="mypage_index_modi"
				onclick="showFollowing()">
				<span>나의구독</span>
			</div>
			<div class="mypage_index" id="mypage_index_sub"
				onclick="showFollower()">
				<span>다이어리 통계</span>
			</div>
			<div class="mypage_content_box">
				<div id="mypage_myinfo">
					<div class="mypage_myinfo_title">나의 정보</div>
					<form action="update.do" method="post" enctype="multipart/form-data" onsubmit="return modifyUser();">
					<div style="text-align: center;">
						<div class="mypage_myinfo_left">
							<div class="mypage_myinfo_img">
								<img id="mypage_img" alt="${sessionScope.loginUser.userImg}"
									src="./resources/kjs_profileImg/${sessionScope.loginUser.userImg }">
								<div class="mypage_myinfo_img_change">
    								<label for="mypage_img_file">사진수정</label> 
    								<input type="file" onchange="readURL(this)" name="userImg" id="mypage_img_file" readonly/>
								</div>
							</div>
							<div class="mypage_myinfo_left_txt">
								<span>마이다이어리URL</span>${sessionScope.loginUser.userDiaryUrl}</div>
							<div class="mypage_myinfo_left_txt">소셜 로그인 연동</div>
							<div class="mypage_myinfo_left_txt">
								<input type="checkbox"> <span>카카오</span>${sessionScope.loginUser.kakaoID}
							</div>
							<div class="mypage_myinfo_left_txt">
								<input type="checkbox"> <span>네이버</span>${sessionScope.loginUser.naverID}
							</div>
						</div>
						<div class="myapge_myinfo_right">
						
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>아이디</span>
								</div>
								<input id="mypageID" name="userID" value="${sessionScope.loginUser.userID}" readonly/>
							</div>
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>이름</span>
								</div>
								<input name="userName" value="${sessionScope.loginUser.userName}">
							</div>
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>닉네임</span>
								</div>
								<input name="userNickname" value="${sessionScope.loginUser.userNickname}">
							</div>
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>핸드폰</span>
								</div>
								<input name="userPhoneNumber" value="${sessionScope.loginUser.userPhoneNumber}">
							</div>
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>이메일</span>
								</div>
								<input name="userEmail" value="${sessionScope.loginUser.userEmail}">
							</div>
							<div class="myapge_myinfo_right_txt">
								<div>
									<span>비밀번호</span>
								</div>
								<input type="password" id="mypagePW" name="userPW" placeholder="비밀번호 확인">
								<span style="color: red; font-size: 12pt;">${error}</span>
							</div>
							<div style="font-family:'GangwonEdu_OTFBoldA'; color: red; text-align: right;">${result}</div>
							<div class="myapge_myinfo_right_btn_box">
								<button>정보수정</button>
								<button type="button" onclick="deleteUser()">회원탈퇴</button>
							</div>
						</div>
					</div>
				</form>
				</div>
				<div id="mypage_following">
					<div>내가 구독하는 사람들</div>
				</div>
				<div id="mypage_follower">
					<div>나를 구독하는 사람들</div>
					<div>나를 구독하는 통계</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	// 바로 사진 보이기
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('mypage_img').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('mypage_img').src = "";
		  }
		}
	</script>
</body>
</html>