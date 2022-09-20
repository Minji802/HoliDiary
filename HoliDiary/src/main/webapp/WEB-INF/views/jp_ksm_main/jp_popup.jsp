<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="resources/jp_sm_js/jp_sm_musicJs.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="resources/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="styleSheet" href="resources/summernote/summernote-lite.css">
<link rel="stylesheet" href="resources/sm_css/sm_music.css">
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<link rel="styleSheet" href="resources/mj_css/postList.css">
<link rel="stylesheet" href="resources/mj_css/postDetail.css">
<link rel="stylesheet" href="resources/mj_css/likeButton.css">
<link rel="stylesheet" href="resources/mj_css/guestBook.css">
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="resources/mj_css/mj_write.css">
<script type="text/javascript" src="resources/jp_sm_js/jp_sm_popupJs.js"></script>
<script type="text/javascript" src="resources/kjs_js/kjs_subscribe.js"></script>
<script type="text/javascript" src="resources/jp_sm_js/jp_sm_valid.js"></script>
<script type="text/javascript" src="resources/jp_sm_js/jp_sm_validCheck.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	$(function() {
		document.addEventListener("contextmenu", function(e) {
			e.preventDefault(); // 원래 있던 오른쪽 마우스 이벤트를 무효화
			var x = e.pageX + 'px'; // 현재 마우스의 X좌표
			var y = e.pageY + 'px'; // 현재 마우스의 Y좌표
			const popMenu = document.getElementById('popMenu'); // 팝업창을 담아옴
			/*
			    스타일 지정, 우클릭 한 위치에 팝업창 띄워줌.
			 */
			popMenu.style.position = 'relative';
			popMenu.style.left = x;
			popMenu.style.top = y;
			popMenu.style.display = 'block';
		})
		document.addEventListener("click", function(e) {
			if (e.keyCode == 3) {
				// 노출 초기화
				popMenu.style.display = 'none';
				popMenu.style.top = null;
				popMenu.style.left = null;
			}
		});

	});
</script>
<style type="text/css">
/* 토글영역 */
#toggle {
	display: block;
	width: 28px;
	height: 30px;
	margin: 30px auto 10px;
}

#toggle span:after, #toggle span:before {
	content: "";
	position: absolute;
	left: 0;
	top: -9px;
}

#toggle span:after {
	top: 9px;
}

#toggle span {
	position: relative;
	display: block;
}

#toggle span, #toggle span:after, #toggle span:before {
	width: 100%;
	height: 5px;
	background-color: #888;
	transition: all 0.3s;
	backface-visibility: hidden;
	border-radius: 2px;
}

/* on activation */
#toggle.on span {
	background-color: transparent;
}

#toggle.on span:before {
	transform: rotate(45deg) translate(5px, 5px);
}

#toggle.on span:after {
	transform: rotate(-45deg) translate(7px, -8px);
}

#toggle.on+#menu {
	opacity: 1;
	visibility: visible;
}

/* menu appearance*/
#menu {
	position: absolute;
	color: #999;
	width: 300px;
	height: 300px;
	padding: 100px;
	font-family: "Segoe UI", Candara, "Bitstream Vera Sans", "DejaVu Sans",
		"Bitstream Vera Sans", "Trebuchet MS", Verdana, "Verdana Ref",
		sans-serif;
	text-align: center;
	border-radius: 4px;
	background: white;
	box-shadow: 0 1px 8px rgba(0, 0, 0, 0.05);
	/* just for this demo */
	opacity: 0;
	visibility: hidden;
	transition: opacity .4s;
	z-index: 1000;
	margin-left: 0px;
	margin-top: 50px;
	border: 1px solid #999;
	box-shadow: 4px 0px 4px 0px rgba(222, 222, 222, 0.3);
}

ul, li, li a {
	list-style: none;
	display: block;
	margin: 0;
	padding: 0;
}

li a {
	padding: 5px;
	color: #888;
	text-decoration: none;
	transition: all .2s;
}

li a:hover, li a:focus {
	color: #fff;
}

/* demo styles */
body {
	background: #eee;
	color: #555;
	font-family: "Open Sans", "Segoe UI", Helvetica, Ar ial, sans-serif;
}
</style>
</head>
<body style="background: ${Diary.themeColor}">

	<!-- 우클릭 시 메뉴 -->
	<c:if test="${Diary.diaryUserId eq sessionScope.loginUser.userID }">
		<ul class="contextmenu">
			<li><a href="jp_write.go?userId=${sessionScope.loginUser.userID }">投稿を作成</a></li>
			<li><a
				href="jp_mainImg.updateGo?userId=${sessionScope.loginUser.userID }">ホーム編集</a></li>
			<li><a
				href="jp_updateMyPopup?userId=${sessionScope.loginUser.userID }">ダイアリー編集</a></li>
			<li><a
				href="jp_updateCategory?userId=${sessionScope.loginUser.userID }">カテゴリー編集</a></li>
			<li><a
				href="jp_advicePage?userId=${sessionScope.loginUser.userID }">ヘルプ</a></li>
		</ul>
	</c:if>

	<!-- 유저 이미지/닉네임/소개 -->
	<div class="app-wrapper">
		<div class="left-area hide-on-mobile">
			<div class="app-header"></div>
			<div class="left-area-content">

				<div class="profile">
					<a><img src="resources/kjs_profileImg/${User.userImg }" alt=""></a>
					<span class="profile-name">${User.userID}</span>
				</div>


				<!-- 좌측 카테고리 리스트 -->
				<div class="page-link-list">
					<a href="jp_popupHomeGo?userId=${User.userID}" class="item-link"
						id="pageLink"> <svg class="link-icon" fill="none"
							stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							class="feather feather-home" viewBox="0 0 24 24">
            <defs />
            <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
            <path d="M9 22V12h6v10" /></svg> Home
					</a>

					<c:if test="${Diary.diaryUserId eq sessionScope.loginUser.userID }">
						<a href="jp_popupScheduleGo?userId=${User.userID}" class="item-link"
							id="pageLink"> <svg class="link-icon"
								xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
								class="feather feather-clock">
            <circle cx="12" cy="12" r="10" />
            <polyline points="12 6 12 12 16 14" /></svg> Schedule
						</a>
					</c:if>
					<a href="jp_guestBookGo?userId=${User.userID}" class="item-link"
						id="pageLink"> <svg class="link-icon"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							fill="none" stroke="currentColor" stroke-width="2"
							stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-play">
            <path d="M5 3l14 9-14 9V3z" />
          </svg> Guest Book
					</a>
				</div>
				<div class="list-header">
					<span class="category-item">My Diary</span>

				</div>
				<div>
					<a href="jp_post-list?userId=${User.userID}&nowPage=1&cntPerPage=10"
						class="item-link" id="pageLink"> <svg class="link-icon"
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg> DIARY POST
					</a>

<!-- 카테고리 수정 &삭제 & 추가 -->


					<c:forEach var="category" varStatus="status"
						items="${Diary.categoriesArray }">
						<a
							href="jp_category-list?userId=${User.userID}&nowPage=1&cntPerPage=10&category=${category }"
							class="item-link il-${status.count }" id="pageLink"> <svg
								class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16"
								height="16" viewBox="0 0 24 24" fill="none"
								stroke="currentColor" stroke-width="2" stroke-linecap="round"
								stroke-linejoin="round" class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg> ${category }
						</a>

					</c:forEach>
				</div>


			</div>


			<c:choose>
				<c:when
					test="${Diary.diaryUserId eq sessionScope.loginUser.userID }">
					<button class="btn-invite"
						onclick="location.href='jp_updateMyPopup?userId=${sessionScope.loginUser.userID }'"
						style="background: ${Diary.themeColor}">ダイアリー編集</button>
				</c:when>
				<c:otherwise>
					<button class="btn-invite"
						onclick="location.href='jp_popupHomeGo?userId=${sessionScope.loginUser.userID }'"
						style="background: ${Diary.themeColor}">My ダイアリーへ</button>
				</c:otherwise>
			</c:choose>


		</div>

		<!-- 우측 타이틀/콘텐트 영역 -->
		<div class="right-area">
			<div class="right-area-upper">

				<button class="menu-button">
					<svg width="24" height="24" fill="none" stroke="#51a380"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
          <defs />
          <path d="M3 12h18M3 6h18M3 18h18" />
        </svg>
				</button>

				<div class="search-part-wrapper">
					<div class="diary-title-name">${Diary.diaryTitle }</div>
					<button class="more-button">
						<svg width="24" height="20" fill="none" stroke="#51a380"
							stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
							class="feather feather-more-vertical">
            <defs />
            <circle cx="12" cy="12" r="1" />
            <circle cx="12" cy="5" r="1" />
            <circle cx="12" cy="19" r="1" />
          </svg>
					</button>
				</div>


				<c:choose>
					<c:when
						test="${Diary.diaryUserId eq sessionScope.loginUser.userID }">
						<div class="action-buttons-wrapper">
							<button class="action-buttons btn-upload"
								onclick="location.href='jp_write.go?userId=${sessionScope.loginUser.userID }'"
								style="background: ${Diary.themeColor}">投稿を作成</button>
						</div>
					</c:when>
					<c:when test="${not empty Subcribe}">
						<div class="action-buttons-wrapper">
							<button class="action-buttons btn-upload"
								style="background: ${Diary.themeColor}"
								onclick="subscribeCancel('${Diary.diaryUserId}');">登録キャンセル</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="action-buttons-wrapper">
							<button class="action-buttons btn-upload"
								style="background: ${Diary.themeColor}"
								onclick="subscribeDo('${Diary.diaryUserId}');">ダイアリー登録</button>
						</div>
					</c:otherwise>
				</c:choose>


			</div>

			<div class="page-right-content">
				<!-- 우측 메인 컨텐트 페이지 -->

				<jsp:include page="${popupContentPage }"></jsp:include>

			</div>
		</div>

	</div>

</body>
</html>