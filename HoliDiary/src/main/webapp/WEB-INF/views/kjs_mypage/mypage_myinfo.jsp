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
					<div class="mypage_myinfo_title">나의 정보 
						<span style="color: red; font-size: 12pt;">${error}</span>
					</div>
					<form action="update.do" method="post"
						enctype="multipart/form-data" onsubmit="return updateValidCheck();">
						<div style="text-align: center;">
							<div class="mypage_myinfo_left">
								<div class="mypage_myinfo_img">
								<c:choose>
								<c:when test="${fn:contains(sessionScope.loginUser.userImg, 'https')}">
									<img id="mypage_img" alt="${sessionScope.loginUser.userImg}"
										src="${sessionScope.loginUser.userImg }">
								</c:when>
								<c:otherwise>
									<img id="mypage_img" alt="${sessionScope.loginUser.userImg}"
										src="./resources/kjs_profileImg/${sessionScope.loginUser.userImg }">
								</c:otherwise>
								</c:choose>
									<div class="mypage_myinfo_img_change">
										<label for="mypage_img_file">사진수정</label> <input type="file"
											onchange="readURL(this)" name="userImg" id="mypage_img_file"
											readonly />
									</div>
								</div>
								<div class="mypage_myinfo_social_box">
									<div class="mypage_myinfo_social_title">소셜 아이디 연동</div>
									<div class="mypage_myinfo_social_kakao">
										<img src="./resources/kjs_img/kakaotalk_logo.png"> 
										<div style="position: absolute; left: 50px;">
											<label class="social_switch"> 
												<c:choose>
													<c:when test="${empty sessionScope.loginUser.kakaoID}">
													<input id="mypage_kakao_checkbox" type="checkbox">
													</c:when>
													<c:otherwise>
													<input id="mypage_kakao_checkbox" type="checkbox" checked>
													</c:otherwise>
												</c:choose>
												<span class="onoff-switch"></span>
											</label>
										</div>
									</div>
									<div class="mypage_myinfo_social_naver">
										<img src="./resources/kjs_img/naver_icon.png"> 
										<div style="position: absolute; left: 50px;">
											<label class="social_switch"> 
												<c:choose>
													<c:when test="${empty sessionScope.loginUser.naverID}">
													<input id="mypage_naver_checkbox" type="checkbox">
													</c:when>
													<c:otherwise>
													<input id="mypage_naver_checkbox" type="checkbox" checked>
													</c:otherwise>
												</c:choose>
												<span class="onoff-switch"></span>
											</label>
											<!-- 네이버 로그인 버튼 노출 영역 -->
										  <div id=naver_id_login style="display: none;"></div>
										  <!-- //네이버 로그인 버튼 노출 영역 -->
										  <script type="text/javascript">
										  	var naver_id_login = new naver_id_login("rX3BsIpQkj6CJiShI2rn", "http://localhost/main/callback.connect.naver");
										  	var state = naver_id_login.getUniqState();
										  	naver_id_login.setState(state);
										  	naver_id_login.setPopup();
										  	naver_id_login.init_naver_id_login();
										  </script>
										</div>
									</div>
								</div>
							</div>
							<div class="myapge_myinfo_right">
								<div class="mypage_myinfo_mydiaryURL">
									<div id="mapage_mydiaryURL_box">
										<span>my diary</span><img src="./resources/kjs_img/down.png">
									</div>
									<div id="mapage_mydiaryURL">
										<input id="mp_mydiary_copyURL"
											value="${sessionScope.loginUser.userDiaryUrl}" readonly />
										<button type="button" id="mp_mydiary_copy_btn">copy</button>
									</div>
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>아이디</span>
									</div>
									<input id="mypageID" name="userID"
										value="${sessionScope.loginUser.userID}" readonly />
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>이름</span>
									</div>
									<input id="mypageName" name="userName"
										value="${sessionScope.loginUser.userName}">
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>닉네임</span>
									</div>
									<input id="mypageNickname" name="userNickname"
										value="${sessionScope.loginUser.userNickname}">
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>핸드폰</span>
									</div>
									<input id="mypagePhone" name="userPhoneNumber"
										value="${sessionScope.loginUser.userPhoneNumber}">
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>이메일</span>
									</div>
									<input id="mypageEmail" name="userEmail"
										value="${sessionScope.loginUser.userEmail}">
								</div>
								<div class="myapge_myinfo_right_txt">
									<div>
										<span>비밀번호 확인</span>
									</div>
									<input type="password" id="mypagePW" name="userPW" placeholder="기존 비밀번호">
								</div>
								<div
									style="font-family: 'GangwonEdu_OTFBoldA'; color: red; text-align: right;">${result}</div>
								<div class="myapge_myinfo_right_btn_box">
									<button>정보수정</button>
									<button type="button" onclick="deleteUser()">회원탈퇴</button>
								</div>
							</div>
						</div>
					</form>
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