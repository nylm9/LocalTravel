<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 - 예매페이지</title>
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
</style>
<!-- Yeonwoo Style -->
<style>
/* 지역 선택시 */
.LocationSelcet {
	border: 1px solid black;
	text-align: center;
	margin-bottom: 3px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.LocationSelcet:hover {
	border: 1px solid black;
	color: white;
	background-color: black;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
}

.LocationSelcetAct {
	border: 1px solid black;
	color: white;
	background-color: lightsalmon;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
}

.LocationSelcetInact {
	border: 1px solid black;
	color: white;
	background-color: darkgray;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
}
/* 목록 제목부분 */
.card-header {
	text-align: center;
	font-weight: bold;
}
/* 역 선택 부분 */

/* 지역선택 Body 부분 */
.SelectList {
	height: 500px;
	overflow: scroll;
}

/* 역 버튼  */
.stationBtn {
	display: inline-block;
	border: 1px solid black;
	margin: 3px;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
}

.stationBtn:hover {
	border: 1px solid black;
	color: white;
	background-color: black;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
}

.stationBtnAct {
	border: 1px solid black;
	color: white;
	background-color: lightsalmon;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
}

.cleanTable {
	border: 0px solid white;
}

.cleanTh {
	padding-left: 5px;
	padding-right: 5px;
}

.scheduleInfoTitle {
	font-size: small;
	border: 0px solid white;
	padding: 2px;
}

.scheduleInfoContent {
	font-size: small;
	border: 0px solid white;
	padding: 2px;
}

.textleft {
	text-align: left;
}

.textcenter {
	text-align: center;
}

.ReserveTitle {
	font-size: small;
	padding: 3px;
}

.ReserveTitle2 {
	font-size: large;
	padding: 3px;
}

.ReserveContent {
	padding: 3px;
	font-size: xx-large;
	font-weight: bold;
	padding-bottom: 10px;
}
</style>


</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->


	<!-- 예매창 main창-->
	<section class="section">
		<div class="row" style="min-width: 565px;">
		<h2>예매는 성공되었다</h2>
		</div>
	</section>
	<script type="text/javascript">
		
	</script>


	<!-- THEME JAVASCRIPT FILES
================================================== -->
	<!-- initialize jQuery Library -->
	<script
		src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
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
	<script
		src="${pageContext.request.contextPath }/resources/js/custom.js"></script>


</body>
</html>