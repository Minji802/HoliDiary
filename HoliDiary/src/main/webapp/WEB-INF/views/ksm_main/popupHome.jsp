<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<link rel="stylesheet" href="resources/sm_css/sm_music.css">
<script type="text/javascript" src="resources/sm_js/sm_musicJs.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	margin-left: -70px;
}

.button a {
	width: 200px;
	padding: 5px 20px;
	text-align: center;
	color: white;
	border: solid 2px white;
	z-index: 1;
}

.content-line:hover .button {
	opacity: 1;
}

span {
	font-weight: 600;
}

/* 말풍선 적절한 top 과 margin-left 로 위치조정 */
.arrow_box2 {
  display: none;
  position: fixed;
  width: 150px;
  
  padding: 5px;
  -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  border-radius: 8px;
  background: #333;
  color: #fff;
  font-size: 14px;
  z-index: 9999;
	margin-left: 590px;
	margin-top: -178px;
}

.arrow_box2:after {
  position: absolute;
  bottom: 100%;
  left: 50%;
  width: 0;
  height: 50px;
  margin-left: 25px;
  border: solid transparent;
  border-color: rgba(51, 51, 51, 0);
  border-bottom-color: #333;
  border-width: 10px;
  pointer-events: none;
  content: ' ';
}

span:hover + p.arrow_box2 {
  display: block;
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
				<img class="introduce-backImg" src="resources/sm_img/postmemo-removebg-preview.png" style="height: 250px; width: 370px;">
				<span class="introduce-backImg-text">${Diary.diaryIntroduce }</span>
		</div>
			<a href="#" onclick="showMusicPlayer();"><img class="turntable-backImg" src="resources/sm_img/turntable2-removebg-preview.png"></a>
			<a href="#" onclick="showTicket();"><img class="airplane-backImg" src="resources/sm_img/airplane-removebg-preview.png"></a>
			<a href="#" onclick="showAirplane();"><img class="ticket-backImg" src="resources/sm_img/ticket-removebg-preview.png"></a>
			
			<div id="hover-info">
			<div>
			<span><img class="question-backImg" src="resources/sm_img/png-clipart-question-mark-question-mark-removebg-preview.png"></span>
			<p class="arrow_box2"> Click on the sticker!</p>
			</div>
			</div>
			<span style="z-index: 3"><img class="question-backImg2" src="resources/sm_img/weather-sticker.PNG"></span>
	</div>
	
	<!-- 날씨 api -->
	<table id="weatherArea" style="background: ${Diary.themeColor}">
      <tr>
         <td rowspan="2"><img id="weatherImg"></td>
         <td id="weatherDesc"></td>
      </tr>
      <tr>
         <td id="weatherTemp"></td>
      </tr>
   </table>
	
		<hr style="height: 1px; border:0; border-top: 3px dashed ${Diary.themeColor};">

<script>


$(document).ready(function(){
	$(".question-backImg2").click(function(e) {
	      
        var url = "http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=e7b1a57cd2158c8d195bfb24b7597bad&units=metric&lang=kr";
         $.getJSON(url, function(data){
           var icon = "https://openweathermap.org/img/wn/"+data.weather[0].icon+".png";
           $("#weatherImg").attr("src", icon);
           $("#weatherDesc").text(data.weather[0].description);
           $("#weatherTemp").text(data.main.temp + "℃(" + data.main.humidity + "%)");
           
           $("#weatherArea").css("display", "block");
           $("#weatherArea").css("z-index", "10000");
           $("#weatherArea").css("top", "110px");
           $("#weatherArea").css("left", "705px");
           
           setTimeout(function(){
              $("#weatherArea").css("display", "none");
              $("#weatherArea").css("z-index", "0");
           }, 3000);
        });
	});
});
</script>


</body>
</html>