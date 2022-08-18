<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="content_find_user">
		<div id="find_id_page_box">
			<div class="find_id_go_login">
				<a href="login.go">로그인 페이지로</a>
			</div>
			<div class="find_id_go_find_pw">
				<a href="find.pw.go">비밀번호 찾기</a>
			</div>
			<form action="find.id.do" method="post" onsubmit="return findID()">
				<div id="find_id_box">
					<div class="userID_show_box">
						<span id="find_id_valid"></span>
						<c:choose>
							<c:when test="${null ne db_user}">
								<span id="userID_show" style="color: blue;">${db_user}</span>
								<c:if test="${null ne kakao_user}">
									<br>
									<span id="userID_show">카카오와 연동된 아이디입니다.</span>
								</c:if>
								<c:if test="${null ne naver_user}">
									<br>
									<span id="userID_show">네이버와 연동된 아이디입니다.</span>
								</c:if>
							</c:when>
							<c:when test="${findID_r eq 'no' }">
								<span id="userID_show">아이디를 찾을 수 없습니다.<br>입력정보를 다시 확인해주세요.</span>
							</c:when>
						</c:choose>
					</div>
					<div class="find_id_name_box">
						<input name="userName" placeholder="이름" autocomplete="off"
							id="find_id_name">
					</div>
					<div class="find_id_phone_box">
						<input name="userPhoneNumber" placeholder="휴대폰번호"
							autocomplete="off" id="find_id_phone">
					</div>
					<div class="find_id_btn_box">
						<button id="find_id_btn">아이디 찾기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>