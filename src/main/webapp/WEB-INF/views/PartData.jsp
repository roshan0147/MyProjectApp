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
<H3>WELCOME TO PART DATA PAGE !!</H3>
<table border="1">
  <tr>
     <th>ID</th>
     <th>CODE</th>
     <th>WIDTH</th>
     <th>LENGHT</th>
     <th>HEIGHT</th>
     <th>COST</th>
     <th>CURRENCY</th>
     <th>NOTE</th>
     <th colspan="3">OPERATIONS</th>
  </tr>
    <c:forEach items="${list}" var="ob">
       <tr>
           <td>${ob.partId}</td>
           <td>${ob.partCode}</td>
           <td>${ob.partWidth}</td>
           <td>${ob.partLenght}</td>
           <td>${ob.partHeight}</td>
           <td>${ob.partBaseCost}</td>
           <td>${ob.partBaseCurrency}</td>
           <td>${ob.partDesc}</td>
           <td><a href="delete?pid=${ob.partId}">DELETE</a></td>
		   <td><a href="edit?pid=${ob.partId}">EDIT</a></td>
		   <td><a href="view?pid=${ob.partId}">VIEW</a></td>
       </tr>
    </c:forEach>
</table>
</body>
</html>