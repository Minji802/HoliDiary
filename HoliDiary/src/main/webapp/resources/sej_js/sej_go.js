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
