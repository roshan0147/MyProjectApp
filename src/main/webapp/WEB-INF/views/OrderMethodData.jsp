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
	<H3>WELCOME TO ORDER METHOD DATA PAGE !!</H3>
	<a href="excel">Excel Export</a>
	<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list }">
			<table border="1">
				<tr>
					<th>ID</th>
					<th>MODE</th>
					<th>CODE</th>
					<th>TYPE</th>
					<th>ACCEPT</th>
					<th>DESCRIPTION</th>
					<th colspan="3">OPERATIONS</th>
				</tr>
				<c:forEach items="${list}" var="ob">
					<tr>
						<td>${ob.orderId}</td>
						<td>${ob.orderMode}</td>
						<td>${ob.orderCode}</td>
						<td>${ob.orderType}</td>
						<td>${ob.orderAccept}</td>
						<td>${ob.orderDesc}</td>
						<td><a href="delete?oid=${ob.orderId}">DELETE</a></td>
						<td><a href="view?oid=${ob.orderId}">VIEW</a></td>
						<td><a href="edit?oid=${ob.orderId}">EDIT</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h3>DATA NOT FOUND !!</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>