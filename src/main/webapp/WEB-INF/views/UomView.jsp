<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H3>WELCOME TO UOM VIEW PAGE !!</H3>
<a href="excel?id=${ob.uomId}">Excel Export</a>|
<a href="pdf?id=${ob.uomId}">PDF Export</a>
<table border="1">
   <tr>
     <th>ID</th><td>${ob.uomId}</td>
   </tr>
   <tr>
     <th>TYPE</th><td>${ob.uomType}</td>
   </tr>
   <tr>
     <th>MODEL</th><td>${ob.uomModel}</td>
   </tr>
   <tr>
     <th>NOTE</th><td>${ob.uomDesc}</td>
   </tr>


</table>
</body>
</html>