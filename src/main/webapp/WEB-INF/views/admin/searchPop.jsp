<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가게코드 검색</title>

<!-- initialize jQuery Library -->
<script
	src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>

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


	<label for="inputFname" class="form-label">가게 코드 검색</label>
	<input type="text" placeholder="가게 이름을 입력하세요."
		onkeyup="searchFCode(this.value)"><br>
		<div id="foodListArea">
    <!-- <span style="cursor: pointer;" onclick="select(this);">"+""+foodinfo.fcode+""+"</span> <br/><hr> -->
</div>

</body>



<script type="text/javascript">

function searchFCode(inputval) {
	console.log("food목록 조회");
	console.log("입력한 값 : " + inputval);
 		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath }/getAllFoodList",
			data : { "inputval" : inputval },
			dataType : "json",
			async:false,
			success: function(foodList) {
				console.log(foodList)
				var output = "";
				for(var foodinfo of foodList){
					if(foodinfo.length == 0){
						console.log("검색결과 없음");
					} else {
						console.log("검색결과 있음")
						output += "<span style=\"cursor: pointer;\" onclick=\"select(this);\">"+"\""+foodinfo.fcode+"\""+""+"\""+foodinfo.fname+"\""+""+"\""+foodinfo.faddr+"\""+"</span> <br/><hr>";
					}
				}
 				$("#foodListArea").html(output);
				/* $("#selectMovie").focus();
				$("#selectMovie").click();  */
		}
});


}

</script>


</html>