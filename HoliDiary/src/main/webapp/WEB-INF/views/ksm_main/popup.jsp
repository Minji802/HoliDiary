<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<link
	href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap"
	rel="stylesheet">
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>

<script type="text/javascript">
	$(function() {
		document.addEventListener("contextmenu", function(e) {

			e.preventDefault(); // 원래 있던 오른쪽 마우스 이벤트를 무효화한다.

			var x = e.pageX + 'px'; // 현재 마우스의 X좌표
			var y = e.pageY + 'px'; // 현재 마우스의 Y좌표

			const popMenu = document.getElementById('popMenu'); // 팝업창을 담아옴

			/*
			    스타일 지정, 우클릭 한 위치에 팝업창 띄워줌..
			 */
			popMenu.style.position = 'relative';
			popMenu.style.left = x;
			popMenu.style.top = y;
			popMenu.style.display = 'block';
		})
		document.addEventListener("click", function(e) {

			// 노출 초기화
			popMenu.style.display = 'none';
			popMenu.style.top = null;
			popMenu.style.left = null;

		});
	});
</script>
</head>
<body style="background: ${Diary.themeColor}">

	<ul class="contextmenu">
		<li><a href="">포스트 작성</a></li>
		<li><a href="updateCategory?userId=${sessionScope.loginUser.userID }">카테고리 편집</a></li>
		<li><a href="updateMyPopup?userId=${sessionScope.loginUser.userID }">다이어리 설정</a></li>
		<li><a href="#">도움말</a></li>
	</ul>



	<div class="app-wrapper">
		<div class="left-area hide-on-mobile">
			<div class="app-header"></div>
			<div class="left-area-content">

				<div class="profile">
					<a><img
						src="resources/kjs_profileImg/${sessionScope.loginUser.userImg }"
						alt=""></a>
						
					<details>
						<summary>
							<span class="profile-name">${sessionScope.loginUser.userNickname }</span>
						</summary>
						<p class="profile-introduce">${Diary.diaryIntroduce }</p>
					</details>
					
				</div>
				

				<div class="page-link-list">
					<a href="popupHomeGo?userId=${sessionScope.loginUser.userID }"
						class="item-link" id="pageLink"> <svg class="link-icon"
							fill="none" stroke="currentColor" stroke-linecap="round"
							stroke-linejoin="round" stroke-width="2"
							class="feather feather-home" viewBox="0 0 24 24">
            <defs />
            <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
            <path d="M9 22V12h6v10" /></svg> Home
					</a> <a href="popupScheduleGo?userId=${sessionScope.loginUser.userID }"
						class="item-link" id="pageLink"> <svg class="link-icon"
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-heart">
            <path
								d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z" />
          </svg> Schedule
					</a> <a href="#" class="item-link" id="pageLink"> <svg
							class="link-icon" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-play">
            <path d="M5 3l14 9-14 9V3z" />
          </svg>
          Map</a>
       </div>
       <div class="list-header">
        <span class="category-item">Public</span>
       
      </div>
       <div>
        <a href="post-list?postWriter=${sessionScope.loginUser.userID }" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg> POST
					</a> 
					
					<!--   ====== 카테고리 수정 &삭제 & 추가 -->
					
					
					<c:forEach var="category" varStatus="status" items="${Diary.categoriesArray }">
					<a href="#" class="item-link il-${status.count }" id="pageLink"> <svg
							class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16"
							height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg> ${category }
					</a>
					
					</c:forEach>
				</div>
				

			</div>
			
			
			<button class="btn-invite"
				onclick="location.href='updateMyPopup?userId=${sessionScope.loginUser.userID }'" 
				style="background: ${Diary.themeColor}">다이어리 설정
			</button>

		</div>

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

			
				<div class="action-buttons-wrapper">
					<button class="action-buttons btn-upload"
						onclick="location.href='write.go?postWriter=${sessionScope.loginUser.userID }'" 
						style="background: ${Diary.themeColor}">포스트 작성</button>
				</div>
				
				
			</div>

			<div class="page-right-content">
				<!-- 우측 메인 컨텐트 페이지 -->

				<jsp:include page="${popupContentPage }"></jsp:include>

			</div>
		</div>

	</div>

</body>
</html>