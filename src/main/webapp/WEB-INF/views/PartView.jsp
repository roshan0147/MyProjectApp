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
<H3>WELCOME TO PART VIEW PAGE !</H3>
<table border="1">
    <tr>
      <th>ID</th><td>${ob.partId}</td>
    </tr>
    <tr>
      <th>CODE</th><td>${ob.partCode}</td>
    </tr>
    <tr>
      <th>WIDTH</th><td>${ob.partWidth}</td>
    </tr>
    <tr>
      <th>LENGHT</th><td>${ob.partLenght}</td>
    </tr>
    <tr>
      <th>HEIGHT</th><td>${ob.partHeight}</td>
    </tr>
    <tr>
      <th>COST</th><td>${ob.partBaseCost}</td>
    </tr>
    <tr>
      <th>CURRENCY</th><td>${ob.partBaseCurrency}</td>
    </tr>
    <tr>
      <th>NOTES</th><td>${ob.partDesc}</td>
    </tr>
</table>
</body>
</html>