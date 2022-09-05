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
	$(function() {
		var selectThemeColor = document.getElementById("selectThemeColor").value;
		
		if (selectThemeColor == "linear-gradient(to top, #FFDE59, #5D5FB2)") {
			$("#holi").prop("checked", true);
		} else if (selectThemeColor == "#FFB22C") {
			$("#orange").prop("checked", true);
		} else if (selectThemeColor == "gray") {
			$("#dark").prop("checked", true);
		} else if (selectThemeColor == "#FF9EBB") {
			$("#love").prop("checked", true);
		} else if (selectThemeColor == "linear-gradient(to top, #00656E, #FDC04E)") {
			$("#sujin").prop("checked", true);
		} else if (selectThemeColor == "#99CCFF") {
			$("#sky").prop("checked", true);
		} else if (selectThemeColor == "linear-gradient(to top, #673AB7, #9575CD, #D1C4E9)") {
			$("#yongjun").prop("checked", true);
		} else if (selectThemeColor == "linear-gradient(to top, #1A237E, #FF7F27)") {
			$("#minji").prop("checked", true);
		}
			

		$("input[name=themeColor]").change(function() {
			let color = $("input[name=themeColor]:checked").val();
			console.log(color);
			$('body').css('background', color);
			$('.btn-invite').css('background', color);
			$('.action-buttons').css('background', color);
			$(".themeColor").removeClass("selected");
		});
		

	});
</script>
</head>
<body>
<h1>Edit Diary</h1>

	<form action="diary.update">
		<table>
			<tr>
				<td colspan="10"><span><h3>Theme Color</h3></span></td>
			</tr>
			<tr>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="holi" 
						value="linear-gradient(to top, #FFDE59, #5D5FB2)" />holi</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="orange" 
						value="#FFB22C" />orange</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="dark" 
						value="gray" />dark</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="love" 
						value="#FF9EBB" />love</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="sky" 
						value="#99CCFF" />sky</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="sujin" 
						value="linear-gradient(to top, #00656E, #FDC04E)" />sujin</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="yongjun" 
						value="linear-gradient(to top, #673AB7, #9575CD, #D1C4E9)" />yongjun</label></td>
				<td><label><input type="radio" name="themeColor" class="themeColor" id="minji" 
						value="linear-gradient(to top, #1A237E, #FF7F27)" />minji</label></td>
				<td><input type="hidden" id="selectThemeColor" value="${Diary.themeColor }"> </td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td><span><h3>Diary Title</h3></span></td>
			</tr>
			<tr>
				<td><input value="${Diary.diaryTitle }" type="text"
					name="diaryTitle" autocomplete="off" maxlength="20"
					style="border-bottom: solid 1px; width: 330px;"></td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td><span><h3>Diary Introduce</h3></span></td>
			</tr>
			<tr>
				<td><input value="${Diary.diaryIntroduce }" type="text"
					name="diaryIntroduce" autocomplete="off" maxlength="25"
					style="border-bottom: solid 1px; width: 330px;"></td>
				<td><input type="hidden" value="${Diary.diaryUserId }"
					name="diaryUserId"></td>
			</tr>
		</table>
		<br> <br>


		<table>
			<tr>
				<td><button class="btn-invite"
						style="background-color: gray; width: 80px;">저장</button></td>
			</tr>
		</table>
	</form>


</body>
</html>