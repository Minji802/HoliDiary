<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.button {
  position: absolute;
  width: 200px;
  left:-50px;
  top: 200px;
  text-align: center;
  opacity: 0;
  transition: opacity .35s ease;
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
</style>
</head>
<body>
	<div>${Diary.diaryImg }</div>
	<div class="content-line content-line-hero">

		<div class="slider-wrapper owl-carousel owl-theme" id="owl-slider-1">
			<div class="item hero-img-wrapper img-1">
				<img
					src="https://images.unsplash.com/photo-1485846234645-a62644f84728?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2240&q=80"
					alt="SlideShow">
				<div class="button">
					<a href="#"> 수정 </a>
				</div>
			</div>
		</div>
	</div>

	<!-- 뮤직 플레이어 -->



</body>
</html>