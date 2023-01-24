<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>프로젝트 - 메인페이지</title>
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
</head>
<body>

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
              <li class="list-inline-item"><a href="#">회원가입</a></li>  
            </ul>
          </div>
        </div>
        
    </div>
  </div>
</header>

<!-- 사진 움직이기 -->
<section class="slider mt-4">
	<div class="container-fluid">
		<div class="row no-gutters">
			<div class="col-lg-12 col-sm-12 col-md-12 slider-wrap">
	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4">
							<a href="blog-single.html">
								<img src="${pageContext.request.contextPath }/resources/images/slider/slider1.jpg" alt="" class="img-fluid">
							</a>
						</div>

						<div class="slider-post-content">
							<span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">패키지 1</span>
							<h3 class="post-title mt-1"><a href="blog-single.html">멘트</a></h3>
							<span class=" text-muted  text-capitalize">날짜, 여행경로</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4">
							<a href="blog-single.html">
								<img src="${pageContext.request.contextPath }/resources/images/slider/slider2.jpg" alt="" class="img-fluid">
							</a>
						</div>
						<div class="slider-post-content">
							<span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">패키지 2</span>
							<h3 class="post-title mt-1"><a href="blog-single.html">멘트</a></h3>
							<span class=" text-muted  text-capitalize">날짜, 여행경로</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4">
							<a href="blog-single.html">
								<img src="${pageContext.request.contextPath }/resources/images/slider/slider3.jpg" alt="" class="img-fluid">
							</a>
						</div>
						<div class="slider-post-content">
							<span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">패키지 3</span>
							<h3 class="post-title mt-1"><a href="blog-single.html">멘트</a></h3>
							<span class=" text-muted  text-capitalize">날짜, 여행경로</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4">
							<a href="blog-single.html">
								<img src="${pageContext.request.contextPath }/resources/images/slider/slider2.jpg" alt="" class="img-fluid">
							</a>
						</div>

						<div class="slider-post-content">
							<span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">패키지 4</span>
							<h3 class="post-title mt-1"><a href="blog-single.html">멘트</a></h3>
							<span class=" text-muted  text-capitalize">날짜, 여행경로</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4">
							<a href="blog-single.html">
								<img src="${pageContext.request.contextPath }/resources/images/slider/slider3.jpg" alt="" class="img-fluid">
							</a>
						</div>
			
						<div class="slider-post-content">
							<span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">패키지 5</span>
							<h3 class="post-title mt-1"><a href="blog-single.html">멘트</a></h3>
							<span class=" text-muted  text-capitalize">날짜, 여행경로</span>
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