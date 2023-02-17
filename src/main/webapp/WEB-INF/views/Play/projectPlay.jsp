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
	
			<div class="card" style=" margin-left:620px; margin-top:40px; margin:40px auto;">
				<div class="card-body" >

					<div class="e">
						<label>지역 선택</label>
						 <select name="province" onchange="searchEnjoy()">
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

					<div class="e" >
				<h5>함께</h5>
<!-- 				<button  class="button"  onclick="change_btn(this, 'person')">가족과함께</button>
					<button  class="button"  onclick="change_btn(this, 'person')">혼자</button>
					<button  class="button"  onclick="change_btn(this, 'person')">데이트</button>
					<button  class="button"  onclick="change_btn(this, 'person')">우정</button> -->
					<label class="button together" onclick="clickSection(this, 'together')" for="selFamily">
					#가족과</label>
 					<input class="d-none" type="radio" name="toRadio" value="01" id="selFamily" >
 					
					<label class="button together" onclick="clickSection(this, 'together')" for="alone">
					#혼자</label>
					<input class="d-none" type="radio" name="toRadio" value="02"  id="alone">
					
					<label class="button together" onclick="clickSection(this, 'together')" for="date">
					#데이트</label>
						<input class="d-none" type="radio" name="toRadio" value="03"  id="date">
						
					<label class="button together" onclick="clickSection(this, 'together')" for="friend">
					#우정</label>
						<input class="d-none" type="radio" name="toRadio" value="04"  id="friend">
				</div>
				
				<div class="e"  style="margin-top:5px;">	
				<h5>계절</h5>		
				<label class="button season" onclick="clickSection(this, 'season')" for="selSpring">
				#봄</label>
					<input class="d-none" type="radio" name="seasonRadio" value="a"  id="selSpring">
				
				<label class="button season" onclick="clickSection(this, 'season')" for="selSummer">
				#여름</label>
					<input class="d-none" type="radio" name="seasonRadio" value="b"  id="selSummer">
				
				<label class="button season" onclick="clickSection(this, 'season')" for="selFall">
				#가을</label>
					<input class="d-none" type="radio" name="seasonRadio" value="c"  id="selFall">
					
				<label class="button season" onclick="clickSection(this, 'season')" for="selWinter">
				#겨울</label>
					<input class="d-none" type="radio" name="seasonRadio" value="d"  id="selWinter">
				</div>
				
				<div class="e"  style="margin-top:5px;">	
				<h5>공간</h5>
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selPicture">
				#사진명소</label>
					<input class="d-none" type="radio" name="subRadio" value="50"  id="selPicture">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selExtreme">
				#익스트림</label>
					<input class="d-none" type="radio" name="subRadio" value="51"  id="selExtreme">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selHilling">
				#힐링</label>
					<input class="d-none" type="radio" name="subRadio" value="52"  id="selHilling">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selNatural">
				#자연</label>
					<input class="d-none" type="radio" name="subRadio" value="53"  id="selNatural">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selPicture">
				#체험</label>
					<input class="d-none" type="radio" name="subRadio" value="54"  id="selPicture">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selCulure">
				#문화</label>
					<input class="d-none" type="radio" name="subRadio" value="55"  id="selCulure">
					
				<label class="button subject" onclick="clickSection(this, 'subject')" for="selShop">
				#상점</label>
					<input class="d-none" type="radio" name="subRadio" value="56"  id="selShop">
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
	
				
			
			<c:forEach items="${enList}" var="enjoy" varStatus="status">
			<div class="row mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:30px;" id="selBtnEnjoyListArea">
            <!-- <div class="col-3" >
               <div class="card"style="margin-bottom:13px; width: auto; height:auto;" >
                  <div class="card-body"  > --> 
                  
                       <%-- <h5 class="card-title py-2" style="text-align: center;" >No.${status.index + 1 }</h5>
                      <div style="height:200px;width:5px;">
                     <a href="${pageContext.request.contextPath }/playInfo?ecode=${enjoy.ecode }">
					 <img  alt="" src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoy.epicture }" 
                          style="height:200px;width:237px;">                          
                     </a>
                     </div>
                     
                     <h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="${enjoy.ename }" >${enjoy.ename }</h6>
                     
                     <p class="small mb-1">${enjoy.eaddr }</p>
                     <c:choose>
                        <c:when test="${sessionScope.loginId == 'admin' }">
                           <a class="btn-dark btn-sm btn"
                    		 href="${pageContext.request.contextPath }/BlogWritePage?ecode=${enjoy.ecode }">블로그쓰기</a>
							<a class="btn-dark btn-sm btn"
                   			  href="${pageContext.request.contextPath }/playInfo?ecode=${enjoy.ecode }">상세보기</a>
                        </c:when>
                        <c:otherwise>
                     <a class="btn-dark btn-sm btn"
                     href="${pageContext.request.contextPath }/playInfo?ecode=${enjoy.ecode }">상세보기</a>
                        </c:otherwise>

                     </c:choose> --%> 
                  
                  </div>
               <!-- </div>
            </div>
			</div> -->
            
         </c:forEach>				
						 <!--  <script type="text/javascript">
						 	function ticketPage(selMvcode){
						 		location.href= "${pageContext.request.contextPath }/ticketPage?selectmovie="+selMvcode;
						 	}
						 
						 </script> -->
							
		</section>


</body>

<script type="text/javascript">

	/* 
	h5의 내용을 기준으로 버튼이 하나씩만 눌리게 만들고 싶음.
	버튼은 총 1~3개 클릭되고, 버튼이 눌릴때마다 ajax로 select 하고싶음. (테마코드ethcode로 select) 
	사용자가 버튼을 몇 개 누를지 모르기때문에 ajax로 data를 어떤형태로 전송해야할지 잘 모르겠음.
	만약 1,2,3 모두 누르면 해당하는 테마코드가 완성되어 select 되게 만들고싶음.(각 주제마다 주어진 자릿수가 있음) 
	*/
	
	$(document).ready(function(){
		$("input:radio[name=toRadio]").on("change",searchEnjoy);
		$("input:radio[name=seasonRadio]").on("change",searchEnjoy);
		$("input:radio[name=subRadio]").on("change",searchEnjoy);
		
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/readyGetEnjoyList",
			dataType : "json",
			async:false,
			success:function(enList){
				var output = "";
				var loginId = '${sessionScope.loginId}';
				for (var i = 0; i < enList.length; i++){
					if(enList.length == 0){
						console.log("검색결과 없음");
					} else {
						/* var statusNum = '${status.index + 1 }'; */
						var enjoy = enList[i];
						var statusNum = i + 1;
						output += '<div class="col-3" >';
						output += '<div class="card"style="margin-bottom:13px; width: auto; height:auto;" >';
						output += '<div class="card-body" >';
						output += '<h5 class="card-title py-2" style="text-align: center;" >No.' + statusNum  + '<h5>';
						output += '<div style="height:200px;width:5px;">';
						output += '<a href="${pageContext.request.contextPath }/playInfo?ecode='+enList[i].ecode+'">';
						output += '<img alt="" src="${pageContext.request.contextPath }/resources/EnjoyPicture/'+enList[i].epicture+'" style="height:200px;width:237px;" > </a>';
						output += '</div>';
						output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+enList[i].ename+'" >'+enList[i].ename+' </h6>';
						output += '<p class="small mb-1">'+enList[i].eaddr+' </p>';
						
						if( loginId == 'admin' ) {
						output += '<a class="btn-dark btn-sm btn" style="margin-bottom:5px;"';
						output += 'href="${pageContext.request.contextPath }/BlogWritePage?ecode='+enList[i].ecode+'">블로그쓰기</a>'
						output += '<a class="btn-dark btn-sm btn"';
						output += 'href="${pageContext.request.contextPath }/playInfo?ecode='+enList[i].ecode+' ">상세보기</a>';
						} else {
						output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/playInfo?ecode='+enList[i].ecode+' ">상세보기</a>';
						}
						output += '</div></div></div>'
					}
				}
				$("#selBtnEnjoyListArea").html(output);
				/* $("#selectMovie").focus();
				$("#selectMovie").click(); */
			}
		});	
		
		
		
	})
	
	
	
	function searchEnjoy(){
		console.log("searchEnjoy");
		
		var togetherVal = $("input:radio[name=toRadio]:checked").val(); // undefined
		if(togetherVal == undefined){
			togetherVal = '__';
		}
		console.log("함께 : "+ togetherVal );
		
		var seasonVal = $("input:radio[name=seasonRadio]:checked").val();
		if(seasonVal == undefined){
			seasonVal = '_';
		}
		console.log("계절 : " + seasonVal);
		
		var subjectVal = $("input:radio[name=subRadio]:checked").val();
		if(subjectVal == undefined) {
			subjectVal = "__";
		}
		console.log("공간 : " + subjectVal);
		
		var procode = $("select[name=province]").val();
		console.log("procode : " + procode);
		if(procode == 99) {
			alert("지역을 선택해주세요!");
			location.reload();
		}
		
		var thcode = seasonVal + togetherVal + subjectVal;
		clickAjax(thcode, procode)
		
		
	}
	
	
	function clickSection(clickBtn, cnm){
		// 버튼 클릭 스크립트
		$("."+cnm).removeClass('active');
		$(clickBtn).addClass('active');
		
	}
	
	
/* 
function clickPerson1(selBtn1, cnm) {
  // 기존에 선택된 버튼의 색을 원래대로 되돌림
  console.log(cnm)
  
  const selectedButton = document.querySelector('.'+cnm);
  if (selectedButton) {
    selectedButton.classList.remove('active');
  } 

  // 선택한 버튼의 색을 변경(누름효과)
  selBtn1.classList.add('active');
  clickAjax(selBtn1);

} 

function clickPerson2(selBtn2) {
	  // 기존에 선택된 버튼의 색을 원래대로 되돌림
	  const selectedButton = document.querySelector('.active');
	  if (selectedButton) {
	    selectedButton.classList.remove('active');
	  }  

	  // 선택한 버튼의 색을 변경(누름효과)
	  selBtn2.classList.add('active');
	  clickAjax(selBtn2);

	} 

function clickPerson3(selBtn3) {
	  // 기존에 선택된 버튼의 색을 원래대로 되돌림
	  const selectedButton = document.querySelector('.active');
	  if (selectedButton) {
	    selectedButton.classList.remove('active');
	  } 

	  // 선택한 버튼의 색을 변경(누름효과)
	  selBtn3.classList.add('active');
	  clickAjax(selBtn3);

	}  */

function clickAjax(thcode, procode) {
	
	
  // selectedLabel.querySelector('input') 로 input 태그를 찾을 수 있음.
  /* const input = selBtn.querySelector('input');
	var selToBtn = $('input:radio[name=toRadio]:checked').val();
	var selSeasonBtn = $('input:radio[name=seasonRadio]:checked').val();
	var selSubBtn = $('input:radio[name=subRadio]:checked').val();
	var listVar = $('input[name=toRadio]:checked').val();
  	var thcode = ""; */
  	
  //const selectEnjoyTag = input.value;
  
 /*  if (input) {
	  selToBtn = selToBtn || 0;
	  selSeasonBtn = selSeasonBtn || 0;
	  selSubBtn = selSubBtn || 0;

    //console.log("input.value : "+input.value); // "family"
    console.log("selToBtn : " + selToBtn);
    console.log("selSeasonBtn : " + selSeasonBtn);
    console.log("selSubBtn : " + selSubBtn);
    thcode = selSeasonBtn + selToBtn + selSubBtn;
    console.log("thcode : "+thcode);
    
  } else {
    console.error('input 태그를 찾을 수 없습니다.');
  } */
  
  // 함께 >> 01 02 03 04 , __
  
  // 계절 >> a,b,c,d , _
  
  // 공간 >> 50 51 52 , __
  
  //'e0050'
  
  // input태그중에 name이 ""인것중에 check된 radio의 value를 가져오기!
/*   const selToBtn = document.querySelector('input[name="toRadio"]:checked').value;
  const selSeasonBtn = document.querySelector('input[name="seasonRadio"]:checked').value;
  const selSubBtn = document.querySelector('input[name="subRadio"]:checked').value;
  const selThcode = selToBtn + selSeasonBtn + selSubBtn; */
  // 문자열 결합하여 한줄의 thcode를 만든다음 ajax로 전송 
  
  // console.log(selThcode);
  
  	var loginId = '${sessionScope.loginId}';
  	console.log("loginId : " + loginId);
		$.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/getEnjoyResult",
				data : { "thcode" : thcode , "procode" : procode},
				dataType : "json",
				async:false,
				success: function(enjoyList) {
					console.log(enjoyList)
					var output = "";
					for(var i = 0; i < enjoyList.length; i++) {
						if(enjoyList.length == 0){
							console.log("검색결과 없음");
						} else {
							var enjoy = enjoyList[i];
							var statusNum = i + 1;
							output += '<div class="col-3" >';
							output += '<div class="card"style="margin-bottom:13px; width: auto; height:auto;" >';
							output += '<div class="card-body" >';
							output += '<h5 class="card-title py-2" style="text-align: center;" >No.' + statusNum  + '<h5>';
							output += '<div style="height:200px;width:5px;">';
							output += '<a href="${pageContext.request.contextPath }/playInfo?ecode='+enjoyList[i].ecode+'">';
							output += '<img alt="" src="${pageContext.request.contextPath }/resources/EnjoyPicture/'+enjoyList[i].epicture+'" style="height:200px;width:237px;" > </a>';
							output += '</div>';
							output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+enjoyList[i].ename+'" >'+enjoyList[i].ename+' </h6>';
							output += '<p class="small mb-1">'+enjoyList[i].eaddr+' </p>';
							
							if( loginId == 'admin' ) {
							output += '<a class="btn-dark btn-sm btn" style="margin-bottom:5px;"';
							output += 'href="${pageContext.request.contextPath }/BlogWritePage?ecode='+enjoyList[i].ecode+'">블로그쓰기</a>'
							output += '<a class="btn-dark btn-sm btn"';
							output += 'href="${pageContext.request.contextPath }/playInfo?ecode='+enjoyList[i].ecode+' ">상세보기</a>';
							} else {
							output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/playInfo?ecode='+enjoyList[i].ecode+' ">상세보기</a>';
							}
							output += '</div></div></div>'
						}
					}
					$("#selBtnEnjoyListArea").html(output);
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
