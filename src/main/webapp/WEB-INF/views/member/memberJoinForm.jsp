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
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/styles.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
#header1 {
	background-color: white;
	margin-right: 20px;
}

#header2 {
	background-color: #EDC7E8;
	opacity: 0.4;
	padding-bottom: 1em;
	text-align: center;
}

.margin {
	margin: 20px 10px 30px 40px; /* top right bottom left */
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
</style>
</head>
<body>
	<!-- 임시적으로 만든 홈버튼 -->
	<a href="${pageContext.request.contextPath }/">홈으로</a><br>

	<form class="row g-3"
		action="${pageContext.request.contextPath }/memberJoin" method="post"
		enctype="multipart/form-data">

		<div>
			<label for="inputMid" class="form-label">아이디</label>
			<!-- <span class="small" id=idCheckMsg>중복확인 메세지</span> -->
			<input type="text" name="mid" id="inputMid">
		</div>
		<div>
			<label for="inputMpw" class="form-label">비밀번호</label> <input
				type="password" name="mpw" id="inputMpw">
		</div>
		<div>
			<label for="inputMname" class="form-label">이름</label> <input
				type="text" name="mname" id="inputMname">
		</div>
		<div>
			<label for="inputMbirth" class="form-label">생년월일</label> <input
				type="date" name="mbirth" id="inputMbirth">
		</div>

		<div>
			<label for="selectmgender" class="form-label">성별</label> <select
				name="mgender" id="gender-select">
				<option value="" disabled selected>--선택해주세요--</option>
				<option value="1">남성</option>
				<option value="2">여성</option>
				<option value="0">선택하지 않음</option>
			</select>
		</div>

		<div>
			<label for="inputMbirth" class="form-label">전화번호</label> <input
				type="text" name="mphone" id="inputMphone">
		</div>
		<div>
			<label for="inputMaddr" class="form-label">주소</label> <input
				type="text" name="maddr" id="inputMaddr">
		</div>
		<div>
			<label for="inputMemailId" class="form-label">이메일주소</label> <input
				type="text" name="memail" id="inputMemailId">
		</div>

		<div>
			<button type="submit" class="btn btn-primary">회원가입</button>
			<button type="reset" class="btn btn-secondary">다시작성</button>
		</div>
	</form>

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


</html>
