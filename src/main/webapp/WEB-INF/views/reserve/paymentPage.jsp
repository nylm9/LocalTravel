<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
    PAGE : INDEX PAGE
    Copyright (c)  2022  NHN KCP Inc.   All Rights Reserverd.
//-->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">
<title>결제 페이지</title>
<!-- 공통: css -->
<link
	href="${pageContext.request.contextPath }/resources/css/paymentStyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<!-- //공통: css -->
<script type="text/javascript">
	var depSta = "";
	var arrSta = "";
	var trainNo = "";
	var deptime = "";
	var arrtime = "";
	var carNum = "";
	var seatNum = "";
	var reserveDate = "";
	var adultCharge = "";
	$(document).ready(function() {
		var urlParams = new URLSearchParams(window.location.search);
		depSta = urlParams.get("depSta");
		arrSta = urlParams.get("arrSta");
		trainNo = urlParams.get("trainNo");
		deptime = urlParams.get("deptime");
		arrtime = urlParams.get("arrtime");
		carNum = urlParams.get("carNum");
		seatNum = urlParams.get("seatNum");
		reserveDate = urlParams.get("reserveDate");
		adultCharge = urlParams.get("adultCharge");
		console.log(depSta + arrSta + trainNo);
	});
</script>
</head>
<body>
	<!-- wrap -->
	<div class="wrap">
		<!-- index -->
		<div id="skipCont" class="grid-middle">
			<div class="inner">
				<h1 class="title-type-1">NHN KCP</h1>
				<p class="title-type-2">주문/결제 SAMPLE</p>
				<p class="txt-type-1">이 페이지는 표준 STANDARD 결제를 요청하는 샘플 페이지입니다.</p>
				<ul class="list-btn-1">
					<li><p onclick="PCpaymentBtn()" class="btn-type-1" style="cursor: pointer;">
							PC 결제요청<span class="icon-arrow"></span>
						</p></li>
					<li><a
						href="${pageContext.request.contextPath }/MobilePayment"
						class="btn-type-1">MOBILE 결제요청<span class="icon-arrow"></span></a></li>
				</ul>
				<!-- footer -->
				<div class="footer">ⓒ NHN KCP Corp.</div>
				<!-- //footer -->
			</div>
			<div class="verticalAlign"></div>
		</div>
		<!-- //index -->
	</div>
	<!-- //wrap -->
	<script type="text/javascript">
		function PCpaymentBtn() {
			console.log(depSta + arrSta + trainNo);
			location.href="${pageContext.request.contextPath }/PCPayment?depSta="+depSta+"&arrSta="+arrSta+"&trainNo="+trainNo+"&deptime="+deptime+"&arrtime="+arrtime+"&carNum="+carNum+"&seatNum="+seatNum+"&reserveDate="+reserveDate+"&adultCharge="+adultCharge+"";
		}
	</script>
</body>
</html>