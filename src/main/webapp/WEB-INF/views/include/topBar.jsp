<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header-top justify-content-center" style="background: #FFEBFF;">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-2 col-md-4 text-center d-none d-lg-block">
      <!-- 로고 -->
      	<div class="navbar-brand " style="margin-left:-5px;">
          <a href="${pageContext.request.contextPath }/mainPage">
          	<span style="float:left; margin-right:1px; margin-top:12px;">sourceTree</span>
           <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image"
           style="width:40px; height:40px;">
          </a>
         </div>
      </div>

      <div class="col-lg-8 col-md-12">
        <nav class="navbar navbar-expand-lg navigation-2 navigation">
          <a class="navbar-brand text-uppercase d-lg-none" href="${pageContext.request.contextPath }/mainPage">
            <img src="${pageContext.request.contextPath }/resources/images/logo.png" alt="" class="img-fluid">
          </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse" aria-controls="navbar-collapse" aria-expanded="false" aria-label="Toggle navigation">
              <span class="ti-menu"></span>
            </button>

              <div class="collapse navbar-collapse" id="navbar-collapse">
                  <ul id="menu" class="menu navbar-nav mx-auto">
                      <li class="nav-item dropdown">
                          <%-- <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath }/reservePage" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          예약하기
                          </a> --%>
                           <li class="nav-item"><a href="${pageContext.request.contextPath }/reservePage" class="nav-link">예약하기</a></li>
                      </li>
                      
                      <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          지역별
                          </a>
                          <div class="dropdown-menu" aria-labelledby="navbarDropdown2">
                            <a class="dropdown-item" href="${pageContext.request.contextPath }/enjoyPage">놀거리</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath }/foodPage">먹거리</a>
                         
                          </div>
                      </li>

							<li class="nav-item"><a href="about.html" class="nav-link">정산</a></li>
							<c:choose>
								<c:when test="${sessionScope.loginId == 'admin' }">
									<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#"
										id="navbarDropdown2" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false"> 관리자페이지 </a>
										<div class="dropdown-menu" aria-labelledby="navbarDropdown2">
											<a class="dropdown-item"
												href="${pageContext.request.contextPath }/AdminPage">데이터 입력</a> <a
												class="dropdown-item"
												href="${pageContext.request.contextPath }/AdminDataPage">데이터 조회</a>
												
										</div>
									</li>
								</c:when>
								<c:otherwise>
								</c:otherwise>

							</c:choose>

						</ul>
                  
<!--                    <ul class="list-inline mb-0 d-block d-lg-none">
                    <li class="list-inline-item"><a href="#">로그인</a></li>
                    <li class="list-inline-item"><a href="#">회원가입</a></li>
                  </ul> -->
              </div>
          </nav>
        </div>
        
        <c:choose>
        <c:when test="${sessionScope.loginId == null }"> <%-- 로그인이 되어 있지 않을 경우 --%>
        <div class="col-lg-2 col-md-4 col-6">
          <div class="header-socials-2 text-right d-none d-lg-block">
            <ul class="list-inline mb-0">
              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/memberLoginForm">로그인</a></li>
              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/testMemberJoinCheckForm">회원가입</a></li>  
             
            </ul>
          </div>
        </div>
        </c:when>
        
        <c:otherwise> 
        	
              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/memberLogout">로그아웃</a></li>
              <li class="list-inline-item"><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
        </c:otherwise>
        </c:choose>
        
    </div>
  </div>
</header>