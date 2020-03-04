<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Menu.jsp" %>
<div class="container">
<a href="excel?id=${ob.shipId}">Excel Export</a>|
<a href="pdf?id=${ob.shipId}">PDF Export</a>

	<table class="table">
		<tr>
			<th>ID</th>
			<td>${ob.shipId}</td>
		</tr>
		<tr>
			<th>MODE</th>
			<td>${ob.shipMode}</td>
		</tr>
		<tr>
			<th>CODE</th>
			<td>${ob.shipCode}</td>
		</tr>
		<tr>
			<th>ENABLE</th>
			<td>${ob.enbShip}</td>
		</tr>
		<tr>
			<th>GRADE</th>
			<td>${ob.shipGrade}</td>
		</tr>
		<tr>
			<th>NOTE</th>
			<td>${ob.shipDesc}</td>
		</tr>
	</table>
	</div>
</body>
</html>