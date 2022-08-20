$(function() {

	$(".heart").on("click", function() {
		$(this).toggleClass("is-active");
		likeupdate();
	});

	function likeupdate() {
		$.ajax({
			url: "post.detail.go",
			type: "GET",
			dataType: "json",
			data: $('.heart').serialize(),
			success: 
				function(data) {
					alert("좋아요 클릭");
					$("#like_result").html(data.like);
				},
				
			error:
				function(request, status, error) {
					alert("ajax 실패")
				}
		});
	}
	
});