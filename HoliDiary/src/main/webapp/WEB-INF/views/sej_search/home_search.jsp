<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div id="home_search_inner_place">
	<div class="leftPageBox">
	<c:if test="${curPage != 1 }">
		<a href="search.page.change?p=${curPage - 1 }&search=${search}"><img id="home_search_pageL" src="resources/sej_img/slider/free-icon-left-yellow.png"></a>
	</c:if>
	</div>
	<div id="home_search_content_place">
	<c:forEach var="c" items="${contents }">
			<div class="home_search_content">
			<div class="home_search_content_title_box">
			<h3 class="home_search_content_title">${c.posttitle }</h3>
			<span>${c.postweather }</span>
			</div> 
			<div>
			<span>${c.postmap }</span>
			<p class="home_search_content_img">
			<c:if test="${sessionScope.loginUser.userID != null}">
			<a href="post.detail.go?postNum=${c.postnum } + &userId=${c.postwriter }">
			<img src="${c.postimg }" onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';">
			</a>
			</c:if>
			<c:if test="${sessionScope.loginUser.userID == null}">
			<a href="login.go">
			<img src="${c.postimg }" onerror="this.onerror=null; this.src='resources/alterImg/free-icon-picture-6490775.png';">
			</a>
			</c:if>
			</p>
			</div>
			<div>
			<span class="home_search_text_box">${c.posttxt }</span>
			<span class="home_search_writer">${c.postwriter }</span> 
			<span class="home_search_recommend">추천수: ${c.postrecommend }</span>
			</div>
			<span class="home_search_category">${c.postcategory }</span>
			<span class="home_search_country">${c.postcountry }</span>
		</div>
		
	</c:forEach>
	</div>
	<div class="rightPageBox">
	<c:if test="${curPage != pageCount }">
		<a href="search.page.change?p=${curPage + 1 }&search=${search}"><img id="home_search_pageR" src="resources/sej_img/slider/free-icon-right-yellow.png"></a>
	</c:if> 
	</div>
	</div>
</body>
</html>