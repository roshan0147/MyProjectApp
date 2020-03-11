<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
				<H3>WELCOME TO PURCHASE ORDER EDIT PAGE !</H3>
			</div>
			<div class="card-body">
				<form:form action="update" method="POST"
					modelAttribute="purchaseOrder">
					<div class="row mb-3">
						<div class="col-4">ID:</div>
						<div class="col-4">
							<form:input path="poId" class="form-control" readonly="true"/>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Order Code:</div>
						<div class="col-4">
							<form:input path="orderCode" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Shipment Code:</div>
						<div class="col-4">
							<form:select path="shipOb.shipId" class="form-control">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${shipMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Vendor:</div>
						<div class="col-4">
							<form:select path="whOb.userId" class="form-control">
								<form:option value="">--SELECT--</form:option>
								<form:options items="${whVendorMap}"/>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Reference Number:</div>
						<div class="col-4">
							<form:input path="referenceNumber" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Quality Check:</div>
						<div class="col-4">
							<form:radiobutton path="qualityCheck" value="Required" />
							Required
							<form:radiobutton path="qualityCheck" value="Not Required" />
							Not Required
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Default Status:</div>
						<div class="col-4">
							<form:input path="defaultStatus" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Description:</div>
						<div class="col-4">
							<form:textarea path="description" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>


					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Update" class="btn btn-primary">
						</div>
						<div class="col-4"></div>
					</div>

				</form:form>
			</div>
			<div class="card-footer">${message}</div>
		</div>
	</div>
</body>
</html>