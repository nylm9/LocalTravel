<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로젝트 - 예매페이지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
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
	
	
	<style type="text/css">
	
		/*맨 앞 역표*/
		table{
		width:100%;
		border:1px solid #444444;
		 border-collapse: collapse;
		}
		th, td {
	    border: 1px solid #444444;
	    text-align:center;
	    padding:8px;
	    }
	    thead{
	    background-color: #f8f8f8;
	    }
		
		/* 눌럿을때 뜨는 표*/
		.card-graph{
			margin-bottom:17px;
			text-align:center; 
			font-weight:bold;
			background-color: #f8f8f8;
		}
  		
  		/*날짜*/
  		.reserveArea{
	  		height:350px;
	  		overflow: scroll;
	  	}
	</style>


</head>
<body>
			<!-- 로고와 탑바 -->
<header class="header-top justify-content-center" style="background: #FFEBFF;">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-2 col-md-4 text-center d-none d-lg-block">
          <a class="navbar-brand " href="index.html">
           <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image"
           style="width:40px; height:40px;">
          </a>
      </div>

      <div class="col-lg-8 col-md-12">
        <nav class="navbar navbar-expand-lg navigation-2 navigation">
          <a class="navbar-brand text-uppercase d-lg-none" href="#">
            <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="" class="img-fluid">
          </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="ti-menu"></span>
            </button>

              <div class="collapse navbar-collapse" id="navbar-collapse">
                  <ul id="menu" class="menu navbar-nav mx-auto">
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          예약하기
                          </a>
                      </li>
                      
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          지역별
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <a class="dropdown-item" href="standard-fullwidth.html">패키지1</a>
                            <a class="dropdown-item" href="standard-left-sidebar.html">패키지 2</a>
                            <a class="dropdown-item" href="standard-right-sidebar.html">패키지3</a>
                          </div>
                      </li>

                      <li class="nav-item"><a href="about.html" class="nav-link">정산</a></li>
                  </ul>
                  
                   <ul class="list-inline mb-0 d-block d-lg-none">
                    <li class="list-inline-item"><a href="#">로그인</a></li>
                    <li class="list-inline-item"><a href="#">회원가입</a></li>
                  </ul>
              </div>
          </nav>
        </div>
        
        <div class="col-lg-2 col-md-4 col-6">
          <div class="header-socials-2 text-right d-none d-lg-block">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="#">로그인</a></li>
               
            </ul>
          </div>
        </div>
        
    </div>
  </div>
</header>
<!-- topbar끝 -->

<!-- 예매창 main창-->
<section class="section">
			<div class="row" style="min-width: 565px;" >
			
			<!-- 출발역 선택표 -->
				<div class="col-lg-3 col-md-6 col-sm-6" >
					<div class="card" style="margin-top:40px; margin-left:40px;">
						<div class="card-body">
						
							<table>
								<thead>
									<tr>
										<th colspan="2">역</th>
									</tr>
								</thead>
									<tbody>
										<tr>
											<td>서울</td>
											<td>경기</td>
										</tr>
										<tr>
											<td>인천</td>
											<td>대전</td>
										</tr>
										<tr>
											<td>대구</td>
											<td>울산</td>
										</tr>
										<tr>
											<td>부산</td>
											<td>광주</td>
										</tr>
										<tr>
											<td>세종</td>
											<td>강원</td>
										</tr>
										<tr>
											<td>충북</td>
											<td>충남</td>
										</tr>
										<tr>
											<td>경북</td>
											<td>경남</td>
										</tr>
										<tr>
											<td>전북</td>
											<td>전남</td>
										</tr>
									</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 출발역을 눌렀을때  -->
				<div class="col-lg-3 col-md-6 col-sm-6" >
					<div class="card" style="margin-top:40px; margin-left:40px;">
						<div class="card-body">
							<table>
								<thead>
									<div class="card card-graph">
									
									<!-- 예시를 서울역으로 넣어놓은 것 -->
										<div class="card-body">서울역</div>
									</div>
								</thead>
								<tbody>
									<tr>
									<!-- 도착지 선택 -->
										<td>부산</td>
									</tr>
									<tr>
										<td>경기</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<!-- 출발지와 도착지를 모두 선택하고 날짜선택 -->
				<div class="col-lg-3 col-md-6 col-sm-6" >
					<div class="card" style="margin-top:40px; margin-left:40px;">
						<div class="card-body">
							<div class ="card" style="float: left;">
								<div class="card-body" >
									<h5 class="card-title">날짜</h5>
									<!-- List group with Links and buttons -->
									<div class="list-group reserveArea" id="scDateListArea">
										<h5>3월</h5>
									</div>
								</div>
							</div>
							<div class ="card" style="float: right;">
								<div class="card-body" >
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
							<div class="row" >												
								<div class="col-6">
									<h3 style="float: left;">출발</h3>
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



<!-- THEME JAVASCRIPT FILES
================================================== -->
<!-- initialize jQuery Library -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
<!-- Bootstrap jQuery -->
<script src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/popper.min.js"></script>
<!-- Owl caeousel -->
<script src="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.js"></script>
<!-- Instagram Feed Js -->
<script src="${pageContext.request.contextPath }/resources/plugins/instafeed-js/instafeed.min.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/google-map/gmap.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>


</body>
</html>