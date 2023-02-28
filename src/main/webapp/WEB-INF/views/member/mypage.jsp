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
<title>마이페이지</title>

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
    
        <!-- 프리텐다드 폰트 -->
    <link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
    

<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
		 <script type="text/javascript">
		  var Msg = '${Msg}';
		  if (Msg.trim().length > 0) { // 빈 문자열이 아닐 때만 alert 창 띄우기
		    alert(Msg);
		  }
		</script>

<style type="text/css">
.jb-division-line {
  border-top: 1px solid #444444;
  margin: 30px auto;
  width: 300px;        
}

a, p, div{
font-family: 'Pretendard';
} 

</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	<!-- 회원정보출력 -->
		<section class="section"  style="margin-top: 40px;">
			<div class="row mx-auto" style="max-width:1200px;min-width:700px;">
			    
			    
				<c:forEach items="${memberList }" var="memInfo">
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" id="memberListArea">
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">내정보</p>
							</div>
							
							<%-- <form class="row g-3"
							action="${pageContext.request.contextPath }/memberJoin"
							method="post" enctype="multipart/form-data"
							onsubmit="return joinFormCheck(this)"
							style="margin-left: 200px;"
							> --%>
							
							<div class="col-md-6">
								<label class="form-label">아이디</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
										<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MID }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이름</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MNAME }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">생년월일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MBIRTH}" readonly>
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">성별</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
											<%-- <c:choose>
											<c:when test="${memInfo.MGENDER == '1' }">
												<p style="font-size:20px; padding-left:10px;  padding-top:10px;">남자</p>
											</c:when>
											<c:otherwise>
												<p style="font-size:20px; padding-left:10px;  padding-top:10px;">여자</p>								
											</c:otherwise>									
										</c:choose> --%>
										
										<c:if test="${memInfo.MGENDER == '1' }">
											<!-- <p style="font-size:15px; padding-left:10px;  padding-top:10px;">남자</p> -->
											<input type="text" name="mid" class="form-control" id="inputMid"
											 value="남자" readonly>
										</c:if>
										<c:if test="${memInfo.MGENDER == '2' }">
										<input type="text" name="mid" class="form-control" id="inputMid"
											 value="여자" readonly>
										</c:if>
										<c:if test="${memInfo.MGENDER == '0' }">
											<input type="text" name="mid" class="form-control" id="inputMid"
											 value="선택하지않음" readonly>
										</c:if>
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">휴대폰번호</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MPHONE }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이메일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MEMAIL }" readonly>
										
									</div>
							</div>
							<!-- </form> -->
							
							<div class="text-center modifyCol">
								
									<a  class="btn btn-secondary" style="margin-top: 10px; margin-left: 520px;"
									href="${pageContext.request.contextPath }/memberModifyPage?loginId=${loginId }">
		                                    글수정
		                            </a>
							</div>
							
						</div>
					</div>
				</div>
				
				</c:forEach>
				
				</div>
			
		</section>
		<section class="section"  style="margin-top: 40px;">
			<div class="row mx-auto" style="max-width:1200px;min-width:700px;">
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" >
						
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">놀거리 저장 목록</p>
							</div>
							
			 				 <c:forEach items="${enjoyList }" var="enjoyList">
								<div style="width:990px; height:50px; margin-left:90px; float: left; border: 1px solid #f0f1f4 ; background-color:#f0f1f4;">
									<div style="line-height:50px; text-align: center; float: left; width:300px; margin-right:10px;">
									<a href="${pageContext.request.contextPath }/playInfo?ecode=${ enjoyList.ecode}">${enjoyList.ename}</a>
									</div>
									<div style="line-height:50px; text-align: center; float: left;">
									${enjoyList.eaddr}
									</div>	 
								</div>
				 			 </c:forEach>  
				 			 <div class="col-12">
				 			 <div style="border-top: 1px solid #444444; margin: 20px 420px; width: 300px; "></div>
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">먹거리 저장 목록</p>
							</div>
							
			 				 <c:forEach items="${FoodList }" var="FoodList">
								<div style="width:990px; height:50px; margin-left:90px; float: left; border: 1px solid #f0f1f4 ; background-color:#f0f1f4;">
									<div style="line-height:50px; text-align: center; float: left; width:300px; margin-right:10px;">
									${FoodList.fname}
									</div>
									<div style="line-height:50px; text-align: center; float: left;">
									${FoodList.faddr}
									</div>	 
								</div>
				 			 </c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="section"  style="margin-top: 40px;">
			<div class="row mx-auto" style="max-width:1200px;min-width:700px;">
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" >
						
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">예매내역</p>
							</div>
						<c:forEach items="${reservationList }" var="reservationList">
							<div id="skipCont">
								<table style='width: 100%;'>
									<tr>
										<th class='reserveTitle' style="padding-left:100px;text-align:center"><br><p>${reservationList.recode }</p></th>
										<th class='reserveTitle' style="padding-left:20px;text-align:center">열차번호<br><p>KTX ${reservationList.trainno }</p></th>
										<th class='reserveTitle' style="padding-left:30px;">승차일자<br><p>${reservationList.traindate }</p></th> 
										 
										<th class='reserveTitle'style="padding-left:20px;text-align:center">출발역 [출발시간]<p> ${reservationList.depsta } ${reservationList.deptime }</p></th>
										<th>→ </th>
										<th class='reserveTitle'style=" text-align:center">  도착역 [도착시간]<p>${reservationList.arrsta } ${reservationList.arrtime }</p></th>
										<th class='reserveTitle' style="padding-left:20px;text-align:center"> 열차칸 [좌석번호] <br><p>${reservationList.carnum } [${reservationList.seatnum }]</p></th>
										 <th class='reserveTitle' style="padding-left:20px;text-align:center"> 금액 <br><p>${reservationList.charge }</p></th>
									</tr>
									
									
								</table>
							</div>
			 			</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</section> 
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
						window.resizeTo(800, 700);
						var urlParams = new URLSearchParams(
								window.location.search);
						depSta = urlParams.get("depSta");
						arrSta = urlParams.get("arrSta");
						trainNo = urlParams.get("trainNo");
						deptime = urlParams.get("deptime");
						arrtime = urlParams.get("arrtime");
						carNum = urlParams.get("carNum");
						seatNum = urlParams.get("seatNum");
						reserveDate = urlParams.get("reserveDate");
						adultCharge = urlParams.get("adultCharge");
						console.log(depSta + "," + arrSta + "," + trainNo + ","
								+ deptime + "," + arrtime + "," + carNum + ","
								+ seatNum + "," + reserveDate + ","
								+ reserveDate + "," + adultCharge);
						// 인원수 계산 및 총 결제금액
						pList = seatNum.split(",");
						pCount = pList.length;
						sumCharge = adultCharge * pCount;
						
						// 예매코드 만들기
						var reservationCode = "T" + ((reserveDate.replace("-","")).replace("-","")).slice(2);
						var randomNum = generateRandomNumber();
						console.log(randomNum); // 예시 출력: "0734"
						reservationCode += randomNum;
						// 날짜 만들기
						var date = reserveDate.split("-");
						console.log(date);
						changeKorDate = date[0] + "년" + date[1] + "월" + date[2] + "일";
						// 일반실 특실 구분
						var roomSortation = "";
						var replaceCarnum = carNum.replace("호차","")
						var checkCarnum = parseInt(replaceCarnum); 
						if(checkCarnum == 1 || checkCarnum > 4){
							roomSortation = "일반실";
						} else {
							roomSortation = "특실";
						}
						//금액 세자리 콤마
						var threecommaCharge = sumCharge.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						
						// 예매표 만들기 
						var output = "<h2 class='title-type-3'>주문내역</h2><br>";
						output += "<table style='width: 100%;'>";
						output += "	<tr>";
						output += "		<th class='reserveTitle' style='padding-bottom: 10px;'>승차일자<br><p>YYYYMMDD</p></th>";
						output += "		<td colspan='2' class='reserveContent'style='padding-bottom: 10px; text-align: left;'>"+changeKorDate+"</td>";
						output += "	</tr>";
						output += "	<tr>";
						output += "		<th class='reserveTitle'>출발역<p>From</p></th>";
						output += "		<th rowspan='4'>→</th>";
						output += "		<th class='reserveTitle'>도착역<p>To</p></th>";
						output += "	</tr>";
						output += "	<tr>";
						output += "		<td class='reserveContent'>"+depSta+"</td>";
						output += "		<td class='reserveContent'>"+arrSta+"</td>";
						output += "	</tr>";
						output += "	<tr>";
						output += "		<th class='reserveTitle'>출발시간</th>";
						output += "		<th class='reserveTitle'>도착시간</th>";
						output += "	</tr>";
						output += "	<tr>";
						output += "		<td class='reserveContent'><span class='reversal'>"+deptime+"</span></td>";
						output += "		<td class='reserveContent'>"+arrtime+"</td>";
						output += "	</tr>";
						output += "	<tr>";
						output += "<td colspan='3' style='padding-bottom: 5px; border-bottom: 1px solid black; font-size: small; text-align: left;' class='reserveContent'>※승강일시와 이용구간을 반드시 확인하시기 바랍니다.</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<th colspan='3' class='reserveTitle'>열차번호</th>";
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='3' class='reserveContent' style='text-align: left;'>KTX "+trainNo+"</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<th class='reserveTitle rightborder' style='text-align: center;'>타는곳</th>";
						output += "<th class='reserveTitle rightborder' style='text-align: center;'>호차번호</th>";
						output += "<th class='reserveTitle' style='text-align: center;'>좌석번호</th>";
						output += "</tr>";
						output += "<tr>";
						output += "<td class='reserveContent rightborder' style='font-size: small;'>역 전광판 확인</td>";
						output += "<td class='reserveContent rightborder'>"+carNum+"<br>";
						output += "<p style='font-size: small;'>"+roomSortation+"</p></td>";
						output += "<td class='reserveContent'>"+seatNum+"</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='3' class='reserveContent' style='padding-top: 10px; font-weight: bold; text-align: center;'>금액₩ "+threecommaCharge+"원</td>";
						output += "</tr>";
						output += "</table>";
						output += "</table>";
						output += "<input type='hidden' name='ordr_idxx' value='"+reservationCode+"' maxlength='40' />";
						// 결제 금액 설정 및 정보 출력
						output += "<input type='hidden' name='good_mny' value='"+1+"' maxlength='9' />";
						output += "<input type='hidden' name='good_name' value='"+depSta+"→"+arrSta+"행 "+trainNo+","+carNum+","+roomSortation+"|"+seatNum+"' />";
						console.log(output);
						$('#skipCont').html(output);
					});
</script>
</body>

</html>