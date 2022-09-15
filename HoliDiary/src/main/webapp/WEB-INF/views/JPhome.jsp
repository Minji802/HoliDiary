<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="home_container">
	<div class="main_slider">
		<div>
			<img src="resources/sej_img/slider/eiffel-tower-768501.jpg">
		</div>
		<div>
			<img src="resources/sej_img/slider/8.jpg">
		</div>
		<div>
			<img src="resources/sej_img/slider/다운로드.jpg">
		</div>
		<div>
			<img src="resources/sej_img/slider/london-530055.jpg">
		</div>
		<div>
			<img src="resources/sej_img/slider/architecture-1852928_1920.jpg">
		</div>
	</div>

	<p class="second_slider_title">
		<img class="second_slider_title_img"
			src="resources/sej_img/slider/free-icon-travel-6350271.png">国別
		Holiまとめ <span class="second_slider_title_border"></span>
	</p>
	<div class="swiper-container swiper1">
		<div class="swiper-wrapper swiper1">
			<div class="swiper-slide">
				<a href="javascript:void(0)" onclick="goHoliByCountry_Europe()">
				<img src="resources/sej_img/slider/22.jpg">
				</a>
			</div>
			<div class="swiper-slide">
				<a href="javascript:void(0)" onclick="goHoliByCountry_America()">
				<img src="resources/sej_img/slider/162.jpg">
				</a>
			</div>
			<div class="swiper-slide">
				<a href="javascript:void(0)" onclick="goHoliByCountry_Asia()">
				<img src="resources/sej_img/slider/a2000366_main.jpg">
				</a>
			</div>
			<div class="swiper-slide">
				<a href="javascript:void(0)" onclick="goHoliByCountry_Africa()">
				<img src="resources/sej_img/slider/다운로드 (2).jpg">
				</a>
			</div>
			<div class="swiper-slide">
				<a href="javascript:void(0)" onclick="goHoliByCountry_Oceania()">
				<img src="resources/sej_img/slider/오세아니아.jpg">
				</a>
			</div>
			<div class="swiper-slide">
				<img src="resources/sej_img/slider/임시 이미지.png">
			</div>
			<div class="swiper-slide">
				<img src="resources/sej_img/slider/임시 이미지.png">
			</div>
			<div class="swiper-slide">
				<img src="resources/sej_img/slider/임시 이미지.png">
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>

	<!-- partial:index.partial.html -->
	<div class='pages'>
		<input id='one' name='trigger' type='radio'> <input id='two'
			name='trigger' type='radio'> <input id='three' name='trigger'
			type='radio'> <input id='four' name='trigger' type='radio'>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='logo'>
					<img class="logo_img_for_bookslider" src="resources/sej_img/slogo1-removebg-preview.png">
				</div>
				<img class="aeroplane_img_for_bookslider" src="resources/sej_img/slider/free-icon-paper-aeroplane-8135537.png">
				<div class='pagenumber'>1 2</div>
				<div class='content'>
					<div class='content_center'>
						<h4>Make a diary of your trip</h4>
					</div>
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='content'>
					<div class='content_center right'>
						<h4>Make a diary of your trip</h4>
					</div>
					<div class='overlay'></div>
				</div>
				<div class='control next'>
					<label for='two'></label>
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<!-- <div><img class='note_pages_logo' src="resources/sej_img/logofit-removebg-preview.png"></div> -->
				<div class='pagenumber'>2 3</div>
				<div class='control'>
					<label for='one'></label>
				</div>
				<div class='content'>
					<!-- <div class='content_picture'>
						<img
							src='https://i.pinimg.com/originals/1f/bc/f1/1fbcf1c55e839cd7b4aa28c4902669be.jpg'>
					</div> -->
					<!-- <div class='content_offset'>
						<h2>Subtitle</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Donec a imperdiet sapien. Nunc vehicula lorem neque, eu rutrum
							sapien posuere ut. Nunc eget ullamcorper turpis. Sed in vehicula
							magna, vitae eleifend velit. Donec dui turpis, viverra vitae
							lobortis commodo, lobortis et ex.</p>
					</div> -->
					<!-- <h1>
						<span>L</span> <span>o</span> <span>o</span> <span>k</span> <span>&nbsp;</span>
						<span>a</span> <span>t</span> <span>&nbsp;</span> <span>t</span> <span>h</span>
						<span>i</span> <span>s</span> <span>&nbsp;</span> <span>a</span> <span>w</span>
						<span>e</span> <span>s</span> <span>o</span> <span>m</span> <span>e</span>
						<br> <span>h</span> <span>e</span> <span>a</span> <span>d</span>
						<span>l</span> <span>i</span> <span>n</span> <span>e</span> <span>&nbsp;</span>
						<span>r</span> <span>i</span> <span>g</span> <span>h</span> <span>t</span>
						<span>&nbsp;</span> <span>h</span> <span>e</span> <span>r</span> <span>e</span>
					</h1> -->
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='control next'>
					<label for='three'></label>
				</div>
				<div class='bg'></div>
				<div class='footer'>
					<i class="fab fa-google-plus-g"></i> <i class="fas fa-retweet"></i>
					<i class="far fa-heart"></i> <i class="far fa-share-square"></i>
				</div>
				<div class='content'>
					<!-- <div class='content_quote'>
						<h5>
							<span class='quo'> <i>"</i>
							</span> <span>This is a quote</span> <span>from someone</span> <span
								class='name'>Jamie Coulter</span> <span class='auth'>-
								Jcoulterdesign</span> <span class='quo'>"</span>
						</h5>
					</div> -->
					<!-- <div class='content_picture'>
						<img
							src='https://i.pinimg.com/originals/1f/bc/f1/1fbcf1c55e839cd7b4aa28c4902669be.jpg'>
					</div> -->
					<!-- <h1>
						<span>L</span> <span>o</span> <span>o</span> <span>k</span> <span>&nbsp;</span>
						<span>a</span> <span>t</span> <span>&nbsp;</span> <span>t</span> <span>h</span>
						<span>i</span> <span>s</span> <span>&nbsp;</span> <span>a</span> <span>w</span>
						<span>e</span> <span>s</span> <span>o</span> <span>m</span> <span>e</span>
						<br> <span>h</span> <span>e</span> <span>a</span> <span>d</span>
						<span>l</span> <span>i</span> <span>n</span> <span>e</span> <span>&nbsp;</span>
						<span>r</span> <span>i</span> <span>g</span> <span>h</span> <span>t</span>
						<span>&nbsp;</span> <span>h</span> <span>e</span> <span>r</span> <span>e</span>
					</h1> -->
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='logo'><!-- Fashion --></div>
				<div class='pagenumber'>4 5</div>
				<div class='content'>
					<div><img class="swing" src="resources/sej_img/slider/Travel-Demand-is-Back-to-Pre-Pandemic-Levels-and-What-it-Means-To-You-This-Summer.jpg"></div>
					<div><img class="swing2" src="resources/sej_img/slider/travel-experience-1x.jpg"></div>
					<div class='content_center'>
						<h4 id="PageContentH">Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
						<h6 id="PageContentH">Lorem ipsum dolor sit amet</h6>
					</div>
				</div>
				<div class='control'>
					<label for='two'></label>
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='control next'>
					<label for='four'></label>
				</div>
				<div class='bg'></div>
				<div class='content_centerimage'>
					<img
						src="resources/sej_img/slider/travel-022.jpg">
				</div>
				<div class='content'>
					<div class='content_center right'>
						<h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit</h4>
						<h6>Lorem ipsum dolor sit amet</h6>
					</div>
				</div>
				<div class='footer'>
					<i class="fab fa-google-plus-g"></i> <i class="fas fa-retweet"></i>
					<i class="far fa-heart"></i> <i class="far fa-share-square"></i>
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='logo'><!-- Fashion --></div>
				<div class='pagenumber'>6 7</div>
				<div class='content'>
					<div class='content_section'>
						<h2>Super</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Donec a imperdiet sapien. Nunc vehicula lorem neque, eu rutrum
							sapien posuere ut. Nunc eget ullamcorper turpis. Sed in vehicula
							magna, vitae eleifend velit.</p>
					</div>
					<div class='content_section'>
						<h2>Awesome</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Donec a imperdiet sapien. Nunc vehicula lorem neque, eu rutrum
							sapien posuere ut. Nunc eget ullamcorper turpis. Sed in vehicula
							magna, vitae eleifend velit.</p>
					</div>
					<div class='content_section'>
						<h2>Great</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Donec a imperdiet sapien. Nunc vehicula lorem neque, eu rutrum
							sapien posuere ut. Nunc eget ullamcorper turpis. Sed in vehicula
							magna.</p>
					</div>
				</div>
				<div class='control'>
					<label for='three'></label>
				</div>
			</div>
		</div>
		<div class='pages_page'>
			<div class='pages_page__inner'>
				<div class='bg'></div>
				<div class='content'></div>
				<div class='footer'>
					<i class="fab fa-google-plus-g"></i> <i class="fas fa-retweet"></i>
					<i class="far fa-heart"></i> <i class="far fa-share-square"></i>
				</div>
			</div>
		</div>
	</div>
	<!-- partial -->
	<script src="./script.js"></script>
	</div>
</body>
</html>