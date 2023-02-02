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
<title>놀거리리뷰사이트</title>

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
	
	<style type="text/css">
	
	.listTitle{
  		overflow: hidden;
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 100%;
  		display: inline-block;
  	}
	</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
<main id="main" class="main mt-2 mx-0">
	<!-- 	<div class="pagetitle">
			<h1>projectReviewForm.jsp</h1>
		</div> -->
		<!-- End Page Title -->
		<section class="section">
		<div class="card mx-auto " style="width: 700px; margin-top:40px;" >
		<form onsubmit="return reviewForm(this)" >
		
			 <input type="text" name="rvencode" value="${param.ecode }"><!--  value="${param.reencode }" 놀거리 코드 집어넣어야함 -->
			 
           <div class="card-header">
            	<h2 class="card-title mb-0 py-1" style="text-align: center;font-size: 30px;font-weight: bold;">${param.ename }</h2>
            </div> 
            
            <div class="card-body pb-1">
             	<div class="row p-3"  style="text-align: center;">
             	
             	<!-- 좋아요 -->
             		<div class="col d-flex align-items-center">
             			<label class="form-label btn-outline-primary btn-lg mx-auto p-3"
             				   onclick="selecteRecommend('1')" id="recommendGood" tabindex="-1">
             				<i class="bi bi-hand-thumbs-up "></i> 좋았어요~!
             				<input class="d-none"  type="radio" value='1' name="rvrecommend">
             			</label>
             		</div>
             		
             		<!-- 중앙아이디 -->
             		<div class="col">
<%--              		<img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" 
	                style="width: 36px; object-fit: cover; object-position: center; " alt="Profile" class="rounded-circle"> --%>
             			<p class="mb-0" style="margin-top:13px;">${sessionScope.loginId }</p>
             		</div>
             		
             		<!-- 별로에요 -->
             		<div class="col d-flex align-items-center">
             			<label class="form-label btn-outline-danger btn-lg  mx-auto p-3"
             			       onclick="selecteRecommend('0')" id="recommendBad" tabindex="-1">
             				<i class="bi bi-hand-thumbs-down"></i> 별로에요...
             				<input class="d-none" type="radio" value='0' name="rvrecommend">
             			</label>
             		</div>
             		
             		<!-- 관람평작성 -->
	             	<div class="col-12 mt-2">
	             		<div>
	             			<textarea class="form-control" rows="5" name="rvcomment"></textarea>
	             		</div>
	             	</div>
	             	
	             	</div>
            </div>
            
            <!-- 등록버튼 -->
            <div class="card-footer px-4 " style="text-align: center;">
              <button type="submit" class="btn btn-primary " >관람평 등록</button>
              <button type="button" class="btn btn-secondary " onclick="window.close()">창닫기</button>
               <a class="btn btn-secondary"
							   href="${pageContext.request.contextPath }/enjoyPage">창닫기</a>
            </div>
            
            </form>
          </div>
		
		</section>
	</main>
	<!-- End #main -->



	<!-- Vendor JS Files -->
<%-- 	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>

<%-- 	<script src="${pageContext.request.contextPath }/resources/assets/vendor/tinymce/tinymce.min.js"></script><!--  -->
 --%>
	<!-- Template Main JS File -->
		<script
		src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		
	<script type="text/javascript">
	function writeReview(reencode,ename){
		window.open('${pageContext.request.contextPath }/reviewForm?reencode='+reencode+"&ename="+ename,'reviewFormPage',"width=750,heigh=400, top=100, left=500");
	}
	function selecteRecommend(checkVal){
 		if(checkVal== '1'){
		$("#recommendGood").removeClass('btn-outline-primary').addClass('btn-primary');
		$("#recommendBad").removeClass('btn-danger').addClass('btn-outline-danger');
		}else{
		$("#recommendGood").removeClass('btn-primary').addClass('btn-outline-primary');
		$("#recommendBad").removeClass('btn-outline-danger').addClass('btn-danger');
		} 
	}
	function reviewForm(formObj){
		var rvencode = formObj.rvencode.value;
		var rvrecommend =formObj.rvrecommend.value;
		var rvcomment = formObj.rvcomment.value;
		if(rvrecommend.length == 0){
			alert('관람평 추천을 선택해주세요');
			return false;
		}
		console.log(rvencode);
		console.log(rvrecommend);
		console.log(rvcomment);
		$.ajax({
			url:"${pageContext.request.contextPath }/reviewWrite",
			type:"post",
			data:{"rvencode":rvencode, "rvrecommend":rvrecommend, "rvcomment":rvcomment },
			async:false,
			success :function(result){
				if(result =="N_login"){
					alert("로그인후에 다시 작성해주세요");
					window.opener.location.reload();
				}else if(result =='1'){
					alert("작성완료되었습니다");
					window.opener.location.reload();
				}else{
					alert("작성실패");
				}
			}
		})
//		window.opener.location.reload();
		window.close();
		return false;
	}
	</script> 
</body>
</html>