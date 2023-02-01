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
<title>놀거리사이트</title>

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
	
	<!-- 상세보기 -->
		<section class="section">
			<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px; margin-top:40px;">
            	<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
              			<!-- 사진 -->
                		<img src="${pageContext.request.contextPath }/resources/Test1.jpg" style="width: 700px; height: 300px;" 
                		     class="img-fluid rounded-start" alt="...">
              		</div>
              		<div class="col-12">
                		<div class="card-body">
                  			<h5 class="card-title" style="font-size: 30px;font-weight: bold;" >제목</h5>
                  			<p class="card-text"><span style="font-size: 18px;font-weight: bold;" >날짜</span>
                  			 <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-up"></i></span>
                  			<span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-down"></i></span>
                  			</p>
                  			<hr>
                  			<p class="card-text mb-1">내용</p>
                  			<p class="card-text mb-1"><a>지도</a></p>
                  			 <a class="btn btn-sm btn-danger"
							   href="${pageContext.request.contextPath }/projectreviewForm">리뷰작성</a>
                		</div>
              		</div>
            	</div>

           	
          	</div>
          	
          	<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<h2>후기글</h2>
              		</div>
              		<hr>
              		
              		<c:forEach items="${reviewList }" var="review">
              		<div class="col-6">
                		<div class="card-body">
                			<div class="row">
                				<div class="col-auto" >
                				
                					<img class="rounded-circle reviewProfile" 
                					src="${pageContext.request.contextPath }/resources/assets/img/profile01.jpg" >
                				</div>
                				<div class="col">
									<h2 class="card-title p-0 mb-1"> 
                					<c:choose>
										<c:when test="${review.RVRECOMMEND == '1' }">
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-up "></i>
											</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; color: black;">
												<i class="bi bi-hand-thumbs-down "></i>
											</span>										
										</c:otherwise>									
									</c:choose>
									
										${review.RVMID} 
									</h2>
									<textarea class="reviewComment w-100" rows="5" readonly="readonly">${review.RVCOMMENT}</textarea>
									<h6>${review.RVDATE}</h6>
                				</div>
                			</div>
                		</div>
                		<hr>
              		</div>
					</c:forEach>             
					<div class="col-12" style="text-align:center;">
					[이전]
					<c:forEach begin="${pageInfo.startPageNum }" end="${pageInfo.endPageNum }" var="pageNum" step="1">
						<c:choose>
							<c:when test="${pageNum == pageInfo.reviewPage }">
							${pageNum }
							</c:when>
							
							<c:otherwise>
					    	<a href="${pageContext.request.contextPath }/movieInfo?mvcode=${mvInfo.mvcode }&reviewPage=${pageNum }">${pageNum }</a> 
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					[다음]
					</div> 		
            	</div>  			         	
          	</div>
          	
		</section>

</body>
</html>