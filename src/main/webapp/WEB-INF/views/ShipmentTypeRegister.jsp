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
							<label for="shipMode">Shipment Mode<span
								class="text-danger">*</span></label>
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
						<div class="col-4" id="shipModeError">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipCode">Shipment Code<span
								class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:input path="shipCode" class="form-control mb-3" />
						</div>
						<div class="col-4" id="shipCodeError">
							<!-- Error -->
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="">Enable Shipment<span class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:select path="enbShip" class="form-control mb-3">
								<form:option value="">--Select--</form:option>
								<form:option value="Yes">Yes</form:option>
								<form:option value="No">No</form:option>
							</form:select>
						</div>
						<div class="col-4" id="enbShipError">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipGrade">Shipment Grade<span
								class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:radiobutton path="shipGrade" value="A" />
							A
							<form:radiobutton path="shipGrade" value="B" />
							B
							<form:radiobutton path="shipGrade" value="C" />
							C
						</div>
						<div class="col-4" id="shipGradeError">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4">
							<label for="shipDesc">Description<span
								class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:textarea path="shipDesc" class="form-control mb-3" />
						</div>
						<div class="col-4" id="noteError">
							<!-- Error -->
						</div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" id="register" value="Create"
								class="btn btn-success mt-2"> <input type="reset"
								value="Clear" class="btn btn-danger mt-2 ml-4">
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
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#shipModeError').hide();
							$('#shipCodeError').hide();
							$('#enbShipError').hide();
							$('#shipGradeError').hide();
							$('#noteError').hide();

							var shipModeError = false;
							var shipCodeError = false;
							var enbShipError = false;
							var shipGradeError = false;
							var noteError = false

							$('#shipMode').change(function() {
								validate_shipMode();
							});
							$('#shipCode').keyup(function() {
								validate_shipCode();
							});
							$('#enbShip').change(function() {
								validate_enbShip();
							});
							$('input[type="radio"][name="shipGrade"]').change(
									function() {
										validate_shipGrade();
									});
							$('#shipDesc').keyup(function() {
								validate_shipDesc();
							});

							function validate_shipMode() {
								var val = $('#shipMode').val();
								if (val == '') {
									$('#shipModeError').show();
									$('#shipModeError').html(
											"Choose <b>SHIPMENT MODE</b>");
									$('#shipModeError').css("color", "red");
									shipModeError = false;
								} else {
									$('#shipModeError').hide();
									shipModeError = true;
								}
								return shipModeError;
							}
							function validate_shipCode() {
								var val = $('#shipCode').val();
								var exp = /^[A-Z]{2,6}$/;
								if (val == '') {
									$('#shipCodeError').show();
									$('#shipCodeError').html(
											"Enter <b>SHIPMENT CODE</b>");
									$('#shipCodeError').css("color", "red");
									shipCodeError = false;
								} else if (!exp.test(val)) {
									$('#shipCodeError').show();
									$('#shipCodeError')
											.html(
													"Enter only 2 to 6 Uppercase Letters");
									$('#shipCodeError').css("color", "red");
									shipCodeError = false;
								} else {
									$('#shipCodeError').hide();
									shipCodeError = true;

								}
								return shipCodeError;
							}
							function validate_enbShip() {
								var val = $('#enbShip').val();
								if (val == '') {
									$('#enbShipError').show();
									$('#enbShipError')
											.html(
													"Choose <b>Shipment Disable or enable</b>");
									$('#enbShipError').css("color", "red");
									enbShipError = false;
								} else {
									$('#enbShipError').hide();
									enbShipError = true;
								}
								return enbShipError;
							}
							function validate_shipGrade() {
								var val = $('input[type="radio"][name="shipGrade"]:checked').length;
								if (val == 0) {
									$('#shipGradeError').show();
									$('#shipGradeError').html(
											"Choose <b>SHIPMENT GRADE</b>");
									$('#shipGradeError').css("color", "red");
									shipGradeError = false;
								} else {
									$('#shipGradeError').hide();
									shipGradeError = true;
								}
								return shipGradeError;
							}
							function validate_shipDesc() {
								var val = $('#shipDesc').val();
								var exp = /^[a-zA-Z0-9.,_-]{2,200}$/;
								if (val == '') {
									$('#noteError').show();
									$('#noteError')
											.html(
													"Enter <b>SHIPMENT DESCRIPTION</b>");
									$('#noteError').css("color", "red");
									noteError = false;
								} else if (!exp.test(val)) {
									$('#noteError').show();
									$('#noteError')
											.html(
													"Description must be 2 to 200 only takes alphabates digits . , _ -");
									$('#noteError').css("color", "red");
									noteError = false;
								} else {
									$('#noteError').hide();
									noteError = true;

								}
								return noteError;
							}

							$('#register').click(
									function() {
										shipModeError = false;
										shipCodeError = false;
										enbShipError = false;
										shipGradeError = false;
										noteError = false;

										validate_shipMode();
										validate_shipCode();
										validate_enbShip();
										validate_shipGrade();
										validate_shipDesc();

										if (shipModeError && shipCodeError
												&& enbShipError
												&& shipGradeError && noteError)
											return true;
										else
											return false;

									})

						})
	</script>
</body>
</html>