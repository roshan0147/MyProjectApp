<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<H3>WELCOME TO WHUSERTYPE DATA PAGE !!</H3>
	<a href="excel">Excel Export</a>
	<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list }">
			<table border="1">
				<tr>
					<th>ID</th>
					<th>TYPE</th>
					<th>CODE</th>
					<th>FOR</th>
					<th>MAIL</th>
					<th>CONTACT</th>
					<th>IDTYPE</th>
					<th>IDNUMBER</th>
					<th colspan="3">OPERATIONS</th>
				</tr>
				<c:forEach items="${list}" var="ob">
					<tr>
						<td>${ob.userId}</td>
						<td>${ob.userType}</td>
						<td>${ob.userCode}</td>
						<td>${ob.userFor}</td>
						<td>${ob.userMail}</td>
						<td>${ob.userContact}</td>
						<td>${ob.userIdType}</td>
						<td>${ob.userIdNumber}</td>
						<td><a href="delete?wid=${ob.userId}">DELETE</a></td>
						<td><a href="view?wid=${ob.userId}">VIEW</a></td>
						<td><a href="edit?wid=${ob.userId}">EDIT</a></td>
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