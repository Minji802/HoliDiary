function mysubSearch(){
	
	let search = $("#mysubSearch").val();
	
	$.ajax({
		url: 'mysub.search',
		type : 'GET',
		dataType : 'json',
		data : {'mysubSearch': search},
		success : function(data) {
			console.log(JSON.stringify(data))
			$(".mypage_mysub_scroll").html("");
			for(i=0; i < data.length; i++){
				$(".mypage_mysub_scroll").append(
						'<div id="mysub_info_list_box"'
						+ 'onclick="mypagePopup(\''
						+ data[i].userID
						+ '\')">'
						+ '<div class="mysub_info_img_box">'
						+	'<img src="./resources/kjs_profileImg/'
						+	data[i].userImg
						+	'\">'
						+	'</div>'
						+	'<div class="mysub_info_nickname">'
						+	data[i].userNickname
						+	'</div>'
						+	'<div class="mysub_info_diarytitle">'
						+	data[i].diaryTitle
						+	'</div>'
						+	'<div class="mysub_info_canclesub">'
						+	'<button type="button" onclick="event.stopPropagation();subscribeCancel(\''
						+	data[i].subscribeNo
						+	'\');">구독취소</button>'
						+	"</div>"
						+	"</div>"
				);
			}
		},
		error : function(error) {
			$(".mypage_mysub_scroll").html("");
		}
	});
}

function mysubscriberSearch(){
	
	let search = $("#mysubscriberSearch").val();
	
	$.ajax({
		url: 'mysubscriber.search',
		type : 'GET',
		dataType : 'json',
		data : {'mysubSearch': search},
		success : function(data) {
			console.log(JSON.stringify(data))
			$(".mypage_mysub_scroll").html("");
			for(i=0; i < data.length; i++){
				$(".mypage_mysub_scroll").append(
						'<div id="mysub_info_list_box"'
						+ 'onclick="mypagePopup(\''
						+ data[i].userID
						+ '\')">'
						+ '<div class="mysub_info_img_box">'
						+	'<img src="./resources/kjs_profileImg/'
						+	data[i].userImg
						+	'\">'
						+	'</div>'
						+	'<div class="mysub_info_nickname">'
						+	data[i].userNickname
						+	'</div>'
						+	'<div class="mysub_info_diarytitle">'
						+	data[i].diaryTitle
						+	'</div>'
						+	'<div class="mysub_info_canclesub">'
						+	'<button type="button" onclick="event.stopPropagation();subscribeCancel(\''
						+	data[i].subscribeNo
						+	'\');">구독취소</button>'
						+	"</div>"
						+	"</div>"
				);
			}
		},
		error : function(error) {
			$(".mypage_mysub_scroll").html("");
		}
	});
}

function subscribeCancel(id){
		$.ajax({
			url: 'mysub.cancel',
			type : 'GET',
			dataType : 'text',
			data : {'id': id},
			success : function(data) {
				if(data == 1){
					location.reload();
				}else{
					swal('구독 취소에 실패했습니다');
				}
			},
			error : function(error) {
				swal('문제가 발생했습니다. 다시 이용해주세요.');
			}
		});
}

function mypagePopup(id){
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1000, height=600, top=100, left=270";
	
	//alert(id);
	
	var url = 'popup.open?userId=' +id;
	
	window.open(url,"_blank", options);
}

function subscribeDo(id){
	$.ajax({
		url: 'subscribe.do',
		type : 'GET',
		dataType : 'text',
		data : {'id': id},
		success : function(data) {
			if(data == 1){
				location.reload();
			}else{
				swal('문제가 발생했습니다. 다시 이용해주세요.');
			}
		},
		error : function(error) {
			swal('문제가 발생했습니다. 다시 이용해주세요.');
		}
	});
}