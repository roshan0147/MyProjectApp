<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H3>WELCOME TO PURCHASE ORDER PAGE !</H3>
<form:form action="save" method="POST" modelAttribute="purchaseOrder">
   <pre>
     Order Code:
           <form:input path="OrderCode"/>
     
     Shipment Code:
           <form:select path="shipmentCode">
             <form:option value="">--SELECT--</form:option>
           </form:select>
   
     Vendor:
           <form:select path="vendor">
              <form:option value="">--SELECT--</form:option>
           </form:select>
   
 Reference Number:
           <form:input path="referenceNumber"/>
           
 Quality Check:
           <form:radiobutton path="qualityCheck" value="Required"/>Required
           <form:radiobutton path="qualityCheck" value="Not Required"/>Not Required
  
  Default Status:
           <form:input path="defaultStatus"/>
           
  Description:
           <form:textarea path="description"/>
           
           <input type="submit" value="Place Order">         
  
   </pre>

</form:form>
${message}
</body>
</html>