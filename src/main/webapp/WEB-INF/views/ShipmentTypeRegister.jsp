<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
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
				<h3>Welcome to Shipment Register Page</h3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="shipmentType">
					<div class="row">
						<div class="col-4">
							<label for="shipMode">Shipment Mode:</label>
						</div>
						<div class="col-4">
							<form:select path="shipMode" class="form-control mb-3">
								<form:option value="">--Select--</form:option>
								<form:option value="Air">Air</form:option>
								<form:option value="Truck">Truck</form:option>
								<form:option value="Ship">Ship</form:option>
								<form:option value="Train">Train</form:option>
							</form:select>
						</div>
						<div class="col-4">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipCode">Shipment Code:</label>
						</div>
						<div class="col-4">
							<form:input path="shipCode" class="form-control mb-3" />
						</div>
						<div class="col-4">
							<!-- Error -->
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="">Enable Shipment:</label>
						</div>
						<div class="col-4">
							<form:select path="enbShip" class="form-control mb-3">
								<form:option value="">--Select--</form:option>
								<form:option value="Yes">Yes</form:option>
								<form:option value="No">No</form:option>
							</form:select>
						</div>
						<div class="col-4">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipGrade">Shipment Grade:</label>
						</div>
						<div class="col-4">
							<form:radiobutton path="shipGrade" value="A" />
							A
							<form:radiobutton path="shipGrade" value="B" />
							B
							<form:radiobutton path="shipGrade" value="C" />
							C
						</div>
						<div class="col-4">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipDesc">Description:</label>
						</div>
						<div class="col-4">
							<form:textarea path="shipDesc" class="form-control mb-3" />
						</div>
						<div class="col-4">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Create" class="btn btn-success mt-2">
							<input type="reset" value="Clear"
								class="btn btn-danger mt-2 ml-4">
						</div>
						<div class="col-4"></div>
					</div>


				</form:form>
			</div>
			<c:if test="${!empty message}">
				<div class="card-footer text-primary">${message}</div>
			</c:if>
		</div>
	</div>
</body>
</html>