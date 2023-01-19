<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 임시적으로 만든 홈버튼 -->
	<a href="${pageContext.request.contextPath }/">홈으로</a><br>
	
	<div>
		<input type="text" id="mid"> <input type="text" id="mpw">
		<button type="button" onclick="memberLoginBtn()">로그인</button>
	</div>
	
	<!-- Jquery&로그인 기능 관련 JavaScript -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		
		function memberLoginBtn() {
			var mid = $('#mid').val();
			var mpw = $('#mpw').val();
			
			console.log(mid + ' ' + mpw);
			
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/memberLogin",
				data : {
					"mid" : mid,
					"mpw" : mpw
				},
				success: function(loginResult){
					console.log(loginResult);
					var loginId = loginResult;
					if(loginId.length > 0){
						//로그인 성공시 띄울 부분
						alert('로그인 완료됨');
					} else {
						//로그인 실패시 띄울 부분
						alert('로그인 실패됨')
					}
				}
			});
		}
		
		
	</script>
</body>
</html>