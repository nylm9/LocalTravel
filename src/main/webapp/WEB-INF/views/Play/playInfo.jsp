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
<title>놀거리 상세보기 페이지</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>


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
	
	.reviewComment{
		outline: none;
		resize: none;
		border: none;
	}
h1, .h1, h2, .h2, h3, .h3, h4, .h4, h5, .h5, h6, .h6  {
  color: #1c1c1c;
  font-weight: 600;
  /*  font-family: sans-serif;  */
    font-family: 'Pretendard';
}

.p {
font-family: 'Pretendard';
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




	</style>
	<script type="text/javascript">
  		var reMsg = '${redirectMsg}';
  		if(reMsg.length > 0){
  			alert(reMsg);
  		}
  </script>
	
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
		 <script type="text/javascript">
		  var Msg = '${Msg}';
		  if (Msg.trim().length > 0) { // 빈 문자열이 아닐 때만 alert 창 띄우기
		    alert(Msg);
		  }
		</script>

</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	
	<!-- 상세보기 -->
		<section class="section">
			<div class="card mb-3 p-5 mx-auto" style="min-width: 700px; max-width: 1200px; margin-top:40px;">
            	<div class="row g-0">
              		<div class="col-12">
                		<div class="card-body"> 
		                	<!-- 사진 -->
		                	<form onsubmit="return joinFormCheck(this)">
		                	<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enInfo.epicture }" 
		                		style="width: 300px; height: 400px; float:left" 
		                		     class="img-fluid rounded-start" alt="...">
		                		     
		                		     <div style="position:absolute; bottom:80px;left:20px;">
					                  	<a class="btn btn-sm btn-danger"
										href="${pageContext.request.contextPath }/reviewForm?reencode=${enInfo.ecode }">리뷰작성</a>
											<a class="btn btn-sm" style="background:blue; color:white;" href="${pageContext.request.contextPath }/locationSelectReservePage?elcode=${enInfo.elcode }">예매하기</a>
												   
										<div style="float:left; margin-right:7px;">
											<label class="btn btn-sm btn-primary">
							             		<a type="submit" href="${pageContext.request.contextPath }/likeplay?lbcode=${enInfo.ecode }">저장</a>
							             	<input class="d-none"  type="radio" value='1' name="rvrecommend">
							             	</label>
										</div> 
										<!-- 예매하기버튼 -->
										<div style="margin-top:5px; margin-right:5px;">
										</div>
									</div>
		                		     
		                		     <!-- 정보출력 -->
                		  			<div style="padding-left:350px;">
			                  			<h5 class="card-title" style="font-size: 30px;font-weight: bold;" >${enInfo.ename }</h5>
			                  			<p class="card-text"><span style="font-size: 18px;font-weight: bold;" >주소: ${enInfo.eaddr }</span>
				                  			<div>
												<c:if test="${enInfo.erepute == '0'}">
													<p style="font-size: 17px; ">평점: ☆☆☆☆☆(0) </p>
												</c:if>
												<c:if test="${enInfo.erepute == '1'}">
													<p style="font-size: 17px; ">평점: ★☆☆☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '2'}">
													<p style="font-size: 17px; ">평점: ★★☆☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '3'}">
													<p style="font-size: 17px; ">평점: ★★★☆☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '4'}">
													<p style="font-size: 17px; ">평점: ★★★★☆ </p>
												</c:if>
												<c:if test="${enInfo.erepute == '5'}">
													<p style="font-size: 17px; ">평점: ★★★★★</p>
												</c:if>
											</div>
								<!-- 지도 -->
								<div class="map_wrap" style="margin-left: 50px;">
									<div id="map"
										style="width: 80%; height: 80%; position: relative; overflow: hidden;"></div>

									<div id="menu_wrap" class="bg_white">
										<div class="option">
											<div>
												<form onsubmit="searchPlaces(); return false;">
													검색어 : <input type="text" value="${enInfo.ename }" id="keyword"
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
			                  		
			                  			 <!-- <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-up"></i></span>
			                  			 <span style="font-size: 18px;font-weight: bold;" ><i class="bi bi-hand-thumbs-down"></i></span> -->
			                  			
			                  				<hr>
					                  			<c:choose>
							       	   				<c:when test="${enInfo.etell == null }">
														<p style="font-size: 17px; ">전화번호: 없음</p>
													</c:when>
													<c:otherwise>
							       	   					<p  style="font-size: 20px; " >전화번호: ${enInfo.etell }</p>
													</c:otherwise>
												</c:choose>
			                  			
			                  			<p class="card-text mb-1" style="font-size: 17px; margin-top:-15px; ">${enInfo.eexplain }</p>
				                  			

								<c:forEach items="${blList }" var="blList">
				              		<a href="${pageContext.request.contextPath }/BlogView?ecode=${enInfo.ecode }">
				              		<p>${enInfo.ename }블로그 글도 함께 읽어보세요!</p>
				              		</a>
				              		
								</c:forEach>
								

								
								
								</div>
							</form>
                		</div>
              		</div>
            	</div>
            	

           	
          	</div>
          	
	<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<p style="font-size:25px;">리뷰</p>
              		</div>
              		<hr>
              		
              		<c:forEach items="${reviewList }" var="review">
              		<div class="col-6">
                		<div class="card-body">
                			<div class="row">
                				
                				<div class="col">
									<h8 class="card-title p-0 mb-1"> 
                					<c:choose>
										<c:when test="${review.RVRECOMMEND == '0' }">
											<span style="font-weight: bold; color: pink;">
												<i class="bi bi-hand-thumbs-up "></i>
												<h8>좋아요</h8>
											</span>
										</c:when>
										<c:otherwise>
											<span style="font-weight: bold; color: red;">
												<i class="bi bi-hand-thumbs-down "></i>
												<h8>별로에요</h8>
											</span>										
										</c:otherwise>									
									</c:choose>
										ID: ${review.RVMID} 
									</h8>
									<textarea class="reviewComment w-100" rows="1" readonly="readonly">${review.RVCOMMENT}</textarea>
									<h6>${review.RVDATE}</h6>
                				</div>
                			</div>
                		</div>
                		<hr>
              		</div>
					</c:forEach>             
            	</div>  			         	
          	</div>
          	
		</section>
		
		<!-- 기차예매 -->
		<!-- <section class="section">
		<div class="card mb-3 p-5 mx-auto" style="min-width: 600px; max-width: 1200px;">
				<div class="row g-0">
              		<div class="col-12 " style="text-align: center;" >
                		<p style="font-size:25px;">기차예매</p>
              		</div>
              		<hr>
              		<div>
              		<h5>갈수있는 열차랑 예매버튼</h5>
              		</div>
              	</div>
         </div>
         </section> -->

<script type="text/javascript">
	

</script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93b4f3f3d42ca1981b8841a71a59e4c7&libraries=services,clusterer,drawing"></script>
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

</body>

</html>