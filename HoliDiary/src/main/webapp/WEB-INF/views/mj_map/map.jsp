<html>
<head>
<title>Place Autocomplete and Directions</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<link rel="stylesheet" type="text/css" href="resources/mj_css/mj_map.css" />
<script type="module" src="resources/mj_js/mj_mapIndex.js"></script>
</head>
<body>

	<input id="pac-input" class="controls" type="text" placeholder="Search Box" />

	<div id="floating-panel">
		<input id="hide-markers" type="button" value="Hide Markers" /> 
		<input id="show-markers" type="button" value="Show Markers" /> 
		<input id="delete-markers" type="button" value="Delete Markers" />
	</div>

	<div id="map"></div>
	
	<p>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDb4vTBtJ5eI4DOAJXj4ov7YSdM066-PQ0&libraries=places&callback=initMap&v=weekly"
		defer></script>
</body>
</html>
