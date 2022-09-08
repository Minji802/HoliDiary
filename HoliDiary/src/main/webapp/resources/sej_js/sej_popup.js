function searchPopup(num,id){
	let options = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=1000, height=600, top=100, left=270";
	
	//alert(id);
	
	var url = 'post.detail.go?postNum='+ num + "&userId=" + id;
	
	window.open(url,"_blank", options);
}
