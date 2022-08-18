function openNav() {
 /* $(".top_menu_img_box_a").click(function() {*/
	  document.getElementById("menu_bar").style.width = "300px";
	  
	  /*if (document.getElementById("menu_bar").style.width = "300px") {
		  $("#menu_bar").focusout(function() {
			  document.getElementById("menu_bar").style.width = "0";	
		  });
		} */
 /* });*/
}

function closeNav() {
	/*$(".closebtn").click(function() {*/
		document.getElementById("menu_bar").style.width = "0";	
	/*})*/
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
	    	  arrows : true,      // 옆으로 이동하는 화살표 표시 여부
	          dots : true, 
	      });
}

/*function secondSliderEvent() {
	$('.second_slider').slick({
		  dots: true,
		  arrows : true,
		  infinite: false,
		  speed: 300,
		  slidesToShow: 4,
		  slidesToScroll: 4,
		  responsive: [
		    {
		      breakpoint: 1024,
		      settings: {
		        slidesToShow: 3,
		        slidesToScroll: 3,
		        infinite: true,
		        dots: true
		      }
		    },
		    {
		      breakpoint: 600,
		      settings: {
		        slidesToShow: 2,
		        slidesToScroll: 2
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        slidesToShow: 1,
		        slidesToScroll: 1
		      }
		    }
		    // You can unslick at a given breakpoint now by adding:
		    // settings: "unslick"
		    // instead of a settings object
		  ]
		});
}
*/
document.addEventListener("DOMContentLoaded", function() {

    var mySwiper = new Swiper('.swiper1', {
        slidesPerView: 4,
        slidesPerGroup: 4,
        observer: true,
        observeParents: true,
        spaceBetween: 24,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        breakpoints: {
            1280: {
                slidesPerView: 3,
                slidesPerGroup: 3,
            },
            720: {
                slidesPerView: 1,
                slidesPerGroup: 1,
            }
        }
    });    
});

function searchEvent() {
	$('#autoComplete').autocomplete({
		 source : function(request, response) { //source: 입력시 보일 목록
		     $.ajax({
		           url : "/ajax/autocomplete.do"   
		         , type : "POST"
		         , dataType: "JSON"
		         , data : {value: request.term}	// 검색 키워드
		         , success : function(data){ 	// 성공
		             response(
		                 $.map(data.resultList, function(item) {
		                     return {
		                    	     label : item.SEARCH_WORD    	// 목록에 표시되는 값
		                           , value : item.SEARCH_WORD 		// 선택 시 input창에 표시되는 값
		                           , idx : item.SEQ // index
		                     };
		                 })
		             );    //response
		         }
		         ,error : function(){ //실패
		             alert("오류가 발생했습니다.");
		         }
		     });
		 }
			,focus : function(event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
				return false;
			},
			minLength: 1,// 최소 글자수
			delay: 100	//autocomplete 딜레이 시간(ms),
			, select : function(evt, ui) { 
	      	// 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
				console.log(ui.item.label);
				console.log(ui.item.idx);
		 }
	});
}


$(function() {
	/*openNav();
	closeNav();*/
	/*closeNav2();*/
	mainSliderEvent();
	secondSliderEvent();
	searchEvent();
	
});