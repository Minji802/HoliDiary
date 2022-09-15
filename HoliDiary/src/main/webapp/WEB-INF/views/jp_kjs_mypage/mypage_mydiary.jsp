<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div class="mypage_index"
				onclick="showMyinfo()">
				<span>My Page</span>
			</div>
			<div  class="mypage_index"
				onclick="showSubscribeInfo()">
				<span>My Subscribe</span>
			</div>
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showMyDiary()">
				<span style="color: #6667AB;">My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_mydiary_title">マイダイアリー現況</div>
				</div>
				<div class="mypage_mydiary_chart">
					<canvas id="myChart" width="1000" height="350"></canvas>
				</div>
				<div class="mypage_mydiary_follower">
					<div class="mypage_mydiary_follower_title"><span>本日の訪問者</span></div>
					<div id="mypage_mydiary_scroll">
 					<c:forEach var="visit" items="${visits }">
					<div class="mypage_mydiary_list" >
						<div class="mypage_mydiary_visit_img" onclick="mypagePopup('${visit.userID }')">
							<img src="./resources/kjs_profileImg/${visit.userImg}">
						</div>
						<div class="mypage_mydiary_follower_nickname">
							<span onclick="mypagePopup('${visit.userID }')">${visit.userNickname}</span>
						</div>
					</div>
					</c:forEach> 
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
					</div>
				</div>
			</div>
		</div>
	</div>

	
	<script type="text/javascript">
	
	// x축 날짜 구하기
	var today = new Date();
	var days = [];
	
	for(var i = 0; i < 6; i++){
		today = new Date();
		days[i] = new Date(today.setDate(today.getDate() - (5-i)));
		//console.log(days[i]);
		
 		var month = days[i].getMonth() + 1;
 		var date = days[i].getDate();
 		
 		var labels = month + "月" + date + "日";
 		
 		days[i] = labels;
 		
		//console.log(days[i]);
	}
	
	// y축 데이터 구하기
	$.ajax({
		url: 'visit.get',
		type : 'GET',
		dataType : 'json',
		success : function(visit) {
			const ctx = document.getElementById('myChart').getContext('2d');
			const myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: days,
			        datasets: [{
			            label: '訪問者',
			            data: visit,
			            backgroundColor: '#6667AB',
			            borderColor: '#6667AB',
			            borderWidth: 1
			        }]
			    },
			    options: {
			    	interaction: {
			    	      intersect: false,
			    	      mode: 'index',
			    	    },
			    	responsive: true,
			        scales: {
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			});
		},
		error : function(error) {
			alert('問題が発生しました。もう一度利用してください。')
		}
	});
	
</script>
</body>
</html>