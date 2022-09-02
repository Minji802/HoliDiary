<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/sm_css/sm_popup.css">
<script type="text/javascript" src="resources/jquery/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	$("input[name='themeColor']").change(function(){
		let color = $("input[name='themeColor']:checked").val();
		console.log(color);
			$('body').css('background',color);
			$('.btn-invite').css('background',color);
			$('.action-buttons').css('background',color);
			$(".themeColor").removeClass("selected");
		});	
});


</script>
</head>
<body>

<form action="diary.update">
	<table>
		<tr>
			<td colspan="10"><span><h3>Theme Color</h3></span></td>
		</tr>
		<tr>
			<td><label><input type="radio" name="themeColor" value="linear-gradient(to top, #FFDE59, #5D5FB2)" checked/>holi</label></td>
			<td><label><input type="radio" name="themeColor" value="#FFB22C"/>orange</label></td>
			<td><label><input type="radio" name="themeColor" value="gray"/>dark</label></td>
			<td><label><input type="radio" name="themeColor" value="#FF9EBB"/>love</label></td>
			<td><label><input type="radio" name="themeColor" value="#99CCFF"/>sky</label></td>
			<td><label><input type="radio" name="themeColor" value="linear-gradient(to top, #00656E, #FDC04E)"/>sujin</label></td>
		</tr>	
	</table>
	<br>
	<table>
		<tr>
			<td><span><h3>Diary Title</h3></span></td>
		</tr>
		<tr>
			<td><input value="${Diary.diaryTitle }" type="text" name="diaryTitle" autocomplete="off" style="border-bottom: solid 1px; width: 300px;"></td>
		</tr>
	</table>
	<br>
	<table>
		<tr>
			<td><span><h3>Diary Introduce</h3></span></td>
		</tr>
		<tr>
			<td><input value="${Diary.diaryIntroduce }" type="text" name="diaryIntroduce" autocomplete="off" style="border-bottom: solid 1px; width: 300px;"></td>
			<td><input type="hidden" value="${Diary.diaryUserId }" name="diaryUserId"></td>
		</tr>
	</table>
	<br><br>
	
	
	<table>
		<tr>
			<td><button class="btn-invite" style="background-color: gray; width: 80px;">완료</button></td>
		</tr>
	</table>
</form>	
	
</body>
</html>