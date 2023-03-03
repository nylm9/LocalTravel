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
<title>리뷰사이트</title>

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
	

</head>
<body>
<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	<section class="section">
			<div   >
				<form  action="${pageContext.request.contextPath }/BlogWrite">
					<input type="text" name="bcode" value="${param.ecode }">
					<div class="col-12 mt-2" >
	             		<div >
	             			<textarea class="form-control" rows="5" name="bcontent"></textarea>
	             				<button type="submit" class="btn btn-primary " >관람평 등록</button>
	             		</div>
	             	</div>
				</form>
			
			</div>
		</section>
		<script
   src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
	<script type="text/javascript">
	var Msg = '${Msg}';
	if(Msg.length > 0 ){
		alert(Msg);
	}
	/* 
	function reviewForm(formObj){
		var bcode = formObj.bcode.value;
		var bcontent =formObj.bcontent.value;
		
		
		console.log(bcode);
		console.log(bcontent);
		
		$.ajax({
			url:"${pageContext.request.contextPath }/BlogWrite",
			type:"post",
			data:{"bcode":bcode, "bcontent":bcontent},
			async:false,
			success :function(result){
				if(bcontent == null){
					alert("작성실패");
				}else{
					alert("작성완료");
				}
				
			}
		})
//		window.opener.location.reload();
		window.close();
		return false;
	} */
	</script>

</body>
</html>