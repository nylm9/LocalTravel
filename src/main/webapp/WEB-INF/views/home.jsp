<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko-KR">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>TRAIN-열차예매사이트</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath }/resources/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <style>
#header1 {
 
  background-color: white;

  margin-right: 20px;
}

#header2 {
 
  background-color:#EDC7E8;
  opacity: 0.4;
  padding-bottom:1em;
  text-align:center;
}
.margin {
    margin: 20px 10px 30px 40px; /* top right bottom left */
}
li {
list-style-type:none;
margin-left: 10px;
float: right;
}

ul lu {list-style-type: none;
}
a{
 text-decoration: none;
	
}
header {
  text-align: left;
  position: absolute;
  top: 0;
  left: 0;
}
.train-emoji {
}
img{
text-align: left;
width: 40px;
  height: 40px;
  top: -20px;
}
.title-image  {
    position: relative;
    top: -20px;
    display: flex;
    margin : 25px;
}
/* #header1:hover + #header2 {
	display: block;
	position: fixed;
} */









     
    </style>
    </head>
    <body>
    	
    	<!-- <header>
		  
		</header>-->
    	
		
    	
     <div id="header1" onmouseover="testFunc()"   onmouseout="testFunc2()">
     	 	
		  		<img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image">
		  		<ul>
<<<<<<< HEAD
     	 			<li><a id="title2" style="color:black; text-align: left;" href="${pageContext.request.contextPath }/">로그인</a></li>
     	 			<li><a id="title2" style="color:black; text-align: left;" href="${pageContext.request.contextPath }/memberJoinForm" >회원가입</a></li>
=======
     	 			<li><a id="title2" style="color:black; text-align: left;" href="${pageContext.request.contextPath }/memberLoginForm">로그인</a></li>
     	 			<li><a id="title2" style="color:black; text-align: left;">회원가입</a></li>
>>>>>>> yeonwoo
     	 		</ul>
     		
     
<!--      	 <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
     	 	
     	 </form> -->
		<div id="header2">
		<ul>
	     			<li> <a style="color:black;">기차예매</a> </li>
	     	 		<li> <a style="color:black;">기능2</a> </li>
	     	 		
	    </ul>
	    </div>
     </div>
     	
        
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
               
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">메인페이지</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">메인페이지에 뭐넣을까요</li>
                        </ol>
                       
                       
                   
                    </div>
                </main>
         
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${pageContext.request.contextPath }/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
    </body>
    
    <script type="text/javascript">
    function testFunc(){
    	console.log('!!!!')
    	document.getElementById('header2').style.display = '';
    	
    }	
    function testFunc2(){
    	document.getElementById('header2').style.display = 'none';
    }
    
    
    </script> 
    
    
</html>
