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
<title>놀거리 상세보기 페이지</title>

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
    
	<style type="text/css">
	
	.reviewComment{
		outline: none;
		resize: none;
		border: none;
	}
h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
  color: #1c1c1c;
  font-weight: 600;
   font-family: sans-serif; 
}
	</style>
	<script type="text/javascript">
  		var reMsg = '${redirectMsg}';
  		if(reMsg.length > 0){
  			alert(reMsg);
  		}
  </script>
	
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
		 <script type="text/javascript">
		  var Msg = '${Msg}';
		  if (Msg.trim().length > 0) { // 빈 문자열이 아닐 때만 alert 창 띄우기
		    alert(Msg);
		  }
		</script>

</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
	<!-- 상세보기 -->
		<section class="section">
			<div class="card mb-3 p-5 mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:40px;">
            	<div class="row g-0">
              		<div class="col-12">
                		<div class="card-body"> 
		                	<!-- 사진 -->
		                	<form onsubmit="return joinFormCheck(this)">
		                	<p id="ecodecheck"  onkeyup="joinecodeCheck(this.value)">${enInfo.ecode }</p>
		                	<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enInfo.epicture }" 
		                		style="width: 300px; height: 400px; float:left" 
		                		     class="img-fluid rounded-start" alt="...">
		                		     <!-- 정보출력 -->
                		  			<div style="padding-left:350px;">
			                  			<h5 class="card-title" style="font-size: 30px;font-weight: bold;" >${enInfo.ename }</h5>
			                  			<p class="card-text"><span style="font-size: 18px;font-weight: bold;" >주소: ${enInfo.eaddr }</span>
				                  			<div>
												<c:if test="${enInfo.erepute == '0'}">
													<p style="font-size: 17px; ">평점: ☆☆☆☆☆(0) </p>
												</c:if>
												<c:if test="${enInfo.erepute == '1'}">
													<p style="font-size: 17px; ">평점: ★☆☆☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '2'}">
													<p style="font-size: 17px; ">평점: ★★☆☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '3'}">
													<p style="font-size: 17px; ">평점: ★★★☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '4'}">
													<p style="font-size: 17px; ">평점: ★★★★☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '5'}">
													<p style="font-size: 17px; ">평점: ★★★★★</p>
												</c:if>
											</div>
			                  		
			                  			 <!-- <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-up"></i></span>
			                  			 <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-down"></i></span> -->
			                  			
			                  				<hr>
					                  			<c:choose>
							       	   				<c:when test="${enInfo.etell == null }">
														<p style="font-size: 17px; ">전화번호: 없음</p>
													</c:when>
													<c:otherwise>
							       	   					<p  style="font-size: 20px; " >전화번호: ${enInfo.etell }</p>
													</c:otherwise>
												</c:choose>
			                  			
			                  			<p class="card-text mb-1" style="font-size: 17px; margin-top:-15px; ">${enInfo.eexplain }</p>
				                  			
				                  			<div style="float:left">
					                  			 <a class="btn btn-sm btn-danger"
												   href="${pageContext.request.contextPath }/reviewForm?ecode=${enInfo.ecode }">리뷰작성</a>
												   
												<div style="float:left; margin-right:7px;">
													<label class="btn btn-sm btn-primary">
							             					 <a type="submit" href="${pageContext.request.contextPath }/likeplay?lbcode=${enInfo.ecode }">저장해놓기</a>
							             					<input class="d-none"  type="radio" value='1' name="rvrecommend">
							             			</label>
												</div> 
											</div>
								
									</div>
							
							
							
							
							</form>
                		</div>
              		</div>
            	</div>
            	

           	
          	</div>
          	
	<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<p style="font-size:25px;">리뷰</p>
              		</div>
              		<hr>
              		
              		<c:forEach items="${reviewList }" var="review">
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
		
		<!-- 기차예매 -->
		<section class="section">
		<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<p style="font-size:25px;">기차예매</p>
              		</div>
              		<hr>
              		<div>
              		<h5>갈수있는 열차랑 예매버튼</h5>
              		</div>
              	</div>
         </div>
         </section>

<script type="text/javascript">
function joinecodeCheck(idVal) {
	console.log("놀거리코드 : " + idVal);

		/* $.ajax( { 
			type : "get",	
			url : "${pageContext.request.contextPath }/enjoycodeCheck", 
			data : { "ecode" : idVal },
			success : function(checkResult) {
				console.log("checkResult : " + checkResult);
				alert('틀렸음');
				return false;
				
			}
		} ); */
	
}
</script>

</body>

</html>