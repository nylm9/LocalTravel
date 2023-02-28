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
<title>블로그상세보기</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"crossorigin="anonymous"></script>


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

<style>
.jb-division-line {
	border-top: 1px solid #444444;
	margin: 30px auto;
	width: 300px;
}

p {
font-family: 'Pretendard';
}
</style>

</head>
<body>
<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
     <section class="section">
     <div class="card mb-3 p-5 mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:40px;">
     	<div class="row g-0">
            <div class="col-12">
                <div class="card-body"> 
    	 			<c:forEach items="${enList}" var="enList" varStatus="status">
    	 				<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enList.epicture }" style="width: 300px; height: 400px; float:left" >
       	   				<p class="card-title" style="font-size: 30px;font-weight: bold; margin-left:320px;" >${enList.ename }</p>
       	   				 <p   style=" margin-left:320px;" >${enList.eexplain}</p> 
       	   				 
       	   				<c:choose>
	       	   				<c:when test="${enList.etell == null }">
								<p style="font-size: 20px; margin-left:320px;">주소: ${enList.eaddr } & 전화번호없음</p>
							</c:when>
							<c:otherwise>
	       	   					<p  style="font-size: 20px; margin-left:320px;" >주소: ${enList.eaddr } & 전화번호: ${enList.etell }</p>
							</c:otherwise>
						</c:choose>
						<div>
							<c:if test="${enList.erepute == '0'}">
								<p style="font-size: 20px; margin-left:320px;">평점: 없음</p>
							</c:if>
							<c:if test="${enList.erepute == '1'}">
								<p style="font-size: 20px; margin-left:320px;">평점: ★☆☆☆☆ </p>
							</c:if>
							<c:if test="${enList.erepute == '2'}">
								<p style="font-size: 20px; margin-left:320px;">평점: ★★☆☆☆ </p>
							</c:if>
							<c:if test="${enList.erepute == '3'}">
								<p style="font-size: 20px; margin-left:320px;">평점: ★★★☆☆ </p>
							</c:if>
							<c:if test="${enList.erepute == '4'}">
								<p style="font-size: 20px; margin-left:320px;">평점: ★★★★☆ </p>
							</c:if>
							<c:if test="${enList.erepute == '5'}">
								<p style="font-size: 20px; margin-left:320px;">평점: ★★★★★</p>
							</c:if>
						</div>
							
    				 </c:forEach>
    		    </div>
   			 	<div class="jb-division-line"> </div>
					<c:forEach items="${blist}" var="blist" varStatus="status">
        				 <p style="font-size: 20px; margin-left:350px; color:black; line-height:50px;" >${blist.bcontent }</p>
       				 </c:forEach>
       		  
       		</div>
    	 </div>
    	</div>
     </section>
	
</body>
</html>