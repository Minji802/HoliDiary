<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div class="mypage_index" onclick="showMyinfo()">
				<span>My Page</span>
			</div>
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showFollowing()">
				<span style="color: #6667AB;">My Subscribe</span>
			</div>
			<div class="mypage_index" onclick="showFollower()">
				<span>My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_mysub_title">
						나의 구독자
						<a href="mypage.mysubscribe.go">나의 구독</a>
					</div>
				</div>
				<div class="mypage_mysub_search">
					<input id="mysubscriberSearch" placeholder="닉네임 다이어리명으로 검색">
					<button onclick="mysubscriberSearch()">검색</button>
				</div>
				<div class="mypage_mysub_scroll">
					<c:forEach var="info" items="${infos}">
						<div id="mysub_info_list_box" onclick="mypagePopup('${info.userID }')">
							<div class="mysub_info_img_box">
								<img src="./resources/kjs_profileImg/${info.userImg}">
							</div>
							<div class="mysub_info_nickname">${info.userNickname}</div>
							<div class="mysub_info_diarytitle">${info.diaryTitle}</div>
							<c:choose>
								<c:when test="${info.subCheck eq 'yes'}">
									<div class="mysub_info_canclesub">
										<button type="button" onclick="event.stopPropagation();subscribeCancel('${info.userID}');">구독취소</button>
									</div>
								</c:when>
								<c:when test="${info.subCheck eq 'no'}">
									<div class="mysub_info_canclesub">
										<button type="button" onclick="event.stopPropagation();subscribeDo('${info.userID }');">구독</button>
									</div>
							</c:when>
							</c:choose>
						</div>
					</c:forEach>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				</div>
			</div>
		</div>
	</div>
</body>
</html>