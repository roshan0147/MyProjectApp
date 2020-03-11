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
    <div class="card-header bg-info text-center">
    <H3>WELCOME TO PART DATA PAGE !!</H3>
    </div>
    <div class="card-body">
     <table class="table table-hover">
  <tr>
     <th>ID</th>
     <th>CODE</th>
     <th>WIDTH</th>
     <th>LENGHT</th>
     <th>HEIGHT</th>
     <th>COST</th>
     <th>CURRENCY</th>
     <th>UOM</th>
     <th>SALE CODE</th>
     <th>PURCHASE CODE</th>
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
           <td>${ob.baseCost}</td>
           <td>${ob.baseCurrency}</td>
           <td>${ob.uomOb.uomModel}</td>
           <td>${ob.omSalesOb.orderCode}</td>
           <td>${ob.omPurchaseOb.orderCode}</td>
           <td>${ob.note}</td>
           <td><a href="delete?pid=${ob.partId}" class="btn btn-danger">DELETE</a></td>
		   <td><a href="edit?pid=${ob.partId}" class="btn btn-success">EDIT</a></td>
		   <td><a href="view?pid=${ob.partId}" class="btn btn-warning">VIEW</a></td>
       </tr>
    </c:forEach>
</table>
    
    </div>
</div>

</div>
</body>
</html>