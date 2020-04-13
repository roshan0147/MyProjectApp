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
			<div class="card-header text-center text-white bg-info">
				<h3>User Type Register Page !!</h3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="whUserType">
					<div class="row mb-3">
						<div class="col-4">
							UserType<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:radiobutton path="userType" value="Vendor" />
							Vendor
							<form:radiobutton path="userType" value="Customer" />
							Customer
						</div>
						<div class="col-4" id="userTypeError"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">
							UserCode<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="userCode" class="form-control" />
						</div>
						<div class="col-2" id="userCodeError"></div>
						<div class="col-2" id="serverError">
						   <form:errors path="userCode" class="text-danger"/>
						</div>
					</div>

					<div class="row mb-3">
						<div class="col-4">
							UserFor<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="userFor" class="form-control" readonly="true" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">
							UserMail<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="userMail" class="form-control" />
						</div>
						<div class="col-4" id="userMailError"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">
							UserContact<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="userContact" class="form-control" />
						</div>
						<div class="col-4" id="userContactError"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">
							UserIdType<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:select path="userIdType" class="form-control">
								<form:option value="">--Select--</form:option>
								<form:option value="PAN CARD">PAN CARD</form:option>
								<form:option value="AADHAR">AADHAR</form:option>
								<form:option value="VOTERID">VOTERID</form:option>
								<form:option value="OTHER">OTHER</form:option>
							</form:select>
						</div>
						<div class="col-4" id="userIdTypeError"></div>
					</div>
					<div class="row mb-3" id="other">
						<div class="col-4">
							IfOther<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="ifOther" class="form-control" />
						</div>
						<div class="col-4" id="ifOtherError"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">
							Id Number<span class="text-danger">*</span>
						</div>
						<div class="col-4">
							<form:input path="userIdNumber" class="form-control" />
						</div>
						<div class="col-4" id="idNumberError"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" id="register" value="CREATE USER"
								class="btn btn-success">
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

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#userTypeError').hide();
							$('#userCodeError').hide();
							$('#userMailError').hide();
							$('#userContactError').hide();
							$('#userIdTypeError').hide();
							$('#idNumberError').hide();

							var userTypeError = false;
							var userCodeError = false;
							var userMailError = false;
							var userContactError = false;
							var userIdTypeError = false;
							var idNumberError = false;

							$('input[type="radio"][name="userType"]').change(
									function() {
										validate_userType();
										autoFill_userFor();
									});
							$('#userCode').keyup(function() {
								validate_userCode();
							});
							$('#userMail').keyup(function() {
								validate_userMail();
							});
							$('#userContact').keyup(function() {
								validate_userContact();
							});
							$('#userIdType').change(function() {
								validate_userIdType();
							});
							$('#userIdNumber').keyup(function() {
								validate_userIdNumber();
							});

							function validate_userType() {
								var val = $('input[type="radio"][name="userType"]:checked').length;
								if (val == 0) {
									$('#userTypeError').show();
									$('#userTypeError').html("Choose USERTYPE");
									$('#userTypeError').css("color", "red");
									userTypeError = false;
								} else {
									$('#userTypeError').hide();
									userTypeError = true;
								}
								return userTypeError;
							}
							function autoFill_userFor() {
								var val = $(
										'input[type="radio"][name="userType"]:checked')
										.val();
								if (val == 'Vendor') {
									$('#userFor').val('Purchase');
								} else if (val == 'Customer') {
									$('#userFor').val('Sale');
								}
							}
							function validate_userCode() {
								var val = $('#userCode').val();
								var exp = /^[A-Z]{4,8}$/;
								if (val == '') {
									$('#serverError').hide();
									$('#userCodeError').show();
									$('#userCodeError').html("Enter User Code");
									$('#userCodeError').css("color", "red");
									userCodeError = false;
								} else if (!exp.test(val)) {
									$('#serverError').hide();
									$('#userCodeError').show();
									$('#userCodeError')
											.html(
													"Only Takes Uppercase A to Z between 4 to 8 Charectors");
									$('#userCodeError').css("color", "red");
									userCodeError = false;
								} else {
									$('#userCodeError').hide();
									userCodeError = true;
								}
								return userCodeError;
							}
							function validate_userMail() {
								var val = $('#userMail').val();
								var exp = /^[a-z0-9-_]+\@[a-z]{2,8}\.[a-z]{2,6}$/;
								if (val == '') {
									$('#userMailError').show();
									$('#userMailError').html(
											"Enter User Mail Id");
									$('#userMailError').css("color", "red");
									userMailError = false;
								} else if (!exp.test(val)) {
									$('#userMailError').show();
									$('#userMailError').html(
											"Not a valid user Email");
									$('#userMailError').css("color", "red");
									userMailError = false;
								} else {
									$('#userMailError').hide();
									userMailError = true;
								}
								return userMailError;
							}
							function validate_userContact() {
								var val = $('#userContact').val();
								var exp = /^(\+91)?[6-9][0-9]{9}$/;
								if (val == '') {
									$('#userContactError').show();
									$('#userContactError').html(
											"Enter User Contact Number");
									$('#userContactError').css("color", "red");
									userContactError = false;
								} else if (!exp.test(val)) {
									$('#userContactError').show();
									$('#userContactError').html(
											"Not a valid user contact number");
									$('#userContactError').css("color", "red");
									userContactError = false;
								} else {
									$('#userContactError').hide();
									userContactError = true;
								}
								return userContactError;
							}
							function validate_userIdType() {
								var val = $('#userIdType').val();
								if (val == '') {

									$('#userIdTypeError').show();
									$('#userIdTypeError')
											.html("Select Id Type");
									$('#userIdTypeError').css("color", "red");
									$("#ifOther").attr("readonly", true);
									userIdTypeError = false;
								} else {
									$('#userIdTypeError').hide();

									userIdTypeError = true;
									if (val == 'OTHER') {

										$("#ifOther").attr("readonly", false);
									} else {
										$("#ifOther").val('');
										$("#ifOther").attr("readonly", true);
									}
								}
								return userIdTypeError;
							}
							function validate_userIdNumber() {
								var val = $('#userIdNumber').val();
								var exp = /^[a-zA-Z0-9-_]{4,20}$/;
								if (val == '') {
									$('#idNumberError').show();
									$('#idNumberError').html(
											"Enter User Id Number");
									$('#idNumberError').css("color", "red");
									idNumberError = false;
								} else if (!exp.test(val)) {
									$('#idNumberError').show();
									$('#idNumberError').html(
											"Not a valid user id number");
									$('#idNumberError').css("color", "red");
									idNumberError = false;
								} else {
									$('#idNumberError').hide();
									idNumberError = true;
								}
								return idNumberError;
							}

							$('#register').click(
									function() {
										userTypeError = false;
										userCodeError = false;
										userMailError = false;
										userContactError = false;
										userIdTypeError = false;
										idNumberError = false;

										validate_userType();
										validate_userCode();
										validate_userMail();
										validate_userContact();
										validate_userIdType();
										validate_userIdNumber();

										if (userTypeError && userCodeError
												&& userMailError
												&& userContactError
												&& userIdTypeError
												&& idNumberError)
											return true;
										else
											return false;
									});

						});
	</script>
</body>
</html>