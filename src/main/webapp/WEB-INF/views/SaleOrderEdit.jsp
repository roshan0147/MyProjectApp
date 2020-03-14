<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
           <H3>WELCOME TO SALE ORDER PAGE</H3>
        </div>
        <div class="card-body">
            <form:form action="update" method="POST" modelAttribute="saleOrder">
                 <div class="row mb-3">
                    <div class="col-4">
                        ID
                    </div>
                    <div class="col-4">
                         <form:input path="soId" class="form-control" readonly="true"/>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-4">
                        Order Code
                    </div>
                    <div class="col-4">
                         <form:input path="orderCode" class="form-control"/>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
               <div class="row mb-3">
                    <div class="col-4">
                        Shipment Code
                    </div>
                    <div class="col-4">
                         <form:select path="shipmentOb.shipId" class="form-control">
                           <form:option value="">--SELECT</form:option>
                           <form:options items="${shipMap}"/>
                         </form:select>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-4">
                        Customer
                    </div>
                    <div class="col-4">
                         <form:select path="whUserOb.userId" class="form-control">
                           <form:option value="">--SELECT</form:option>
                           <form:options items="${whMap}"/>
                         </form:select>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-4">
                        Reference Number
                    </div>
                    <div class="col-4">
                        <form:input path="refNumber" class="form-control"/>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-4">
                        Stock Mode
                    </div>
                    <div class="col-4">
                        <form:radiobutton path="stockMode" value="GRADE"/>GRADE
                        <form:radiobutton path="stockMode" value="MARGIN"/>MARGIN
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-4">
                        Stock Source
                    </div>
                    <div class="col-4">
                         <form:select path="stockSource" class="form-control">
                           <form:option value="">--SELECT</form:option>
                           <form:option value="OPEN">OPEN</form:option>
                           <form:option value="AVAILABLE">AVAILABLE</form:option>
                           <form:option value="REFUND">REFUND</form:option>
                         </form:select>
                    </div>
                    <div class="col-4">
                    
                    </div>
                </div>
                 <div class="row mb-3">
                      <div class="col-4">
                          Status
                      </div>
                      <div class="col-4">
                         <form:input path="defaultStatus" readonly="true" class="form-control"/>
                      </div>
                      <div class="col-4">
                      
                      </div>
                 </div>
                  <div class="row mb-3">
                      <div class="col-4">
                          Description
                      </div>
                      <div class="col-4">
                         <form:textarea path="description" class="form-control"/>
                      </div>
                      <div class="col-4">
                      
                      </div>
                 </div>
                 <div class="row mb-3">
                      <div class="col-4">
                          
                      </div>
                      <div class="col-4">
                         <input type="submit" value="Update" class="btn btn-success">
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