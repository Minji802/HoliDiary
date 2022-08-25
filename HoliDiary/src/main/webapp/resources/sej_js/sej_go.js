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
