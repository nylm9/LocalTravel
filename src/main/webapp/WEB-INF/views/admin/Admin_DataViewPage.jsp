<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
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
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
img {
  width: 200px;
  height: 100px;
  object-fit: cover;
}


</style>


</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->

	<!-- Enjoy 데이터 모두 출력 -->
	<section class="section" style="margin-top: 40px;">
		<%-- 		<div class="row">
			<div
				class="col d-flex flex-column align-items-center justify-content-center"
				style="max-width: 1000px;">
				<c:forEach items="${enjoyList }" var="enjoyList">
					<div class="col-md-6">
						<label for="inputEexplain" class="form-label">놀거리 정보</label> 
						<img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoyList.epicture }">
						<h3>${enjoyList.ename }</h3>
						<h3>${enjoyList.eaddr }</h3>
						<hr>
					</div>
				</c:forEach>

			</div>
		</div> --%>

<a href="${pageContext.request.contextPath }/testMainPage">테스트메인페이지 이동</a> <br/>
<a href="${pageContext.request.contextPath }/testMemberJoinCheckForm">회원가입 약관 테스트 페이지 이동</a>
<hr>
<hr>


<details>
    <summary>놀거리 Enjoy</summary>
    <p>
    <table>
			<thead>
				<tr>
					<th>놀거리 사진</th>
					<th>놀거리 코드</th>
					<th>놀거리 이름</th>
					<th>놀거리 주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${enjoyList }" var="enjoyList">
					<tr>
						<td><img src="${pageContext.request.contextPath }/resources/EnjoyPicture/${enjoyList.epicture }"></td>
						<td>${enjoyList.ecode }</td>
						<td>${enjoyList.ename }</td>
						<td>${enjoyList.eaddr }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
    </p>
</details>

<details>
    <summary>가게 Food</summary>
    <p>
    <table>
			<thead>
				<tr>
					<th>가게 사진</th>
					<th>가게 코드</th>
					<th>가게 이름</th>
					<th>가게 주소</th>
					<th>메뉴</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${foodList }" var="foodList"  >
					<tr>
						<td><img src="${pageContext.request.contextPath }/resources/FoodPicture/${foodList.fpicture }"></td>
						<td>${foodList.fcode }</td>
						<td>${foodList.fname }</td>
						<td>${foodList.faddr }</td>
						<td><input type="button" value="메뉴보기" onclick="openChild('${foodList.fcode }')"></td>
						<td><input type="hidden" id="pInput" value="${foodList.fcode }"></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
    </p>
</details>




	</section>
</body>

<script type="text/javascript">

/* function showPopup(fcode) {
	console.log(fcode);
	window.open("searchPopOpen", "a", "width=800, height=500, left=100, top=50"); 
	} */
	
let openWin;

function openChild(selectFcode) {
    // window.name = "부모창 이름"; 
    window.name = "parentForm";
    //let selectFcode = document.getElementById("pInput").value;
    openWin = window.open("MenuDataPopOpen?selectFcode="+selectFcode, "a", "width=800, height=500, left=100, top=50");
   /*  setChildText(); */
}

function setChildText(){
    openWin.document.getElementById("cInput").value = document.getElementById("pInput").value;
}
</script>



</html>