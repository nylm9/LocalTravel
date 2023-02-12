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
<title>놀거리사이트</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
	
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
h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
  color: #1c1c1c;
  font-weight: 600;
   font-family: sans-serif; 
}
/* input[type="radio"] {
    display:none;
}
input[type="radio"] + label{
	border: 1px solid #1993A8;
            background-color: rgba(0,0,0,0);
            color: #1993A8;
            padding: 5px;
               border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
             border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
} */
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

<!-- 버튼 눌렷을때 색 바뀌는 이벤트 -->
<!-- <script type="text/javascript">

/* function change_btn(e) {
	e.classList.toggle("active"); */
	
	
  //var btns = document.querySelectorAll(".button");
  //btns.forEach(function (btn, i) {
/*     if (e.currentTarget == btn) {
      btn.classList.toggle("active");
    } else {
      btn.classList.remove("active");
    } */
  //});
  
 // console.log(e.currentTarget);


</script>
버튼 하나만 눌리게 하는 이벤트
<script type="text/javascript">
function change_btn(selectedBtn, group) {
	 const buttons = document.querySelectorAll(`.button[data-group="${group}"]`);
	  buttons.forEach(button => {
	    if (button === selectedBtn) {
	      button.classList.add('active');
	    } else {
	      button.classList.remove('active');
	    }
	  });
	}
}

<script type="text/javascript">
function change_btn(selectedBtn, group) {
	 const buttons = document.querySelectorAll(`.button[data-group="${group}"]`);
	  buttons.forEach(button => {
	    if (button === selectedBtn) {
	      button.classList.add('active');
	    } else {
	      button.classList.remove('active');
	    }
	  });
}
</script> -->

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
				<div class="e" >
				<h5>함께</h5>
<!-- 				<button  class="button"  onclick="change_btn(this, 'person')">가족과함께</button>
					<button  class="button"  onclick="change_btn(this, 'person')">혼자</button>
					<button  class="button"  onclick="change_btn(this, 'person')">데이트</button>
					<button  class="button"  onclick="change_btn(this, 'person')">우정</button> -->
					
					<label class="button" onclick="clickPerson(this)" for="">#가족과
 						 <input class="d-none" type="radio" value="family" id="selFamily" >
					</label>
					<label class="button" onclick="clickPerson(this)" for="">#혼자
						<input class="d-none" type="radio" value="alone"  id="alone">
					</label>
					<label class="button" onclick="clickPerson(this)" for="">#데이트
						<input class="d-none" type="radio" value="date"  id="date">
					</label>
					<label class="button" onclick="clickPerson(this)" for="">#우정
						<input class="d-none" type="radio" value="friend"  id="friend">
					</label>
					
				</div>
				
				<div class="e"  style="margin-top:5px;">	
				<h5>계절</h5>		
				<label class="button" onclick="clickPerson(this)" for="">#봄
					<input class="d-none" type="radio" value="spring"  id="selSpring">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#여름
					<input class="d-none" type="radio" value="summer"  id="selSummer">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#가을
					<input class="d-none" type="radio" value="fall"  id="selFall">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#겨울
					<input class="d-none" type="radio" value="winter"  id="selWinter">
				</label>
				</div>
				
				<div class="e"  style="margin-top:5px;">	
				<h5>공간</h5>
				<label class="button" onclick="clickPerson(this)" for="">#사진명소
					<input class="d-none" type="radio" value="takePicture"  id="selPicture">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#익스트림
					<input class="d-none" type="radio" value="extreme"  id="selExtreme">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#힐링
					<input class="d-none" type="radio" value="hilling"  id="selHilling">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#자연
					<input class="d-none" type="radio" value="natural"  id="selNatural">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#체험
					<input class="d-none" type="radio" value="experience"  id="selPicture">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#문화
					<input class="d-none" type="radio" value="culture"  id="selCulure">
				</label>
				<label class="button" onclick="clickPerson(this)" for="">#상점
					<input class="d-none" type="radio" value="shop"  id="selShop">
				</label>
				</div>
				
				</div>
			</div>
	</div>
</section>
<!--  키워드 검색결과 패키지 -->
<!-- <section class="section">
			<div class="row" style="min-width: 565px;" >
			
			
				<div class="col-lg-3 col-md-4 col-sm-6" >
					<div class="card" style="margin-top:40px; margin-left:30px;">
						<div class="card-body">
						<h4>패키지</h4>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6" >
					<div class="card" style="margin-top:40px; ">
						<div class="card-body">
						<h4>패키지</h4>
						</div>
					</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6" >
					<div class="card" style="margin-top:40px; ">
						<div class="card-body">
						<h4>패키지</h4>
						</div>
					</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6" >
					<div class="card" style="margin-top:40px;margin-right:30px;">
						<div class="card-body">
						<h4>패키지</h4>
						</div>
					</div>
			</div>
			
	</div>
</section>
 -->

<!-- 패키지 출력 -->
	<section class="section">
			<div class="row mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:30px;" >
				
				
			<c:forEach items="${enList}" var="enjoy" varStatus="status">
				<div class="col-3">
					<div class="card">
						<div class="card-body">
							 <h5 class="card-title py-2" style="text-align: center;" >No.${status.index + 1 }</h5>
							 <div style="height:200px;width:5px;">
							<a href="${pageContext.request.contextPath }/playInfo?mvcode=${enjoy.ecode }">
							<img class="img-fluid" 
							     alt="" src="${enjoy.epicture }" >
							</a>
							</div>
							
							<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${enjoy.ename }" >${enjoy.ename }</h6>
							
							<p class="small mb-1">${enjoy.eaddr }</p>
							
							<a class="btn-dark btn-sm btn"
							href="${pageContext.request.contextPath }/playInfo?ecode=${enjoy.ecode }">상세보기</a>
							
						
						</div>
					</div>
				</div>
			</c:forEach>				
						 <!--  <script type="text/javascript">
						 	function ticketPage(selMvcode){
						 		location.href= "${pageContext.request.contextPath }/ticketPage?selectmovie="+selMvcode;
						 	}
						 
						 </script> -->
							
			</div>
		</section>


</body>

<script type="text/javascript">

	

function clickPerson(selBtn) {
  // 기존에 선택된 버튼의 색을 원래대로 되돌림
  const selectedButton = document.querySelector('.active');
  if (selectedButton) {
    selectedButton.classList.remove('active');
  } 

  // 선택한 버튼의 색을 변경
  selBtn.classList.add('active');
  clickAjax(selBtn);
} 

function clickAjax(selBtn) {
	
  // selectedLabel.querySelector('input') 로 input 태그를 찾을 수 있음.
  const input = selBtn.querySelector('input');
  const selectEnjoyTag = input.value;
  if (input) {
    console.log(input.value); // "family"
  } else {
    console.error('input 태그를 찾을 수 없습니다.');
  }
  
		$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/getEnjoyResult",
				data : { "selEnjoyTag" : selectEnjoyTag },
				dataType : "json",
				async:false,
				success: function(enjoyList) {
					console.log(enjoyList)
					var output = "";
					for(var enjoyInfo of enjoyList){
						if(enjoyInfo.length == 0){
							console.log("검색결과 없음");
						} else {
							console.log("검색결과 있음")
							//output += "<span style=\"cursor: pointer;\" onclick=\"select(this);\">"+"\""+foodinfo.fcode+"\""+""+"\""+foodinfo.fname+"\""+""+"\""+foodinfo.faddr+"\""+"</span> <br/><hr>";
						}
					}
	 				$("#foodListArea").html(output);
					/* $("#selectMovie").focus();
					$("#selectMovie").click();  */
			}
	});


	}
  


</script>




</html>
