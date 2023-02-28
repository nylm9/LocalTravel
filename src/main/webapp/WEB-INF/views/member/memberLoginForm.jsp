<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
    
    <meta charset="UTF-8">
    <title>프로젝트 - 로그인페이지</title>
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
    
   
  <!-- 로그인메세지 -->
   <script type="text/javascript">
  		var reMsg = '${redirectMsg}';
  		if(reMsg.length > 0){
  			alert(reMsg);
  		}
  </script>

</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

<!-- 로그인창 -->
<!-- 로그인창 -->
<section class="section"  style="margin-top:40px;">
			<div class="row justify-content-center">
				<div class="col d-flex flex-column align-items-center justify-content-center" style="max-width:1000px;" >

					<div class="card mb-3">
						<div class="card-body">
							<div class="pt-4 pb-2">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">로그인</p>
								<p class="text-center small">아이디, 비밀번호를 입력해주세요.</p>
							</div>

							<form class="row g-3" action="${pageContext.request.contextPath }/memberLogin" 
							                      method="post" onsubmit="return joinFormCheck(this)" >

								<div class="col-md-12">
									<label for="inputMid" class="form-label">아이디</label>
									<input type="text" name="mid" class="form-control" id="inputMid">
								</div>
								<div class="col-md-12">
									<label for="inputMpw" class="form-label">비밀번호</label>
									<input type="password" name="mpw" class="form-control" id="inputMpw">
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary" style="margin-top:10px; margin-left:10px;">로그인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>





<!-- THEME JAVASCRIPT FILES
================================================== -->
<%-- <!-- initialize jQuery Library -->
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
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script> --%>


 <!-- alert창 디자인 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

<%-- <c:if test="${not empty Msg}">
    <script>
        alert('${Msg}');
    </script>
</c:if> --%>



    <script type="text/javascript">
    	
    	function joinFormCheck(joinForm){
			var formMid = joinForm.mid;
			if(formMid.value == 0){
				alert('아이디를 입력 해주세요!');
				formMid.focus();
				return false;
			}
			var formMpw = joinForm.mpw;
			if(formMpw.value == 0){
				alert('비밀번호를 입력 해주세요!');
				formMpw.focus();
				return false;
			}
			
		}
    	
    	
    </script>
    
    <script type="text/javascript">

$().ready(function () {
    // successMsg 메시지 출력
    var successMsg = "${successMsg}";
    if (successMsg) {
        Swal.fire({
            icon: 'success',
            title: successMsg,
            showConfirmButton: false,
            timer: 2000
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
    
});

</script>
</html>