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
	font-weight:bold;
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
								onclick="return ArrLoctaionSelect(this,${citylist.citycode })">${citylist.cityname }</div>
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
			<div class="col-lg-5 col-md-6 col-sm-6">
				<div class="card" style="margin-top: 40px; margin-left: 30px;">
					<div class="card-header">날짜 및 인원 입력</div>
					<div class="card-body" style="padding-top: 5px;">
						<table class="cleanTable">
							<tr class="cleanTable">
								<th class="cleanTable cleanTh col" style="width: 50px;"><h5>날짜</h5>
									<input type="date" id="InputDate"></th>
								<th class="cleanTable cleanTh col" style="width: 50px;">
									<h5>인원</h5> <select id="pCount">
										<option value="1">어른 1명</option>
										<option value="2">어른 2명</option>
										<option value="3">어른 3명</option>
										<option value="4">어른 4명</option>
										<option value="5">어른 5명</option>
										<option value="6">어른 6명</option>
										<option value="7">어른 7명</option>
										<option value="8">어른 8명</option>
								</select>
								<th class="cleanTable cleanTh col" style="width: 50px;">
									<button type="button" onclick="return serchTrainInfoBtn()"
										class="btn btn-danger font-bold mb-1 w-40 h-30">열차조회</button>
								</th>
							</tr>
						</table>
						<hr>
						<!-- 열차 스케쥴 정보를 담는 부분 -->
						<div style="overflow: scroll; height: 350px" id="scheduleListArea">
							<div class="card">
								<div class="card-body" style="padding: 5px;">
									<table class="cleanTable">
										<tr class="cleanTable">
											<th class="scheduleInfoTitle" style="font-size: small;">출발지</th>
											<th class="scheduleInfoTitle">도착지</th>
											<th class="scheduleInfoTitle">출발 시간</th>
											<th class="scheduleInfoTitle">도착 시간</th>
											<th class="scheduleInfoTitle">소요 시간</th>
											<th class="scheduleInfoTitle">열차 번호</th>
											<th class="scheduleInfoTitle">운임비</th>
											<th class="scheduleInfoTitle" rowspan="2"><button
													type="button" onclick="selectSchedule(this)"
													class="btn font-bold mb-1 w-10 h-10"
													style="padding-left: 20px; padding-right: 20px; background-color: pink;">선택</button></th>
										</tr>
										<tr class="cleanTable">
											<td class="scheduleInfoContent" style="font-size: small;">서울</td>
											<td class="scheduleInfoContent">부산</td>
											<td class="scheduleInfoContent">08:40</td>
											<td class="scheduleInfoContent">10:40</td>
											<td class="scheduleInfoContent">01:00</td>
											<td class="scheduleInfoContent">12</td>
											<td class="scheduleInfoContent">59,800원</td>
										</tr>
									</table>
								</div>
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
							<div class="col-8">
								<table  class="cleanTable" style="text-align: left;">
									<tr class="cleanTable">
										<th class="cleanTable ReserveTitle" colspan="5" id="ReserveDateDisplay">--월 --일</th>
									</tr>
									<tr class="cleanTable">
										<th class="cleanTable textleft ReserveTitle" style="width: 200px;">출발역</th>
										<th class="cleanTable textleft ReserveTitle" style="width: 200px;">도착역</th>
										<th class="cleanTable textleft ReserveTitle" style="width: 180px;">열차번호</th>
										<th class="cleanTable textleft ReserveTitle" style="width: 110px;">호차번호</th>
										<th class="cleanTable textleft ReserveTitle" style="width: 110px;">좌석번호</th>
									</tr>
									<tr class="cleanTable">
										<td class="cleanTable textcenter ReserveContent" id="DepStaDisplay"
											style="">-</td>
										<td class="cleanTable textcenter ReserveContent" id="ArrStaDisplay"
											style="">-</td>
										<td class="cleanTable textcenter ReserveContent" id="TrainNoDisplay"
										style="">-</td>
										<td class="cleanTable textcenter ReserveContent" id="CarNumDisplay"
										style="">-</td>
										<td class="cleanTable textcenter ReserveContent" id="SeatNumDisplay"
										style="">-</td>

									</tr>
									<tr class="cleanTable">
										<th class="cleanTable textleft ReserveTitle" style="padding-top: 30px;">출발시간</th>
										<th class="cleanTable textleft ReserveTitle" style="padding-top: 30px;">도착시간</th>
										<th class="cleanTable textleft ReserveTitle" style="padding-top: 30px;">탑승인원</th>
										<th class="cleanTable textleft ReserveTitle" style="padding-top: 30px;">총결제금액</th>


									</tr>
									<tr class="cleanTable">
										<td class="cleanTable textcenter ReserveContent" id="DepTimeDisplay"
										style="">--:--</td>
										<td class="cleanTable textcenter ReserveContent" id="ArrTimeDisplay"
										style="">--:--</td>
										<td class="cleanTable textcenter ReserveContent" id="pCountDisplay"
										style="">-</td>
										<td class="cleanTable textcenter ReserveContent" id="CashDisplay"
										colspan="2" style="">-</td>
									</tr>
								</table>

								<!-- 
								<h3 style="float: left;">출발</h3>
								<p style="float: left;" id="DepStaDisplay"></p>
								<p style="float: right;" id="ArrStaDisplay"></p>
								<h3 style="float: right;">도착</h3>
							 -->
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
	// 출발역 누를 경우 1, 아닌 경우 0  - 초기화 기능
	var DepStaionBtnAct = 0;
	var ArrStaionBtnAct = 0;
	
	// 역 정보 저장 기능
	var DepStationid= "";
	var DepStationname= "";
	var ArrStationid= "";
	var ArrStationname= "";
	var TrainTime = "";
	//
	var Trainno = "";
	var Adultcharge = "";
	var Scdeptime = "";
	var Scarrtime = "";
	var Timerequired = "";
	var PeopleCount = "";
	
	// 좌석 선택 후 받는 데이터
	function receiveData(data) {
        console.log("Received data in parent window:", data);
        var seatList = data[0].split("-");
        console.log(Trainno+","+Adultcharge+","+Scdeptime+","+Scarrtime+","+Timerequired+","+PeopleCount);
        var AllCharge = parseInt(Adultcharge) * parseInt(PeopleCount); 
        // 좌석 부분
        if(data.length > 1){
        	$('#SeatNumDisplay').html(seatList[1]+"<p Style='display: inline-block; margin: 0px;'>그외</p>");
        } else {
        	$('#SeatNumDisplay').html(seatList[1]);
        }
        $('#TrainNoDisplay').html("KTX "+Trainno);
        $('#CarNumDisplay').html(seatList[0]+"호차");
        $('#DepTimeDisplay').html(Scdeptime);
        $('#ArrTimeDisplay').html(Scarrtime);
        $('#pCountDisplay').html("어른 "+PeopleCount+"명");
        $('#CashDisplay').html(AllCharge+"원");
        
     }
	
	// 1.1. 출발 :: 지역 선택 -> 역 출력 
	function DepLoctaionSelect(Btn, citycode){
		console.log(citycode);
		if(ArrStaionBtnAct == 1){
			var result = confirm("출발역을 기준으로 출발역을 고르시겠습니까?");
			if(result){
			    location.href="${pageContext.request.contextPath }/reservePage";
			}else{
			    return false;
			}
		}
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
			async : true,
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
		DepStaionBtnAct = 1;
		console.log('DepStaionBtnAct : '+DepStaionBtnAct+' - 출발역 선택')
		DepStationname = nodename;
		console.log('출발역 아이디 저장 : '+DepStationid);
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
				var ArrStaouput = "";
				var ccode = "";
				for(j = 11; j < 39; j++){
					ccode = j+"";
					$('#ArrLoctaion'+ccode).addClass('LocationSelcetInact');
					for(i = 0; i < arrStaList.length; i++){
						if(ccode === arrStaList[i].citycode){
							//console.log(arrStaList[i].nodename);
							ArrStaouput += "<div class='stationBtn' id='DtoAstaBtn"+i+"' onclick='ArrStationSelected(this, "+"\""+arrStaList[i].nodeid+"\","+"\""+arrStaList[i].nodename+"\")'>";
							ArrStaouput += arrStaList[i].nodename+"역";
							ArrStaouput += "</div>";
							$('#ArrLoctaion'+ccode).addClass('LocationSelcetAct');
							$('#ArrLoctaion'+ccode).removeClass('LocationSelcetInact');
							$("#ArrstationList"+ccode).removeClass('d-none');
						} 
					}
					$('#arrStationView'+ccode).html(ArrStaouput);
					ArrStaouput = "";
				}
			}				
		});
	}
	
	// 1.3. 출발역 선택 기준 :: 도착역을 선택하기 
	function ArrStationSelected(Btn, nodeid, nodename){
		
		// 출발역을 먼저 누른경우 
		console.log(nodename);
		for(var i =0; i < 100; i++){
			$('#DtoAstaBtn'+i).removeClass('LocationSelcetAct');
		}
		$(Btn).addClass("LocationSelcetAct");
		$('#ArrStaDisplay').html(nodename+"역");
		$('#scDateListArea').removeClass("d-none");
		ArrStationname = nodename;
		console.log('출발역 : '+DepStationid+", 도착역 : "+ArrStationid);
	}
	
	// 2.1. 도착역 선택 기준 :: 도착역을 선택하기 
	function ArrLoctaionSelect(Btn, citycode){
		if(DepStaionBtnAct == 1){
			var result = confirm("도착역을 기준으로 출발역을 고르시겠습니까?");
			if(result){
			    location.href="${pageContext.request.contextPath }/reservePage";
			}else{
			    return false;
			}
		}
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
	
	
	
	
	// 2.2 도착역 기준 :: 도착역을 선택하기
	function AtoDStationSelect(btn, nodeid, nodename){
		ArrStaionBtnAct = 1;
		console.log('ArrStaionBtnAct : '+ArrStaionBtnAct+' - 도착역 선택')
		ArrStationname = nodename;
		console.log('도착역 아이디 저장 : '+ArrStationid);
		console.log(btn);
		console.log(nodeid);
		$('.stationBtn').removeClass('stationBtnAct');
		$(btn).addClass('stationBtnAct');
		$('#ArrStaDisplay').html(nodename+"역");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/ArrStationSelect",
			data: {
				"nodename" : nodename
			},
			dataType: "json",
			async : false,
			success: function(arrStaList){
				for(var i =0; i < 40; i++){
					$("#stationList"+i).addClass('d-none');
					$('#DepLoctaion'+i).removeClass('LocationSelcetAct');
				}
				var DepStaouput = "";
				var ccode = "";
				for(j = 11; j < 39; j++){
					ccode = j+"";
					$('#DepLoctaion'+ccode).addClass('LocationSelcetInact');
					for(i = 0; i < arrStaList.length; i++){
						if(ccode === arrStaList[i].citycode){
							//console.log(arrStaList[i].nodename);
							DepStaouput += "<div class='stationBtn' id='AtoDstaBtn"+i+"' onclick='DepStationSelected(this, "+"\""+arrStaList[i].nodeid+"\","+"\""+arrStaList[i].nodename+"\")'>";
							DepStaouput += arrStaList[i].nodename+"역";
							DepStaouput += "</div>";
							$('#DepLoctaion'+ccode).addClass('LocationSelcetAct');
							$('#DepLoctaion'+ccode).removeClass('LocationSelcetInact');
							$("#stationList"+ccode).removeClass('d-none');
						} 
					}
					$('#stationView'+ccode).html(DepStaouput);
					DepStaouput = "";
				}
			}				
		});
	}
	// 2.3. 도착역 선택 기준 :: 출발역을 선택하기 
	function DepStationSelected(Btn, nodeid, nodename) {
		// 출발역을 먼저 누른경우 
		console.log(nodename);
		for(var i =0; i < 100; i++){
			$('#AtoDstaBtn'+i).removeClass('LocationSelcetAct');
		}
		$(Btn).addClass("LocationSelcetAct");
		$('#DepStaDisplay').html(nodename+"역");
		$('#scDateListArea').removeClass("d-none");
		DepStationname = nodename;
		console.log('출발역 : '+DepStationid+", 도착역 : "+ArrStationid)
	}
	
	// 3.1 날짜를 선택 후 열차조회 버튼 입력
	function serchTrainInfoBtn(){
		TrainTime = $('#InputDate').val();
		console.log(TrainTime);
		$("#ReserveDateDisplay").html(TrainTime); 
		
		// 오늘 기준 전날 열차 정보 조회 불가능
		var today = new Date();
		var targetDate = new Date(TrainTime);
		targetDate.setDate(targetDate.getDate()+1);
		if (today > targetDate) {
			alert('이전의 시간대는 선택하실 수 없습니다!');
			return false;
		}
		if(DepStationname.length == 0){
			alert('출발역을 입력해주세요')
			return false;
		} else if(ArrStationname.length == 0){
			alert('도착역을 입력해주세요')
			return false;
		} else if (TrainTime.length == 0){
			alert('날짜를 입력해주세요')
			return false;
		}
		var loding = "";
		loding += '<div class="spinner-border" role="status">';
		loding += '<span class="visually-hidden">Loading...</span>';
		loding += '</div>';
		$("#scheduleListArea").html(loding);  
		
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/searchTRSchedule",
			data: {
				"depPlaceId" : DepStationname,
				"arrPlaceId" : ArrStationname,
				"depPlandTime" : TrainTime
			},
			dataType: "json",
			async : false,
			success: function(scList){
				console.log(scList);
				var output ="";
				// AJAX - 예매정보를 출력할 때 사용된 코드
				//console.log(scList);
				
				if(scList.length > 0){
					for(var i = 0; i < scList.length; i++){
						console.log(scList[i].trainno);
						
						var deptime = scList[i].depplandtime+'';
						var arrtime = scList[i].arrplandtime+'';
						var deptimeData = deptime.substr(0, 4)+"/"+deptime.substr(4, 2)+"/"+deptime.substr(6, 2)+" "+deptime.substr(8, 2)+":"+deptime.substr(10, 2)+":00";
						var arrtimeData = arrtime.substr(0, 4)+"/"+arrtime.substr(4, 2)+"/"+arrtime.substr(6, 2)+" "+arrtime.substr(8, 2)+":"+arrtime.substr(10, 2)+":00";
						
						// 현재시간 기준 출발 열차 지정
						var now = new Date();
						var deptimeCheck = new Date(deptimeData);
						console.log(deptimeCheck);
						if (deptimeCheck < now){
							continue;
						}
						// 열차 출/도착시간 지정
						var ScDeptime = deptime.substr(8, 2)+":"+deptime.substr(10, 2);
						var ScArrtime = arrtime.substr(8, 2)+":"+arrtime.substr(10, 2);
						
						//열차 소요시간 계산
						var date = new Date(deptimeData);
						var hour = arrtime.substr(8, 2) - deptime.substr(8, 2);
						if(hour < 0){
							hour = 24 - Math.abs(hour);
						}
						var min = arrtime.substr(10, 2) - deptime.substr(10, 2);
						if(min < 0){
							min = 60 - Math.abs(min);
							hour = hour - 1;
						}
						min = min.toString().padStart(2, '0');
						console.log("소요 시간 : "+ hour + ":" + min);
						var timeRequired = hour + ":" + min;
						
						// 스케줄 선택 버튼 입력부분
						output +='<div class="card" style="margin-bottom: 3px; id="div-train'+scList[i].trainno+'">';
						output +='<div class="card-body" style="padding: 5px;">';
						output +='<table class="cleanTable">';
						output +='<tr class="cleanTable">';
						output +='<th class="scheduleInfoTitle" >출발지</th>';
						output +='<th class="scheduleInfoTitle" >도착지</th>';
						output +='<th class="scheduleInfoTitle" >출발 시간</th>';
						output +='<th class="scheduleInfoTitle" >도착 시간</th>';
						output +='<th class="scheduleInfoTitle" >소요 시간</th>';
						output +='<th class="scheduleInfoTitle" >열차 번호</th>';
						output +='<th class="scheduleInfoTitle" >운임비</th>';
						output +="<th class='scheduleInfoTitle' rowspan='2'><button type='button' onclick='selectSchedule(this,"+"\""+scList[i].trainno+"\","+"\""+scList[i].adultcharge+"\","+"\""+ScDeptime+"\","+"\""+ScArrtime+"\","+"\""+timeRequired+"\")' class='btn font-bold mb-1 w-10 h-10' style='padding-left: 20px; padding-right: 20px; background-color: pink;'>선택</button></th>";
						output +='</tr>';
						output +='<tr class="cleanTable">';
						output +='<td class="scheduleInfoContent" >'+scList[i].depplacename+'</td>';
						output +='<td class="scheduleInfoContent" >'+scList[i].arrplacename+'</td>';
						output +='<td class="scheduleInfoContent" >'+ScDeptime+'</td>';
						output +='<td class="scheduleInfoContent" >'+ScArrtime+'</td>';
						output +='<td class="scheduleInfoContent" >'+timeRequired+'</td>';
						output +='<td class="scheduleInfoContent" >'+scList[i].trainno+'</td>';
						output +='<td class="scheduleInfoContent" >'+scList[i].adultcharge+'원</td>';
						output +='</tr>';
						output +='</table>';
						output +='</div>';
						output +='</div>';
						$("#scheduleListArea").html(output);
					}
					
				}
				
				$("#scheduleListArea").html(output);
			}
		});
	}
	
	// 3.2 열차 조회 -> 열차 좌석 선택 
	function selectSchedule(btn, trainno,adultcharge,scdeptime,scarrtime,timerequired){
		console.log(trainno+" "+adultcharge+" "+scdeptime+" "+scarrtime+" "+timerequired);
		var peopleConut = $('#pCount').val();
		PeopleCount = peopleConut;
		Trainno = trainno;
		Adultcharge = adultcharge;
		Scdeptime = scdeptime;
		Scarrtime = scarrtime;
		Timerequired = timerequired;
		window.open("${pageContext.request.contextPath }/SeatSelect?pNum="+peopleConut, "좌석 선택창", "width=400, height=600, resizable=no");
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