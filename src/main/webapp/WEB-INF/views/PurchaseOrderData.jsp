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
         <div class="card-header bg-info text-center">
            <h4>PurchaseOrder All Data</h4>
         </div>
         <div class="card-body">
            <table class="table">
            <tr>
               <th>ID</th>
               <th>ORDER CODE</th>
               <th>SHIPMENT CODE</th>
               <th>VENDOR</th>
               <th>REFNUMBER</th>
               <th>QCHECK</th>
               <th>STATUS</th>
               <th>NOTE</th>
               <th>OPERATIONS</th>
            </tr>
            <c:forEach items="${list}" var="ob">
              <tr>
                 <td>${ob.poId}</td>
                 <td>${ob.orderCode}</td>
                 <td>${ob.shipOb.shipCode}</td>
                 <td>${ob.whOb.userCode}</td>
                 <td>${ob.referenceNumber}</td>
                 <td>${ob.qualityCheck}</td>
                 <td>${ob.defaultStatus}</td>
                 <td>${ob.description}</td>
                 <td><a href="delete?poid=${ob.poId}" class="btn btn-danger">DELETE</a></td>
						<td><a href="edit?poid=${ob.poId}" class="btn btn-success">EDIT</a></td>
						<td><a href="view?poid=${ob.poId}" class="btn btn-info">VIEW</a></td>
              </tr>
            </c:forEach>
            </table>
         </div>
     </div>

</div>
</body>
</html>