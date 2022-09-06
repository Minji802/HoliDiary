/* 빈칸 검사 */

function categoryValidCheck() {
	let categoryName = $("#categoryName");
	
	if(isEmpty(categoryName)){
		categoryName.focus();
		alert('추가할 카테고리 이름을 입력하세요');
		return false;
	}
	return true;
}

function imgValidCheck(){
	let mainImg = $("#mainImg");
	
	if(isEmpty(mainImg)){
		alert('수정할 이미지를 등록하세요');
		return false;
	}
	return true;
	
}

