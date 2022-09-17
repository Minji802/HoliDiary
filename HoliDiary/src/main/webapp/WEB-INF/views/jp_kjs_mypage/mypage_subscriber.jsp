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
				onclick="showSubscribeInfo()">
				<span style="color: #6667AB;">My Subscribe</span>
			</div>
			<div class="mypage_index" onclick="showMyDiary()">
				<span>My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_mysub_title">
						登録者
						<a href="jp.mypage.mysubscribe.go">登録情報</a>
					</div>
				</div>
				<div class="mypage_mysub_search">
					<input id="mysubscriberSearch" placeholder="ニックネームまたはダイアリー検索"">
					<button onclick="mysubscriberSearch()">検索</button>
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
										<button type="button" onclick="event.stopPropagation();subscribeCancel('${info.userID}');">登録キャンセル</button>
									</div>
								</c:when>
								<c:when test="${info.subCheck eq 'no'}">
									<div class="mysub_info_canclesub">
										<button type="button" onclick="event.stopPropagation();subscribeDo('${info.userID }');">ダイアリー登録</button>
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