<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<table>
			<thead>
				<tr>
					<th>대표메뉴1 이미지</th>
					<th>대표메뉴1 이름</th>
					<th>대표메뉴1 가격</th>
					<th>대표메뉴2 이미지</th>
					<th>대표메뉴2 이름</th>
					<th>대표메뉴2 가격</th>
					<th>대표메뉴3 이미지</th>
					<th>대표메뉴3 이름</th>
					<th>대표메뉴3 가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${selectFmenu }" var="selectFmenu">
					<tr>
						<td><img src="${pageContext.request.contextPath }/resources/FoodPicture/${selectFmenu.mpicture1 }"></td>
						<td>${selectFmenu.menuname1 }</td>
						<td>${selectFmenu.menuprice1 }</td>
						
						<td><img src="${pageContext.request.contextPath }/resources/FoodPicture/${selectFmenu.mpicture2 }"></td>
						<td>${selectFmenu.menuname2 }</td>
						<td>${selectFmenu.menuprice2 }</td>
						
						<td><img src="${pageContext.request.contextPath }/resources/FoodPicture/${selectFmenu.mpicture3 }"></td>
						<td>${selectFmenu.menuname3 }</td>
						<td>${selectFmenu.menuprice3 }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	
	
	
	<input type="button" value="창닫기" onclick="window.close()">
</body>
</html>