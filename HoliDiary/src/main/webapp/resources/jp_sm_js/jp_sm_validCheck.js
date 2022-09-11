/* 빈칸 검사 */

function categoryValidCheck() {
	let categoryName = $("#categoryName");
	
	if(isEmpty(categoryName)){
		categoryName.focus();
		alert == swal('追加するカテゴリ名を入力してください。');
		return false;
	}
	return true;
}

function imgValidCheck(){
	let mainImg = $("#mainImg");
	
	if(isEmpty(mainImg)){
		alert == swal('修正するイメージを登録してください。');
		return false;
	}
	return true;
	
}

