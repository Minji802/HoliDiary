function goHome() {
	location.href='index.go';
}

function goSearch() {
	let search = document.getElementsByClassName("search_input")[0].value
	
	location.href='home.search?search='+ search;
}

function goHolinow() {
	location.href='holinow.go';
}

function goBestHoli() {
	location.href='bestHoli.go';
}

function goItemShop() {
	location.href='itemShop.go';
}

function goItemShop_sticker() {
	location.href='itemShop_sticker.go';
}

function goItemShop_other() {
	location.href='itemShop_other.go';
}

function goHoliByCountry_Europe() {
	location.href='holiByCountry.go?search=유럽';
}
function goHoliByCountry_America() {
	location.href='holiByCountry.go?search=아메리카';
}
function goHoliByCountry_Asia() {
	location.href='holiByCountry.go?search=아시아';
}
function goHoliByCountry_Africa() {
	location.href='holiByCountry.go?search=아프리카';
}
function goHoliByCountry_Oceania() {
	location.href='holiByCountry.go?search=오세아니아';
}
