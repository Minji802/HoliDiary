function postSubmitCheck() {
			var postTitle = document.postSubmitForm.postTitle;
			var postTxt = document.postSubmitForm.postTxt;
			
			if (postTitle.value == '') {
				alert("제목을 입력해주세요");
				postTitle.focus();
				return false;
			} else if (postTxt.value == ''){
				alert("내용을 입력해주세요");
				postTxt.focus();
				return false;
			}
			
			return true;
			
		}