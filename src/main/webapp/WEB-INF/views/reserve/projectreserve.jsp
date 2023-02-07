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
	background-color: red;
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
	padding-left: 5px;
	padding-right: 5px;
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
	background-color: red;
	text-align: center;
	cursor: pointer;
	margin-bottom: 3px;
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

			<!-- 출발역 선택표 -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card" style="margin-top: 40px; margin-left: 40px;">
					<div class="card-header">출발역</div>
					<div class="card-body SelectList">
						<!-- 출발역 선택창 -->
						<c:forEach items="${cityList }" var="citylist">
							<!-- 지역 목록 -->
							<div class="LocationSelcet" id="DepLoctaion${citylist.citycode }"
								onclick="DepLoctaionSelect(this,${citylist.citycode })">${citylist.cityname }</div>
							<div id="stationList${citylist.citycode }" class="d-none">
								<div id="stationView${citylist.citycode }">
									<!-- 역 목록 -->
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- 도착역 선택표 -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card" style="margin-top: 40px; margin-left: 40px;">
					<div class="card-header">도착역</div>
					<div class="card-body SelectList">
						<!-- 출발역 선택창 -->
						<c:forEach items="${cityList }" var="citylist">
							<!-- 지역 목록 -->
							<div class="LocationSelcet" id="ArrLoctaion${citylist.citycode }"
								onclick="ArrLoctaionSelect(this,${citylist.citycode })">${citylist.cityname }</div>
							<div id="ArrstationList${citylist.citycode }" class="">
								<div id="arrStationView${citylist.citycode }">
									<!-- 역 목록 -->
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- 출발지와 도착지를 모두 선택하고 날짜선택 -->
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="card" style="margin-top: 40px; margin-left: 40px;">
					<div class="card-body">
						<div class="card" style="float: left;">
							<div class="card-body">
								<h5 class="card-title">날짜</h5>
								<!-- List group with Links and buttons -->
								<div class="list-group reserveArea" id="scDateListArea">
									<h5>3월</h5>
								</div>
							</div>
						</div>
						<div class="card" style="float: right;">
							<div class="card-body">
								<h6>열차상세정보</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 맨아단에 출발->도착 예매하기 버튼 -->
			<div class="col-12">
				<div class="card">
					<div class="card-body p-3">
						<div class="row">
							<div class="col-6">
								<h3 style="float: left;">출발</h3>
								<p style="float: left;" id="DepStaDisplay"></p>
								<p style="float: right;" id="ArrStaDisplay"></p>
								<h3 style="float: right;">도착</h3>
								
							</div>

							<div class="col" style="text-align: center;">
								<button class="btn btn-danger font-bold mb-1 w-40 h-30"
									onclick="reserveMovie_kakaoPay()">예매하기_결제</button>
							</div>
						</div>

					</div>
				</div>
			</div>



		</div>
	</section>

	<script type="text/javascript">
	// 1.1. 출발 :: 지역 선택 -> 역 출력 
	function DepLoctaionSelect(Btn, citycode){
		console.log(citycode);
		var cityCode = citycode;
		//역 목록을 감싸는 DIV 
		var sl = document.getElementById("stationList"+cityCode);
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/DepRegionSelect",
			data: {
				"citycode" : citycode
			},
			dataType: "json",
			async : false,
			success: function(scList){
				console.log(scList);
				output = "";
				for(var i = 0; i < scList.length; i++){
					// 역의 클래스 stationBtn과 아이디 staBtncode+고유넘버로 이루어져있음
					output += "<div class='stationBtn' id='staBtncode"+citycode+i+"' onclick='DepStationSelect(this, "+"\""+scList[i].nodeid+"\","+"\""+scList[i].nodename+"\")'>";
					output += scList[i].nodename+"역";
					output += "</div>";
				}
				console.log(output);
				// 이전에 누른 선택을 초기화시킴 
				for(var i =0; i < 40; i++){
					$("#stationList"+i).addClass('d-none');
					$('#DepLoctaion'+i).removeClass('LocationSelcetAct');
				}
				//해당 지역의 역목록을 출력합니다.
				$('#stationView'+cityCode).html(output);
				//
				sl.classList.remove('d-none');
				// 버튼 엑티브 
				$(Btn).addClass("LocationSelcetAct");
			}
		});
	}
	
	// 1.2. 출발역 선택 기준 ::  역 선택 -> 역정보 입력 -> 이동 가능한 역 정보 띄우기
	function DepStationSelect(btn, nodeid, nodename){
		console.log(btn);
		console.log(nodeid);
		$('.stationBtn').removeClass('stationBtnAct');
		$(btn).addClass('stationBtnAct');
		$('#DepStaDisplay').html(nodename+"역");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/DepStationSelect",
			data: {
				"nodename" : nodename
			},
			dataType: "json",
			async : false,
			success: function(arrStaList){
				for(var i =0; i < 40; i++){
					$("#ArrstationList"+i).addClass('d-none');
					$('#ArrLoctaion'+i).removeClass('LocationSelcetAct');
				}
				console.log(arrStaList);
				var ArrStaouput = "";
				var ccode = "";
				for(j = 11; j < 39; j++){
					ccode = j+"";
					$('#ArrLoctaion'+ccode).removeClass('LocationSelcetAct');
					console.log('지역코드 : '+ccode);
					for(i = 0; i < arrStaList.length; i++){
						if(ccode === arrStaList[i].citycode){
							//console.log(arrStaList[i].nodename);
							ArrStaouput += "<div class='stationBtn' id='DtoAstaBtn"+i+"' onclick='ArrStationSelected(this, "+"\""+arrStaList[i].nodeid+"\","+"\""+arrStaList[i].nodename+"\")'>";
							ArrStaouput += arrStaList[i].nodename+"역";
							ArrStaouput += "</div>";
							$('#ArrLoctaion'+ccode).addClass('LocationSelcetAct');
							$("#ArrstationList"+ccode).removeClass('d-none');
						}
					}
					console.log(ArrStaouput);
					$('#arrStationView'+ccode).html(ArrStaouput);
					ArrStaouput = "";
				}
			}				
		});
	}
	
	// 1.3. 출발역 선택 기준 :: 도착역을 선택하기 
	function ArrStationSelected(Btn, nodeid, nodename){
		console.log(nodename);
		for(var i =0; i < 100; i++){
			$('#DtoAstaBtn'+i).removeClass('LocationSelcetAct');
		}
		$(Btn).addClass("LocationSelcetAct");
		$('#ArrStaDisplay').html(nodename+"역");
		
	}
	
	// 2.1. 도착역 선택 기준 :: 도착역을 선택하기 
	function ArrLoctaionSelect(Btn, citycode){
		console.log(citycode);
		var cityCode = citycode;
		//역 목록을 감싸는 DIV 
		var sl = document.getElementById("ArrstationList"+cityCode);
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/DepRegionSelect",
			data: {
				"citycode" : citycode
			},
			dataType: "json",
			async : false,
			success: function(scList){
				console.log(scList);
				output = "";
				for(var i = 0; i < scList.length; i++){
					// 역의 클래스 stationBtn과 아이디 staBtncode+고유넘버로 이루어져있음
					output += "<div class='stationBtn' id='staBtncode"+citycode+i+"' onclick='AtoDStationSelect(this, "+"\""+scList[i].nodeid+"\","+"\""+scList[i].nodename+"\")'>";
					output += scList[i].nodename+"역";
					output += "</div>";
				}
				console.log(output);
				// 이전에 누른 선택을 초기화시킴 
				for(var i =0; i < 40; i++){
					$("#ArrstationList"+i).addClass('d-none');
					$('#ArrLoctaion'+i).removeClass('LocationSelcetAct');
				}
				//해당 지역의 역목록을 출력합니다.
				$('#arrStationView'+cityCode).html(output);
				//
				sl.classList.remove('d-none');
				// 버튼 엑티브 
				$(Btn).addClass("LocationSelcetAct");
			}
		});
	}
	
	
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