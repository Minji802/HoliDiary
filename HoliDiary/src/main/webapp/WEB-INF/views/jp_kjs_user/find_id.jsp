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
				<a href="jp.login.go">ログインページへ</a>
			</div>
			<div class="find_id_go_find_pw">
				<a href="jp.find.pw.go">パスワードをお忘れの方</a>
			</div>
			<form action="jp.find.id.do" method="post" onsubmit="return findID()">
				<div id="find_id_box">
					<div class="userID_show_box">
						<span id="find_id_valid"></span>
						<c:choose>
							<c:when test="${null ne db_user}">
								<span id="userID_show">${db_user}</span>
								<span class="userSNS_show">
								<c:if test="${null ne kakao_user}">
									<br>
									カカオトークと連動している会員です。
								</c:if>
								<c:if test="${null ne naver_user}">
									<br>
									ネイバーと連動している会員です。
								</c:if>
								</span>
							</c:when>
							<c:when test="${findID_r eq 'no' }">
								<span id="userID_show" style="color: red; font-size: 13pt;">IDが見つかりません。<br>入力情報を確認してください。</span>
							</c:when>
						</c:choose>
					</div>
					<div class="find_id_name_box">
						<input name="userName" placeholder="氏名" autocomplete="off"
							id="find_id_name">
					</div>
					<div class="find_id_phone_box">
						<input name="userPhoneNumber" placeholder="電話番号"
							autocomplete="off" id="find_id_phone">
					</div>
					<div class="find_id_btn_box">
						<button id="find_id_btn">IDを探す</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>