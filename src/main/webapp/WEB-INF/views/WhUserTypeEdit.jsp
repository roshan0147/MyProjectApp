
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
				<h3>User Type Register Edit Page !!</h3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="whUserType">
					<div class="row mb-3">
						<div class="col-4">ID:</div>
						<div class="col-4">
							<form:input path="userId" class="form-control" readonly="true"/>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">UserType:</div>
						<div class="col-4">
							<form:radiobutton path="userType" value="Sale" />
							Vender
							<form:radiobutton path="userType" value="Purchase" />
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
			<div class="card-footer">${message}</div>
		</div>
	</div>
</body>
</html>