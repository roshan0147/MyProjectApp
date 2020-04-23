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
                <h3>UOM DATA PAGE !!!</h3>
          </div>
         
	<div class="card-body">
	<a href="excel">Excel Export</a>
	<a href="pdf">PDF Export</a>
	<c:choose>
		<c:when test="${!empty list}">
			<table class="table">
				<tr>
					
					<th>TYPE</th>
					<th>MODEL</th>
					<th>DESC</th>
					<th colspan="3">OPERATIONS</th>
				</tr>
				<c:forEach items="${list}" var="ob">
					<tr>
						
						<td>${ob.uomType}</td>
						<td>${ob.uomModel}</td>
						<td>${ob.uomDesc}</td>
						<td><a href="delete?uid=${ob.uomId}" class="btn btn-danger">DELETE</a></td>
					    <td><a href="view?uid=${ob.uomId}" class="btn btn-success">VIEW</a></td>
					    <td><a href="edit?uid=${ob.uomId}" class="btn btn-primary">EDIT</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			<h1>DATA NOT FOUND !!</h1>
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	</div>
</body>
</html>