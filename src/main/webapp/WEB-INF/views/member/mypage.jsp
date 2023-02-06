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


</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	<!-- 회원정보출력 -->
		<section class="section">
		<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<p style="font-size:25px;">마이페이지</p>
              		</div>
              		<hr>
              		
              		<c:forEach items="${memberList }" var="memberList">
              		<div class="col-6">
                		<div class="card-body">
                			<div class="row">
                				
                				<div class="col">
									<h8 class="card-title p-0 mb-1"> 
                					<c:choose>
										<c:when test="${review.RVRECOMMEND == '1' }">
											<span style="font-weight: bold; color: pink;">
												<i class="bi bi-hand-thumbs-up "></i>
												<h8>좋아요</h8>
											</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; color: red;">
												<i class="bi bi-hand-thumbs-down "></i>
												<h8>별로에요</h8>
											</span>										
										</c:otherwise>									
									</c:choose>
										ID: ${review.RVMID} 
									</h8>
									<textarea class="reviewComment w-100" rows="1" readonly="readonly">${review.RVCOMMENT}</textarea>
									<h6>${review.RVDATE}</h6>
                				</div>
                			</div>
                		</div>
                		<hr>
              		</div>
					</c:forEach>             
				
            	</div>  			         	
          	</div>
          	</section>

</body>
</html>