<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Slide Image Effects -&gt; GSAP &amp; JS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Great+Vibes&family=Zen+Dots&display=swap');

@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Noto Sans KR';
    src: url('../../resources/sej_font/NotoSansKR-Medium.otf') format('opentype');
}

@font-face {
    font-family: 'Noto Sans Light';
    src: url('../../resources/sej_font/NotoSansKR-Light.otf') format('opentype');
}

@font-face {
    font-family: 'Montserrat';
    src: url('../../resources/sej_font/Montserrat-Medium.otf') format('opentype');
}

@font-face {
    font-family: 'Montserrat-Thin';
    src: url('../../resources/sej_font/Montserrat-Thin.otf') format('opentype');
}

@font-face {
    font-family: 'sans-serif';
    src: url('../../resources/sej_font/SansSerifFLF.otf') format('opentype');
}

/*from mobile have a bug, working to fix the error*/

*,
*::after,
*::before {
	box-sizing: border-box;
}

body {
	--color-text: #4800d4;
  --color-bg: #fff2db;
  --color-link: #b045f8;
  --color-link-hover: #b045f8;
  --color-info: #272625;
  --grid-item-bg: #ffffff;
	font-family: 'Zen Dots', cursive;
	min-height: 100vh;
	color: var(--color-text, #272625);
	background-color: var(--color-bg, #fff);
}

/* Main stuff */
.text {
  fill: url("#p-stars");
  stroke: #551f7a;
  stroke-width: 5; }

/* Colorize & animate pattern */
.g-stars polygon {
  stroke-width: 0;
  -webkit-animation: stroke 2s infinite;
  animation: stroke 2s infinite; }
  .g-stars polygon:nth-child(5n + 1) {
    fill: #551F7A;
    stroke: #551F7A;
    -webkit-animation-delay: -0.4s;
    animation-delay: -0.4s; }
  .g-stars polygon:nth-child(5n + 2) {
    fill: #27b5ba;
    stroke: #27b5ba;
    -webkit-animation-delay: -0.8s;
    animation-delay: -0.8s; }
  .g-stars polygon:nth-child(5n + 3) {
    fill: #D9587A;
    stroke: #D9587A;
    -webkit-animation-delay: -1.2s;
    animation-delay: -1.2s; }
  .g-stars polygon:nth-child(5n + 4) {
    fill: #ff8800;
    stroke: #ff8800;
    -webkit-animation-delay: -1.6s;
    animation-delay: -1.6s; }
  .g-stars polygon:nth-child(5n + 5) {
    fill: #ffa1ff;
    stroke: #ffa1ff;
    -webkit-animation-delay: -2s;
    animation-delay: -2s; }

/* Change stroke-width within animation */
@-webkit-keyframes stroke {
  50% {
    stroke-width: 8; } }
@keyframes stroke {
  50% {
    stroke-width: 8; } }

svg {
		width: 30%;
		margin: 0 auto;
		display: block;
		text-transform: uppercase; }

a {
	text-decoration: none;
	color: var(--color-link);
	outline: none;
}

a:hover,
a:focus {
	color: var(--color-link-hover);
	outline: none;
}

main {
	position: relative;
}

.title {
	text-align: center;
	font-size: 5rem;
}

/* Top Navigation Style */
.grid-wrap {
	position: relative;
	max-width: 1100px;
	margin: 0 auto;
	padding: 6rem 1rem 0;
}

.grid-wrap--hidden {
	height: 0;
}

.grid {
	margin: 0 auto;
	position: relative;
	display: none;
}

.js .grid {
	display: block;
}

.grid__item {
	width: 260px;
	position: relative;
	padding: 2.75rem;
	margin-bottom: 5rem;
}

.grid__item-wrap {
	position: relative;
}

.grid__item-bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: var(--grid-item-bg);
	background-color: #F9F5EA;
	box-shadow: 3px 2px 5px #c5c5c5;
}

.grid__item-img {
	pointer-events: none;
	position: relative;
	max-width: 100%;
	margin: 0 auto;
	display: block;
	outline: 1px solid transparent;
}

.grid__item:nth-child(even) .grid__item-img {
	transform: rotate3d(0,0,1,4deg);
}

.grid__item:nth-child(odd) .grid__item-img {
	transform: rotate3d(0,0,1,-4deg);
}

.grid__item-title {
	font-size: 1.3rem;
	font-weight: normal;
	position: absolute;
	left: 0;
	top: -30px;
	margin: 0 0 0 1rem;
	/* -webkit-writing-mode: vertical-rl;
	writing-mode: vertical-rl; */
	/* transform: rotate(180deg); */
	transform-origin: 0 50%;
	font-family: 'GangwonEdu_OTFBoldA';
	letter-spacing: 0.8px;
}

.grid__item-number {
	font-family: 'GangwonEdu_OTFBoldA';
	position: absolute;
	right: 0;
	bottom: 0;
	font-size: 45px;
	margin: 0 0 0.15rem;
}

.grid__item-number > span {
	display: inline-block;
}

.content {
	margin: 0 auto;
	grid-template-columns: 100%;
	grid-template-rows: 100%;
	align-items: center;
	pointer-events: none;
}

.js .content {
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 1000;
}

.content__item {
	padding: 10rem 5vw 10rem;
	grid-area: 1 / 1 / 1 / 1;
}

.js .content__item {
	height: 0;
	opacity: 0;
	overflow: hidden;
	padding: 0;
	pointer-events: none;
}

.js .content__item--current {
	height: auto;
	opacity: 1;
	padding: 3rem 5vw 10rem;
	pointer-events: auto;
}

.content__item-intro {
	position: relative;
	display: grid;
	grid-template-columns: 100%;
	grid-template-rows: 100%;
	align-items: center;
}

.content__item-img {
	position: relative;
	height: auto;
	max-width: 100%;
	display: block;
	margin: 0 auto;
	grid-area: 1 / 1 / 1 / 1;
	box-shadow: 3px 2px 5px #c5c5c5;
	border-radius: 10px;
}

.js .content__item-img {
	visibility: hidden;
}

.content__item-title {
	position: relative;
	font-size: 6vw;
	line-height: 1;
	/* text-align: center; */
	margin: 0;
	padding: 0 5vw;
	white-space: nowrap;
	grid-area: 1 / 1 / 1 / 1;
	font-family: 'GangwonEdu_OTFBoldA';
	color: #6667AB;
}

.content__item-title > span {
	white-space: pre;
	display: inline-block;
}

.content__item-text {
	text-align: justify;
	max-width: 800px;
	margin: 3rem auto;
	font-family: 'GangwonEdu_OTFBoldA';
	color: black;
	font-size: 30px;
}

.content__item-text p {
	margin: 0;
}

.content__close {
	position: absolute;
	top: 0.75rem;
	left: 50%;
	z-index: 10000;
	transform: translateX(-50%);
	background: none;
	border: 0;
	margin: 0;
	padding: 0;
	cursor: pointer;
	color: var(--color-text);
}

.content__close:focus {
	outline: none;
}

.content__item--current ~ .content__close {
	pointer-events: auto;
}

.content__indicator {
	position: absolute;
	top: calc(100vh - 6rem);
	left: calc(50% - 0.75rem);
	display: none;
}

.js .content__item-title > span,
.js .content__item-text,
.content__close,
.content__indicator {
	opacity: 0;
}

button.content__close {
	border: 2px solid var(--color-text);
	padding: 5px;
	margin-bottom: 5px;
	border-radius: 5px;
	cursor: pointer;
  font-family: 'Zen Dots', cursive;
  font-size: 14px;
  text-transform: uppercase;
}

button.content__close:hover {
	background-color: #4800d4;
	color: #fff;
	transition: .3s;
}

@media screen and (min-width: 55em) {
	.title {
		display: flex;
		text-align: center;
	}

	.grid__item-number {
		right: -2.45rem;
		color: #FFDE59;
	}
	.grid__item-title {
		margin-left: -0.25rem;
		color: #6667AB;
	}
	.content__item-img {
		max-width: none;
		height: calc(100vh - 6rem);
	}
	.content__indicator {
		display: block;
	}
}
</style>
<!-- css 적용 문제로 직접 css 적용 -->
</head>
<body>
<!-- partial:index.partial.html -->
<main>
			<div class="title">
				<svg viewBox="0 0 600 300">
					<!-- Pattern -->
					<pattern
						id="p-stars"
						width="70"
						height="70"
						viewBox="0 0 120 120"
						patternUnits="userSpaceOnUse"
					>
						<g class="g-stars">
							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549 "
								transform="
								 scale(.9,.9)"
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(30,30)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(90,30)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(0,60)
								 scale(.9,.9)"
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549 "
								transform="
								 translate(60,0)
								 scale(.9,.9)  
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(60,60)
								 scale(.9,.9)  
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(90,90)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(30,90)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(120,60)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(60,120)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(0,120)
								 scale(.9,.9)
								 "
							></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(-30,90)
								 scale(.9,.9)
								 "
							></polygon>

							<!-- Hack to make shapes full  -->
							<polygon></polygon>
							<polygon></polygon>
							<polygon></polygon>

							<polygon
								points="15 22.5 6.18322122 27.1352549 7.86707613 17.3176275 0.734152256 10.3647451 10.5916106 8.93237254 15 0 19.4083894 8.93237254 29.2658477 10.3647451 22.1329239 17.3176275 23.8167788 27.1352549"
								transform="
								 translate(120,0)
								 scale(.9,.9)
								 "
							></polygon>
						</g>
					</pattern>

					<!-- Text -->
					<text text-anchor="middle" x="50%" y="50%" dy=".35em" class="text">
						<a href="javascript:void(0)" onclick="goHolinow()">#Holi Now</a>
					</text>
				</svg>
			</div>

			<div class="grid-wrap">
				<div class="grid">
				<c:forEach var="hn" items="${holinows }">
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="${hn.postimg }" onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';" alt="Paris" />
						</div>
						<h3 class="grid__item-title">${hn.posttitle }</h3>
						<h4 class="grid__item-number">${hn.postcountry }</h4>
					</a>
				</c:forEach>	
				
				</div>
			</div>

			<div class="content">
				<c:forEach var="hn" items="${holinows }">
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="${hn.postimg }" onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';" alt="Dove" />
						<h2 class="content__item-title">${hn.posttitle }</h2>
					</div>
					<div class="content__item-text">
						${hn.posttxt }
					</div>
				</div>
				</c:forEach>
				
				<button class="content__close">Close</button>
        <svg class="content__indicator icon icon--caret"><use xlink:href="#icon-caret"></use></svg>
			</div>
		</main>
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/masonry/4.2.2/masonry.pkgd.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js'></script>
<script src='https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js'></script><script type="module" src="./script.js"></script>
<script type="module">
import charming from "https://cdn.skypack.dev/charming@3.0.2";

document.documentElement.className="js";
var supportsCssVars=function(){
  var e,t=document.createElement("style");
  return t.innerHTML="root: { --tmp-var: bold; }",
    document.head.appendChild(t),
    e=!!(window.CSS&&window.CSS.supports&&window.CSS.supports("font-weight","var(--tmp-var)")),
    t.parentNode.removeChild(t),e};
supportsCssVars()||alert("Please view this demo in a modern browser that supports CSS Variables.");

{
	
	const getOffset = (elem, axis) => {
		let offset = 0;
		const type = axis === 'top' ? 'offsetTop' : 'offsetLeft';
		do {
			if ( !isNaN( elem[type] ) )
			{
				offset += elem[type];
			}
		} while( elem = elem.offsetParent );
		return offset;
	}
	// Calculates the distance between two points.
	const distance = (p1,p2) => Math.hypot(p2.x-p1.x, p2.y-p1.y);
	
	const randNumber = (min,max) => Math.floor(Math.random() * (max - min + 1)) + min;
	
	const getMousePos = (e) => {
		let posx = 0;
		let posy = 0;
		if (!e) e = window.event;
		if (e.pageX || e.pageY) 	{
			posx = e.pageX;
			posy = e.pageY;
		}
		else if (e.clientX || e.clientY) 	{
			posx = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
			posy = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
		}
		return { x : posx, y : posy }
	};
	
	const getAngle = (el) => {
		const st = window.getComputedStyle(el, null);
		const tr = st.getPropertyValue('transform');
		let values = tr.split('(')[1];
		values = values.split(')')[0];
		values = values.split(',');
		return Math.round(Math.asin(values[1]) * (180/Math.PI));
	};
	
	const keys = {37: 1, 38: 1, 39: 1, 40: 1};
	const preventDefault = (e) => {
		e = e || window.event;
		e.returnValue = false;  
	}
	const preventDefaultForScrollKeys = (e) => {
		if (keys[e.keyCode]) {
			preventDefault(e);
			return false;
		}
	}
	const disableScroll = () => {
		if (window.addEventListener) // older FF
			window.addEventListener('DOMMouseScroll', preventDefault, false);
		window.onwheel = preventDefault; // modern standard
		window.onmousewheel = document.onmousewheel = preventDefault; // older browsers, IE
		window.ontouchmove  = preventDefault; // mobile
		document.onkeydown  = preventDefaultForScrollKeys;
	}
	const enableScroll = () => {
		if (window.removeEventListener)
			window.removeEventListener('DOMMouseScroll', preventDefault, false);
		window.onmousewheel = document.onmousewheel = null; 
		window.onwheel = null; 
		window.ontouchmove = null;  
		document.onkeydown = null;  
	}
	
    class GridItem {
        constructor(el) {
			this.DOM = {el: el};
		
			this.DOM.bg = this.DOM.el.querySelector('.grid__item-bg');
			
			this.DOM.tilt = {};
			
			this.DOM.imgWrap = this.DOM.el.querySelector('.grid__item-wrap');
			this.DOM.tilt.img = this.DOM.imgWrap.querySelector('img');
			
			this.DOM.tilt.title = this.DOM.el.querySelector('.grid__item-title');
			
			this.DOM.tilt.number = this.DOM.el.querySelector('.grid__item-number');
			
			charming(this.DOM.tilt.number);
			
			this.DOM.numberLetters = this.DOM.tilt.number.querySelectorAll('span');
			
			this.tiltconfig = {   
                title: {translation : {x: [-8,8], y: [4,-4]}},
                number: {translation : {x: [-5,5], y: [-10,10]}},
                img: {translation : {x: [-15,15], y: [-10,10]}}
			};
			
			this.angle = getAngle(this.DOM.tilt.img);
			
            this.initEvents();
		}
		initEvents() {
		
			this.toggleAnimationOnHover = (type) => {
				
				TweenMax.to(this.DOM.bg, 1, {
					ease: Expo.easeOut,
					scale: type === 'mouseenter' ? 1.15 : 1
				});
				
				this.DOM.numberLetters.forEach((letter,pos) => {
					TweenMax.to(letter, .2, {
						ease: Quad.easeIn,
						delay: pos*.1,
						y: type === 'mouseenter' ? '-50%' : '50%',
						opacity: 0,
						onComplete: () => {
							TweenMax.to(letter, type === 'mouseenter' ? 0.6 : 1, {
								ease: type === 'mouseenter' ? Expo.easeOut : Elastic.easeOut.config(1,0.4),
								startAt: {y: type === 'mouseenter' ? '70%' : '-70%', opacity: 0},
								y: '0%',
								opacity: 1
							});
						}
					});
				});
			};
			this.mouseenterFn = (ev) => {
				if ( !allowTilt ) return;
				this.toggleAnimationOnHover(ev.type);
            };
            this.mousemoveFn = (ev) => requestAnimationFrame(() => {
				if ( !allowTilt ) return;
                this.tilt(ev);
            });
            this.mouseleaveFn = (ev) => {
				if ( !allowTilt ) return;
				this.resetTilt();
				this.toggleAnimationOnHover(ev.type);
            };
            this.DOM.el.addEventListener('mouseenter', this.mouseenterFn);
            this.DOM.el.addEventListener('mousemove', this.mousemoveFn);
            this.DOM.el.addEventListener('mouseleave', this.mouseleaveFn);
		}
		tilt(ev) {
			
			const mousepos = getMousePos(ev);
           
            const docScrolls = {left : body.scrollLeft + docEl.scrollLeft, top : body.scrollTop + docEl.scrollTop};
            const bounds = this.DOM.el.getBoundingClientRect();
            
            const relmousepos = {
                x : mousepos.x - bounds.left - docScrolls.left, 
                y : mousepos.y - bounds.top - docScrolls.top 
            };
            // Movement settings for the tilt elements.
            for (let key in this.DOM.tilt) {
				let t = this.tiltconfig[key].translation;
				// Animate each of the elements..
                TweenMax.to(this.DOM.tilt[key], 2, {
                    ease: Expo.easeOut,
                    x: (t.x[1]-t.x[0])/bounds.width*relmousepos.x + t.x[0],
                    y: (t.y[1]-t.y[0])/bounds.height*relmousepos.y + t.y[0]
                });
            }
		}
		resetTilt() {
			for (let key in this.DOM.tilt ) {
                TweenMax.to(this.DOM.tilt[key], 2, {
					ease: Elastic.easeOut.config(1,0.4),
                    x: 0,
                    y: 0
                });
            }
		}
	
		hide(withAnimation = true) { this.toggle(withAnimation,false); }
		
		show(withAnimation = true) { this.toggle(withAnimation); }
		toggle(withAnimation, show = true) {
			TweenMax.to(this.DOM.tilt.img, withAnimation ? 0.8 : 0, {
				ease: Expo.easeInOut,
				delay: !withAnimation ? 0 : show ? 0.15 : 0,
				scale: show ? 1 : 0,
				opacity: show ? 1 : 0,
			});
			TweenMax.to(this.DOM.bg, withAnimation ? 0.8 : 0, {
				ease: Expo.easeInOut,
				delay: !withAnimation ? 0 : show ? 0 : 0.15,
				scale: show ? 1 : 0,
				opacity: show ? 1 : 0
			});
			this.toggleTexts(show ? 0.45 : 0, withAnimation, show);
		}
		// hides the texts (translate down and fade out).
		hideTexts(delay = 0, withAnimation = true) { this.toggleTexts(delay, withAnimation, false); }
		// shows the texts (reset transforms and fade in).
		showTexts(delay = 0, withAnimation = true) { this.toggleTexts(delay, withAnimation); }
		toggleTexts(delay, withAnimation, show = true) {
			TweenMax.to([this.DOM.tilt.title, this.DOM.tilt.number], !withAnimation ? 0 : show ? 1 : 0.5, {
				ease: show ? Expo.easeOut : Quart.easeIn,
				delay: !withAnimation ? 0 : delay,
				y: show ? 0 : 20,
				opacity: show ? 1 : 0
			});
		}
	}

	
    class Content {
        constructor(el) {
			this.DOM = {el: el};
		
            this.DOM.img = this.DOM.el.querySelector('.content__item-img');
            this.DOM.title = this.DOM.el.querySelector('.content__item-title');
			this.DOM.text = this.DOM.el.querySelector('.content__item-text');
			
			charming(this.DOM.title);
			
			this.DOM.titleLetters = this.DOM.title.querySelectorAll('span');
			this.titleLettersTotal = this.DOM.titleLetters.length;
		}
		
        show(delay = 0, withAnimation = true) { this.toggle(delay, withAnimation); }
        hide(delay = 0, withAnimation = true) { this.toggle(delay, withAnimation, false); }
		toggle(delay, withAnimation, show = true) {
			setTimeout(() => {
				
				this.DOM.titleLetters.forEach((letter,pos) => {
					TweenMax.to(letter, !withAnimation ? 0 : show ? .6 : .3, {
						ease: show ? Back.easeOut : Quart.easeIn,
						delay: !withAnimation ? 0 : show ? pos*.05 : (this.titleLettersTotal-pos-1)*.04,
						startAt: show ? {y: '50%', opacity: 0} : null,
						y: show ? '0%' : '50%',
						opacity: show ? 1 : 0
					});
				});
				this.DOM.text.style.opacity = show ? 1 : 0;

			}, withAnimation ? delay*1000 : 0 );
		}
    }

	// The Grid class.
    class Grid {
        constructor(el) {
			this.DOM = {el: el};
			// The grid wrap.
			this.DOM.gridWrap = this.DOM.el.parentNode;
			// The grid items.
            this.items = [];
            Array.from(this.DOM.el.querySelectorAll('.grid__item')).forEach(itemEl => this.items.push(new GridItem(itemEl)));
            
			this.itemsTotal = this.items.length;
			
			this.contents = [];
			Array.from(document.querySelectorAll('.content > .content__item')).forEach(contentEl => this.contents.push(new Content(contentEl)));
			
			this.DOM.closeCtrl = document.querySelector('.content__close');
			this.DOM.scrollIndicator = document.querySelector('.content__indicator');
			
			this.current = -1;
            
            this.initEvents();
		}
		initEvents() {
			
			for (let item of this.items) {
				item.DOM.el.addEventListener('click', (ev) => {
					ev.preventDefault();
					this.openItem(item);
				});
			}
			
			this.DOM.closeCtrl.addEventListener('click', () => this.closeItem());
			
			this.resizeFn = () => {
				if (this.current === -1 || winsize.width === window.innerWidth) return;
				this.closeItem(false);
			};
			window.addEventListener('resize', this.resizeFn);
		}
		getSizePosition(el, scrolls = true) {
			const scrollTop = window.pageYOffset || docEl.scrollTop || body.scrollTop;
    		const scrollLeft = window.pageXOffset || docEl.scrollLeft || body.scrollLeft;
			return {
				width: el.offsetWidth,
				height: el.offsetHeight,
				left: scrolls ? getOffset(el, 'left')-scrollLeft : getOffset(el, 'left'),
				top: scrolls ? getOffset(el, 'top')-scrollTop : getOffset(el, 'top')
			};
		}
		openItem(item) {
			if ( this.isAnimating ) return;
			this.isAnimating = true;
			
			this.scrollPos = window.scrollY;
			
			disableScroll();
			
			allowTilt = false;
			
			this.current = this.items.indexOf(item);
			
			this.hideAllItems(item);
			
			item.hideTexts();
			
			item.DOM.el.style.zIndex = 1000;
			
			const itemDim = this.getSizePosition(item.DOM.el);
			item.DOM.bg.style.width = `${itemDim.width}px`;
			item.DOM.bg.style.height = `${itemDim.height}px`;
			item.DOM.bg.style.left = `${itemDim.left}px`;
			item.DOM.bg.style.top = `${itemDim.top}px`;
			
			item.DOM.bg.style.position = 'fixed';
			
			const d = Math.hypot(winsize.width, winsize.height);
		
			TweenMax.to(item.DOM.bg, 1.2, {
				ease: Expo.easeInOut,
				delay: 0.4,
				x: winsize.width/2 - (itemDim.left+itemDim.width/2),
				y: winsize.height/2 - (itemDim.top+itemDim.height/2),
				scaleX: d/itemDim.width,
				scaleY: d/itemDim.height,
				rotation: -1*item.angle*2
			});
			
			const contentEl = this.contents[this.current];
			
			contentEl.DOM.el.classList.add('content__item--current');
			
			const imgDim = this.getSizePosition(item.DOM.imgWrap);
			const contentImgDim = this.getSizePosition(contentEl.DOM.img, false);
			
			this.showContentElems(contentEl, 1);
			
			TweenMax.to(item.DOM.tilt.img, 1.2, {
				ease: Expo.easeInOut,
				delay: 0.55,
				scaleX: contentImgDim.width/imgDim.width,
				scaleY: contentImgDim.height/imgDim.height,
				x: (contentImgDim.left+contentImgDim.width/2)-(imgDim.left+imgDim.width/2),
				y: (contentImgDim.top+contentImgDim.height/2)-(imgDim.top+imgDim.height/2),
				rotation: 0,
				onComplete: () => {
					
					item.DOM.tilt.img.style.opacity = 0;
					contentEl.DOM.img.style.visibility = 'visible';
					
					contentEl.DOM.el.parentNode.style.position = 'absolute';
					
					this.DOM.gridWrap.classList.add('grid-wrap--hidden');
					
					window.scrollTo(0, 0);
					
					enableScroll();
					this.isAnimating = false;
				}
			});
		}
		closeItem(withAnimation = true) {
			if ( this.isAnimating ) return;
			this.isAnimating = true;
			
			const contentEl = this.contents[this.current];
			
			window.scrollTo(0, this.scrollPos);
			contentEl.DOM.el.parentNode.style.position = 'fixed';
			
			disableScroll();
			
			this.DOM.gridWrap.classList.remove('grid-wrap--hidden');
		
			const item = this.items[this.current];
			
			this.hideContentElems(contentEl, 0, withAnimation);
			
			item.DOM.tilt.img.style.opacity = 1;
			contentEl.DOM.img.style.visibility = 'hidden';
			
			TweenMax.to(item.DOM.tilt.img, withAnimation ? 1.2 : 0, {
				ease: Expo.easeInOut,
				scaleX: 1,
				scaleY: 1,
				x: 0,
				y: 0,
				rotation: item.angle*2
			});
			
			TweenMax.to(item.DOM.bg, withAnimation ? 1.2 : 0, {
				ease: Expo.easeInOut,
				delay: 0.15,
				x: 0,
				y: 0,
				scaleX: 1,
				scaleY: 1,
				rotation: 0,
				onComplete: () => {
					contentEl.DOM.el.classList.remove('content__item--current');
					item.DOM.bg.style.position = 'absolute';
					item.DOM.bg.style.left = '0px';
					item.DOM.bg.style.top = '0px';
					this.current = -1;
					allowTilt = true;
					item.DOM.el.style.zIndex = 0;
					enableScroll();
					this.isAnimating = false;
				}
			});
			
			this.showAllItems(item, withAnimation);
			
			item.showTexts(1, withAnimation);
		}
		
		showContentElems(contentEl, delay = 0, withAnimation = true) { this.toggleContentElems(contentEl, delay, withAnimation); }
		hideContentElems(contentEl, delay = 0, withAnimation = true) { this.toggleContentElems(contentEl, delay, withAnimation, false); }
		toggleContentElems(contentEl, delay, withAnimation, show = true) {
			
			TweenMax.to([this.DOM.closeCtrl, this.DOM.scrollIndicator], withAnimation ? 1 : 0, {
				ease: show ? Expo.easeOut : Expo.easeIn,
				delay: withAnimation ? delay : 0,
				startAt: show ? {y: 60} : null,
				y: show ? 0 : 60,
				opacity: show ? 1 : 0
			});
			if ( show ) {
				contentEl.show(delay, withAnimation);
			}
			else {
				contentEl.hide(delay, withAnimation);
			}
		}
		
		sortByDist(refPoint, itemsArray) {
			let distancePairs = [];
			let output = [];
	
			for(let i in itemsArray) {
				const rect = itemsArray[i].DOM.el.getBoundingClientRect();
				distancePairs.push([distance(refPoint,{x:rect.left+rect.width/2, y:rect.top+rect.height/2}), i]);
			}
	
			distancePairs.sort((a,b) => a[0]-b[0]);
	
			for(let p in distancePairs) {
				const pair = distancePairs[p];
				output.push(itemsArray[pair[1]]);
			}
	
			return output;
		}
		
		showAllItems(exclude, withAnimation = true) { this.toggleAllItems(exclude, withAnimation); }
		hideAllItems(exclude, withAnimation = true) { this.toggleAllItems(exclude, withAnimation, false); }
		toggleAllItems(exclude, withAnimation, show = true) {
			if ( !withAnimation ) {
				this.items.filter(item => item != exclude).forEach((item, pos) => item[show ? 'show' : 'hide'](withAnimation));
			}
			else {
				const refrect = exclude.DOM.el.getBoundingClientRect(); 
				const refPoint = {
					x: refrect.left+refrect.width/2, 
					y: refrect.top+refrect.height/2
				};
				this.sortByDist(refPoint, this.items.filter(item => item != exclude))
					.forEach((item, pos) => setTimeout(() => item[show ? 'show' : 'hide'](), show ? 300+pos*70 : pos*70));
			}
		}
	}

	
	let allowTilt = true;
	
	
	const body = document.body;
	const docEl = document.documentElement;
	
	
    let winsize;
    const calcWinsize = () => winsize = {width: window.innerWidth, height: window.innerHeight};
    calcWinsize();
    window.addEventListener('resize', calcWinsize);

	
	const grid = new Grid(document.querySelector('.grid'));

	
	imagesLoaded(document.querySelectorAll('.grid__item-img'), () => {
		body.classList.remove('loading');
		var msnry = new Masonry( grid.DOM.el, {
			// options
			itemSelector: '.grid__item',
			columnWidth: 260,
			gutter: 100,
			fitWidth: true
		});
	});
}
</script>
</body>
</html>
    