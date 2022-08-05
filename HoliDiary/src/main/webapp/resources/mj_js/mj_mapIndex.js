let latLng = { lat: 37.5662952, lng: 126.9779451 };
let europe = { lat: 56.0789635, lng: 0.9901297 };
let asia = { lat: 34.047863, lng: 100.6196553 };
let america = { lat: 11.863562, lng: -107.4353043 };
let oceania = { lat: -11.1692535, lng: 130.6697515 };
let africa = { lat: 4.364132, lng: 23.025819 };
const bounds = {
		north: 84.860203,
		south: -84.618493,
		west: -180.0,
		east: 180.0
};

const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
let labelIndex = 0;

	
function initMap() {
	
	  let map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 13,
	    center: latLng,
	    restriction: {
            latLngBounds: bounds,
            strictBounds: false,
        },
	  });
	  
	  
	  $('#europeGo').on('click', function() {
			map.panTo(europe);
			map.setZoom(4);
		});
	  $('#asiaGo').on('click', function() {
		  map.panTo(asia);
		  map.setZoom(3);
	  });
	  $('#americaGo').on('click', function() {
		  map.panTo(america);
		  map.setZoom(3);
	  });
	  $('#oceaniaGo').on('click', function() {
		  map.panTo(oceania);
		  map.setZoom(4);
	  });
	  $('#africaGo').on('click', function() {
		  map.panTo(africa);
		  map.setZoom(3);
	  });
		
	  
	  
	  const contentString = '<input id="a" placeholder="장소">'
	   
	  let infowindow = new google.maps.InfoWindow({
	    content: contentString,
	  });
	  let marker = new google.maps.Marker({
	    position: latLng,
	    map,
	    title: "zz",
	  });

	  marker.addListener("click", () => {
		    infowindow.open({
		      anchor: marker,
		      map,
		      shouldFocus: false,
		    });
		  });



	  // 마커추가
	  // This event listener calls addMarker() when the map is clicked.
	  google.maps.event.addListener(map, "click", (event) => {
		  console.log('마커찍힘')
		  console.log(event.latLng.lat())
		  console.log(event.latLng.lng())
		  addMarker(event.latLng, map);
    
	  });

	  // add event listeners for the buttons
// document.getElementById("show-markers").addEventListener("click",
// showMarkers);
// document.getElementById("hide-markers").addEventListener("click",
// hideMarkers);
// document.getElementById("delete-markers").addEventListener("click",
// deleteMarkers);

	  // Add a marker at the center of the map.
	  // addMarker(seoul, map);

}




// Adds a marker to the map.
function addMarker(location, map) {
	  let newMaker = new google.maps.Marker({
		    position: location,
		    label: labels[labelIndex++ % labels.length],
		    map: map,
	  });
	 
	  
	  newMaker.addListener("click", () => {
	  		console.log('추가된 마커 이벤트')
	  		// 찍힌 마커에 해당 정보 가져오기
	  		let infos = '<input id="placeName" placeholder="장소이름"><br>' +
	  			'<input id="infoMemo" placeholder="설명을 입력해주세요">' +
	  			'<button class="saveInfo">저장</button>';
	  		
				let infowindow = new google.maps.InfoWindow({
		  			content: infos,
		  		});
				
				
		  		infowindow.open({
		  			anchor: newMaker, map,
		  			shouldFocus: false,
		  		});
		  		
		  		$(document).on("click", ".saveInfo", function() {
	  			let placeName = $("#placeName").val()
	  			let infoMemo = $("#infoMemo").val()
	  			console.log(placeName);
	  			console.log(infoMemo);
	  			$.ajax({
	  				url : 'save.info',
	  				data : {map_placeName:placeName, map_infoMemo:infoMemo},
	  				success : function() {
	  					
	  					
	  				}
	  				
	  			});
				
			});
	  			
	  });
}



window.initMap = initMap;


/*
 * // Sets the map on all markers in the array. function setMapOnAll(map) { for
 * (let i = 0; i < markers.length; i++) { markers[i].setMap(map); } } // Removes
 * the markers from the map, but keeps them in the array. function hideMarkers() {
 * setMapOnAll(null); } // Shows any markers currently in the array. function
 * showMarkers() { setMapOnAll(map); } // Deletes all markers in the array by
 * removing references to them. function deleteMarkers() { hideMarkers();
 * markers = []; }
 */

