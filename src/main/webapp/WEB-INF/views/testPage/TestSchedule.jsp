<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	};
</style>
</head>
<body>
	<a href="${pageContext.request.contextPath }/TestSchedule">새로고침</a>
	<h2>기차 예매사이트 (열차정보 출력 예제)</h2>
	
	출발할 역 정보 : <input type="text" id="depPlaceId"> <br>
	도착할 역 정보 : <input type="text" id="arrPlaceId">	<br>
	날짜 선정 : <input type="date" id="depPlandTime"> <br>
	인원 : <input type="text" id="arrPlaceId"> <br>
	<button type="button" onclick="inputScheduleData()">입력하기</button>
	<br><hr><br>
	<div id="dataTable">
	
	</div>
	

	
	
	
	<script type="text/javascript">
		
	// 입력된 각 정보를 담은 뒤 Ajax로 전송해준다. => TrainController
		function inputScheduleData() {
			var depPlaceId = $('#depPlaceId').val();
			var arrPlaceId = $('#arrPlaceId').val();
			var depPlandTime = $('#depPlandTime').val();
			
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/getTrainSchedule",
				data: {
					"depPlaceId" : depPlaceId,
					"arrPlaceId" : arrPlaceId,
					"depPlandTime" : depPlandTime
				},
				dataType: "json",
				async : false,
				success: function(scList){
					var output ="";
					// AJAX - 예매정보를 출력할 때 사용된 코드
					//console.log(scList);
					output += '<table>';
					output += '<tr><th>출발역</th><th>도착역</th><th>출발시간</th><th>도착시간</th><th>편성번호</th><th>운임비</th></tr>';
					if(scList.length > 0){
						for(var i = 0; i < scList.length; i++){
							console.log(scList[i].trainno);
							output += '<tr>';
							output += '<td>'+scList[i].depplacename+'</td>';
							output += '<td>'+scList[i].arrplacename+'</td>';
							output += '<td>'+scList[i].depplandtime+'</td>';
							output += '<td>'+scList[i].arrplandtime+'</td>';
							output += '<td>'+scList[i].trainno+'</td>';
							output += '<td>'+scList[i].adultcharge+'</td>';
							output += '</tr>';
						}
						
					}
					output += '</table>';
					$("#dataTable").html(output);
				}
			})
		}
	
	</script>
</body>
</html>