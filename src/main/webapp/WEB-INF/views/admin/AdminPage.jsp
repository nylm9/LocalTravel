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
	
	<h1>로그인한 아이디 : ${sessionScope.loginId }</h1>

<!-- Enjoy테이블 데이터 입력 부분 -->
	<section class="section" style="margin-top: 40px;">
		<div class="row justify-content-center">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">

				<div class="card mb-3">
					<div class="card-body">
						<div class="pt-4 pb-2">
							<h5 class="card-title text-center pb-0 fs-4">Enjoy 데이터 입력</h5>
							<p class="text-center small">Enjoy 정보를 입력해주세요.</p>
						</div>

						<form class="row g-3"
							action="${pageContext.request.contextPath }/memberJoin"
							method="post" enctype="multipart/form-data"
							onsubmit="return joinFormCheck(this)">

							<div class="col-md-6">
								<label for="inputMid" class="form-label">놀거리 종류</label> <span
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
    	var Msg = '${Msg}';
    	if(Msg.length > 0 ){
    		alert(Msg);
    	}
    </script>

<!-- initialize jQuery Library -->
<script src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>

  

</html>
