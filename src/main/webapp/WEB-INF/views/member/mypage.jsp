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
<title>마이페이지</title>

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
			    
			    
				<c:forEach items="${memberList }" var="memInfo">
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" id="memberListArea">
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">내정보</p>
							</div>
							
							<%-- <form class="row g-3"
							action="${pageContext.request.contextPath }/memberJoin"
							method="post" enctype="multipart/form-data"
							onsubmit="return joinFormCheck(this)"
							style="margin-left: 200px;"
							> --%>
							
							<div class="col-md-6">
								<label class="form-label">아이디</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
										<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MID }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이름</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MNAME }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">생년월일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MBIRTH }" readonly>
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
										
										<c:if test="${memInfo.MGENDER == '1' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">남자</p>
										</c:if>
										<c:if test="${memInfo.MGENDER == '2' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">여자</p>
										</c:if>
										<c:if test="${memInfo.MGENDER == '3' }">
											<p style="font-size:15px; padding-left:10px;  padding-top:10px;">선택하지않음</p>
										</c:if>
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">휴대폰번호</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MPHONE }" readonly>
										
									</div>
							</div>
							<div class="col-md-6">
								<label class="form-label">이메일</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
									<input type="text" name="mid" class="form-control" id="inputMid"
									 value="${memInfo.MEMAIL }" readonly>
										
									</div>
							</div>
							<!-- </form> -->
							
							<div class="text-center modifyCol">
								
									<a  class="btn btn-secondary" style="margin-top: 10px; margin-left: 520px;"
									href="${pageContext.request.contextPath }/memberModifyPage?loginId=${loginId }">
		                                    글수정
		                            </a>
							</div>
							
						</div>
					</div>
				</div>
				
				</c:forEach>
				
				</div>
			
		</section>
		<section class="section"  style="margin-top: 40px;">
			<div class="row mx-auto" style="max-width:1200px;min-width:700px;">
			   <c:forEach items="${likeList }" var="likeList">
				
				<div class="col-12">
					<div class="card mb-3" style="padding:20px;">
						<div class="row g-0" >
						
						
						
							<div class="col-12">
								<p class="text-center pb-0 fs-4" style="font-weight:bold;color:black;">저장한 목록</p>
							</div>
							<div class="col-md-6">
								<label class="form-label">놀거리저장리스트</label> 
									<div style="border: 1px solid #f0f1f4 ; background-color:#f0f1f4">
								<p>${likeList.lbcode }</p>
									 
								</div>
							</div>
						
						</div>
					</div>
				</div>
				
				 </c:forEach> 
				
				</div>
			
		</section>
		
</body>
</html>