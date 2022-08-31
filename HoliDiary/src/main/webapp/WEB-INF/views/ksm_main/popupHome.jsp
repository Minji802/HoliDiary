<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="resources/sm_css/sm_music.css">
<script type="text/javascript" src="resources/sm_js/sm_musicJs.js"></script> -->
<style>
.button {
	position: absolute;
	width: 200px;
	left: 80%;
	top: 15px;
	text-align: center;
	opacity: 0;
	transition: opacity .35s ease;
	font-weight: 600;
}

.button a {
	width: 200px;
	padding: 5px 20px;
	text-align: center;
	color: black;
	border: solid 2px black;
	z-index: 1;
}

.content-line:hover .button {
	opacity: 1;
}

span {
	font-weight: 600;
}


</style>
</head>
<body>
	<%-- <div>${Diary.diaryImg }</div> --%>
	<div class="content-line content-line-hero">
		<div class="slider-wrapper owl-carousel">
			<div class="hero-img-wrapper">
				<img style="border-radius: 6px;" src="resources/sm_img/${Diary.diaryImg }" 
				onerror="this.onerror=null; this.src='https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2240&q=80';">
				
				<c:if test="${Diary.diaryUserId eq sessionScope.loginUser.userID }">
				<div class="button">
					<a href="mainImg.updateGo?userId=${Diary.diaryUserId }"> 수정 </a>
					<%-- <input type="hidden" value="${User.userId }" name="userId"> --%>
				</div>
				</c:if>
			</div>
		</div>
	</div>
	<span>${Diary.diaryIntroduce }</span>

	<!-- 뮤직 플레이어 -->
<!-- 	<div id="app-cover">
  <div id="bg-artwork"></div>
  <div id="bg-layer"></div>
  <div id="player">
    <div id="player-track">
      <div id="album-name"></div>
      <div id="track-name"></div>
      <div id="track-time">
        <div id="current-time"></div>
        <div id="track-length"></div>
      </div>
      <div id="s-area">
        <div id="ins-time"></div>
        <div id="s-hover"></div>
        <div id="seek-bar"></div>
      </div>
    </div>
    <div id="player-content">
      <div id="album-art">
        <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_1.jpg" class="active" id="_1">
        <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_2.jpg" id="_2">
        <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_3.jpg" id="_3">
        <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_4.jpg" id="_4">
        <img src="https://raw.githubusercontent.com/himalayasingh/music-player-1/master/img/_5.jpg" id="_5">
        <div id="buffer-box">Buffering ...</div>
      </div>
      <div id="player-controls">
        <div class="control">
          <div class="button" id="play-previous">
            <i class="fas fa-backward"></i>
          </div>
        </div>
        <div class="control">
          <div class="button" id="play-pause-button">
            <i class="fas fa-play"></i>
          </div>
        </div>
        <div class="control">
          <div class="button" id="play-next">
            <i class="fas fa-forward"></i>
          </div>
        </div>
      </div>
    </div>
  </div>
</div> -->


</body>
</html>