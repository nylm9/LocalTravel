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
<title>TRAIN-열차예매사이트_Admin페이지</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- jQuery google CDN -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->

<!-- initialize jQuery Library -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>




<style>
}
li {
	list-style-type: none;
	margin-left: 10px;
	float: right;
}

ul lu {
	list-style-type: none;
}

a {
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

img {
	text-align: left;
	width: 40px;
	height: 40px;
	top: -20px;
}

.title-image {
	position: relative;
	top: -20px;
	display: flex;
	margin: 25px;
}
/* #header1:hover + #header2 {
	display: block;
	position: fixed;
} */
select {
	width: 200px;
	padding: .8em .5em;
	border: 1px solid #999;
	font-family: inherit;
	background: /* url('arrow.jpg') */ no-repeat 95% 50%;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: #0f1f4;
}

select::-ms-expand {
	display: none;
}
</style>

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
</head>
<body>

	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

	<h1>로그인한 아이디 : ${sessionScope.loginId }</h1>




	<!--     ENAME NVARCHAR2(50) NOT NULL,   -- 놀거리이름
    ELCODE NCHAR(2),                -- 놀거리 지역코드
    EADDR NVARCHAR2(200),           -- 놀거리 주소
    ETELL NVARCHAR2(11),            -- 놀거리 전화번호
    EREPUTE NCHAR(1),               -- 놀거리 평판 (최초등록이니까 0점으로 하겠음!)
    EEXPLAIN NVARCHAR2(500),        -- 놀거리 설명
    ETHCODE NCHAR(5),               -- 놀거리 테마코드 -->

	<!-- Enjoy 부분 시작 -->
	<section class="section" style="margin-top: 40px;">
		<div class="row " style="float: left; margin-left: 5px;">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 800px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Enjoy 데이터 입력</h5>
							<p class="text-center small">Enjoy 정보를 입력해주세요( 이름 -> 주소 순으로
								작성 )</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/insertEnjoyData"
							method="post" enctype="multipart/form-data">

							<div class="col-md-6">
								<label for="selectElcode" class="form-label">지역코드</label> <select
									name="elcode" id="elcode-select" class="form-control">
									<option value="" disabled selected>--지역 선택--</option>
									<option value="11">서울</option>
									<option value="31">경기</option>
									<option value="23">인천</option>
									<option value="25">대전</option>
									<option value="22">대구</option>
									<option value="26">울산</option>
									<option value="21">부산</option>
									<option value="24">광주</option>
									<option value="12">세종</option>
									<option value="32">강원</option>
									<option value="33">충북</option>
									<option value="34">충남</option>
									<option value="37">경북</option>
									<option value="38">경남</option>
									<option value="35">전북</option>
									<option value="36">전남</option>

								</select>

							</div>


							<div class="col-md-6">
								<label for="inputEname" class="form-label">놀거리 이름</label> <span
									class="small" id="EnameCheckMsg">⠀</span> <input type="text"
									name="ename" class="form-control" id="inputEname"
									onkeyup="joinENameCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputEaddr" class="form-label">놀거리 주소</label> <span
									class="small" id="EaddrCheckMsg">⠀</span> <input type="text"
									name="eaddr" class="form-control" id="inputEaddr"
									onkeyup="joinEAddrCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputEtel" class="form-label">놀거리 전화번호(-는
									제외하고 입력)</label> <input type="tel" name="etell" class="form-control"
									id="inputEtel">
							</div>
							<div class="col-md-6">
								<label for="inputEexplain" class="form-label">놀거리 설명</label> <input
									type="text" name="eexplain" class="form-control"
									id="inputEexplain">
							</div>

							<div class="col-md-6">
								<label for="inputEexplain" class="form-label">놀거리
									테마코드(5글자)</label> <input type="text" name="ethcode"
									class="form-control" id="inputEexplain">
							</div>

							<div class="col-md-6">
								<label for="inputEfile" class="form-label">놀거리 이미지</label> <input
									type="file" name="efile" class="form-control" id="inputEfile">
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">등록</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Enjoy 부분 끝 -->



		<!-- Food insert 할 부분 시작 -->
		<div class="row ">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 900px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Food 데이터 입력</h5>
							<p class="text-center small">Food 정보를 입력해주세요 ( 이름 -> 주소 순으로
								작성 )</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/insertFoodData"
							method="post" enctype="multipart/form-data">

							<div class="col-md-6">
								<label for="selectFlcode" class="form-label">지역코드</label> <select
									name="Flcode" id="Flcode-select" class="form-control">
									<option value="" disabled selected>--지역 선택--</option>
									<option value="11">서울</option>
									<option value="31">경기</option>
									<option value="23">인천</option>
									<option value="25">대전</option>
									<option value="22">대구</option>
									<option value="26">울산</option>
									<option value="21">부산</option>
									<option value="24">광주</option>
									<option value="12">세종</option>
									<option value="32">강원</option>
									<option value="33">충북</option>
									<option value="34">충남</option>
									<option value="37">경북</option>
									<option value="38">경남</option>
									<option value="35">전북</option>
									<option value="36">전남</option>

								</select>

							</div>


							<div class="col-md-6">
								<label for="inputFname" class="form-label">가게 이름</label> <span
									class="small" id="FnameCheckMsg">⠀</span> <input type="text"
									name="fname" class="form-control" id="inputFname"
									onkeyup="joinFNameCheck(this.value)">
							</div>
							
							<div class="col-md-6">
								<label for="inputF1ex" class="form-label">가게 한줄소개</label> <input
									type="text" name="f1ex" class="form-control" placeholder="필수사항 아님"
									id="inputF1ex">
							</div>
							
							<div class="col-md-6">
								<label for="inputFaddr" class="form-label">가게 주소</label> <span
									class="small" id="FaddrCheckMsg">⠀</span> <input type="text"
									name="faddr" class="form-control" id="inputFaddr"
									onkeyup="joinFAddrCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputFtel" class="form-label">가게 전화번호(-는
									제외하고 입력)</label> <input type="tel" name="ftell" class="form-control"
									id="inputFtel">
							</div>
							<div class="col-md-6">
								<label for="inputFexplain" class="form-label">가게 설명</label> <input
									type="text" name="fexplain" class="form-control"
									id="inputFexplain">
							</div>

							<div class="col-md-6">
								<label for="inputFexplain" class="form-label">놀거리
									테마코드(5글자)</label> <input type="text" name="fthcode"
									class="form-control" id="inputFexplain">
							</div>

							<div class="col-md-6">
								<label for="inputFfile" class="form-label">가게 이미지</label> <input
									type="file" name="ffile" class="form-control" id="inputFfile">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">등록</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>





		<!-- Food insert 할 부분 시작 -->
		<div class="row " style="float: center;">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 900px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">menu 데이터 입력</h5>
							<p class="text-center small">menu 정보를 입력해주세요</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/insertMenuData"
							method="post" enctype="multipart/form-data">

							<div class="col-md-6">
								<label for="inputFname" class="form-label">가게 코드</label>
								<input type="button" value="검색" onclick="showPopup()"> 
								<span class="small" id="FnameCheckMsg">⠀</span> 
								<%-- <input type="hidden" name="fname" class="form-control" id="hiddenfcode" 
								value="${sessionScope.fcode }">  --%>
								<input type="text" name="menufcode" class="form-control" id="Viewfcode">
							</div>

							<div class="col-md-6">
								<label for="inputMenuThcode" class="form-label">메뉴테마코드</label>
								 <input type="text" name="menuthcode" class="form-control" id="inputMenuThcode">
							</div>

							<div class="col-md-6">
								<label for="inputMfile" class="form-label">대표메뉴1 이미지</label> <input
									type="file" name="mfile1" class="form-control" id="inputMfile">
							</div>

							<div class="col-md-6">
								<label for="inputMenuName1" class="form-label">대표메뉴1 이름</label>
								 <input
									type="text" name="menuname1" class="form-control"
									id="inputMenuName1">
							</div>
							<div class="col-md-6">
								<label for="inputMenuPrice1" class="form-label">대표메뉴1 가격</label>
								<span class="small" id="FaddrCheckMsg">⠀</span> <input
									type="text" name="menuprice1" class="form-control"
									id="inputMenuPrice1">
							</div>

							<div class="col-md-6">
								<label for="inputMenuExplain1" class="form-label">대표메뉴1
									설명</label> <input type="text" name="menuexplain1" class="form-control"
									id="inputMenuExplain1">
							</div>
							
							<div class="col-md-6">
								<label for="inputMfile2" class="form-label">대표메뉴2 이미지</label> <input
									type="file" name="mfile2" class="form-control" id="inputMfile2">
							</div>

							<div class="col-md-6">
								<label for="inputMenuName2" class="form-label">대표메뉴2 이름</label>
								 <input
									type="text" name="menuname2" class="form-control"
									id="inputMenuName2">
							</div>
							<div class="col-md-6">
								<label for="inputMenuPrice2" class="form-label">대표메뉴2 가격</label>
								<span class="small" id="FaddrCheckMsg">⠀</span> <input
									type="text" name="menuprice2" class="form-control"
									id="inputMenuPrice2">
							</div>

							<div class="col-md-6">
								<label for="inputMenuExplain2" class="form-label">대표메뉴2
									설명</label> <input type="text" name="menuexplain2" class="form-control"
									id="inputMenuExplain2">
							</div>
							
							<div class="col-md-6">
								<label for="inputMfile3" class="form-label">대표메뉴3 이미지</label> <input
									type="file" name="mfile3" class="form-control" id="inputMfile3">
							</div>

							<div class="col-md-6">
								<label for="inputMenuName3" class="form-label">대표메뉴3 이름</label>
							 <input
									type="text" name="menuname3" class="form-control"
									id="inputMenuName3">
							</div>
							<div class="col-md-6">
								<label for="inputMenuPrice3" class="form-label">대표메뉴3 가격</label>
							 <input
									type="text" name="menuprice3" class="form-control"
									id="inputMenuPrice3">
							</div>

							<div class="col-md-6">
								<label for="inputMenuExplain3" class="form-label">대표메뉴3
									설명</label> <input type="text" name="menuexplain3" class="form-control"
									id="inputMenuExplain3">
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">등록</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>


		<!-- 	<form action="multi-file" method="post"  enctype="multipart/form-data">
		파일 : <input type="file" name="multiFile" multiple> <br>
		파일 설명 : <input type="text" name="fileContent"><br>
		<input type="submit" value="제출">
	</form> -->

	</section>







</body>


<!-- enjoy부분 스크립트 시작 -->

<script type="text/javascript">
	function joinENameCheck(nameVal) {
		console.log("입력한 놀거리 이름 : " + nameVal);
		if (nameVal.length == 0) {
			$("#EnameCheckMsg").text('놀거리 이름를 입력 해주세요!').css("color", "red");
		} 
	}
</script>


<script type="text/javascript">

function joinEAddrCheck(addrVal) {
	let inputEname = document.getElementById("inputEname").value;
	console.log("입력한 놀거리 주소 : " + addrVal);
/* 	if(addrVal.length == 0 ) {
		$("#EaddrCheckMsg").text('놀거리 주소를 입력 해주세요!').css("color","red"); 
	} else {  */
		$.ajax( { 
			type : "get",	
			url : "${pageContext.request.contextPath }/enjoyNameCheck", 
			data : { "inputEname" : inputEname, "inputEaddr" : addrVal },
			success : function(checkResult) {
				console.log("checkResult : " + checkResult);
				if( checkResult == 'NO' ) {
					/* 놀거리 이름 중복 */
					$("#EnameCheckMsg").text('중복된 놀거리 입니다.').css("color","red"); 
				} else {
					/* 놀거리 이름 가능 */
					$("#EnameCheckMsg").text('입력가능한 놀거리 입니다.').css("color","green"); 
				}
			}
		} );
	/* } */
	}
</script>




<!-- enjoy부분 스크립트 끝 -->



<!-- food부분 스크립트 시작 -->

<script type="text/javascript">
	function joinFNameCheck(nameVal) {
		console.log("입력한 가게 이름 : " + nameVal);
		if (nameVal.length == 0) {
			$("#FnameCheckMsg").text('가게 이름을 입력 해주세요!').css("color", "red");
		} 
	}
	
	
</script>


<script type="text/javascript">

function joinFAddrCheck(addrVal) {
	let inputFname = document.getElementById("inputFname").value;
	console.log("입력한 가게 주소 : " + addrVal);
		$.ajax( { 
			type : "get",	
			url : "${pageContext.request.contextPath }/enjoyFoodCheck", 
			data : { "inputFname" : inputFname, "inputFaddr" : addrVal },
			success : function(checkResult) {
				console.log("checkResult : " + checkResult);
				if( checkResult == 'NO' ) {
					/* 가게 이름 중복 */
					$("#FnameCheckMsg").text('중복된 가게 입니다.').css("color","red"); 
				} else {
					/* 가게 이름 가능 */
					$("#FnameCheckMsg").text('입력가능한 가게 입니다.').css("color","green"); 
				}
			}
		} );
	}
</script>

<!-- food부분 스크립트 끝 -->



<!-- menu부분 스크립트 시작 -->
<script type="text/javascript">

/* 	function selectFcode() {
	const fcode =  document.getElementById('hiddenfcode').value;
		 document.getElementById("Viewfcode").innerText = fcode;
	} */
	
	
	
	
</script>
<!-- menu부분 스크립트 끝 -->

<script type="text/javascript">

/* $.ajax({
	  type: "GET",
	  url: "your-url",
	  success: function(response) {
	    // response는 결과 값
	  }
	});
	
$("input[name='your-input-name']").val(response); */


function showPopup() {
	window.open("searchPopOpen", "a", "width=800, height=500, left=100, top=50"); 
	}

</script>
<!-- menu부분 스크립트 끝 -->






<script type="text/javascript">
    	var Msg = '${Msg}';
    	if(Msg.length > 0 ){
    		alert(Msg);
    	}
    </script>


</html>
