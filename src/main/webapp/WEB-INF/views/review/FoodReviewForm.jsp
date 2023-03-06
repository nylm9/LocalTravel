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
<title>먹거리리뷰작성페이지</title>

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
  	  	.like-content {
    display: inline-block;
    width: 100%;
    font-size: 18px;
    border-top: 10px dashed #eee;
    text-align: center;
}
.like-content span {
  color: #9d9da4;
  font-family: monospace;
}
.like-content .btn-secondary {
    display: block;
   
    text-align: center;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-second {
    display: block;
    
    text-align: center;
    background: #0100FF;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-secondary:hover {
    transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
    margin-right: 5px;
}
.animate-like {
/*   animation-name: likeAnimation;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
  animation-duration: 0.65s; */
  background:#7286D3
}
.animate-hate {
/*   animation-name: likeAnimation;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
  animation-duration: 0.65s; */
  background:#FD8A8A
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}
	</style>
	
</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
<main id="main" class="main mt-2 mx-0">
		<!-- End Page Title -->
		<section class="section">
		<div class="card mx-auto " style="width: 700px; margin-top:40px;" >
		<form onsubmit="return FoodreviewForm(this)" >
		
            
            <div class="card-body pb-1" style="background:#eee">
			 <input type="hidden" name="rvfdcode" value="${param.fcode }">
			 <h2 style="background:#eee;" >${showname}</h2>
             	<div class="row p-3"  style="text-align: center;">
             	
             		<!-- 좋아요 -->
             		<div class="like-content col d-flex align-items-center row p-3"  style="text-align: center;">
             			<label class="btn-lg mx-auto p-3 btn-secondary like-review"
             				   onclick="selecteRecommend('1')" id="recommendGood" tabindex="-1">
             				<i class="fa fa-heart" aria-hidden="true"></i> 좋아요
             				<input class="d-none"  type="radio" value='1' name="rvrecommend">
             			</label>
             		</div>
             		
             		<!-- 별로에요 -->
             		<div class="like-content col d-flex align-items-center">
             			<label class="btn-lg mx-auto p-3 btn-second like-hate"
             			       onclick="selecteRecommend('0')" id="recommendBad" tabindex="-1">
             				<i class="fa fa-heart" aria-hidden="true"></i> 싫어요
             				<input class="d-none" type="radio" value='0' name="rvrecommend">
             			</label>
             		</div>
             		
             		<!-- 관람평작성 -->
	             	<div class="col-12 mt-2">
	             		<div >
	             			<textarea style="background:#FFFFFF" class="form-control" rows="5" name="rvcomment"></textarea>
	             		</div>
	             	</div>
	             	
	             	
	             	</div>
            </div>
            
            <!-- 등록버튼 -->
            <div class="card-footer px-4 " style="text-align: center;">
              <button type="submit" class="btn btn-primary " >관람평 등록</button>
               <a class="btn btn-secondary"
							   href="${pageContext.request.contextPath }/foodPage">창닫기</a>
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
	/* $(function(){
	  $(document).one('click', '.like-review', function(e) {
	    $(this).html('<i class="fa " aria-hidden="true"></i>You liked this ☺️');
	    $(this).children('.fa-heart').addClass('animate-like');
	  });
	}); */
$(function() {
	  var liked = false;

	  $(document).on('click', '.like-review', function(e) {
	    if (!liked) {
	      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this ☺️');
	      $(this).children('.fa-heart').addClass('animate-like');
	      liked = true;
	    } else {
	      $(this).html('<i class="fa fa-heart" aria-hidden="true"></i> 좋아요');
	      $(this).children('.fa-heart').removeClass('animate-like');
	      liked = false;
	    }
	  });
	});

/* 	$(function(){
	  $(document).one('click', '.like-hate', function(e) {
	    $(this).html('<i class="" aria-hidden="true"></i> You hate this 😒');
	    $(this).children('.fa-heart').addClass('animate-hate');
	  });
	}); */
$(function(){
  $(document).on('click', '.like-hate', function(e) {
      if ($(this).hasClass('hate-selected')) { // 선택된 상태인 경우
          $(this).html('<i class="" aria-hidden="true"></i> 싫어요');
          $(this).removeClass('hate-selected');
          $(this).children('.fa-heart').removeClass('animate-hate');
      } else { // 선택되지 않은 상태인 경우
          $(this).html('<i class="" aria-hidden="true"></i> You hate this 😒');
          $(this).addClass('hate-selected');
          $(this).children('.fa-heart').addClass('animate-hate');
      }
  });
});
/* 	function selecteRecommend(checkVal){
 		if(checkVal== '1'){
		$("#recommendGood").removeClass('btn-outline-primary').addClass('btn-primary');
		$("#recommendBad").removeClass('btn-danger').addClass('btn-outline-danger');
		}else{
		$("#recommendGood").removeClass('btn-primary').addClass('btn-outline-primary');
		$("#recommendBad").removeClass('btn-outline-danger').addClass('btn-danger');
		} 
	} */
	function FoodreviewForm(formObj){
		var rvfdcode = formObj.rvfdcode.value;
		var rvrecommend =formObj.rvrecommend.value;
		var rvcomment = formObj.rvcomment.value;
		/* var rvfdthcode = formObj.rvfdthcode.value; */
		if(rvrecommend.length == 0){
			alert('관람평 추천을 선택해주세요');
			return false;
		}
		console.log(rvfdcode);
		console.log(rvrecommend);
		console.log(rvcomment);
		/* console.log(rvfdthcode); */
		$.ajax({
			url:"${pageContext.request.contextPath }/fdreviewWrite",
			type:"post",
			data:{"rvfdcode":rvfdcode, "rvrecommend":rvrecommend, "rvcomment":rvcomment/* , "rvfdthcode":rvfdthcode */ },
			async:false,
			success :function(result){
				if(result =="N_login"){
					alert("로그인후에 다시 작성해주세요");
					window.location.href = "${pageContext.request.contextPath }/memberLoginForm";
				}else if(result =='1'){
					alert("작성완료되었습니다");
					window.location.href = "${pageContext.request.contextPath }/foodPage";
				}else{
					alert("작성실패");
					window.location.href = "${pageContext.request.contextPath }/foodPage";
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