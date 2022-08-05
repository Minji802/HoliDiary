
// 전화번호 자동 하이픈 생성 함수
function phoneNumberHyphen(){
	var autoHypenPhone = function(str){
	      str = str.replace(/[^0-9]/g, '');
	      var tmp = '';
	      if( str.length < 4){
	          return str;
	      }else if(str.length < 7){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3);
	          return tmp;
	      }else if(str.length < 11){
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 3);
	          tmp += '-';
	          tmp += str.substr(6);
	          return tmp;
	      }else{              
	          tmp += str.substr(0, 3);
	          tmp += '-';
	          tmp += str.substr(3, 4);
	          tmp += '-';
	          tmp += str.substr(7);
	          return tmp;
	      }
	  
	      return str;
	}


	var phoneNum = document.getElementById('phoneNum');

	phoneNum.onkeyup = function(){
	  console.log(this.value);
	  this.value = autoHypenPhone( this.value ) ;  
	}
}

// 카카오 소셜 로그인을 위한 초기 설정
Kakao.init('4341fa67ca594172a2669bd0ccaf89fc');
console.log('카카오톡 권한 : ' + Kakao.isInitialized());

// 카카오톡으로 로그인 하기
function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost/main/social.go'
    })
  }


// 레디
$(function() {
	phoneNumberHyphen();
});
