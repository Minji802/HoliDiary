<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
<script type="text/javascript" src="resources/sm_js/sm_popupJs.js"></script>
</head>
<body>

<div class="app-wrapper">
  <div class="left-area hide-on-mobile">
    <div class="app-header">
	</div>
    <div class="left-area-content">
    	
      <div class="profile">
        	<a><img src="https://images.unsplash.com/photo-1496340672773-0b29c9b17ed2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2250&q=80" alt=""></a>
      <details>
          	<summary><span class="profile-name">minji park</span></summary>
          	<p class="profile-introduce">소개글칸입니다. 가나다라마바사아자차카타파하</p>
      </details>
      </div>
      
      <div class="page-link-list">
        <a href="popupHomeGo" class="item-link" id="pageLink">
          <svg class="link-icon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-home" viewBox="0 0 24 24">
            <defs />
            <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z" />
            <path d="M9 22V12h6v10" /></svg>
          Home</a>
        <a href="popupScheduleGo" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-heart">
            <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z" />
          </svg>
          Schedule</a>
         <a href="#" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-play">
            <path d="M5 3l14 9-14 9V3z" />
          </svg>
          Map</a>
       </div>
       <div class="list-header">
        <span class="category-item">Public</span>
       
      </div>
       <div>
        <a href="#" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg>
          2020 Trip</a>
        <a href="#" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg>
          2021 Trip</a>
        <a href="#" class="item-link" id="pageLink">
          <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list">
            <path d="M8 6h13M8 12h13M8 18h13M3 6h.01M3 12h.01M3 18h.01" />
          </svg>
          2022 Trip</a>
      </div>
      <div class="list-header">
        <span class="category-item">Private</span>
        
      </div>
      <a href="#" class="item-link" id="pageLink">
        <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">
          <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
          <path d="M7 11V7a5 5 0 0110 0v4" />
        </svg>
        Personal 1</a>
      <a href="#" class="item-link" id="pageLink">
        <svg class="link-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-lock">
          <rect x="3" y="11" width="18" height="11" rx="2" ry="2" />
          <path d="M7 11V7a5 5 0 0110 0v4" />
        </svg>
        Personal 2</a>
      
      
    </div>
    <button class="btn-invite" onclick="updateMyPopup">설정</button>
  </div>
  <div class="right-area">
    <div class="right-area-upper">
      <button class="menu-button">
        <svg width="24" height="24" fill="none" stroke="#51a380" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
          <defs />
          <path d="M3 12h18M3 6h18M3 18h18" />
        </svg>
      </button>
      <div class="search-part-wrapper">

        <div class="diary-title-name">다이어리 타이틀</div>
        
        <button class="more-button">
          <svg width="24" height="20" fill="none" stroke="#51a380" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-more-vertical">
            <defs />
            <circle cx="12" cy="12" r="1" />
            <circle cx="12" cy="5" r="1" />
            <circle cx="12" cy="19" r="1" />
          </svg>
        </button>
        
      </div>
      <div class="action-buttons-wrapper">
        <button class="action-buttons btn-upload">포스트 작성1</button>
      </div>
    </div>
    
    <div class="page-right-content"> <!-- 우측 메인 컨텐트 페이지 -->
    
    	<jsp:include page="${contentPage }"></jsp:include>
			
    </div>
    
  </div>

</body>
</html>