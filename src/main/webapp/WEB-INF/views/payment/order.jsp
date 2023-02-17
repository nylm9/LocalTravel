<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<title>*** NHN KCP API SAMPLE ***</title>
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">
<link
	href="${pageContext.request.contextPath }/resources/css/paymentStyle.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript">
	/****************************************************************/
	/* m_Completepayment  설명                                      */
	/****************************************************************/
	/* 인증완료시 재귀 함수                                         */
	/* 해당 함수명은 절대 변경하면 안됩니다.                        */
	/* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다.    */
	/* Web 방식의 경우 리턴 값이 form 으로 넘어옴                   */
	/****************************************************************/
	function m_Completepayment(FormOrJson, closeEvent) {
		var frm = document.order_info;

		/********************************************************************/
		/* FormOrJson은 가맹점 임의 활용 금지                               */
		/* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다.  */
		/* FormOrJson 값을 활용 하시려면 기술지원팀으로 문의바랍니다.       */
		/********************************************************************/
		GetField(frm, FormOrJson);

		if (frm.res_cd.value == "0000") {
			alert("결제 승인 요청 전,\n\n반드시 결제창에서 고객님이 결제 인증 완료 후\n\n리턴 받은 ordr_chk 와 업체 측 주문정보를\n\n다시 한번 검증 후 결제 승인 요청하시기 바랍니다."); //업체 연동 시 필수 확인 사항.
			/*
			                    가맹점 리턴값 처리 영역
			 */

			frm.submit();
		} else {
			alert("[" + frm.res_cd.value + "] " + frm.res_msg.value);

			closeEvent();
		}
	}
</script>
<!--
            결제창 호출 JS
             개발 : https://testpay.kcp.co.kr/plugin/payplus_web.jsp
             운영 : https://pay.kcp.co.kr/plugin/payplus_web.jsp
    -->
<script type="text/javascript"
	src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
<script type="text/javascript">
	/* 표준웹 실행 */
	function jsf__pay(form) {
		try {
			KCP_Pay_Execute(form);
		} catch (e) {
			/* IE 에서 결제 정상종료시 throw로 스크립트 종료 */
		}
	}
</script>

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
						output += "<input type='hidden' name='good_mny' value='"+sumCharge+"' maxlength='9' />";
						output += "<input type='hidden' name='good_name' value='"+depSta+"→"+arrSta+"행 "+trainNo+","+carNum+","+roomSortation+"|"+seatNum+"' />";
						console.log(output);
						$('#skipCont').html(output);
					});
</script>
<script type="text/javascript">
function generateRandomNumber() {
	  var randomNumber = Math.floor(Math.random() * 10000);
	  return randomNumber.toString().padStart(4, '0');
	}

	

	
</script>
<style>
.reserveTitle {
	text-align: left; /* 문자를 왼쪽으로 정렬 */
	font-size: small; /* 글꼴 크기를 작게 설정 */
}

.reserveContent {
	text-align: center; /* 문자를 가운데 정렬 */
	font-size: x-large; /* 글꼴 크기를 크게 설정 */
}

.reversal {
	background-color: black;
	color: white;
	padding-left: 5px;
	padding-right: 5px;
}

.rightborder {
	border-right: 1px solid black;
}
</style>
</head>
<body>
	<!-- 결제후 이동페이지 -->
	<form name="order_info" method="post" action="../contoller/mainPage">
		<div class="wrap">
			<!-- header -->
			<div class="header">
				<a href="#" onclick="history.back();" class="btn-back"><span>뒤로가기</span></a>
				<h1 class="title">기차 예매 결제</h1>
			</div>
			<!-- //header -->
			<!-- contents -->
			<div id="skipCont" class="contents">
				<p class='txt-type-1'>결제 전 해당 주문내용을 확인해주시기 바랍니다</p>
				<p class='txt-type-2'>소수 수정 시 [※ 필수] 또는 [※ 옵션] 표시가 포함된 문장은 가맹점의
					상황에 맞게 적절히 수정 적용하시기 바랍니다.</p>
				<!-- 주문내역 -->
				<h2 class='title-type-3'>주문내역</h2>
				<br>
				<table style='width: 100%;'>
					<tr>
						<th class='reserveTitle' style='padding-bottom: 10px;'>승차일자</th>
						<td colspan='2' class='reserveContent'
							style='padding-bottom: 10px; text-align: left;'>0000년 00월
							00일</td>
					</tr>
					<tr>
						<th class='reserveTitle'>출발역</th>
						<th rowspan='4'>→</th>
						<th class='reserveTitle'>도착역</th>
					</tr>
					<tr>
						<td class='reserveContent'>서울역</td>
						<td class='reserveContent'>부산역</td>
					</tr>
					<tr>
						<th class='reserveTitle'>출발시간</th>
						<th class='reserveTitle'>도착시간</th>
					</tr>
					<tr>
						<td class='reserveContent'><span class='reversal'>00:00</span></td>
						<td class='reserveContent'>00:00</td>
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
						<td colspan='3' class='reserveContent' style='text-align: left;'>KTX
							000</td>
					</tr>
					<tr>
						<th class='reserveTitle rightborder' style='text-align: center;'>타는곳</th>
						<th class='reserveTitle rightborder' style='text-align: center;'>호차번호</th>
						<th class='reserveTitle' style='text-align: center;'>좌석번호</th>
					</tr>
					<tr>
						<td class='reserveContent rightborder' style='font-size: small;'>역
							전광판 확인</td>
						<td class='reserveContent rightborder'>5호차<br>
							<p style='font-size: small;'>일반실</p></td>
						<td class='reserveContent'>A4</td>
					</tr>
					<tr>
						<td colspan='3' class='reserveContent' style='padding-top: 10px; font-weight: bold; text-align: center;'>금액₩ 30,000원</td>
					</tr>
				</table>
			</div>
			<!-- http://localhost:8080/contoller/PCPayment?depSta=%EB%8F%99%EB%8C%80%EA%B5%AC&arrSta=%EB%8C%80%EC%A0%84&trainNo=32&deptime=13:23&arrtime=14:03&carNum=5%ED%98%B8%EC%B0%A8&seatNum=C8&reserveDate=2023-02-17&adultCharge=19700 -->

			<div class="line-type-1"></div>
			<!-- 주문정보 -->
			<h2 class="title-type-3">예매정보</h2>
			<ul class="list-type-1">
				<!-- 주문자명(buyr_name) -->
				<li>
					<div class="left">
						<p class="title">예매자명</p>
					</div>
					<div class="right">
						<div class="ipt-type-1 pc-wd-2">
							<input type="text" name="buyr_name" value="홍길동" />
						</div>
					</div>
				</li>
				<!-- 주문자 연락처1(buyr_tel1) -->
				<li>
					<div class="left">
						<p class="title">전화번호</p>
					</div>
					<div class="right">
						<div class="ipt-type-1 pc-wd-2">
							<input type="text" name="buyr_tel1" value="02-0000-0000" />
						</div>
					</div>
				</li>
				<!-- 휴대폰번호(buyr_tel2) -->
				<li>
					<div class="left">
						<p class="title">휴대폰번호</p>
					</div>
					<div class="right">
						<div class="ipt-type-1 pc-wd-2">
							<input type="text" name="buyr_tel2" value="010-0000-0000" />
						</div>
					</div>
				</li>
				<!-- 주문자 E-mail(buyr_mail) -->
				<li>
					<div class="left">
						<p class="title">이메일</p>
					</div>
					<div class="right">
						<div class="ipt-type-1 pc-wd-2">
							<input type="text" name="buyr_mail" value="test@test.co.kr" />
						</div>
					</div>
				</li>
			</ul>
			<div class="line-type-1"></div>
			<!-- 
                    결제 수단 정보 설정 
                    
                    결제에 필요한 결제 수단 정보를 설정합니다.                               
                                                                                          
                    신용카드 : 100000000000, 계좌이체 : 010000000000, 가상계좌 : 001000000000 
                    포인트   : 000100000000, 휴대폰   : 000010000000, 상품권   : 000000001000
                    
                    위와 같이 설정한 경우 표준웹에서 설정한 결제수단이 표시됩니다.
                    표준웹에서 여러 결제수단을 표시하고 싶으신 경우 설정하시려는 결제
                    수단에 해당하는 위치에 해당하는 값을 1로 변경하여 주십시오.
                                                                                               
                    예) 신용카드, 계좌이체, 가상계좌를 동시에 표시하고자 하는 경우
                    pay_method = "111000000000"
                    신용카드(100000000000), 계좌이체(010000000000), 가상계좌(001000000000)에
                    해당하는 값을 모두 더해주면 됩니다.
                    ※ 필수
                     KCP에 신청된 결제수단으로만 결제가 가능합니다.        
                -->
			<h2 class="title-type-3">결제수단</h2>
			<ul class="list-check-1">
				<li><input type="radio" id="radio-2-1" class="ipt-radio-1"
					name="pay_method" value="100000000000" checked /> <label
					for="radio-2-1"><span class="ico-radio"><span></span></span>신용카드</label>
				</li>
				<li><input type="radio" id="radio-2-2" class="ipt-radio-1"
					name="pay_method" value="010000000000" /> <label for="radio-2-2"><span
						class="ico-radio"><span></span></span>계좌이체</label></li>
				<li><input type="radio" id="radio-2-3" class="ipt-radio-1"
					name="pay_method" value="001000000000" /> <label for="radio-2-3"><span
						class="ico-radio"><span></span></span>가상계좌</label></li>
				<li><input type="radio" id="radio-2-4" class="ipt-radio-1"
					name="pay_method" value="000100000000" /> <label for="radio-2-4"><span
						class="ico-radio"><span></span></span>포인트</label></li>
				<li><input type="radio" id="radio-2-5" class="ipt-radio-1"
					name="pay_method" value="000010000000" /> <label for="radio-2-5"><span
						class="ico-radio"><span></span></span>휴대폰</label></li>
				<li><input type="radio" id="radio-2-6" class="ipt-radio-1"
					name="pay_method" value="000000001000" /> <label for="radio-2-6"><span
						class="ico-radio"><span></span></span>상품권</label></li>
				<li><input type="radio" id="radio-2-8" class="ipt-radio-1"
					name="pay_method" value="111000000000" /> <label for="radio-2-8"><span
						class="ico-radio"><span></span></span>신용카드/계좌이체/가상계좌</label></li>
			</ul>
			<div Class="Line-Type-1"></div>
			<ul class="list-btn-2">
				<li><a href="#none" onclick="jsf__pay(document.order_info);"
					class="btn-type-2 pc-wd-3">결제요청</a></li>
				<li class="pc-only-show"><a href="../index.html"
					class="btn-type-3 pc-wd-2">처음으로</a></li>
			</ul>
		</div>
		<!-- //contents -->

		<div class="grid-footer">
			<div class="inner">
				<!-- footer -->
				<div class="footer">ⓒ NHN KCP Corp.</div>
				<!-- //footer -->
			</div>
		</div>

		<!-- 가맹점 정보 설정-->
		<input type="hidden" name="site_cd" value="T0000" /> <input
			type="hidden" name="site_name" value="TEST SITE" /> <input
			type="hidden" name="pay_method" value="" />
		<!-- 
                ※필수 항목
                표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다.값을 설정하지 마십시오
            -->
		<input type="hidden" name="res_cd" value="" /> <input type="hidden"
			name="res_msg" value="" /> <input type="hidden" name="enc_info"
			value="" /> <input type="hidden" name="enc_data" value="" /> <input
			type="hidden" name="ret_pay_method" value="" /> <input type="hidden"
			name="tran_cd" value="" /> <input type="hidden"
			name="use_pay_method" value="" />
		<!-- 주문정보 검증 관련 정보 : 표준웹 에서 설정하는 정보입니다 -->
		<input type="hidden" name="ordr_chk" value="" />
		<!--  현금영수증 관련 정보 : 표준웹 에서 설정하는 정보입니다 -->
		<input type="hidden" name="cash_yn" value="" /> <input type="hidden"
			name="cash_tr_code" value="" /> <input type="hidden"
			name="cash_id_info" value="" />

		<!-- 
                ====================================================
                추가 옵션 정보
                ※ 옵션 - 결제에 필요한 추가 옵션 정보를 입력 및 설정합니다. 
                ====================================================
            -->

		<!--사용카드 설정 여부 파라미터 입니다.(통합결제창 노출 유무) -->
		<!-- <input type="hidden" name="used_card_YN"        value="Y" /> -->
		<!-- 사용카드 설정 파라미터 입니다. (해당 카드만 결제창에 보이게 설정하는 파라미터입니다. used_card_YN 값이 Y일때 적용됩니다. -->
		<!-- <input type="hidden" name="used_card"        value="CCBC:CCKM:CCSS" /> -->

		<!--
                신용카드 결제시 OK캐쉬백 적립 여부를 묻는 창을 설정하는 파라미터 입니다
                포인트 가맹점의 경우에만 창이 보여집니다
            -->
		<!-- <input type="hidden" name="save_ocb"        value="Y" /> -->

		<!-- 고정 할부 개월 수 선택
                value값을 "7" 로 설정했을 경우 => 카드결제시 결제창에 할부 7개월만 선택가능  -->
		<!-- <input type="hidden" name="fix_inst"        value="07" /> -->

		<!-- 무이자 옵션
                    ※ 설정할부    (가맹점 관리자 페이지에 설정 된 무이자 설정을 따른다) - "" 로 설정
                    ※ 일반할부    (KCP 이벤트 이외에 설정 된 모든 무이자 설정을 무시한다) - "N" 로 설정
                    ※ 무자 할부 (가맹점 관리자 페이지에 설정 된 무이자 이벤트 중 원하는 무이자 설정을 세팅한다) - "Y" 로 설정 -->
		<!-- <input type="hidden" name="kcp_noint"       value="" /> -->

		<!-- 무이자 설정
                    ※ 주의 1 : 할부는 결제금액이 50,000 원 이상일 경우에만 가능
                    ※ 주의 2 : 무이자 설정값은 무이자 옵션이 Y일 경우에만 결제 창에 적용
                    예) BC 2,3,6개월, 국민 3,6개월, 삼성 6,9개월 무이자 : CCBC-02:03:06,CCKM-03:06,CCSS-03:06:04 -->
		<!-- <input type="hidden" name="kcp_noint_quota" value="CCBC-02:03:06,CCKM-03:06,CCSS-03:06:09" /> -->


		<!--  해외카드 구분하는 파라미터 입니다.(해외비자, 해외마스터, 해외JCB로 구분하여 표시) -->
		<!-- <input type="hidden" name="used_card_CCXX"        value="Y"/> -->

		<!--  가상계좌 은행 선택 파라미터
                 ※ 해당 은행을 결제창에서 보이게 합니다.(은행코드는 매뉴얼을 참조)  -->
		<!-- <input type="hidden" name="wish_vbank_list" value="05:03:04:07:11:23:26:32:34:81:71" /> -->

		<!--  가상계좌 입금 기한 설정하는 파라미터 - 발급일 + 3일 -->
		<!-- <input type="hidden" name="vcnt_expire_term" value="3"/> -->

		<!-- 가상계좌 입금 시간 설정하는 파라미터
                HHMMSS형식으로 입력하시기 바랍니다
                          설정을 안하시는경우 기본적으로 23시59분59초가 세팅이 됩니다 -->
		<!-- <input type="hidden" name="vcnt_expire_term_time" value="120000" /> -->

		<!-- 포인트 결제시 복합 결제(신용카드+포인트) 여부를 결정할 수 있습니다.- N 일경우 복합결제 사용안함 -->
		<!-- <input type="hidden" name="complex_pnt_yn" value="N" /> -->

		<!-- 현금영수증 등록 창을 출력 여부를 설정하는 파라미터 입니다
                       ※ Y : 현금영수증 등록 창 출력
                       ※ N : 현금영수증 등록 창 출력 안함 
                       ※ 주의 : 현금영수증 사용 시 KCP 상점관리자 페이지에서 현금영수증 사용 동의를 하셔야 합니다 -->
		<!-- <input type="hidden" name="disp_tax_yn"     value="Y" /> -->

		<!--  결제창에 가맹점 사이트의 로고를 표준웹 좌측 상단에 출력하는 파라미터 입니다
                      업체의 로고가 있는 URL을 정확히 입력하셔야 하며, 최대 150 X 50  미만 크기 지원
                      ※ 주의 : 로고 용량이 150 X 50 이상일 경우 site_name 값이 표시됩니다. -->
		<!-- <input type="hidden" name="site_logo"       value="" /> -->

		<!-- 결제창 영문 표시 파라미터 입니다. 영문을 기본으로 사용하시려면 Y로 세팅하시기 바랍니다 -->
		<!-- <input type="hidden" name="eng_flag"      value="Y"> -->

		<!--  KCP는 과세상품과 비과세상품을 동시에 판매하는 업체들의 결제관리에 대한 편의성을 제공해드리고자, 
                    복합과세 전용 사이트코드를 지원해 드리며 총 금액에 대해 복합과세 처리가 가능하도록 제공하고 있습니다
                    복합과세 전용 사이트 코드로 계약하신 가맹점에만 해당이 됩니다
                    상품별이 아니라 금액으로 구분하여 요청하셔야 합니다
                    총결제 금액은 과세금액 + 부과세 + 비과세금액의 합과 같아야 합니다. 
                (good_mny = comm_tax_mny + comm_vat_mny + comm_free_mny) -->
		<!-- <input type="hidden" name="tax_flag"       value="TG03" /> -->
		<!-- 변경불가     -->
		<!-- <input type="hidden" name="comm_tax_mny"   value=""     /> -->
		<!-- 과세금액     -->
		<!-- <input type="hidden" name="comm_vat_mny"   value=""     /> -->
		<!-- 부가세      -->
		<!-- <input type="hidden" name="comm_free_mny"  value=""     /> -->
		<!-- 비과세 금액 -->

		<!--  skin_indx 값은 스킨을 변경할 수 있는 파라미터이며 총 7가지가 지원됩니다. 
                     변경을 원하시면 1부터 7까지 값을 넣어주시기 바랍니다. -->
		<!-- <input type="hidden" name="skin_indx"      value="1" /> -->
		<!-- 상품코드 설정 파라미터 입니다.(상품권을 따로 구분하여 처리할 수 있는 옵션기능입니다.) -->
		<!-- <input type="hidden" name="good_cd"      value="" /> -->

		<!-- 가맹점에서 관리하는 고객 아이디 설정을 해야 합니다. 상품권 결제 시 반드시 입력하시기 바랍니다. -->
		<!-- <input type="hidden" name="shop_user_id"    value="" /> -->

		<!--  복지포인트 결제시 가맹점에 할당되어진 코드 값을 입력해야합니다. -->
		<!-- <input type="hidden" name="pt_memcorp_cd"   value="" /> -->

		<!--  결제창의 상단문구를 변경할 수 있는 파라미터 입니다. -->
		<!-- <input type="hidden" name="kcp_pay_title"   value="상단문구추가" /> -->
		</div>
	</form>
</body>
</html>