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
	$("#displayList").hide();
	// 검색어의 길이가 바뀔 때마다 호출
	var wordLength = $(this).val().trim().length;
	if(wordLength == 0){
				$("#displayList").hide();
			} else {
				$.ajax({
					url:"/wordSearchShow.action",
					type:"get",
					data:{"searchType": $("#searchType").val(),
						  "searchWord": $("#searchWord").val() },
					dataType:"json",
					success:function(json){
						if(json.length > 0){
							// 검색된 데이터가 있는 경우
							var html = "";
							$.each(json, function(index, item){
								var word = item.word;
	                            // 검색목록들과 검색단어를 모두 소문자로 바꾼 후 검색단어가 나타난 곳의 index를 표시.
								var index = word.toLowerCase().indexOf( $("#searchWord").val().toLowerCase() );
								// jaVa -> java
								var len = $("#searchWord").val().length;
								// 검색한 단어를 파랑색으로 표현
								var result = word.substr(0, index) + "<span style='color:blue;'>"+word.substr(index, len)+"</span>" + word.substr(index+len);
								html += "<span class='result' style='cursor:pointer;'>" + result + "</span><br>";
							});
							
							var input_width = $("#searchWord").css("width"); // 검색어 input 태그 width 알아오기
							$("#displayList").css({"width":input_width}); // 검색 결과의 width와 일치시키기
							$("#displayList").html(html);
							$("#displayList").show();
						}
						
					},
					error: function(request, status, error){
		                alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            }
					
				});

			}
	        
	        // 자동완성 목록을 클릭하면 검색하기
		$(document).on('click', ".result", function(){
			var word = $(this).text();
			$("#searchWord").val(word);
			goSearch(); // 검색기능
		});
}


$(function() {
	/*openNav();
	closeNav();*/
	/*closeNav2();*/
	mainSliderEvent();
	secondSliderEvent();

});