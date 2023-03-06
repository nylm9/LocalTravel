<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>마이페이지-영수증</title>
<script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>


 <!-- theme meta -->
    <meta name="theme-name" content="revolve" />

    <!--Favicon-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico" type="image/x-icon">
    
    <!-- THEME CSS
	================================================== -->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Themify -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/themify/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick-theme.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.css">
    <!-- Slick Carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.css">
    <!-- manin stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">

<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
		 <script type="text/javascript">
		  var Msg = '${Msg}';
		  if (Msg.trim().length > 0) { 
		    alert(Msg);
		  }
		 
		  $(document).ready(function(){
			  // 00:00:00 없애주는 Function
			  var cleanTrainDate = $('#trainDateDisplay').html();
			  console.log(cleanTrainDate);
			  cleanTrainDate = cleanTrainDate.replace(" 00:00:00","").replace("0023","2023");
			  console.log(cleanTrainDate);
			  $('#trainDateDisplay').html(cleanTrainDate);
			  
			  //
			  var arrtime = $('#arrTimeDisplay').html();
			  const departureTime = new Date(cleanTrainDate+' '+arrtime); // 열차 출발 시간
				console.log(departureTime);
			  const now = new Date(); // 현재 시간

			  if (now > departureTime) { // 현재 시간이 출발 시간보다 늦을 경우
  					console.log('열차가 이미 출발했습니다.');
  					$('#cancelBtn').html("예매 취소 불가");
  					$('#cancelBtn').css('background-color', 'gray');
  					$('#cancelBtn').attr('href', '');
  					$('#cancelBtn').addClass('d-none');
  					$('#noCancelMsg').removeClass('d-none');
			  } else {
  					console.log('열차는 아직 출발하지 않았습니다.');
			  }
			});
		</script>
<style>
#qrcode {
  float: right;
}

</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
	<!-- 영수증출력 -->
	
	<section id="reservation-table" class="section"  style="margin-top: 40px; margin-left:500px;">
			<div class="row mx-auto" style="max-width:1200px;">
				
				<div class="col-7">
					<div class="card mb-3" style="padding:20px;">
						<c:forEach items="${reservationList }" var="reservationList">
						<p style="text-align: center; border-bottom: 1px dotted black;">기차예매정보</p>
						<!-- <div style="border-top: 1px solid #CFD2CF; margin: 20px 10px; width: 600px; "></div> -->
						<!--  <table >
							<tr >
								<td >기차번호</td>
								<td>ktx</td>
							</tr>
						</table>  -->
						<!-- 주문내역 -->
				
				<!-- <br> -->
				<table style='width: 100%;'>
					<tr>
						<th class='reserveTitle' style='padding-bottom: 10px;'>승차일자</th>
						<td colspan='2' class='reserveContent' id='trainDateDisplay'
							style='padding-bottom: 10px; text-align: left; '>${reservationList.traindate }</td>
					</tr>
					<tr>
						<th class='reserveTitle'>출발역</th>
						<th rowspan='4'>→</th>
						<th class='reserveTitle'>도착역</th>
					</tr>
					<tr>
						<td class='reserveContent' style='font-size:XX-Large; padding-top:5px;padding-bottom:5px;color:#F2789F'>${reservationList.depsta }</td>
						<td class='reserveContent'style='font-size:XX-Large; padding-top:5px;padding-bottom:5px; color:#516BEB'>${reservationList.arrsta }</td>
					</tr>
					<tr>
						<th class='reserveTitle'>출발시간</th>
						<th class='reserveTitle'>도착시간</th>
					</tr>
					<tr>
						<td class='reserveContent' style='font-size:XX-Large; padding-top:5px;padding-bottom:5px;color:#F2789F'><span class='reversal' id='arrTimeDisplay'>${reservationList.deptime }</span></td>
						<td class='reserveContent' style='font-size:XX-Large; padding-top:5px;padding-bottom:5px; color:#516BEB'>${reservationList.arrtime }</td>
					</tr>
					<tr>
						<td colspan='3'
							style='padding-bottom: 5px; border-bottom: 1px solid black; font-size: small; text-align: left;'
							class='reserveContent'>※승강일시와 이용구간을 반드시 확인하시기 바랍니다.</td>
					</tr>
					<tr>
						<th colspan='3' class='reserveTitle'>열차번호</th>
					</tr>
					<tr>
						<td colspan='3' class='reserveContent' style='text-align: left; color:#868686'>KTX
							${reservationList.trainno }</td>
					</tr>
					<tr>
						<th class='reserveTitle rightborder' style='text-align: center;'>타는곳</th>
						<th class='reserveTitle rightborder' style='text-align: center;'>호차번호</th>
						<th class='reserveTitle' style='text-align: center;'>좌석번호</th>
					</tr>
					<tr style='margin: 10px;'>
						<td class='reserveContent rightborder' style='font-size: small; text-align:center; border-right: 1px solid black;'>역
							전광판 확인</td>
						<td class='reserveContent rightborder' style='border-right: 1px solid black; text-align:center; font-size:XX-Large; padding-top:5px;padding-bottom:5px; color:#868686'>${reservationList.carnum }<br>
							<!-- <p style='font-size: small;'>일반실</p> --></td>
						<td class='reserveContent'  style='text-align:center;font-size:XX-Large; padding-top:5px; padding-bottom:5px; color:#868686'>${reservationList.seatnum }</td>
					</tr>
					<tr>
						<td colspan='1' class='reserveContent' id='chargeDisplay' style='padding-top: 10px; font-weight: bold; text-align: center;'>금액₩ ${reservationList.charge }</td>
						<td colspan='2' class='reserveContent' style='padding-top: 10px; font-weight: bold; text-align: center; width: 100px; height: 100px;'><div id="qrcode"></div></td>
						
					</tr>
					<tr>
						<td></td>
						<td>
							<a style="margin-left: 0 auto;"class="btn-danger btn" id="cancelBtn" href="${pageContext.request.contextPath }/cancelReservation?recode=${reservationList.recode }">예매취소하기</a>
							<p id="noCancelMsg"class="d-none">예매 취소 불가</p>
						</td>
						<td></td>
					</tr>
				</table>

		<script>
		document.addEventListener("DOMContentLoaded", function() {
    		// QR 코드 생성 라이브러리를 통해 QR 코드 이미지를 생성합니다.
      		var qrcode = new QRCode(document.getElementById('qrcode'), {
        	width: 100,
        	height: 100,
      	});
      		qrcode.makeCode('http://localhost:8080/controller/');
    	});
  		</script>

										

							
						
						</c:forEach>
					</div>
				</div>
			</div>
	</section> 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>

</html>
