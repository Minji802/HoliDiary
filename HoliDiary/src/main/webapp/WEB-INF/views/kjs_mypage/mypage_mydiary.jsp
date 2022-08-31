<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
</head>
<body>
	<div id="content_mypage">
		<div id="mypage_page_box">
			<div class="mypage_index"
				onclick="showMyinfo()">
				<span>My Page</span>
			</div>
			<div  class="mypage_index"
				onclick="showFollowing()">
				<span>My Subscribe</span>
			</div>
			<div style="background-color: #FFDE59;" class="mypage_index"
				onclick="showFollower()">
				<span style="color: #6667AB;">My Diary</span>
			</div>
			<div class="mypage_content_box">
				<div>
					<div class="mypage_mydiary_title">마이 다이어리 현황</div>
				</div>
				<div class="mypage_mydiary_chart">
					<canvas id="myChart" width="1000" height="350"></canvas>
				</div>
				<div class="mypage_mydiary_follower">
					<div class="mypage_mydiary_follower_title">나를 구독하는 사람</div>
					<c:forEach var="info" items="${infos }">
					<div>
						<div class="mypage_mydiary_follower_img">
							<img src="./resources/kjs_profileImg/${info.userImg}">
						</div>
						<div>
							${info.userNickname}
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	
	const ctx = document.getElementById('myChart').getContext('2d');
	const myChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        datasets: [{
	            label: '방문자 수',
	            data: [12, 19, 3, 5, 2, 3],
	            fill: false,
	            tension: 0.1,
	            backgroundColor: ['#6667AB'],
	            borderColor: ["#6667AB"],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            y: {
	                beginAtZero: true
	            },
	            x: {
	                type: 'time',
	                time: {
	                  unit: 'day'
	                }
	            }
	        }
	    }
	});
</script>
</body>
</html>