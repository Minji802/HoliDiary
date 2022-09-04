<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Swiper slide transition</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Montserrat:400,700&amp;display=swap'>
<link rel='stylesheet' href='https://unpkg.com/swiper@5.2.0/css/swiper.min.css'><link rel="stylesheet" href="./style.css">
<style type="text/css">
/* body {
  background-color: #f6f7fb;
  height: 100vh;
  width: 100%;
  display: flex;
  font-family: "Montserrat", sans-serif;
  flex-direction: column;
  justify-content: center;
  align-items: center;
} */
@font-face {
    font-family: 'Ballet Hormony';
    src: url('resources/sej_font/Ballet Harmony.ttf') format('truetype');
}


.bestHoliContent {
  margin-top: 180px;
}
.bestHoliSliderPlace {
  height: 1500px;
  width: 100%;
  display: flex;
  font-family: "Montserrat", sans-serif;
  flex-direction: column;
 /*  justify-content: center; */
  align-items: center;
  /* margin-top: 180px; */
}
.bestHoliTitle {
 	font-family: 'Ballet Hormony';
 	color: #FFDE59;
 	letter-spacing: 1px;
 	font-size: 50px;
 	position: relative;
 	/* top: -100px; */
}
.bestHoliTitle span {
 	color: #6667AB;
}
.bestHoliRanking {
	display: flex;
	margin-bottom: 200px;
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
}
.bestHoliRankingCrown {
	position: relative;
	left: 600px;
	top: -130px;
	width: 150px;
	height: 130px;
}
.bestHoliRankingImg {
	width: 391px;
	height: 315px;
}
.bestHoliRankingImg img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.swiper-container {
  height: 400px;
  width: 100%;
  padding-bottom: 85px;
}

.swiper-wrapper {
  width: 73.8%;
  will-change: transform;
}
@media (min-width: 630px) {
  .swiper-wrapper {
    width: 100%;
  }
}

.swiper-slide {
  width: 100%;
  background-color: white;
  overflow: hidden;
  box-shadow: 3px 2px 5px #c5c5c5;
}
.swiper-slide.swiper-slide-active .slide-image, .swiper-slide.swiper-slide-duplicate-active .slide-image {
  transform: scale3d(1, 1, 1);
}
@media (min-width: 630px) {
  .swiper-slide {
    width: 50%;
  }
}
@media (min-width: 768px) {
  .swiper-slide {
    width: 33.333333%;
  }
  .swiper-slide.swiper-slide-next .slide-image, .swiper-slide.swiper-slide-prev .slide-image, .swiper-slide.swiper-slide-duplicate-next .slide-image, .swiper-slide.swiper-slide-duplicate-prev .slide-image {
    transform: scale3d(1, 1, 1);
  }
}
@media (min-width: 1024px) {
  .swiper-slide {
    width: 25%;
  }
}

.swiper-pagination {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 85px;
}
.swiper-pagination.swiper-pagination {
  bottom: 0;
}

.swiper-pagination-bullet {
  background: tomato;
  width: 22px;
  height: 4px;
  border-radius: 0;
  transition: opacity 1s ease;
}
.swiper-pagination-bullet.swiper-pagination-bullet.swiper-pagination-bullet {
  margin: 0;
}
@media (min-width: 768px) {
  .swiper-pagination-bullet {
    width: 40px;
  }
}

.slide-image {
  height: 100%;
  width: 100%;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  transform: scale3d(1.3, 1.3, 1);
  backface-visibility: hidden;
  will-change: transform;
  transition: transform 1400ms ease;
}

.slide-content {
  padding: 0 2.2rem;
  display: flex;
  flex-direction: column;
  height: 100%;
}
.slide-content h4 {
  font-size: 25px;
  font-weight: 400;
  margin: 0 0 1rem;
  padding-top: 2.8rem;
  flex-grow: 0;
}
.slide-content p {
  display: flex;
  line-height: 1.8;
  margin-bottom: 0;
  margin-top: 0;
  font-size: 14px;
  flex-grow: 1;
  	/* display: inline-block;
-	overflow : hidden;
	text-overflow : ellipsis;
	height : 20px; 
	word-wrap : brek-word; 
	display : -webkit-box;
	-webkit-line-clamp : 1; 
	-webkit-box-orient: vertical;  */
 /* width : 100px; (px을 고정 값으로 설정한다. 이는 자신이 원하는 만큼 설정하면 될것이다.) */
 height: 50px;
 white-space : nowrap; /* (text의 길이가 길어지면 자동으로 줄이 바뀌는데 이를 한줄로 설정한다.) */
 overflow : hidden; /* (width가 고정되어있는 상태에서 text가 길어지면 해당 element를 넘어서는데 이를 표시하지 않는다.) */
 text-overflow : ellipsis; /* (넘어간 text대신 ...으로 text를 대체한다.) */
}
.slide-content footer {
  display: flex;
  justify-content: space-between;
  width: 100%;
  padding-bottom: 2.8rem;
  font-size: 14px;
  color: #c2c0e0;
}
.slide-content a {
  color: tomato;
  font-size: 12px;
  font-weight: 700;
  text-decoration: none;
  border-bottom: 3px solid currentColor;
  padding-bottom: 3px;
}
.bestHoliTxt {
	/* display: inline-block;
	overflow : hidden;
	text-overflow : ellipsis;
	height : 20px; 
	word-wrap : brek-word; 
	display : -webkit-box;
	-webkit-line-clamp : 1; 
	-webkit-box-orient: vertical;  */
}
</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class="bestHoliContent">
<div class="bestHoliRanking">
	<div class="bestHoliTitle">
	<img class="bestHoliRankingCrown" src="resources/sej_img/bestHoli/free-icon-crown-1076305.png">
	<h1 style="display: inline">Best&nbsp;<span>Holi</span></h1>
	</div>
	<br>
	<c:forEach var="bh1" items="${bestHolisR }">
	<div class="bestHoliRankingImg">
		<img src="${bh1.postimg }" onerror="this.src='resources/alterImg/free-icon-picture-6490775.png'">
	</div>
	</c:forEach>
</div>
<div class="bestHoliSliderPlace">
<div class="swiper-container">
    <div class="swiper-wrapper">
    <c:forEach var="bh" items="${bestHolis }">
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url('${bh.postimg}'),url('resources/alterImg/free-icon-picture-6490775.png')">
            </div>
        </div>
        <div class="swiper-slide">
            <article class="slide-content">
                <h4>${bh.posttitle }</h4>
                <p class="bestHoliTxt">
				${bh.posttxt }
               </p>
                <footer>
                    <div><fmt:formatDate value="${bh.postdate }" pattern="yyyy/MM/dd"/> </div>
                    <c:if test="${sessionScope.loginUser.userID != null}">
                    <a href="post.detail.go?postNum=${bh.postnum } + &userId=${bh.postwriter }">READ MORE</a>
                	</c:if>
                    <c:if test="${sessionScope.loginUser.userID == null}">
                    <a href="login.go">READ MORE</a>
                	</c:if>
                </footer>
            </article>
        </div>
    </c:forEach>
       <!--  <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1469334031218-e382a71b716b?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div>
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1483985988355-763728e1935b?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div>
        <div class="swiper-slide">
            <article class="slide-content">
                <h4>Lorem Ipsum</h4>
                <p>
Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore molestias itaque reiciendis et excepturi odit eligendi cum eaque ad culpa, numquam corrupti rem praesentium, earum beatae temporibus nulla voluptates laudantium!
                </p>
                <footer>
                    <div>01/02</div>
                    <a href="#">READ MORE</a>
                </footer>
            </article>
        </div>
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div>
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1508350552147-213c11fcede6?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div>
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1551310357-b26c1af069c6?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div>
        <div class="swiper-slide">
            <article class="slide-content">
                <h4>Lorem Ipsum</h4>
                <p>
Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempore molestias itaque reiciendis et excepturi odit eligendi cum eaque ad culpa, numquam corrupti rem praesentium, earum beatae temporibus nulla voluptates laudantium!
                </p>
                <footer>
                    <div>02/02</div>
                    <a href="#">READ MORE</a>
                </footer>
            </article>
        </div>
        <div class="swiper-slide">
            <div 
                class="slide-image" 
                style="background-image: url(https://images.unsplash.com/photo-1495385794356-15371f348c31?w=500&h=500&q=70&fit=crop&crop=faces)">
            </div>
        </div> -->
    </div>
    
    <div class="swiper-pagination"></div>
</div>
</div>

</div>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js'></script><script  src="./script.js"></script>
	<script type="text/javascript">
	new Swiper('.swiper-container', {
		  slidesPerView: 'auto',
		  initialSlide: 2,
		  speed: 1000,
		  spaceBetween: 32,
		  loop: true,
		  centeredSlides: true,
		  roundLengths: true,
		  mousewheel: true,
		  grabCursor: true,
		  pagination: {
		    el: '.swiper-pagination',
		    clickable: true } });
	</script>
</body>
</html>
