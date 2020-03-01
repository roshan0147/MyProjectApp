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
<H3>WELCOME TO EDIT PAGE !!</H3>
<form:form action="update" method="POST" modelAttribute="part">
    <pre>
       ID:       <form:input path="partId" readonly="true"/>
       CODE:
                 <form:input path="partCode"/>
          
       DIMENSION:
           WIDTH <form:input path="partWidth"/> LENGHT <form:input path="partLenght"/> HEIGHT <form:input path="partHeight"/>
    
       BASE COST:
                 <form:input path="partBaseCost"/>
              
       BASE CURRENCY:
                 <form:select path="partBaseCurrency">
                  <form:option value="">--SELECT--</form:option>
                  <form:option value="INR">INR</form:option>
                  <form:option value="USD">USD</form:option>
                  <form:option value="AUS">AUS</form:option>
                  <form:option value="ERU">ERU</form:option>
                 </form:select>
              
       DESCRIPTION:
                  <form:textarea path="partDesc"/>
             
                  <input type="submit" value="Update"/>
          </pre>
   </form:form>
 
</body>
</html>