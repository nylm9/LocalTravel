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
	
 <title>내 블로그</title>
    <style>
      /* 작성하기 버튼 스타일링 */
      button {
        background-color: #008CBA;
        border: none;
        color: white;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-bottom: 10px;
        width:300px;
      }
      
      /* 작성하는 칸 스타일링 */
      textarea {
        width: 100%;
        height: 400px;
        padding: 12px 20px;
        box-sizing: border-box;
        border: 2px solid #ccc;
        border-radius: 4px;
        background-color: #f8f8f8;
        font-size: 16px;
        resize: none;
      }
    </style>
  </head>
<body>
<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	<section class="section">
			<div   >
				 <form onsubmit="return reviewForm(this)" action="${pageContext.request.contextPath }/BlogWrite"> 
					<input type="text" name="bcode" value="${param.ecode }">
					<!-- <h1>내 블로그</h1> -->
				    <br>
				    <textarea name="bcontent" placeholder="내용을 입력하세요"></textarea>
				   <%--  <a href="${pageContext.request.contextPath }/BlogWrite?bcode=${param.ecode}" type="submit">작성하기</a> --%>
				   <button type="submit" style="margin-left:40%;">작성하기</button>
				 </form>
				
			
			</div>
		</section>
		<script
   src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
    <script type="text/javascript">
     var Msg = '${Msg}';
     if (Msg.trim().length > 0) { // 빈 문자열이 아닐 때만 alert 창 띄우기
       alert(Msg);
     }
	
   </script>
	
	<script type="text/javascript">
	function reviewForm(formObj) {
	    var bcode = formObj.bcode.value;
	    var bcontent = formObj.bcontent.value;
	    console.log(bcode);
	    console.log(bcontent);
	    if (result == "success") {
            alert('작성완료');
           /* location.replace("home.jsp");
            window.close(); */ 
            console.log('성공');
        } else {
            alert('작성실패');
        }
  /*   error: function () {
        alert('error-작성 실패');
    } */
    }
	
	   /*  $.ajax({
	        url: "${pageContext.request.contextPath }/BlogWrite",
	        type: "POST",
	        data: { "bcode": bcode, "bcontent": bcontent },
	        success: function (result) {
	            if (result == "success") {
	                alert('작성완료');
	               /*  location.replace("home.jsp");
	                window.close(); 
	                console.log('성공');
	            } else {
	                alert('작성실패');
	            }
	        },
	        error: function () {
	            alert('error-작성 실패');
	        }
	    }); */
	</script>


</body>
</html>