<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Menu.jsp" %>
	<h3>UOM REGISTER PAGE !!</h3>
	<form:form action="save" method="post" modelAttribute="uom">
		<pre>
UomType:
     <form:select path="uomType">
        <form:option value="">---SELECT---</form:option>
        <form:option value="PACKING">PACKING</form:option>
        <form:option value="NO PACKING">NO PACKING</form:option>
        <form:option value="-NA-">-NA-</form:option>
     </form:select>
     
UomModel:
    <form:input path="uomModel"/>
    
Description:
    <form:textarea path="uomDesc"></form:textarea>
    
    <input type="submit" value="CREATE UOM">
</pre>
	</form:form>
	${message}
</body>
</html>