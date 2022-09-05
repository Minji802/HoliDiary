var album_list = document.querySelector('.album-list');
var album_player_show = document.querySelector('#album-player-show');

album_player_show.addEventListener('change', function(){
  if ( this.checked ) {
    album_list.classList.add('all-view-albums');
  } else {
    album_list.classList.remove('all-view-albums');
  }
});


function showMusicPlayer() {
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=100, left=270";
	
//	var url = 'musicPlayer';
	var url = 'musicPlayer.open';
	
	window.open(url, "_blank", options);
}

function showAirplane(){
let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=100, left=270";
	
	
	window.open("https://www.skyscanner.co.kr", "_blank", options);
}

function showTicket(){
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=400, height=500, top=100, left=270";
	
	
	window.open("https://www.airbnb.co.kr/", "_blank", options);
}