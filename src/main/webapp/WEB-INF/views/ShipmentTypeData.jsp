<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<H3>ALL SHIPMENTTYPE DATA !!</H3>
	<a href="excel">Excel Export</a>|<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list }">
			<table border="1">
				<tr>
					<th>ID</th>
					<th>MODE</th>
					<th>CODE</th>
					<th>ENABLE</th>
					<th>GRADE</th>
					<th>DESC</th>
					<th colspan="3">OPERATIONS</th>
				</tr>
				<c:forEach items="${list}" var="ob">
					<tr>
						<td>${ob.shipId}</td>
						<td>${ob.shipMode}</td>
						<td>${ob.shipCode}</td>
						<td>${ob.enbShip}</td>
						<td>${ob.shipGrade}</td>
						<td>${ob.shipDesc}</td>
						<td><a href="delete?sid=${ob.shipId}">DELETE</a></td>
						<td><a href="edit?sid=${ob.shipId}">EDIT</a></td>
						<td><a href="view?sid=${ob.shipId}">VIEW</a></td>
					</tr>
				</c:forEach>
				<tr></tr>
			</table>
		</c:when>
		<c:otherwise>
			<H3>DATA NOT FOUND !</H3>
		</c:otherwise>
	</c:choose>
</body>
</html>