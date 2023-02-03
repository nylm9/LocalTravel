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
<title>먹거리페이지</title>

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

/*버튼 (눌렸을때)*/
.button:hover,
.button.active {
color:white;
            background-color: #078196;
            border: 0;
			outline: 0;
}
.button:visited {
			color:white;
            background-color: #078196;
            
}
.button {
 			border: 1px solid #1993A8;
            background-color: rgba(0,0,0,0);
            color: #1993A8;
            padding: 5px;
               border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
             border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
           
}

/*이동css*/
/* #moving-text {
  position: relative;
  animation: move-right 20s linear infinite;
  animation-direction: alternate;
}

@keyframes move-right {
  0% {
    left: 10%;
  }
  100% {
    left: 90%;
  }
} */





</style>

<!-- <script type="text/javascript">
function change_btn(e) {
	  var btns = document.querySelectorAll(".button");
	  btns.forEach(function (btn, i) {
	    if (e.currentTarget == btn) {
	      btn.classList.add("active");
	    } else {
	      btn.classList.remove("active");
	    }
	  });
	  console.log(e.currentTarget);
	}
</script> -->

<!-- 버튼 눌렷을때 이벤트 -->
<script type="text/javascript">

function change_btn(e) {
	e.classList.toggle("active");
  //var btns = document.querySelectorAll(".button");
  //btns.forEach(function (btn, i) {
/*     if (e.currentTarget == btn) {
      btn.classList.toggle("active");
    } else {
      btn.classList.remove("active");
    } */
  //});
  
 // console.log(e.currentTarget);
}




</script>



</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

			<!--================= 메인창 =================-->
<section class="section" style="margin-top:40px; margin:auto;">
	<div class="row align-items-center">
	
		<div class="card" style=" margin-left:680px; margin-top:40px;">
			<div class="card-body" >
				<div class="e" id="moving-text" style="margin-top:5px;">	
				<h5>먹거리</h5>		
				<button class="button"  onclick="change_btn(this)">양식</button>
				<button class="button"  onclick="change_btn(this)">중식</button>
				<button class="button"  onclick="change_btn(this)">일식</button>
				<button class="button"  onclick="change_btn(this)">한식</button>
				<button class="button"  onclick="change_btn(this)">동남아</button>
				<button class="button"  onclick="change_btn(this)">카페</button>
				</div>
			</div>
		</div>
	</div>
</section>
<!--  키워드 검색결과 패키지 -->


<!-- 패키지 출력 -->
	<section class="section">
			<div class="row mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:5px;" >
				
				
			 <c:forEach items="${fdList}" var="food" varStatus="status">
				<div class="col-3">
					<div class="card"  style=" margin-top:5px;">
						<div class="card-body">
							 <h5 class="card-title py-2" style="text-align: center;" >No.${status.index + 1 }</h5>
							 <div style="height:200px;width:5px;">
							<a href="${pageContext.request.contextPath }/foodInfo?fcode=${food.fcode }">
							<img class="img-fluid" 
							     alt="" src="${food.fpicture }" >
							</a>
							</div>
							<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${food.fname }" >${food.fname }</h6>
						
							<p class="small mb-1">${food.faddr }</p>
							
							<a class="btn-dark btn-sm btn"
							href="${pageContext.request.contextPath }/foodInfo?fcode=${food.fcode }">상세보기</a>
						
						
						</div>
					</div>
				</div>
			</c:forEach>				
						  
							
			</div>
		</section>


</body>



</html>
