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
			<div class="card-header bg-info text-center text-white">
				<h3>UOM REGISTER PAGE !!</h3>
			</div>
			<div class="card-body">
				<form:form action="save" method="post" modelAttribute="uom">
					<div class="row">
						<div class="col-4">UomType<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:select path="uomType" class="form-control mb-3">
								<form:option value="">---SELECT---</form:option>
								<form:option value="PACKING">PACKING</form:option>
								<form:option value="NO PACKING">NO PACKING</form:option>
								<form:option value="-NA-">-NA-</form:option>
							</form:select>
						</div>
						<div class="col-4" id="uomTypeError"></div>
					</div>
					<div class="row">
						<div class="col-4">UomModel<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:input path="uomModel" class="form-control mb-3"/>
						</div>
						<div class="col-2" id="uomModelError"></div>
						<div class="col-2" id="serverError">
						   <form:errors path="uomModel" class="text-danger"/>
						</div>
					</div>

					<div class="row">
						<div class="col-4">Description<span class="text-danger">*</span></div>
						<div class="col-4">
							<form:textarea path="uomDesc" class="form-control mb-3" />
						</div>
						<div class="col-4" id="uomDescError"></div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" id="register" value="CREATE UOM"
								class="btn btn-primary">
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
		$(document).ready(function() {
			$('#uomTypeError').hide();
			$('#uomModelError').hide();
			$('#uomDescError').hide();

			var uomTypeError = false;
			var uomModelError = false;
			var uomDescError = false;

			$('#uomType').change(function() {
				validate_uomType();
			})
			$('#uomModel').keyup(function() {
				validate_uomModel();
			})
			$('#uomDesc').keyup(function() {
				validate_uomDesc();
			})

			function validate_uomType() {
				var val = $('#uomType').val();
				if (val == '') {
					$('#uomTypeError').show();
					$('#uomTypeError').html("Choose <b>UOM TYPE</b>");
					$('#uomTypeError').css("color", "red");
					uomTypeError = false;
				} else {
					$('#uomTypeError').hide();
					uomTypeError = true;
				}
				return uomTypeError;
			}
			function validate_uomModel() {
				var val = $('#uomModel').val();
				var exp=/^[A-Z]{2,5}$/;
				if (val == '') {
					$('#serverError').hide();
					$('#uomModelError').show();
					$('#uomModelError').html("Enter <b>UOM MODEL</b>");
					$('#uomModelError').css("color", "red");
					uomModelError = false;
				}else if(!exp.test(val)){
					$('#serverError').hide();
					$('#uomModelError').show();
					$('#uomModelError').html("Only 2 to 5 Uppercase Letters");
					$('#uomModelError').css("color", "red");
					uomModelError = false;
					}
				 else {
					$('#uomModelError').hide();
					uomModelError = true;
				}
				return uomModelError;
			}
			function validate_uomDesc() {
				var val = $('#uomDesc').val();
				var exp=/^[a-zA-Z0-9-_.]{2,150}$/;
				if (val == '') {
					$('#uomDescError').show();
					$('#uomDescError').html("Enter <b>UOM DESCRIPTION</b>");
					$('#uomDescError').css("color", "red");
					uomDescError = false;
				}else if(!exp.test(val)){
					$('#uomDescError').show();
					$('#uomDescError').html("Only Takes(2 to 150) Alphabates,Digits and . _ - <b>FOR DESCRIPTION</b>");
					$('#uomDescError').css("color", "red");
					uomDescError = false;
					}
				 else {
					$('#uomDescError').hide();
					uomDescError = true;
				}
				return uomDescError;
			}
			$('#register').click(function() {

				uomTypeError = false;
				uomModelError = false;
				uomDescError = false;

				validate_uomType();
				validate_uomModel();
				validate_uomDesc();

				if (uomTypeError && uomModelError && uomDescError) {
					return true;
				} else
					return false;

			})
		});
	</script>
</body>
</html>