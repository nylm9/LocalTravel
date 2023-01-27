<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
	
	출발할 역 정보 : <input type="text" id="depPlaceId"> <br>
	도착할 역 정보 : <input type="text" id="arrPlaceId">	<br>
	날짜 선정 : <input type="date" id="depPlandTime"> <br>
	<button type="button" onclick="inputScheduleData()">입력하기</button>
	
	
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
				success: function(Result){
					alert(Result);
				}
			})
		}
	
	</script>
</body>
</html>