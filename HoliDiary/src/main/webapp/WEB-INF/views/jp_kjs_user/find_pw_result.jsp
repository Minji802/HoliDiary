<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="content_find_user">
	<div id="find_pw_result_page_box"> 
		<div class="find_pw_result_go_login">
			<a href="jp.login.go">ログインページへ</a>
		</div>
		<c:choose>
			<c:when test="${r eq '불일치'}">
				<div class="find_pw_result_info">
					<span>会員情報が見つかりません。<br> 入力情報を確認してください。</span>
				</div>
				<div class="find_pw_result_go_find_id">
					<button onclick="location.href='jp.find.id.go'">IDを探す</button>
				</div>
				<div class="find_pw_result_go_find_pw">
					<button onclick="location.href='jp.find.pw.go'">パスワードをお忘れの方</button>
				</div>
			</c:when>
			<c:when test="${r eq '일치' }">
				<div class="find_pw_result_info">
					<span>
						<span class="find_pw_result_email" >${userEmail }</span>へ臨時パスワードが送信されました。<br>
						臨時パスワードでログインした後、パスワードの変更をお願いします。
					</span>
				</div>
			</c:when>
		</c:choose>
	</div>	
</div>
</body>
</html>