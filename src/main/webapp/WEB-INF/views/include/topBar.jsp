<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header-top justify-content-center" style="background: #F7F5EB;">
  <div class="container">
    <!-- <div class="row align-items-center"> -->
      <div class="col-lg-2 col-md-4 text-center d-none d-lg-block">
      <!-- 로고 -->
      <div class="navbar-brand ">
      	<nav class="navbar navbar-expand-lg navigation-2 navigation">
		      	<div style="margin-left:-220%;">
			          <a  href="${pageContext.request.contextPath }/testMainPage">
			          	<span style="float:left; margin-right:1px; margin-top:12px;">Tripick</span>
			           <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image"
			           style="width:40px; height:40px;">
			          </a>
		         </div>
	           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
	              <span class="ti-menu"></span>
	            </button>
			
                <div class="collapse navbar-collapse"id="navbar-collapse" style="position:absolute;left:600%;"> 
                  <ul id="menu" class="menu navbar-nav mx-auto" >
                      <li class="nav-item"><a href="${pageContext.request.contextPath }/reservePage" class="nav-link">예약하기</a></li>
                      <li  class="nav-item"><a href="${pageContext.request.contextPath }/enjoyPage"class="nav-link">놀거리</a></li>
                      <li  class="nav-item"><a href="${pageContext.request.contextPath }/foodPage"class="nav-link">먹거리</a></li>
                        <c:choose>
					        <c:when test="${sessionScope.loginId == null }"> <%-- 로그인이 되어 있지 않을 경우 --%>
					              <li  class="nav-item"><a href="${pageContext.request.contextPath }/memberLoginForm"class="nav-link">로그인</a></li>
					              <li  class="nav-item"><a href="${pageContext.request.contextPath }/testMemberJoinCheckForm"class="nav-link">회원가입</a></li>  
					        </c:when>
					        <c:otherwise> 
					              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/memberLogout"class="nav-link">로그아웃</a></li>
					              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/myPage"class="nav-link">마이페이지</a></li>
					        </c:otherwise>
       				   </c:choose>
					   <c:choose>
							 <c:when test="${sessionScope.loginId == 'admin' }">
							  
							 <ul id="menu" class="menu navbar-nav mx-auto"  style="position:absolute;top:0%;left:-50%;">
								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath }/AdminPage">데이터 입력</a> </li>
								<li class="nav-item"><a class="nav-link"
										href="${pageContext.request.contextPath }/AdminDataPage">데이터 조회</a></li>
										
								</ul>		
										
								
								
							</c:when>
						<c:otherwise>
						</c:otherwise>
					  </c:choose>
					</ul>
				</div>
			</nav>
         </div>
      </div>

      <div class="col-lg-8 col-md-12"><!-- class="col-lg-8 col-md-12" -->
        <nav class="navbar navbar-expand-lg navigation-2 navigation">
          <a class="navbar-brand text-uppercase d-lg-none" href="${pageContext.request.contextPath }/mainPage">
            <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="" class="img-fluid"
            style="width:60px;">
          </a>
          </nav>
        </div>
        

        
    </div>

</header>