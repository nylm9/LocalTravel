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
<title>TRAIN-열차예매사이트</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<script
	src="${pageContext.request.contextPath }/resources/memberJoinCheck/checkBox.js"></script>
	
<!-- jQuery google CDN -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->

<!-- initialize jQuery Library -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>




<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	background-color: #f7f7f7;
}

ul>li {
	list-style: none
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: block;
	clear: both;
}

#joinForm {
	width: 460px;
	margin: 0 auto;
}

ul.join_box {
	border: 1px solid #ddd;
	background-color: #fff;
}

.checkBox, .checkBox>ul {
	position: relative;
}

.checkBox>ul>li {
	float: left;
}

.checkBox>ul>li:first-child {
	width: 85%;
	padding: 15px;
	font-weight: 600;
	color: #888;
}

.checkBox>ul>li:nth-child(2) {
	position: absolute;
	top: 50%;
	right: 30px;
	margin-top: -12px;
}

.checkBox textarea {
	width: 96%;
	height: 90px;
	margin: 0 2%;
	background-color: #f7f7f7;
	color: #888;
	border: none;
}

.footBtwrap {
	margin-top: 15px;
}

.footBtwrap>li {
	float: left;
	width: 50%;
	height: 60px;
}

.footBtwrap>li>button {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 20px;
	text-align: center;
	line-height: 60px;
}

.fpmgBt1 {
	background-color: #fff;
	color: #888;
	border-color: #eee;
}

.fpmgBt2 {
	background-color: lightsalmon;
	color: #fff;
	border-color: #eee;
}
</style>

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
</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

	<!-- 약관동의 창 -->
	<section class="section" style="margin-top: 40px;">
		<div class="row justify-content-center">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">회원가입</p>
						</div>
						<%--  <form action="${pageContext.request.contextPath }/memberJoinForm" id="joinForm">  --%>
							<ul class="join_box">
								<li class="checkBox check01">
									<ul class="clearfix">
										<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에
											모두 동의합니다.</li>
										<li class="checkAllBtn"><input type="checkbox" 
											name="chkAll" id="chkAll" class="chkAll"></li>
									</ul>
								</li>
								<li class="checkBox check02">
									<ul class="clearfix">
										<li>이용약관 동의(필수)</li>
										<li class="checkBtn"><input type="checkbox" name="chk" id="chm"
											class="chk"></li>
									</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
								</li>
								<li class="checkBox check03">
									<ul class="clearfix">
										<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
										<li class="checkBtn"><input type="checkbox" name="chk" id="chm"
											class="chk"></li>
									</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
								</li>
								<li class="checkBox check03">
									<ul class="clearfix">
										<li>위치정보 이용약관 동의(선택)</li>
										<li class="checkBtn"><input type="checkbox" name="chk" id="chs"
											class="chk"></li>
									</ul> <textarea name="" id="">여러분을 환영합니다.
네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
   </textarea>
								</li>
								<li class="checkBox check04">
									<ul class="clearfix">
										<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
										<li class="checkBtn"><input type="checkbox" name="chk" id="chs"
											class="chk"></li>
									</ul>

								</li>
							</ul>
							<ul class="footBtwrap clearfix">
								<!-- <li><button class="fpmgBt1">비동의</button></li> -->
								<li><button class="fpmgBt2" onClick="location.href='${pageContext.request.contextPath }/'">비동의</button>
								<li><button class="fpmgBt2"  onClick="location.href='${pageContext.request.contextPath }/memberJoinForm'" >동의</button></li>
							</ul>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</div>
	</section>


</body>



<!-- initialize jQuery Library -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>




<script type="text/javascript">


</script>



</html>
