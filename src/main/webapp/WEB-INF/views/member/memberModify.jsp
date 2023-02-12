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
<title>회원정보수정페이지</title>

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


</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/WEB-INF/views/include/topBar.jsp"%>
	<!-- End Header -->
	<!-- 회원정보출력 -->
		<section class="section"  style="margin-top: 40px;">
			<div class="row mx-auto" style="max-width:1200px;min-width:700px;">
			    
			    <form onsubmit="return modifyFormCheck(modifyForm)" action="${pageContext.request.contextPath }/memberModify">
			<%-- 	<c:forEach items="${memInfo }" var="memInfo"> --%>
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" id="memberListArea">
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">수정하기</p>
							</div>
							
							<%-- <form class="row g-3"
							action="${pageContext.request.contextPath }/memberJoin"
							method="post" enctype="multipart/form-data"
							onsubmit="return joinFormCheck(this)"
							style="margin-left: 200px;"
							> --%>
							
							<div class="col-md-6">
								<label class="form-label" style="flaot:left">아이디 </label><p style="color:red; font-size:1px; float:right">아이디는 수정불가능합니다.</p>
									<div>
										<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.mid }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이름</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mname" class="form-control" id="inputMid"
									 value="${memInfo.mname }" >
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">생년월일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mbirth" class="form-control" id="inputDate"
									 value="${memInfo.mbirth }">
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">성별</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									
											<%-- <c:choose>
											<c:when test="${memInfo.MGENDER == '1' }">
												<p style="font-size:20px; padding-left:10px;  padding-top:10px;">남자</p>
											</c:when>
											<c:otherwise>
												<p style="font-size:20px; padding-left:10px;  padding-top:10px;">여자</p>								
											</c:otherwise>									
										</c:choose> --%>
										
										<c:if test="${memInfo.mgender == '1' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">남자</p>
										</c:if>
										<c:if test="${memInfo.mgender == '2' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">여자</p>
										</c:if>
										<c:if test="${memInfo.mgender == '3' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">선택하지않음</p>
										</c:if>
								 <select name="mgender" id="gender-select" class="form-control">
									<option value="" disabled selected>--선택해주세요--</option>
									<option value="1">남성</option>
									<option value="2">여성</option>
									<option value="0">선택하지 않음</option>

								</select>
								
									</div>
										

							
							</div>
							<div class="col-md-6">
								<label class="form-label">휴대폰번호</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mphone" class="form-control" id="inputMid"
									 value="${memInfo.mphone }" >
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이메일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="memail" class="form-control" id="inputMid"
									 value="${memInfo.memail }" >
										
									</div>
							</div>
							<!-- </form> -->
							
							<div class="text-center modifyCol">
								<button type="submit" class="btn btn-secondary" style="margin-top: 10px; margin-left: 520px;">
		                                    글수정
		                            </button>
							</div>
							
						</div>
					</div>
				</div>
				
				<%-- </c:forEach> --%>
				</form>
				</div>
			
		</section>
<script type="text/javascript">
/* 	function writeReview(loginId,mname){
		window.open('${pageContext.request.contextPath }/memberModifyPage?loginId='+loginId+"&mname="+mname,'memberModify',"width=750,heigh=400, top=100, left=500");
	}
 */

	
/* 	 function modifyForm(formObj){
		var mid = formObj.mid.value;
		var mname =formObj.mname.value;
		var mbirth = formObj.mbirth.value;
		var mgender = formObj.mgender.value;
		var mphone = formObj.mphone.value;
		var memail = formObj.memail.value;
		console.log("ddd");
		console.log(mid);
		console.log(mname);
		console.log(mbirth);
		console.log(mgender);
		console.log(mphone);
		console.log(memail);
		$.ajax({
			url:"${pageContext.request.contextPath }/memberModify",
			type:"post",
			data:{"mid":mid, "mname":mname, "mbirth":mbirth, "mgender":mgender, "mphone":mphone, "memail":memail },
			async:false,
			success :function(result){
				 if(result =='1'){
					alert("작성완료되었습니다");
					window.opener.location.reload();
				}else{
					alert("작성실패");
				}
			}
		})
//		window.opener.location.reload();
		window.close();
		return false;
	} 
  */
  var Msg = '${Msg}';
	if(Msg.length > 0 ){
		alert(Msg);
	}

  function modifyFormCheck(modifyForm){
	   var modifyForm = modifyForm.mgender;
	   if(modifyForm.value == 0){
	      alert('성별을 눌러주세요!');
	      modifyForm.focus();
	      return false;
	   }
	}

		
		
	}
 
	</script> 
	<script
   src="${pageContext.request.contextPath }/resources/plugins/jquery/jquery.js"></script>
</body>
</html>