<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기차예매 - 좌석 선택창</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- theme meta -->
<meta name="theme-name" content="revolve" />

<!--Favicon-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/resources/images/favicon.ico"
	type="image/x-icon">

<!-- THEME CSS
	================================================== -->
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Themify -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/themify/css/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.css">
<!-- Slick Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.css">
<!-- manin stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/style.css">


<style type="text/css">

/*맨 앞 역표*/
table {
	width: 100%;
	border: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	text-align: center;
	padding: 5px;
}

thead {
	background-color: #f8f8f8;
}

/* 눌럿을때 뜨는 표*/
.card-graph {
	margin-bottom: 17px;
	text-align: center;
	font-weight: bold;
	background-color: #f8f8f8;
}

/*날짜*/
.reserveArea {
	height: 350px;
	overflow: scroll;
}

.seatBtn-Th {
	cursor: pointer;
}

.seatBtn-Th:hover {
	background-color: lightgray;
	cursor: pointer;
}

.seatBtn-Th-Act {
	cursor: pointer;
	background-color: gray;
}
</style>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var urlParams = new URLSearchParams(window.location.search);
		var pNum = urlParams.get("pNum");
		
		console.log('좌석데이터 가져오기')
		$.ajax({
			type : "GET",
			dataType: "json",
			async : false,
	        url : "${pageContext.request.contextPath }/getSeatData",
	        success : function(arrayList) {
	        	console.log(arrayList[0].seatnum);
	        	var arr1 = [];
	        	var arr2 = [];
	        	var arr3 = [];
	        	var arr4 = [];
	        	for(var i = 0; i < 14; i++){
	        		console.log(arrayList[i].seatnum);
	        		arr1.push(arrayList[i].seatnum);
	        	}
	        	for(var i = 14; i < 28; i++){
	        		console.log(arrayList[i].seatnum);
	        		arr2.push(arrayList[i].seatnum);
	        	}
	        	for(var i = 28; i < 42; i++){
	        		console.log(arrayList[i].seatnum);
	        		arr3.push(arrayList[i].seatnum);
	        	}
	        	for(var i = 42; i < 56; i++){
	        		console.log(arrayList[i].seatnum);
	        		arr4.push(arrayList[i].seatnum);
	        	}
	        	console.log('============================');
	        	console.log(arr1);
	        	console.log(arr2);
	        	console.log(arr3);
	        	console.log(arr4);
	        	var output = "<table>";
	        	for(var i = 0; i < 14; i++){
	        		output += '<tr>';
	        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr1[i]+'</th>';
	        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr2[i]+'</th>';
	        		output += '<th></th>';
	        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr3[i]+'</th>';
	        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr4[i]+'</th>';
	        		output += '</tr>';
					
	        	}
	        	output += '</table>';
	        	$('#outputSeatNum').html(output);
	        }
		});
			
	});		
	
</script>
</head>
<body>
	기차예매 - 좌석선택
	<div class="col-12">
		<div style="margin-bottom: 10px;">
			<button id="previousBtn" type="button" class="btn btn-danger" onclick="return previousBtn(this)" style="float: left;">이전</button>
			<h4 id="carCaption" Style="display: inline-block; margin-left: 0px auto; margin-right: 0px auto;">5호차</h4>
			<button id="nextBtn" type="button" class="btn btn-danger" onclick="nextBtn(this)" style="float: right;">다음</button><input type="hidden" value="5" id="carNum">
		</div>
		<div class="card">
			<div class="card-body" id="outputSeatNum">
				
			</div>
			<button id="nextBtn" type="button" class="btn btn-danger" onclick="selectComplete()" style="float: center;">선택완료</button>
		</div>
	</div>

</body>
<script type="text/javascript">
	var pCount = [];
	//선택완료
	
	function selectComplete(){
		var urlParams = new URLSearchParams(window.location.search);
		var pNum = parseInt(urlParams.get("pNum"));
		console.log(pNum+", "+pCount.length)
		if(pCount.length == pNum){
			var result = confirm('선택된 좌석 정보 : '+pCount);
			if(result){
				window.opener.receiveData(pCount);
		        window.close();
			}else{
			    return false;
			}
		} else {
			alert('인원에 맞는 좌석수를 선택하세요')
		}
		
	}
	
	// 이전 버튼
	function previousBtn(btn) {
		var carNum = $('#carNum').val();
		console.log('호차넘버 : '+ carNum);
		if(carNum == 1){
			alert('맨앞 차량입니다.');
			return false;
		}
		var previouscar = carNum - 1; 
		$('#carNum').val(previouscar);
		if(previouscar == 1){
			$('#previousBtn').removeClass('btn-danger');
		}
		$('#nextBtn').addClass('btn-danger');
		$('#carCaption').html(previouscar+'호차');
		console.log('좌석데이터 가져오기')
		$.ajax({
			type : "GET",
			dataType: "json",
			async : false,
			data: {
				"carNum" : previouscar
			},
	        url : "${pageContext.request.contextPath }/getSeatData2",
	        success : function(arrayList) {
	        	console.log(arrayList[0].seatnum);
	        	var arr1 = [];
	        	var arr2 = [];
	        	var arr3 = [];
	        	var arr4 = [];
	        	if(arrayList.length > 50){
	        		for(var i = 0; i < 14; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr1.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 14; i < 28; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr2.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 28; i < 42; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr3.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 42; i < 56; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr4.push(arrayList[i].seatnum);
		        	}
		        	console.log('============================');
		        	console.log(arr1);
		        	console.log(arr2);
		        	console.log(arr3);
		        	console.log(arr4);
		        	var output = "<table>";
		        	for(var i = 0; i < 14; i++){
		        		output += '<tr>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr1[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr2[i]+'</th>';
		        		output += '<th></th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr3[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr4[i]+'</th>';
		        		output += '</tr>';
						
		        	}
		        	output += '</table>';
	        	} else {
	        		for(var i = 2; i < 14; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr1.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 16; i < 28; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr2.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 30; i < 42; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr3.push(arrayList[i].seatnum);
		        	}
		        	console.log('============================');
		        	console.log(arr1);
		        	console.log(arr2);
		        	console.log(arr3);
		        	console.log(arr4);
		        	var output = "<table>";
		        	for(var i = 0; i < 12; i++){
		        		output += '<tr>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr1[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr2[i]+'</th>';
		        		output += '<th></th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr3[i]+'</th>';
		        		output += '</tr>';
						
		        	}
		        	output += '</table>';
	        	}
	        	
	        	$('#outputSeatNum').html(output);
	        }
		});
	}
	
	
	// 다음버튼
	function nextBtn(btn) {
		var carNum = $('#carNum').val();
		console.log('호차넘버 : '+ carNum);
		if(carNum == 18){
			alert('맨뒤 차량입니다.');
			return false;
		}
		var nextcar = parseInt(carNum) + 1; 
		$('#carNum').val(nextcar);
		if(nextcar == 18){
			$('#nextBtn').removeClass('btn-danger');
		}
		$('#previousBtn').addClass('btn-danger');
		$('#carCaption').html(nextcar+'호차');
		console.log('좌석데이터 가져오기')
		$.ajax({
			type : "GET",
			dataType: "json",
			async : false,
			data: {
				"carNum" : nextcar
			},
	        url : "${pageContext.request.contextPath }/getSeatData2",
	        success : function(arrayList) {
	        	console.log(arrayList[0].seatnum);
	        	console.log('좌석 수 :' + arrayList.length);
	        	var arr1 = [];
	        	var arr2 = [];
	        	var arr3 = [];
	        	var arr4 = [];
	        	if(arrayList.length > 50){
	        		for(var i = 0; i < 14; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr1.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 14; i < 28; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr2.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 28; i < 42; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr3.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 42; i < 56; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr4.push(arrayList[i].seatnum);
		        	}
		        	console.log('============================');
		        	console.log(arr1);
		        	console.log(arr2);
		        	console.log(arr3);
		        	console.log(arr4);
		        	var output = "<table>";
		        	for(var i = 0; i < 14; i++){
		        		output += '<tr>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr1[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr2[i]+'</th>';
		        		output += '<th></th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr3[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr4[i]+'</th>';
		        		output += '</tr>';
						
		        	}
		        	output += '</table>';
	        	} else {
	        		for(var i = 2; i < 14; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr1.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 16; i < 28; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr2.push(arrayList[i].seatnum);
		        	}
		        	for(var i = 30; i < 42; i++){
		        		console.log(arrayList[i].seatnum);
		        		arr3.push(arrayList[i].seatnum);
		        	}
		        	console.log('============================');
		        	console.log(arr1);
		        	console.log(arr2);
		        	console.log(arr3);
		        	console.log(arr4);
		        	var output = "<table>";
		        	for(var i = 0; i < 12; i++){
		        		output += '<tr>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr1[i]+'</th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr2[i]+'</th>';
		        		output += '<th></th>';
		        		output += '<th class="seatBtn-Th" onclick="return seatBtn(this)">'+arr3[i]+'</th>';
		        		output += '</tr>';
						
		        	}
		        	output += '</table>';
	        	}
	        	
	        	$('#outputSeatNum').html(output);
	        }
		});
	}
	
	// 시트버튼
	function seatBtn(btn){
		var urlParams = new URLSearchParams(window.location.search);
		var pNum = parseInt(urlParams.get("pNum"));
		console.log(pCount.length+" "+pNum);
		console.log('부모창으로부터 받은 데이터2 : '+pNum);
		console.log($('#carNum').val()+$(btn).html());
		var pSeat = $('#carNum').val()+"-"+$(btn).html();
		if(pCount.includes(pSeat)){
			var index = pCount.indexOf(pSeat);
			if (index > -1) {
				pCount.splice(index, 1);
			}
			console.log(pCount);
			$(btn).removeClass('seatBtn-Th-Act');
		} else {
			pCount.push(pSeat);
			console.log(pCount);
			$(btn).addClass('seatBtn-Th-Act');
		}
		console.log(pCount.length+" "+pNum);
		if(pCount.length == pNum + 1){
			alert('예매인원보다 많은 좌석을 가질 수 없습니다.');
			$(btn).removeClass('seatBtn-Th-Act');
			pCount.pop(pSeat);
		}
		
		
	}
</script>
<!-- THEME JAVASCRIPT FILES
================================================== -->
<!-- initialize jQuery Library -->

<!-- Bootstrap jQuery -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/bootstrap/js/popper.min.js"></script>
<!-- Owl caeousel -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/owl-carousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/slick-carousel/slick.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/magnific-popup/magnific-popup.js"></script>
<!-- Instagram Feed Js -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/instafeed-js/instafeed.min.js"></script>
<!-- Google Map -->
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/google-map/gmap.js"></script>
<!-- main js -->
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>


</body>
</html>