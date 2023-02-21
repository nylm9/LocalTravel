<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
  transform: translateX(-50%);
  opacity: 0;
  transition: .8s;
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
    background: url(https://cdn.pixabay.com/photo/2020/07/14/16/18/snow-5404785_960_720.jpg) no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

.image2 {
    background: url(https://cdn.pixabay.com/photo/2022/08/23/06/55/village-7405160_960_720.jpg) no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

.image3 {
    background: url(
https://cdn.pixabay.com/photo/2022/08/30/15/33/nature-7421337_960_720.jpg) no-repeat;
  background-attachment: fixed;
  background-size: cover;
}

 /* ----------- */

.text {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  color: #fff;
  background: #1e3932;
  font-size: .9rem;
}

@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");

* {
  font-family: Pretendard;
  padding: 0;
  margin: 0;
}

</style>
			<!-- newMainTest JS -->
</head>
<body>
  <div class="image1"></div>

<div class="text">
  <h2>
    background-attachment <br><br>
    - scroll (기본) <br>
    - fixed (고정)<br>
  </h2>
</div>

<div class="image2"></div>

<div class="text">
  <h2>
    background-attachment 속성으로, <br>
    배경 이미지를 고정시켜보세요!
  </h2>
</div>

<div class="image3"></div>
</body>

		<script src="${pageContext.request.contextPath }/resources/newMainPage/newMainTest.js"></script>
<script type="text/javascript">




</script>

</html>