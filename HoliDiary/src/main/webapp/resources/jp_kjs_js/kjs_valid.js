// <input>을 넣었을때
// 비어있으면 true, 글자가 들어있으면 false
function isEmpty(input) {
	return (!input.val());
}

function isEmptyForJS(input) {
	return (!input.value);
}

//글자수가 모자라면 true, 괜찮으면 false
function lessThan(input, len) {
	return (input.val().length < len);
}


//영어, 숫자이외의 것이 있으면 true, 아니면 false
function containsHS(input) {
	var txt = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM@_.";
	for (var i = 0; i < input.val().length; i++) {
		if (txt.indexOf(input.val()[i]) == -1) {
			return true;
		}
	}
	return false;
}

//두 개 내용이 다르면 true, 같으면 false
function notEquals(input1, input2) {
	return (input1.val() != input2.val());
}

