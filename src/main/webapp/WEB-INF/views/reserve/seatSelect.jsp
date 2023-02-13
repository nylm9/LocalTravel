<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기차예매 - 좌석 선택창</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- theme meta -->
<meta name="theme-name" content="revolve" />

<!--Favicon-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">

<!-- THEME CSS
	================================================== -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Themify -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/themify/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.css">
<!-- Slick Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.css">
<!-- manin stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">


<style type="text/css">

/*맨 앞 역표*/
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
	padding: 8px;
}

thead {
	background-color: #f8f8f8;
}

/* 눌럿을때 뜨는 표*/
.card-graph {
	margin-bottom: 17px;
	text-align: center;
	font-weight: bold;
	background-color: #f8f8f8;
}

/*날짜*/
.reserveArea {
	height: 350px;
	overflow: scroll;
}

.seatBtn-Th {
	cursor: pointer;
}

.seatBtn-Th:hover {
	background-color: lightgray;
	cursor: pointer;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		console.log('좌석데이터 가져오기')
		$.ajax({
			type : "GET",
			dataType: "json",
			async : false,
	        url : "${pageContext.request.contextPath }/getSeatData",
	        success : function(arrayList) {
	        	console.log(arrayList[0].seatnum);
	        	var arr1 = [];
	        	for(var i = 0; i < arrayList.length; i++){
	        		console.log(arrayList[i].seatnum);
	        	}
	        	
	        }
		});
			
	});		
	
</script>
</head>
<body>
	기차예매 - 좌석선택
	<div class="col-12">
		<div style="margin-bottom: 10px;">
			<button type="button" class="btn" style="text-align: left;">이전</button>
			<h4
				Style="display: inline-block; margin-left: 55px; margin-right: 60px;">5호차</h4>
			<button type="button" class="btn" style="text-align: right;">다음</button>
		</div>
		<div class="card">
			<div class="card-body">
				<table>
					
						<tr>
							<th></th>
							<th></th>
							<th>
							<th></th>
							<th></th>
						</tr>
					
				</table>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function re9() {
		alert('sks')
	}
</script>
<!-- THEME JAVASCRIPT FILES
================================================== -->
<!-- initialize jQuery Library -->

<!-- Bootstrap jQuery -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/popper.min.js"></script>
<!-- Owl caeousel -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.js"></script>
<!-- Instagram Feed Js -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/instafeed-js/instafeed.min.js"></script>
<!-- Google Map -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/google-map/gmap.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>


</body>
</html>