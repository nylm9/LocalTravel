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

   <!-- 프리텐다드 폰트 -->
    <link href="https://webfontworld.github.io/pretendard/Pretendard.css" rel="stylesheet">

<style type="text/css">

/*버튼 (눌렸을때)*/
.button:hover,
.button.active {
color:white;
            background-color: #6096B4;
            border: 0;
         outline: 0;
}
.button:visited {
         color:white;
            background-color: #078196;
            
}
.button {
          border: 1px solid #6096B4;
            background-color: rgba(0,0,0,0);
            color: #6096B4;
            padding: 5px;
               border-top-left-radius: 5px;
            border-bottom-left-radius: 5px;
             border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;  
           
}
h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6 {
  color: #1c1c1c;
  font-weight: 600;
   font-family: 'Pretendard';
}

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

select {
  -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
  
 font-family: 'Pretendard';
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  
  color: #444;
  background-color: #fff;
  
  padding: .6em 1.4em .5em .8em;
  margin: 0;
  
  border: 1px solid #aaa;
  border-radius: .5em;
  box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
}

select:hover {
  border-color: #888;
}

select:focus {
  border-color: #aaa;
  box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
  box-shadow: 0 0 0 3px -moz-mac-focusring;
  color: #222;
  outline: none;
}

select:disabled {
  opacity: 0.5;
}

/* label {
  font-family: "Noto Sans KR", sans-serif;
  font-size: 1rem;
  font-weight: 600;
  line-height: 1.3;
  
  color: #444;
  
  margin-right: 0.5em;
} */

/* form {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
} */

body {
  margin: 0;
}


/* 지도 */
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:70%;height:300px; }
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}



.half_background {
 background: linear-gradient(to top, #A0C3D2 50%, transparent 50%); 
/* box-shadow: inset 0 -20px 0 #A0C3D2; */
}


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

   <script type="text/javascript">
    	var Msg = '${Msg}';
    	if(Msg.length > 0 ){
    		alert(Msg);
    	}
    </script>

</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

			<!--================= 메인창 =================-->
<section class="section" style="margin-top:40px; margin:auto;">
   <div >


         <div class="card" style=" margin-left:620px; margin-top:40px; margin:40px auto; ">
		
		         <!-- 지도 -->
				<div class="map_wrap" style="margin-left: 250px;">
					<div id="map"
						style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

					<div id="menu_wrap" class="bg_white">
						<div class="option">
							<div>
								<form onsubmit="searchPlaces(); return false;">
									검색어 : <input type="text" value="인천일보아카데미" id="keyword"
										size="15">
									<button type="submit">검색</button>
								</form>
							</div>
						</div>
						<hr>
						<ul id="placesList"></ul>
						<div id="pagination"></div>
					</div>
				</div>

				 <div class="card-body"  style="margin:0 auto; float:left;">
				
					<div class="e" style="float:left; margin-right:20px; /* margin-top:35px; */">
						<h5 style="text-align:center;">지역 선택</h5>
						 <select name="province" onchange="searchFood()">
						 	<option value="99">--선택하세요--</option>
							<option value="11">서울특별시</option>
							<option value="31">경기도</option>
							<option value="23">인천광역시</option>
							<option value="21">부산광역시</option>
							<option value="22">대구광역시</option>
							<option value="24">광주광역시</option>
							<option value="25">대전광역시</option>
							<option value="26">울산광역시</option>
							<option value="32">강원도</option>
							<option value="33">충청북도</option>
							<option value="34">충청남도</option>
							<option value="12">세종특별시</option>
							<option value="35">전라북도</option>
							<option value="36">전라남도</option>
							<option value="37">경상북도</option>
							<option value="38">경상남도</option>
						</select>

					</div>
			
			
				<div class="e" id="moving-text" style="margin-top:5px;float:left">	
				<h5 style="text-align:center;">먹거리</h5>		
 				
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
 				
 				<label class="button food" onclick="clickSection(this, 'food')" for="selPub">
 				#술집</label>
 				<input class="d-none" type="radio" name="fRadio" value="pb008" id="selPub">
 								
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


     <!-- alert창 디자인 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
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
					output += '<div class="card"  style=" margin-top:5px;margin-bottom:13px; width: 270px; height:430px;">';
					output += '<div class="card-body">';
					output += '<h5 class="card-title py-2" style="text-align: center;" >No.' + statusNum  + '<h5>';
					output += '<div style="height:200px;width:5px;">';
					output += '<a href="${pageContext.request.contextPath }/foodInfo?fcode='+foodList[i].fcode+'">';
					output += '<img alt="" src="${pageContext.request.contextPath }/resources/FoodPicture/'+foodList[i].fpicture+'" style="height:200px;width:237px;" > </a>';
					output += '</div>';
					output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+foodList[i].fname+'" >'+foodList[i].fname+' </h6>';
					 if (foodList[i].f1ex != null && foodList[i].f1ex != undefined) {
					      output += '<p class="small mb-1 half_background">'+foodList[i].f1ex+' </p>';
					      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
					    } else {
					      output += '<p class="small mb-1">'+foodList[i].faddr+' </p>';
					    }
					output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/foodInfo?fcode='+foodList[i].fcode+' ">상세보기</a>';
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
		if (procode == 99) {
			/*   alert("지역을 선택해주세요!"); */
			// errorMsg 메시지 출력
			var infoMsg = "지역을 선택해주세요!";
			if (infoMsg) {
				const Toast = Swal.mixin({
					toast : true,
					position : 'top-center',
					showConfirmButton : false,
					timer : 1000,
					timerProgressBar : true,
				});

				Toast.fire({
					icon : 'info',
					title : infoMsg,
				});
			}
			setTimeout(function() {
				location.reload();
			}, 1000)
			/* location.reload(); */
		}

		clickAjax(foodVal, procode)

	}

	function clickAjax(foodVal, procode) {
		console.log("clickAjax 호출");

		var loginId = '${sessionScope.loginId}';
		console.log("loginId : " + loginId);
		$
				.ajax({
					type : "get",
					url : "${pageContext.request.contextPath }/getFoodResult",
					data : {
						"fthcode" : foodVal,
						"procode" : procode
					},
					dataType : "json",
					async : false,
					success : function(foodList) {
						console.log(foodList)
						var output = "";
						for (var i = 0; i < foodList.length; i++) {
							if (foodList.length == 0) {
								console.log("검색결과 없음");
							} else {
								var food = foodList[i];
								var statusNum = i + 1;

								output += '<div class="col-3">';
								output += '<div class="card"  style=" margin-top:5px;margin-bottom:13px; width: 270px; height:430px;">';
								output += '<div class="card-body">';
								output += '<h5 class="card-title py-2" style="text-align: center;" >No.'
										+ statusNum + '<h5>';
								output += '<div style="height:200px;width:5px;">';

								output += '<a href="${pageContext.request.contextPath }/foodInfo?fcode='
										+ foodList[i].fcode + '">';
								output += '<img alt="" src="${pageContext.request.contextPath }/resources/FoodPicture/'+foodList[i].fpicture+'" style="height:200px;width:237px;" > </a>';
								output += '</div>';
								output += '<h6 class="listTitle mt-2 mb-0" style="color: #012970; font-weight: 700;" title="'+foodList[i].fname+'" >'
										+ foodList[i].fname + ' </h6>';
								if (foodList[i].f1ex != null
										&& foodList[i].f1ex != undefined) {
									output += '<p class="small mb-1 half_background">'
											+ foodList[i].f1ex + ' </p>';
									output += '<p class="small mb-1">'
											+ foodList[i].faddr + ' </p>';
								} else {
									output += '<p class="small mb-1">'
											+ foodList[i].faddr + ' </p>';
								}
								output += '<a class="btn-dark btn-sm btn" href="${pageContext.request.contextPath }/foodInfo?fcode='
										+ foodList[i].fcode + ' ">상세보기</a>';
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d1475fdd9bd6c2c4dd2d46f76de2e05&libraries=services,clusterer,drawing"></script>
   <script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>




</html>
