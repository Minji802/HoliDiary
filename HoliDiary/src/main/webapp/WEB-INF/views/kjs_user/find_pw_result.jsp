<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOLIDIARY</title>
</head>
<body>
<div id="content_find_user">
	<div id="find_pw_result_page_box"> 
		<div class="find_pw_result_go_login">
			<a href="login.go">로그인 페이지로</a>
		</div>
		<c:choose>
			<c:when test="${r eq '불일치'}">
				<div class="find_pw_result_info">
					<span>회원정보를 찾을 수 없습니다.<br> 입력하신 정보를 다시 확인해주세요.</span>
				</div>
				<div class="find_pw_result_go_find_id">
					<button onclick="location.href='find.id.go'">아이디 찾기</button>
				</div>
				<div class="find_pw_result_go_find_pw">
					<button onclick="location.href='find.pw.go'">비밀번호 찾기</button>
				</div>
			</c:when>
			<c:when test="${r eq '일치' }">
				<div class="find_pw_result_info">
					<span>
						<span class="find_pw_result_email">${userEmail }</span>로 임시 비밀번호가 전송되었습니다.<br>
						임시 비밀번호를 통해 로그인 후, 비밀번호를 변경해주세요.
					</span>
				</div>
			</c:when>
		</c:choose>
	</div>	
</div>
</body>
</html>