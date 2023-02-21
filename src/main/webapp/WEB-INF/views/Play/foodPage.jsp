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
<!-- <script type="text/javascript">

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
버튼 하나만 눌리게 하는 이벤트
<script type="text/javascript">
function change_btn(selectedBtn) {
  const buttons = document.querySelectorAll('.button');
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
	
		<div class="card" style=" margin-left:620px; margin-top:40px; margin:40px auto; ">
			<div class="card-body" >
				
									<div class="e">
						<label>지역 선택</label>
						 <select name="province" onchange="searchFood()">
						 	<option value="99">--선택하세요--</option>
							<option value="11">서울특별시</option>
							<option value="21">부산광역시</option>
							<option value="22">대구광역시</option>
							<option value="23">인천광역시</option>
							<option value="24">광주광역시</option>
							<option value="25">대전광역시</option>
							<option value="26">울산광역시</option>
							<option value="31">경기도</option>
							<option value="32">강원도</option>
							<option value="33">충청북도</option>
							<option value="34">충청남도</option>
							<option value="12">세종특별시</option>
							<option value="35">전라북도</option>
							<option value="36">전라남도</option>
							<option value="37">경상북도</option>
							<option value="38">경상남도</option>
							<option value="39">제주특별자치도</option>
						</select>

					</div>
			
			
				<div class="e" id="moving-text" style="margin-top:5px;">	
				<h5>먹거리</h5>		
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selFamily">
				#가족과</label>
 				<input class="d-none" type="radio" name="fRadio" value="fa001" id="selFamily" >
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selWestern">
 				#양식</label>
 				<input class="d-none" type="radio" name="fRadio" value="we002" id="selWestern">
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selChinese">
 				#중식</label>
 				<input class="d-none" type="radio" name="fRadio" value="ch003" id="selChinese">
 				
 				 <label class="button food" onclick="clickSection(this, 'food')" for="selJapanese">
 				#일식</label>
 				<input class="d-none" type="radio" name="fRadio" value="ja004" id="selJapanese">
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selKorean">
 				#한식</label>
 				<input class="d-none" type="radio" name="fRadio" value="ko005" id="selKorean">
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selSoutheast">
 				#아시안</label>
 				<input class="d-none" type="radio" name="fRadio" value="as006" id="selSoutheast">
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selCafe">
 				#카페</label>
 				<input class="d-none" type="radio" name="fRadio" value="ca007" id="selCafe">
 								
				</div>
				
			</div>
		</div>
	</div>
</section>
<!--  키워드 검색결과 패키지 -->


<!-- 패키지 출력 -->
	<section class="section">
	
			 <c:forEach items="${fdList}" var="food" varStatus="status">
			<div class="row mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:5px;" id="selBtnFoodListArea">
				
				<!-- <div class="col-3">
					<div class="card"  style=" margin-top:5px;">
						<div class="card-body"> -->
							 <%-- <h5 class="card-title py-2" style="text-align: center;" >No.${status.index + 1 }</h5>
							 <div style="height:200px;width:5px;">
							<a href="${pageContext.request.contextPath }/foodInfo?fcode=${food.fcode }">
							<img class="" style="height:200px;width:237px;" 
							     alt="" src="${pageContext.request.contextPath }/resources/FoodPicture/${food.fpicture }" >
							</a>
							</div>
							<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${food.fname }" >${food.fname }</h6>
							<p class="small mb-1">${food.f1ex } (형광펜 효과 추가)</p>
							<p class="small mb-1">${food.faddr }</p>
							
							
							<a class="btn-dark btn-sm btn"
							href="${pageContext.request.contextPath }/foodInfo?fcode=${food.fcode }">상세보기</a> --%>
						
						
						<!-- </div>
					</div>
				</div> -->
						  
							
			</div>
			</c:forEach>				
		</section>


</body>

<script type="text/javascript">

$(document).ready(function(){
	// 페이지가 로딩되었을 때
	$("input:radio[name=fRadio]").on("change",searchFood);
	
	
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/readyGetAllEnjoyList",
		dataType : "json",
		async:false,
		success: function(foodList) {
			console.log(foodList)
			var output = "";
			for(var i = 0; i < foodList.length; i++) {
				if(foodList.length == 0){
					console.log("검색결과 없음");
				} else {
					var food = foodList[i];
					var statusNum = i + 1;
					output += '<div class="col-3">';
					output += '<div class="card"  style=" margin-top:5px;">';
					output += '<div class="card-body">';
					output += '<h5 class="card-title py-2" style="text-align: center;" >No.' + statusNum  + '<h5>';
					output += '<div style="height:200px;width:5px;">';
					output += '<a href="${pageContext.request.contextPath }/playInfo?ecode='+foodList[i].fcode+'">';
					output += '<img alt="" src="${pageContext.request.contextPath }/resources/FoodPicture/'+foodList[i].fpicture+'" style="height:200px;width:237px;" > </a>';
					output += '</div>';
					output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+foodList[i].fname+'" >'+foodList[i].fname+' </h6>';
					 if (foodList[i].f1ex != null && foodList[i].f1ex != undefined) {
					      output += '<p class="small mb-1">'+foodList[i].f1ex+' </p>';
					      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
					    } else {
					      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
					    }
					output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/playInfo?ecode='+foodList[i].fcode+' ">상세보기</a>';
					output += '</div></div></div>'
				}
			}
			$("#selBtnFoodListArea").html(output);
			/* $("#selectMovie").focus();
			$("#selectMovie").click(); */
		}
	});	
	
	
});


function clickSection(clickBtn, cnm){
	// 버튼 클릭 스크립트
	$("."+cnm).removeClass('active');
	$(clickBtn).addClass('active');
	
}






function searchFood() {
	// 버튼의 값이 변경되었을 때(버튼이 눌렸을 때)
	var foodVal = $("input:radio[name=fRadio]:checked").val(); 
	if(foodVal == undefined){
		foodVal = '_____';
	}
	console.log("버튼값 : " + foodVal);
	
	var procode = $("select[name=province]").val();
	console.log("procode : " + procode);
	if(procode == 99) {
		alert("지역을 선택해주세요!");
		location.reload();
	}
	
	clickAjax(foodVal, procode)	
	
	
}


	function clickAjax(foodVal, procode) {
		console.log("clickAjax 호출");
		
		var loginId = '${sessionScope.loginId}';
	  	console.log("loginId : " + loginId);
			$.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/getFoodResult",
					data : { "fthcode" : foodVal , "procode" : procode},
					dataType : "json",
					async:false,
					success: function(foodList) {
						console.log(foodList)
						var output = "";
						for(var i = 0; i < foodList.length; i++) {
							if(foodList.length == 0){
								console.log("검색결과 없음");
							} else {
								var food = foodList[i];
								var statusNum = i + 1;
								
								output += '<div class="col-3">';
								output += '<div class="card"  style=" margin-top:5px;">';
								output += '<div class="card-body">';
								output += '<h5 class="card-title py-2" style="text-align: center;" >No.' + statusNum  + '<h5>';
								output += '<div style="height:200px;width:5px;">';
								output += '<a href="${pageContext.request.contextPath }/playInfo?ecode='+foodList[i].fcode+'">';
								
								output += '<img alt="" src="${pageContext.request.contextPath }/resources/FoodPicture/'+foodList[i].fpicture+'" style="height:200px;width:237px;" > </a>';
								output += '</div>';
								output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+foodList[i].fname+'" >'+foodList[i].fname+' </h6>';
								 if (foodList[i].f1ex != null && foodList[i].f1ex != undefined) {
								      output += '<p class="small mb-1">'+foodList[i].f1ex+' </p>';
								      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
								    } else {
								      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
								    }
								output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/playInfo?ecode='+foodList[i].fcode+' ">상세보기</a>';
								output += '</div></div></div>'
							}
						}
						$("#selBtnFoodListArea").html(output);
						/* $("#selectMovie").focus();
						$("#selectMovie").click();  */
					}
		});


		}
		



</script>

    <script type="text/javascript">
     var Msg = '${Msg}';
     if (Msg.trim().length > 0) { // 빈 문자열이 아닐 때만 alert 창 띄우기
       alert(Msg);
     }
   </script>


</html>
