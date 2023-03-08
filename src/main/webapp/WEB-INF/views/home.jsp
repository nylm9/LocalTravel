<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <!-- 프리텐다드 폰트 -->
    <link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">
    

    
<style type="text/css">
  @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gowun+Dodum&display=swap');
  
.square{
      width: 100px;
      height: 100px;
      background: pink;
}

 p{
font-family: 'Black Han Sans', sans-serif !important;
} 


span, h3 {
/* font-family: 'Gowun Dodum', sans-serif; */
font-family: 'Pretendard';
}

#dotted {
   border: dotted 10px;
}

/* font-family: 'Black Han Sans', sans-serif;
font-family: 'Do Hyeon', sans-serif;
font-family: 'Gowun Dodum', sans-serif; */
</style>

</head>

<body style="background:#F7F5EB;">

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
 <div>
	<p style="font-size:70px; position:absolute; left:70px;top: 55px;">트립픽과 KTX 예약부터 
	<p style="font-size:70px; position:absolute; left:100px;top: 135px;">여행지 추천까지
	
	</p>
 </div>  

<!-- 사진 움직이기 -->
<section class="slider mt-4">
	<div class="container-fluid" >
		<div class="row no-gutters" style="margin-top:200px;">
			<div class="col-lg-12 col-sm-12 col-md-12 slider-wrap">
	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4" style="border: 2px dotted  #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E001"> <!-- 번호를 하나씩 컨트롤러로 보내고 -->
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/롯데월드 봄.jfif" alt="" 
								 class="img-fluid" style="width:680px;height:650px;">
							</a>
						</div>
					
						<div class="slider-post-content" style="border-radius: 10px;"> <!-- style="width: 400px; height: 150px; -->
						<!-- 하나씩 일일이 적기 -->
							<span class="cat-name text-color text-uppercase letter-spacing">롯데월드 어드벤처</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E001">365일 즐거움이 가득한 공간<br> 롯데월드!</a></h3>
							<span class=" text-muted  text-capitalize">서울 송파구 올림픽로 240</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4" style="border: 2px dotted #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E007">
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/f46dff9a-7235-4acf-850d-9b5e85a43ba7_해운대해수욕장.jfif"
								 alt="" class="img-fluid" style="width:680px;height:650px;">
							</a>
						</div>
						<div class="slider-post-content" style="border-radius: 10px;">
							<span class="cat-name text-color text-uppercase letter-spacing">해운대 해수욕장</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E007">주변의 뺴어난 자연경관과 어우러진</br> 전국 제일의 해수욕장</a></h3>
							<span class=" text-muted  text-capitalize">부산 해운대구 우동</span>
						</div>
	               </div>
	            </div>

	            <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4" style="border: 2px dotted #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E009">
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/대구이월드.jfif"
								 alt="" class="img-fluid"style="width:680px;height:650px;">
							</a>
						</div>
						<div class="slider-post-content" style="border-radius: 10px;">
							<span class="cat-name text-color text-uppercase letter-spacing"
							>이월드</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E009">Where Dreams come true</br>벚꽃이 예쁜 이월드</a></h3>
							<span class=" text-muted  text-capitalize">대구 달서구 두류공원로 200 이월드</span>
						</div>
	               </div>
	            </div>


	            <div class="slider-item" >
	               <div class="slider-item-content" >
						<div class="post-thumb mb-4" style="border: 2px dotted #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E014">
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/보문정.jpg"
								 alt="" class="img-fluid"style="width:680px;height:650px;">
							</a>
						</div>
						<div class="slider-post-content" style="border-radius: 10px;">
							<span class="cat-name text-color text-uppercase letter-spacing"
							>보문정</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E014">어느 계절 하나 빼놓지 않고 
							<br>풍경을 감상해야 할 곳</a></h3>
							<span class=" text-muted  text-capitalize">경북 경주시 신평동</span>
						</div>
	               </div>
	            </div>

	             <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4" style="border: 2px dotted #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E013">
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/반곡역.jpg"
								 alt="" class="img-fluid"style="width:680px;height:650px;">
							</a>
						</div>
						<div class="slider-post-content" style="border-radius: 10px;">
							<span class="cat-name text-color text-uppercase letter-spacing"
							>반곡역(간이역)</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E013">주변풍경이 아름답고 자연과 어우러져 <br>경치 좋은 곳</a></h3>
							<span class=" text-muted  text-capitalize">강원 원주시 달마중3길 30</span>
						</div>
	               </div>
	            </div>
	             <div class="slider-item">
	               <div class="slider-item-content">
						<div class="post-thumb mb-4" style="border: 2px dotted #A0C3D2;">
							<a href="${pageContext.request.contextPath }/playInfo?ecode=E012">
								<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/여의도 윤중로 벛꽃길.jfif"
								 alt="" class="img-fluid"style="width:680px;height:650px;">
							</a>
						</div>
						<div class="slider-post-content" style="border-radius: 10px;">
							<span class="cat-name text-color text-uppercase letter-spacing"
							>여의도 윤중로 벚꽃길</span>
							<h3 class="post-title mt-1"><a href="${pageContext.request.contextPath }/playInfo?ecode=E012">해마다 4월이 되면 벚꽃이 <br>흐드러지는 예쁜 곳</a></h3>
							<span class=" text-muted  text-capitalize">서울 영등포구 여의도동</span>
						</div>
	               </div>
	            </div> 
	             
	             
            </div>
	             
		</div>
	</div>
	</section>
	
	<!-- 블로그부분 -->
<%-- 	<section class="section">
		<p style="text-align : center;font-size: 30px;font-weight: bold; margin-top:10px;">블로그</p>
 	<div class="row mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:50px;"  >
			<c:forEach items="${blist}" var="blog" varStatus="status">
				<div class="col-3">
					<div class="card" style="margin-bottom:13px;">
						<div class="card-body" >
						
							 <h5 class="card-title py-2" style="text-align: center;" >No.${status.index + 1 }</h5>
							 <div>
							<a href="${pageContext.request.contextPath }/BlogView?ecode=${blog.bcode }">
							<img class="img-fluid" 
							     alt="" src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enList[status.index].epicture }"
							    style="height:200px;width:237px;" >
							</a>
							</div> 
							
							<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${enList[status.index].ename }" >${enList[status.index].ename }</h6>
							
							<p class="small mb-1">${enList[status.index].eaddr }</p>
							
							<a class="btn-dark btn-sm btn"
							href="${pageContext.request.contextPath }/BlogView?ecode=${blog.bcode }">블로그글보기</a>
							
						
						</div>
					</div>
				</div>
			</c:forEach>				
		</div>
		 
		 <div class="row mx-auto" style="min-width: 600px; max-width: 1200px;">
		 <h5>dddd</h5>
		<c:forEach items="${enList}" var="enjoy" varStatus="status">
			<div class="col-3">
					<div class="card">
						<div class="card-body">
							<h6>ddd</h6>
						</div>
					</div>
				</div>
		</c:forEach>
		 </div>
</section> --%>




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

    <!-- alert창 디자인 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

    <script type="text/javascript">
    	var Msg = '${Msg}';
    	if(Msg.length > 0 ){
    		alert(Msg);
    	}
    </script> 
    
<script type="text/javascript">


$().ready(function () {
    // successMsg 메시지 출력
    var successMsg = "${successMsg}";
    if (successMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: successMsg,
        });
    }
    

    
    // errorMsg 메시지 출력
    var errorMsg = "${errorMsg}";
    if (errorMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'error',
            title: errorMsg,
        });
    }
    
    
    // errorMsg 메시지 출력
    var logoutMsg = "${logoutMsg}";
    if (logoutMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: logoutMsg,
        });
    }
    
    
    // blogWriteSMsg 메시지 출력
    var blogWriteSMsg = "${blogWriteSMsg}";
    if (blogWriteSMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: blogWriteSMsg,
        });
    }
    
    // blogWriteFMsg 메시지 출력
    var blogWriteFMsg = "${blogWriteFMsg}";
    if (blogWriteFMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'error',
            title: blogWriteFMsg,
        });
    }
    
    
    // joinSMsg 메시지 출력
    var joinSMsg = "${joinSMsg}";
    if (joinSMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'success',
            title: joinSMsg,
        });
    }
    
    // joinFMsg 메시지 출력
    var joinFMsg = "${joinFMsg}";
    if (joinFMsg) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'top-center',
            showConfirmButton: false,
            timer: 2000,
            timerProgressBar: true,
        });

        Toast.fire({
            icon: 'error',
            title: joinFMsg,
        });
    }
    
    
});

</script>
</html>