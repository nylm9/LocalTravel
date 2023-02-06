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
<title>TRAIN-열차예매사이트</title>

<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>

<!-- jQuery google CDN -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script> -->
	
	<!-- initialize jQuery Library -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
	
	
	
	
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


	<!-- 회원가입창 -->
	<section class="section" style="margin-top: 40px;">
		<div class="row justify-content-center">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">회원가입</p>
							<p class="text-center small">회원 정보를 입력해주세요.</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/memberJoin"
							method="post" enctype="multipart/form-data"
							onsubmit="return joinFormCheck(this)">

							<div class="col-md-6">
								<label for="inputMid" class="form-label">아이디</label> <span
									class="small" id=idCheckMsg>⠀</span> 
									<input type="text" name="mid" class="form-control" id="inputMid"
									onkeyup="joinIdCheck(this.value)">
							</div>
							<div class="col-md-6">
								<label for="inputMpw" class="form-label">비밀번호</label> <input
									type="password" name="mpw" class="form-control" id="inputMpw">
							</div>
							<div class="col-md-6">
								<label for="inputMname" class="form-label">이름</label> <input
									type="text" name="mname" class="form-control" id="inputMname">
							</div>
							<div class="col-md-6">
								<label for="inputMbirth" class="form-label">생년월일</label> <input
									type="date" name="mbirth" class="form-control" id="inputMbirth">
							</div>

							<div class="col-md-6">
								<label for="selectmgender" class="form-label">성별</label> <select
									name="mgender" id="gender-select" class="form-control">
									<option value="" disabled selected>--선택해주세요--</option>
									<option value="1">남성</option>
									<option value="2">여성</option>
									<option value="0">선택하지 않음</option>

								</select>

							</div>

							<div class="col-md-6">
								<label for="inputMPhone" class="form-label">휴대폰번호</label> 
								<input type="text" name="mphone" class="form-control" id="inputMbirth"
								placeholder="- 는 빼고 입력해주세요">
							</div>


							<div class="col-md-5">
								<label for="inputMemailId" class="form-label">이메일아이디</label> <input
									type="text" name="memail" class="form-control"
									id="inputMemailId" placeholder="id@Email.com">
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary"
									style="margin-top: 10px; margin-left: 350px;">회원가입</button>
								<button type="reset" class="btn btn-secondary"
									style="margin-top: 10px;">다시작성</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>

<script type="text/javascript">
	function testFunc() {
		console.log('!!!!')
		document.getElementById('header2').style.display = '';

	}
	function testFunc2() {
		document.getElementById('header2').style.display = 'none';
	}
</script>

<script type="text/javascript">
$(document).ready(function(){
	console.log('확인!');
	//jQuery 작동여부 확인
})


function joinIdCheck(idVal) {
	console.log("입력한 아이디 : " + idVal);
	if(idVal.length == 0) {
		$("#idCheckMsg").text('아이디를 입력 해주세요!').css("color","red"); 
	} else {
		$.ajax( { 
			type : "get",	
			url : "${pageContext.request.contextPath }/memberIdCheck", 
			data : { "inputId" : idVal },
			success : function(checkResult) {
				console.log("checkResult : " + checkResult);
				if( checkResult == 'OK' ) {
					/* 아이디 사용 가능 */
					$("#idCheckMsg").text('사용가능한 아이디 입니다.').css("color","green"); 
				} else {
					/* 중복된 아이디 */
					$("#idCheckMsg").text('중복된 아이디 입니다.').css("color","red"); 
				}
			}
		} );
	}
}







		function joinFormCheck(joinForm){
			var formMid = joinForm.mid;
			if(formMid.value == 0){
				alert('아이디를 입력 해주세요!');
				formMid.focus();
				return false;
			}
			var formMpw = joinForm.mpw;
			if(formMpw.value == 0){
				alert('비밀번호를 입력 해주세요!');
				formMpw.focus();
				return false;
			}
			var formMname = joinForm.mname;
			if(formMname.value == 0){
				alert('이름을 입력 해주세요!');
				formMname.focus();
				return false;
			}
		}
		
/* 		function selectDomain(selDomain){
			var selectDomainVal = selDomain.value;
			document.getElementById('inputMemailDomain').value = selectDomainVal;
		} */
		
		
	</script>


<!-- initialize jQuery Library -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>

</html>
