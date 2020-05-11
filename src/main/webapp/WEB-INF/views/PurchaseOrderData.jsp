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
              	 <td><a href="parts?poid=${ob.poId}" class="btn btn-info">Add Parts</a></td>
              	 <td>
			   <c:choose>
				<c:when test="${'ORDERED' eq ob.defaultStatus}">
					<a href="invoceOrder?poId=${ob.poId}" class="btn btn-success">GENERATE INVOICE</a>
				</c:when>
				<c:when test="${'INVOICED' eq ob.defaultStatus}">
					<a href="downloadInvoce?poId=${ob.poId}" class="btn btn-info">DOWNLOAD INVOICE</a>
				</c:when>
				<c:when test="${'RECEVIED' eq ob.defaultStatus}">
					<b class="text-success">ORDER IS USED IN GRN</b>
				</c:when>
				<c:otherwise>
					ORDER MUST BE PLACED
				</c:otherwise>
			</c:choose>
			</td>
              
              </tr>
            </c:forEach>
            </table>
         </div>
     </div>

</div>
</body>
</html>