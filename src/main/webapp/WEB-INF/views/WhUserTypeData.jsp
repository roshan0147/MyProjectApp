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
<%@include file="Menu.jsp" %>
     <div class="container">
     <div class="card">
        <div class="card-header bg-info text-white text-center">
             <H3>WELCOME TO WHUSERTYPE DATA PAGE !!</H3>
        </div>
        <div class="card-body">
             <a href="excel">Excel Export</a>
	<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list }">
			<table class="table">
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
						<td><a href="delete?wid=${ob.userId}" class="btn btn-danger">DELETE</a></td>
						<td><a href="view?wid=${ob.userId}" class="btn btn-primary">VIEW</a></td>
						<td><a href="edit?wid=${ob.userId}" class="btn btn-success">EDIT</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h3>DATA NOT FOUND !!</h3>
		</c:otherwise>
	</c:choose>
        </div>
     </div>
	
	
	</div>
</body>
</html>