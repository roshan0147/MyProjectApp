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
				<h3>User Type Register Page !!</h3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="whUserType">
					<div class="row mb-3">
						<div class="col-4">UserType:</div>
						<div class="col-4">
							<form:radiobutton path="userType" value="Vendor" />
							Vendor
							<form:radiobutton path="userType" value="Customer" />
							Customer
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">UserCode:</div>
						<div class="col-4">
							<form:input path="userCode" class="form-control"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">UserFor:</div>
						<div class="col-4">
							<form:input path="userFor" class="form-control"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">UserMail:</div>
						<div class="col-4">
							<form:input path="userMail" class="form-control"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">UserContact:</div>
						<div class="col-4">
							<form:input path="userContact" class="form-control"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">UserIdType:</div>
						<div class="col-4">
							<form:select path="userIdType" class="form-control">
								<form:option value="">--Select--</form:option>
								<form:option value="PAN CARD">PAN CARD</form:option>
								<form:option value="AADHAR">AADHAR</form:option>
								<form:option value="VOTERID">VOTERID</form:option>
								<form:option value="OTHER">OTHER</form:option>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>


					<div class="row mb-3">
						<div class="col-4">Id Number:</div>
						<div class="col-4">
							<form:input path="userIdNumber" class="form-control"/>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="CREATE USER" class="btn btn-success">
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