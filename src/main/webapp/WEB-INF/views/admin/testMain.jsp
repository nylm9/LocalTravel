<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Gowun+Dodum&display=swap');
h2 {
  transform: translateX(-50%);
  opacity: 0;
  transition: .8s;
  font-family: 'Black Han Sans', sans-serif;
}

h2.active {
  transform: translateX(0);
  opacity: 1;
}

div {
  width: 100%;
  height: 100vh;
  position: relative;
}

.image1 {
    /* background: url(https://cdn.pixabay.com/photo/2020/07/14/16/18/snow-5404785_960_720.jpg) no-repeat; */
    /* background: url(https://wallpapercave.com/dwp2x/wp5973934.jpg) no-repeat; 벚꽃사진 */
     background: url("${pageContext.request.contextPath }/resources/newMainPage/main1.jpg") no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

.image2 {
    background: url(https://cdn.pixabay.com/photo/2022/08/23/06/55/village-7405160_960_720.jpg) no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

/* .image3 {
    background: url(
https://cdn.pixabay.com/photo/2022/08/30/15/33/nature-7421337_960_720.jpg) no-repeat;
  background-attachment: fixed;
  background-size: cover;
} */

 /* ----------- */

.text {
  display: flex;
  justify-content: center;
  align-items: center;
  /* text-align: center; */ 
  color: #fff;
  background: #A0C3D2;
  /* 여기에 색깔 코드 넣으면 됨. */
  font-size: .9rem;
    background-size: cover;
}

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");
 
 
* {
  font-family: Pretendard;
  padding: 0;
  margin: 0;
}

.logo-container {
  position: absolute;
  top: 15px;
  left: 0;
}

.logo-container img {
  width: 40px;
  height: 40px;
}

</style>
			<!-- newMainTest JS -->
</head>


<body>

<div class="text">
		
<div class="logo-container" style="margin-bottom: 50px;" >
  <span style="margin-left: 20px; margin-right: 1px; margin-top: 12px; color: black; font-size: 20px;" >Tripick</span>
  <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image">
</div>
		
		<h2 style="font-size: 3em; font-weight: 100">
			여행을 떠나시나요?
			<!--     background-attachment <br><br>
    - scroll (기본) <br>
    - fixed (고정)<br> -->
		</h2>
	</div>


  <div class="image1"></div>

<div class="text">

<div class="logo-container" >
  <span style="margin-left: 20px; margin-right: 1px; margin-top: 12px; color: black; font-size: 20px;" >Tripick</span>
  <img src="${pageContext.request.contextPath }/resources/free-icon-passenger-train-6666868.png" alt="image">
</div>

<h2 style="font-size: 3em; font-weight: 100">
  
  트립픽이 도와드릴게요!
<!--     background-attachment <br><br>
    - scroll (기본) <br>
    - fixed (고정)<br> -->
  </h2>
  
</div>

<!-- <div class="image2"></div>

<div class="text">
  <h2>
    background-attachment 속성으로, <br>
    배경 이미지를 고정시켜보세요!
    []와 함께 즐거운 여행 하세요!
  </h2>
</div>

<div class="image3"></div> -->


</body>

		<script src="${pageContext.request.contextPath }/resources/newMainPage/newMainTest.js"></script>
<script type="text/javascript">

  window.addEventListener('scroll', function() {
	  var windowHeight = window.innerHeight; // 브라우저 창의 높이
	  var bodyHeight = document.body.offsetHeight; // body의 전체 높이
	  var scrollTop = document.documentElement.scrollTop; // 스크롤 위치
	  if (windowHeight + scrollTop >= bodyHeight) {
	    // 스크롤이 최하단에 도달한 경우
	    location.href = '${pageContext.request.contextPath }/mainPage'; // 메인페이지로 이동
	  }
	});  


</script>

</html>