function goHome() {
	location.href='index.go';
}

function goJP_home() {
	location.href='JPindex.go';
}

function goSearch() {
	let search = document.getElementsByClassName("search_input")[0].value
	
	location.href='home.search?search='+ search;
}

function goJP_Holinow() {
	location.href='JPholinow.go';
}

function goJP_BestHoli() {
	location.href='JPbestHoli.go';
}

function goJP_ItemShop() {
	location.href='JPitemShop.go';
}

function goJP_ItemShop_sticker() {
	location.href='JPitemShop_sticker.go';
}

function goJP_ItemShop_other() {
	location.href='JPitemShop_other.go';
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
