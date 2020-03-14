<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
       <div class="card-header bg-info text-center text-white">
             <h3>UOM REGISTER PAGE !!</h3>
       </div>
       <div class="card-body">
           <form:form action="save" method="post" modelAttribute="uom">
         <div class="row">
              <div class="col-4">
                  UomType:
              </div>
              <div class="col-4">
                  <form:select path="uomType" class="form-control mb-3">
        <form:option value="">---SELECT---</form:option>
        <form:option value="PACKING">PACKING</form:option>
        <form:option value="NO PACKING">NO PACKING</form:option>
        <form:option value="-NA-">-NA-</form:option>
     </form:select>
              </div>
              <div class="col-4">
              
              </div>
         </div>
       <div class="row">
            <div class="col-4">
               UomModel:
            </div>
            <div class="col-4">
                <form:input path="uomModel" class="form-control mb-3"/>
            </div>
            <div class="col-4">
            
            </div>
       </div>
     
     <div class="row">
         <div class="col-4">
              Description:
         </div>
         <div class="col-4">
               <form:textarea path="uomDesc" class="form-control mb-3"/>
         </div>
         <div class="col-4">
         
         </div>
     </div>
     <div class="row">
         <div class="col-4">
         
         </div>
         <div class="col-4">
             <input type="submit" value="CREATE UOM" class="btn btn-primary">
         </div>
         <div class="col-4">
         
         </div>
     </div>
    
	</form:form>
       </div>
       <c:if test="${!empty message }">
           <div class="card-footer text-primary">
               ${message}
           </div>
       </c:if>
   </div>
</div>
	
</body>
</html>