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
	<%@include file="Menu.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header text-center text-white bg-info">
				<H3>WELCOME TO PURCHASE ORDER PAGE !</H3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST"
					modelAttribute="purchaseOrder">
					<div class="row mb-3">
						<div class="col-4">Order Code<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="OrderCode" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Shipment Code<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="shipOb.shipId" class="form-control">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${shipMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Vendor<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="whOb.userId" class="form-control">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${whVendorMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Reference Number<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="referenceNumber" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Quality Check<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:radiobutton path="qualityCheck" value="Required" />
							Required
							<form:radiobutton path="qualityCheck" value="Not Required" />
							Not Required
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Default Status<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="defaultStatus" class="form-control" readonly="true"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Description<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:textarea path="description" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>


					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Place Order" class="btn btn-primary">
						</div>
						<div class="col-4"></div>
					</div>

				</form:form>
			</div>
			<c:if test="">
			<div class="card-footer text-primary">${message}</div>
			</c:if>
		</div>
	</div>
</body>
</html>