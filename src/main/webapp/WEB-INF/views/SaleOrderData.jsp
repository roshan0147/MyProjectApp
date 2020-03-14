<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <h3>Welcome to SaleOrder Data Page</h3>
           </div>
           <div class="card-body">
                <table class="table">
                    <tr>
                       <th>ID</th>
                       <th>CODE</th>
                       <th>Ref Num</th>
                       <th>Mode</th>
                       <th>Source</th>
                       <th>Status</th>
                       <th>Note</th>
                       <th>ShipCode</th>
                       <th>CustCode</th>
                       <th>Operations</th>
                    </tr>
                <c:forEach items="${list }" var="ob">
                    <tr>
                      <td><c:out value="${ob.soId}"></c:out></td>
                      <td><c:out value="${ob.orderCode}"></c:out></td>
                      <td><c:out value="${ob.refNumber}"></c:out></td>
                      <td><c:out value="${ob.stockMode}"></c:out></td>
                      <td><c:out value="${ob.stockSource}"></c:out></td>
                      <td><c:out value="${ob.defaultStatus}"></c:out></td>
                      <td><c:out value="${ob.description}"></c:out></td>
                      <td><c:out value="${ob.shipmentOb.shipCode}"></c:out></td>
                      <td><c:out value="${ob.whUserOb.userCode}"></c:out></td>
                      <td><a href="delete?soid=${ob.soId}" class="btn btn-danger">DELETE</a></td>
					  <td><a href="view?soid=${ob.soId}" class="btn btn-success">VIEW</a></td>
					  <td><a href="edit?soid=${ob.soId}" class="btn btn-primary">EDIT</a></td>
                    </tr>
                </c:forEach>
                </table>
           </div>
        </div>
    
    </div>
</body>
</html>