<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Slide Image Effects -&gt; GSAP &amp; JS</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="./style.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Great+Vibes&family=Zen+Dots&display=swap');

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
	top: 0;
	margin: 0 0 0 1rem;
	-webkit-writing-mode: vertical-rl;
	writing-mode: vertical-rl;
	transform: rotate(180deg);
	transform-origin: 0 50%;
}

.grid__item-number {
	font-family: 'Great Vibes', cursive;
	position: absolute;
	right: 0;
	bottom: 0;
	font-size: 2.7rem;
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
}

.js .content__item-img {
	visibility: hidden;
}

.content__item-title {
	position: relative;
	font-size: 7vw;
	line-height: 1;
	text-align: center;
	margin: 0;
	padding: 0 5vw;
	white-space: nowrap;
	grid-area: 1 / 1 / 1 / 1;
}

.content__item-title > span {
	white-space: pre;
	display: inline-block;
}

.content__item-text {
	text-align: justify;
	max-width: 800px;
	margin: 3rem auto;
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
	}
	.grid__item-title {
		margin-left: -0.25rem;
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
						#Holi Now
					</text>
				</svg>
			</div>

			<div class="grid-wrap">
				<div class="grid">
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/GettyImages-503564070.jpg" alt="Paris" />
						</div>
						<h3 class="grid__item-title">Amazing Lond</h3>
						<h4 class="grid__item-number">London</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/GettyImages-532667921.jpg" alt="Eagle" />
						</div>
						<h3 class="grid__item-title">Bald Eagle</h3>
						<h4 class="grid__item-number">Eagle</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/GettyImages-452532471.jpg" alt="Owl" />
						</div>
						<h3 class="grid__item-title">Great Horned Owl</h3>
						<h4 class="grid__item-number">Owl</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/AA.14077862.1.jpg" alt="Falcon" />
						</div>
						<h3 class="grid__item-title">Prairie Falcon</h3>
						<h4 class="grid__item-number">Falcon</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Puffin" />
						</div>
						<h3 class="grid__item-title">Atlantic Puffin</h3>
						<h4 class="grid__item-number">Puffin</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Flamingo" />
						</div>
						<h3 class="grid__item-title">Chilean Flamingo</h3>
						<h4 class="grid__item-number">Flamingo</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Peacock" />
						</div>
						<h3 class="grid__item-title">Indian Peafowl</h3>
						<h4 class="grid__item-number">Peacock</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Macaw" />
						</div>
						<h3 class="grid__item-title">Scarlet Macaw</h3>
						<h4 class="grid__item-number">Macaw</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Cockatoo" />
						</div>
						<h3 class="grid__item-title">Palm Cockatoo</h3>
						<h4 class="grid__item-number">Cockatoo</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Swan" />
						</div>
						<h3 class="grid__item-title">Black Swan</h3>
						<h4 class="grid__item-number">Swan</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Some image" />
						</div>
						<h3 class="grid__item-title">Keel-Billed Toucan</h3>
						<h4 class="grid__item-number">Toucan</h4>
					</a>
					<a href="#" class="grid__item">
						<div class="grid__item-bg"></div>
						<div class="grid__item-wrap">
							<img class="grid__item-img" src="resources/sej_img/holinow/임시 이미지.png" alt="Ostrich" />
						</div>
						<h3 class="grid__item-title">Common Ostrich</h3>
						<h4 class="grid__item-number">Ostrich</h4>
					</a>
				</div>
			</div>

			<div class="content">
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/154510/pexels-photo-154510.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Dove" />
						<h2 class="content__item-title">Mourning Dove</h2>
					</div>
					<div class="content__item-text">
						<p>The mourning dove is a medium-sized, slender dove approximately 31 cm (12 in) in length. Mourning doves weigh 112–170 g (4.0–6.0 oz), usually closer to 128 g (4.5 oz). The mourning dove has a wingspan of 37-45 cm. The elliptical wings are broad, and the head is rounded. Its tail is long and tapered ("macroura" comes from the Greek words for "large" and "tail"). Mourning doves have perching feet, with three toes forward and one reversed. The legs are short and reddish colored. The beak is short and dark, usually a brown-black hue.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/6694643/pexels-photo-6694643.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Eagle" />
						<h2 class="content__item-title">Bald Eagle</h2>
					</div>
					<div class="content__item-text">
						<p>The plumage of an adult bald eagle is evenly dark brown with a white head and tail. The tail is moderately long and slightly wedge-shaped. Males and females are identical in plumage coloration, but sexual dimorphism is evident in the species, in that females are 25% larger than males. The beak, feet and irises are bright yellow. The legs are feather-free, and the toes are short and powerful with large talons. The highly developed talon of the hind toe is used to pierce the vital areas of prey while it is held immobile by the front toes. The beak is large and hooked, with a yellow cere. The adult bald eagle is unmistakable in its native range. The closely related African fish eagle (Haliaeetus vocifer) (from far outside the bald eagle's range) also has a brown body (albeit of somewhat more rufous hue), white head and tail, but differs from the bald in having a white chest and black tip to the bill</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/5883285/pexels-photo-5883285.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Owl" />
						<h2 class="content__item-title">Great Horned Owl</h2>
					</div>
					<div class="content__item-text">
						<p>The great horned owl is generally colored for camouflage. The underparts of the species are usually light with some brown horizontal barring; the upper parts and upper wings are generally a mottled brown usually bearing heavy, complex, darker markings. All subspecies are darkly barred to some extent along the sides, as well. All great horned owls have a facial disc. This can be reddish, brown, or gray in color (depending on geographical and racial variation) and is demarked by a dark rim culminating in bold, blackish side brackets. This species' "horns" are tufts of feathers, called plumicorns. The purpose of plumicorns is not fully understood, but the theory that they serve as a visual cue in territorial and sociosexual interactions with other owls is generally accepted.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/1387045/pexels-photo-1387045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Falcon" />
						<h2 class="content__item-title">Prairie Falcon</h2>
					</div>
					<div class="content__item-text">
						<p>The prairie falcon (Falco mexicanus) is a medium-large sized falcon of western North America. It is about the size of a peregrine falcon or a crow, with an average length of 40 cm (16 in), wingspan of approximately 1 meter (40 in), and average weight of 720 g (1.6 lb). As in all falcons, females are noticeably bigger than males. Though a separate species from the peregrine, the prairie falcon is basically an arid environment adaptation of the early peregrine falcon lineage, able to subsist on less food than the peregrine, and generally lighter in weight than a peregrine of similar wing span. Having evolved in a harsh desert environment with low prey density, the prairie falcon has developed into an aggressive and opportunistic hunter of a wide range of both mammal and bird prey. It will regularly take prey from the size of sparrows to approximately its own weight, and occasionally much larger. It is the only larger falcon native only to North America. It is resident from southern Canada, through western United States, and into northern Mexico. The prairie falcon is popular as a falconry bird, where with proper training it is regarded as being as effective as the more well known peregrine falcon. Male prairie falcons are usually 37 to 38 cm in length (~15 inches) and weigh 500 to 635g (1.1 to 1.4 lbs). Females are about 45 cm in length (17.7 inches) and weigh 762 to 970g (1.7 to 2.1 lbs). A large female can be nearly twice the size of a small male, with wingspan reaching to 1.1 meters (3.5 feet), and tends to hunt significantly larger prey.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/4344890/pexels-photo-4344890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Puffin" />
						<h2 class="content__item-title">Atlantic Puffin</h2>
					</div>
					<div class="content__item-text">
						<p>The Atlantic puffin is sturdily built with a thick-set neck and short wings and tail. It is 28 to 30 cm (11 to 12 in) in length from the tip of its stout bill to its blunt-ended tail. Its wingspan is 47 to 63 cm (19 to 25 in) and on land it stands about 20 cm (8 in) high. The male is generally slightly larger than the female, but they are coloured alike. The forehead, crown, and nape are glossy black, as are the back, wings, and tail. A broad, black collar extends around the neck and throat. On each side of the head is a large, lozenge-shaped area of very pale grey. These face patches taper to a point and nearly meet at the back of the neck. The shape of the head creates a crease extending from the eye to the hindmost point of each patch, giving the appearance of a grey streak. The eye looks almost triangular in shape because of a small, peaked area of horny blue-grey skin above it and a rectangular patch below. The irises are brown or very dark blue and each has red orbital ring.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/788655/pexels-photo-788655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Flamingo" />
						<h2 class="content__item-title">Chilean Flamingo</h2>
					</div>
					<div class="content__item-text">
						<p>The Chilean flamingo (Phoenicopterus chilensis) is a species of large flamingo at 110–130 cm (43–51 in) closely related to American flamingo and greater flamingo, with which it was sometimes considered conspecific. The species is listed as near threatened by the IUCN. It breeds in South America from Ecuador and Peru to Chile and Argentina and east to Brazil; it has been introduced into the Netherlands. Like all flamingos, it lays a single chalky-white egg on a mud mound. These flamingos are mainly restricted to salt lagoons and soda lakes but these areas are vulnerable to habitat loss and water pollution.The plumage is pinker than the slightly larger greater flamingo, but less so than the Caribbean flamingo. It can be differentiated from these species by its grayish legs with pink joints (tibiotarsal articulation), and also by the larger amount of black on the bill (more than half). Young chicks may have no sign of pink coloring whatsoever, but instead remain gray.The Chilean flamingo's bill is equipped with comb-like structures that enable it to filter food—mainly algae and plankton—from the water of the coastal mudflats, estuaries, lagoons, and salt lakes where it lives.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/6194634/pexels-photo-6194634.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Peacock" />
						<h2 class="content__item-title">Indian Peafowl</h2>
					</div>
					<div class="content__item-text">
						<p>Peacocks are a larger sized bird with a length from bill to tail of 100 to 115 cm (39 to 45 in) and to the end of a fully grown train as much as 195 to 225 cm (77 to 89 in) and weigh 4–6 kg (8.8–13.2 lb). The females, or peahens, are smaller at around 95 cm (37 in) in length and weigh 2.75–4 kg (6.1–8.8 lb). Indian peafowl are among the largest and heaviest representatives of the Phasianidae. So far as is known, only the wild turkey grows notably heavier. The green peafowl is slightly lighter in body mass despite the male having a longer train on average than the male of the Indian species. Their size, colour and shape of crest make them unmistakable within their native distribution range. The male is metallic blue on the crown, the feathers of the head being short and curled. The fan-shaped crest on the head is made of feathers with bare black shafts and tipped with bluish-green webbing. A white stripe above the eye and a crescent shaped white patch below the eye are formed by bare white skin. The sides of the head have iridescent greenish blue feathers. The back has scaly bronze-green feathers with black and copper markings. The scapular and the wings are buff and barred in black, the primaries are chestnut and the secondaries are black. The tail is dark brown and the "train" is made up of elongated upper tail coverts (more than 200 feathers, the actual tail has only 20 feathers) and nearly all of these feathers end with an elaborate eye-spot. A few of the outer feathers lack the spot and end in a crescent shaped black tip. The underside is dark glossy green shading into blackish under the tail. The thighs are buff coloured. The male has a spur on the leg above the hind toe.The adult peahen has a rufous-brown head with a crest as in the male but the tips are chestnut edged with green. The upper body is brownish with pale mottling. The primaries, secondaries and tail are dark brown. The lower neck is metallic green and the breast feathers are dark brown glossed with green. The remaining underparts are whitish. Downy young are pale buff with a dark brown mark on the nape that connects with the eyes. Young males look like the females but the wings are chestnut coloured.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/6923087/pexels-photo-6923087.png?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="Macaw" />
						<h2 class="content__item-title">Scarlet Macaw</h2>
					</div>
					<div class="content__item-text">
						<p>The scarlet macaw (Ara macao) is a large red, yellow, and blue Central and South American parrot, a member of a large group of Neotropical parrots called macaws. It is native to humid evergreen forests of tropical Central and South America. Its range extends from south-eastern Mexico to the Peruvian Amazon, Ecuador, Colombia, Bolivia, Venezuela and Brazil in lowlands of 500 m (1,600 ft) (at least formerly) up to 1,000 m (3,300 ft), as well as the Pacific island of Coiba. Formerly, it ranged north to southern Tamaulipas. In some areas, it has suffered local extinction because of habitat destruction, or capture for the parrot trade, but in other areas, it remains fairly common. It is the national bird of Honduras. Like its relative the blue-and-yellow macaw, scarlet macaws are popular birds in aviculture as a result of their striking plumage. It is about 81 centimeters (32 in) long, of which more than half is the pointed, graduated tail typical of all macaws, though the scarlet macaw has a larger percentage of tail than the other large macaws. The average weight is about 1 kilogram (2 lb 3 oz). The plumage is mostly scarlet, but the rump and tail-covert feathers are light blue, the greater upper wing coverts are yellow, the upper sides of the flight feathers of the wings are dark blue as are the ends of the tail feathers, and the undersides of the wing and tail flight feathers are dark red with metallic gold iridescence. Some individuals may have green in the wings. There is bare white skin around the eye and from there to the bill. Tiny white feathers are contained on the face patch. The upper mandible is mostly pale horn in color and the lower is black. Juveniles have dark eyes; adults have light yellow eyes. It is frequently confused with the slightly larger green-winged macaw, which has more distinct red lines in the face and no yellow in the wing. Scarlet macaws make very loud, high and sometimes low-pitched, throaty squawks, squeaks and screams designed to carry many kilometers to call for their groups. The scarlet macaw can live up to 75 or even 90 years in captivity, although a more typical lifespan is 40 to 50 years.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/7722486/pexels-photo-7722486.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Cockatoo" />
						<h2 class="content__item-title">Palm Cockatoo</h2>
					</div>
					<div class="content__item-text">
						<p>The palm cockatoo was originally described by German naturalist Johann Friedrich Gmelin in 1788 as Psittacus aterrimus. Its specific name, Probosciger aterrimus, is from Latin proboscis, long thin nose + -ger, carry, and Latin superlative adjective for ater, black, hence a "black [bird] with a long thin nose (beak)". The only member of the monotypic genus, Probosciger, the palm cockatoo is a member of the white cockatoo subfamily Cacatuinae. Earlier limited genetic studies found it to be the earliest offshoot from the ancestors of what have become the cockatoo family. Four subspecies are recognized, three poorly differentiated and one distinctive. The Cape York cockatoo (P. a. aterrimus), the larger goliath cockatoo (P. a. goliath), P. a. macgillivrayi, intermediate in size, and the northern palm cockatoo (P. a. stenolophus, similar to the goliath, but crest feathers are much narrower). "Palm cockatoo" has been designated the official name by the International Ornithological Committee (IOC). The species was named the "Goliath Aratoo" in Wood's Natural History (1862). It is also sometimes given the misnomer "black macaw" in aviculture - the macaws are unrelated New World parrots. Confusingly, this name was also used by early naturalists and Brazilian natives to refer to the dark blue hyacinth macaw. The palm cockatoo is 55 to 60 cm (22 to 24 in) in length and weighs 910–1,200 g (2.01–2.65 lb). It may be the largest cockatoo species and largest parrot in Australia, although large races of yellow-tailed black cockatoos and sulphur-crested cockatoos broadly overlap in size. It is a distinctive bird with a large crest and has one of the largest bills of any parrot (only the hyacinth macaw's is larger). This powerful bill enables palm cockatoos not only to eat very hard nuts and seeds, but also enables males to break off thick (about 1 in) sticks from live trees to use for a drumming display. The male has a larger beak than the female. The beak is unusual, as the lower and upper mandibles do not meet for much of its length, allowing the tongue to hold a nut against the top mandible while the lower mandible works to open it. The palm cockatoo also has a distinctive red cheek patch that changes colour when the bird is alarmed or excited. The palm cockatoo has a large and complex vocal repertoire, including many whistles and even a "hello" call that sounds surprisingly human-like. Distinct dialects occur throughout the species' range. Anecdotal evidence indicates a palm cockatoo reaching 80 or 90 years of age in an Australian zoo, although the oldest confirmed individual was aged 56 in London Zoo in 2000. Although longevity of captive birds is known, the lifespan of palm cockatoos that live in the wild is still unknown .</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/5826772/pexels-photo-5826772.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="Swan" />
						<h2 class="content__item-title">Black Swan</h2>
					</div>
					<div class="content__item-text">
						<p>The black swan (Cygnus atratus) is a large waterbird, a species of swan which breeds mainly in the southeast and southwest regions of Australia. Within Australia, the black swan is nomadic, with erratic migration patterns dependent upon climatic conditions. It is a large bird with mostly black plumage and a red bill. It is a monogamous breeder, with both partners sharing incubation and cygnet-rearing duties. The black swan was introduced to various countries as an ornamental bird in the 1800s, but has managed to escape and form stable populations. Described scientifically by English naturalist John Latham in 1790, the black swan was formerly placed into a monotypic genus, Chenopis. Black swans can be found singly, or in loose companies numbering into the hundreds or even thousands. It is a popular bird in zoological gardens and bird collections, and escapees are sometimes seen outside their natural range.Black swans are mostly black-feathered birds, with white flight feathers. The bill is bright red, with a pale bar and tip; and legs and feet are greyish-black. Cobs (males) are slightly larger than pens (females), with a longer and straighter bill. Cygnets (immature birds) are a greyish-brown with pale-edged feathers. Mature black swans measure between 110 and 142 centimetres (43 and 56 in) in length and weigh 3.7–9 kilograms (8.2–19.8 lb). Their wing span is between 1.6 and 2 metres (5.2 and 6.6 ft). The neck is long (relatively the longest neck among the swans) and curved in an "S"-shape. The black swan utters a musical and far reaching bugle-like sound, called either on the water or in flight, as well as a range of softer crooning notes. It can also whistle, especially when disturbed while breeding and nesting. When swimming, black swans hold their necks arched or erect and often carry their feathers or wings raised in an aggressive display. In flight, a wedge of black swans will form as a line or a V, with the individual birds flying strongly with undulating long necks, making whistling sounds with their wings and baying, bugling or trumpeting calls. Black swan skeleton (Museum of Osteology). The black swan is unlike any other Australian bird, although in poor light and at long range it may be confused with a magpie goose in flight. However, the black swan can be distinguished by its much longer neck and slower wing beat. One captive population of black swans in Lakeland, Florida has produced a few individuals which are a light mottled grey colour instead of black. The black swan is common in the wetlands of southwestern and eastern Australia and adjacent coastal islands. In the south west its range encompasses an area between North West Cape, Cape Leeuwin and Eucla; while in the east it covers a large region bounded by the Atherton Tableland, the Eyre Peninsula and Tasmania, with the Murray Darling Basin supporting very large populations of black swans. It is uncommon in central and northern Australia. The black swan is almost exclusively herbivorous, and while there is some regional and seasonal variation, the diet is generally dominated by aquatic and marshland plants. In New South Wales the leaf of reedmace (genus Typha) is the most important food of birds in wetlands, followed by submerged algae and aquatic plants such as Vallisneria. In Queensland, aquatic plants such as Potamogeton, stoneworts, and algae are the dominant foods. The exact composition varies with water level; in flood situations where normal foods are out of reach black swans will feed on pasture plants on shore. The black swan feeds in a similar manner to other swans. When feeding in shallow water it will dip its head and neck under the water and it is able to keep its head flat against the bottom while keeping its body horizontal. In deeper water the swan up-ends to reach lower. Black swans are also able to filter feed at the water's surface.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/17811/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Some image" />
						<h2 class="content__item-title">Keel-Billed Toucan</h2>
					</div>
					<div class="content__item-text">
						<p>When I was in the islands nearly a generation ago, I was acquainted with a young American couple who had among their belongings an attractive little son of the age of seven—attractive but not practicably companionable with me, because he knew no English. He had played from his birth with the little Kanakas on his father’s plantation, and had preferred their language and would learn no other. The family removed to America a month after I arrived in the islands, and straightway the boy began to lose his Kanaka and pick up English. By the time he was twelve he hadn’t a word of Kanaka left; the language had wholly departed from his tongue and from his comprehension. Nine years later, when he was twenty-one, I came upon the family in one of the lake towns of New York, and the mother told me about an adventure which her son had been having. By trade he was now a professional diver. A passenger boat had been caught in a storm on the lake, and had gone down, carrying her people with her. A few days later the young diver descended, with his armor on, and entered the berth-saloon of the boat, and stood at the foot of the companionway, with his hand on the rail, peering through the dim water. Presently something touched him on the shoulder, and he turned and found a dead man swaying and bobbing about him and seemingly inspecting him inquiringly. He was paralyzed with fright.</p>
						<p>His entry had disturbed the water, and now he discerned a number of dim corpses making for him and wagging their heads and swaying their bodies like sleepy people trying to dance. His senses forsook him, and in that condition he was drawn to the surface. He was put to bed at home, and was soon very ill. During some days he had seasons of delirium which lasted several hours at a time; and while they lasted he talked Kanaka incessantly and glibly; and Kanaka only. He was still very ill, and he talked to me in that tongue; but I did not understand it, of course. The doctor-books tell us that cases like this are not uncommon. Then the doctors ought to study the cases and find out how to multiply them. Many languages and things get mislaid in a person’s head, and stay mislaid for lack of this remedy.</p>
						<p>Several of our passengers belonged in Honolulu, and these were sent ashore; but nobody could go ashore and return. There were people on shore who were booked to go with us to Australia, but we could not receive them; to do it would cost us a quarantine-term in Sydney. They could have escaped the day before, by ship to San Francisco; but the bars had been put up, now, and they might have to wait weeks before any ship could venture to give them a passage any whither. And there were hardships for others. An elderly lady and her son, recreation-seekers from Massachusetts, had wandered westward, further and further from home, always intending to take the return track, but always concluding to go still a little further; and now here they were at anchor before Honolulu positively their last westward-bound indulgence—they had made up their minds to that—but where is the use in making up your mind in this world? It is usually a waste of time to do it. These two would have to stay with us as far as Australia. Then they could go on around the world, or go back the way they had come; the distance and the accommodations and outlay of time would be just the same, whichever of the two routes they might elect to take. Think of it: a projected excursion of five hundred miles gradually enlarged, without any elaborate degree of intention, to a possible twenty-four thousand. However, they were used to extensions by this time, and did not mind this new one much.</p>
					</div>
				</div>
				<div class="content__item">
					<div class="content__item-intro">
						<img class="content__item-img" src="https://images.pexels.com/photos/2078472/pexels-photo-2078472.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="Ostrich" />
						<h2 class="content__item-title">Common Ostrich</h2>
					</div>
					<div class="content__item-text">
						<p>The common ostrich (Struthio camelus) or simply ostrich, is a species of large flightless bird native to certain large areas of Africa. It is one of two extant species of ostriches, the only living members of the genus Struthio in the ratite order of birds. The other is the Somali ostrich (Struthio molybdophanes), which was recognized as a distinct species by BirdLife International in 2014 having been previously considered a very distinctive subspecies of ostrich. The common ostrich belongs to the order Struthioniformes. Struthioniformes previously contained all the ratites, such as the kiwis, emus, rheas, and cassowaries. However, recent genetic analysis has found that the group is not monophyletic, as it is paraphyletic with respect to the tinamous, so the ostriches are now classified as the only members of the order. Phylogenetic studies have shown that it is the sister group to all other members of Palaeognathae and thus the flighted tinamous are the sister group to the extinct moa. It is distinctive in its appearance, with a long neck and legs, and can run for a long time at a speed of 55 km/h (34 mph) with short bursts up to about 70 km/h (43 mph), the fastest land speed of any bird. The common ostrich is the largest living species of bird and lays the largest eggs of any living bird (the extinct elephant birds of Madagascar and the giant moa of New Zealand laid larger eggs). The common ostrich's diet consists mainly of plant matter, though it also eats invertebrates and small reptiles. It lives in nomadic groups of 5 to 50 birds. When threatened, the ostrich will either hide itself by lying flat against the ground, or run away. If cornered, it can attack with a kick of its powerful legs. Mating patterns differ by geographical region, but territorial males fight for a harem of two to seven females. The common ostrich is farmed around the world, particularly for its feathers, which are decorative and are also used as feather dusters. Its skin is used for leather products and its meat is marketed commercially, with its leanness a common marketing point. Common ostriches usually weigh from 63 to 145 kilograms (139–320 lb), or as much as two adult humans. The Masai ostriches of East Africa (S. c. massaicus) averaged 115 kg (254 lb) in males and 100 kg (220 lb) in females, while the nominate subspecies, the North African ostrich (S. c. camelus), was found to average 111 kg (245 lb) in unsexed adults. Exceptional male ostriches (in the nominate subspecies) can weigh up to 156.8 kg (346 lb). At sexual maturity (two to four years), male common ostriches can be from 2.1 to 2.8 m (6 ft 11 in to 9 ft 2 in) in height, while female common ostriches range from 1.7 to 2.0 m (5 ft 7 in to 6 ft 7 in) tall. New chicks are fawn in color, with dark brown spots.[12] During the first year of life, chicks grow at about 25 cm (9.8 in) per month[citation needed]. At one year of age, common ostriches weigh approximately 45 kilograms (99 lb). Their lifespan is up to 40–45 years. The long neck and legs keep their head up to 2.8 m (9 ft) above the ground, and their eyes are said to be the largest of any land vertebrate: 50 mm (2.0 in) in diameter; helping them to see predators at a great distance. The eyes are shaded from sunlight from above. However, the head and bill are relatively small for the birds' huge size, with the bill measuring 12 to 14.3 cm (4.7 to 5.6 in). Their skin varies in color depending on the subspecies, with some having light or dark gray skin and others having pinkish or even reddish skin. The strong legs of the common ostrich are unfeathered and show bare skin, with the tarsus (the lowest upright part of the leg) being covered in scales: red in the male, black in the female. The tarsus of the common ostrich is the largest of any living bird, measuring 39 to 53 cm (15 to 21 in) in length. The bird has just two toes on each foot (most birds have four), with the nail on the larger, inner toe resembling a hoof. The outer toe has no nail. The reduced number of toes is an adaptation that appears to aid in running, useful for getting away from predators. Common ostriches can run at a speed over 70 km/h (43 mph) and can cover 3 to 5 m (9.8 to 16.4 ft) in a single stride. The wings reach a span of about 2 metres (6 ft 7 in), and the wing chord measurement of 90 cm (35 in) is around the same size as for the largest flying birds.</p>
					</div>
				</div>
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
    