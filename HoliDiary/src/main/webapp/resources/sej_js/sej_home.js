function openNav() {
  $(".top_menu_img_box_a").click(function() {
	  document.getElementById("menu_bar").style.width = "300px";
	  
	  /*if (document.getElementById("menu_bar").style.width = "300px") {
		  $("#menu_bar").focusout(function() {
			  document.getElementById("menu_bar").style.width = "0";	
		  });
		} */
  });
}

function closeNav() {
	$(".closebtn").click(function() {
		document.getElementById("menu_bar").style.width = "0";	
	})
}

/*function closeNav2() {
	$("#menu_bar").focusout(function() {
		alert('11');
	});
}*/

function mainSliderEvent() {
	      $('.main_slider').slick({
	    	  slidesToShow: 1,
	    	  slidesToScroll: 1,
	    	  autoplay: true,
	    	  autoplaySpeed: 2000,
	    	  arrows : true,         // 옆으로 이동하는 화살표 표시 여부
	          dots : true, 
	      });
}





$(function() {
	openNav();
	closeNav();
	/*closeNav2();*/
	mainSliderEvent();
});