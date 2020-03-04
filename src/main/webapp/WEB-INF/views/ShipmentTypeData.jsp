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
<%@include file="Menu.jsp" %>
    <div class="container">
    <div class="card">
       <div class="card-header text-center text-white bg-info">
         <h3> ALL SHIPMENTTYPE DATA</h3>
       </div>
       <div class="card-body">
	<a href="excel">Excel Export</a>|<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list }">
			<table class="table table-hover">
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
						<td><a href="delete?sid=${ob.shipId}" class="btn btn-danger">DELETE</a></td>
						<td><a href="edit?sid=${ob.shipId}" class="btn btn-success">EDIT</a></td>
						<td><a href="view?sid=${ob.shipId}" class="btn btn-info">VIEW</a></td>
					</tr>
				</c:forEach>
				<tr></tr>
			</table>
		</c:when>
		<c:otherwise>
			<H3>DATA NOT FOUND !</H3>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	</div>
</body>
</html>