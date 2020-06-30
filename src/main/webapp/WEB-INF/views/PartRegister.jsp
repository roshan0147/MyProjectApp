<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Menu.jsp"%>

	<div class="container">
		<div class="card">
			<div class="card-header bg-info text-white text-center">
				<H3>WELCOME TO PART PAGE !!</H3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="part">
					<div class="row">
						<div class="col-4">CODE<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="partCode" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">WIDTH<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="partWidth" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">LENGHT<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="partLenght" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row">
						<div class="col-4">HEIGHT<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="partHeight" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">BASE COST<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="baseCost" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">BASE CURRENCY<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="baseCurrency" class="form-control mb-3">
								<form:option value="">--SELECT--</form:option>
								<form:option value="INR">INR</form:option>
								<form:option value="USD">USD</form:option>
								<form:option value="AUS">AUS</form:option>
								<form:option value="ERU">ERU</form:option>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">UOM<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="uomOb.uomId" class="form-control mb-3">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${uomList}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4"> SALE CODE<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="omSalesOb.orderId" class="form-control mb-3">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${omSalesMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">PURCHASE CODE<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="omPurchaseOb.orderId" class="form-control mb-3">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${omPurchaseMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4">DESCRIPTION<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:textarea path="note" class="form-control mb-3" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="CREATE" class="btn btn-success" />
						</div>
						<div class="col-4"></div>
					</div>

				</form:form>
			</div>
			<c:if test="${!empty message }">
				<div class="card-footer text-primary">${message}</div>
			</c:if>
		</div>
	</div>
</body>
</html>