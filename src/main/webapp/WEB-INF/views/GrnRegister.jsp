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
			<div class="card-header bg-info text-white text-center">
				<H3>WELCOME TO GRN REGISTER PAGE</H3>
			</div>
			<div class="card-body">
				<form:form action="save" method="POST" modelAttribute="grn">

					<div class="row mb-3">
						<div class="col-4">Grn Code</div>
						<div class="col-4">
							<form:input path="grnCode" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Grn Type</div>
						<div class="col-4">
							<form:input path="grnType" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Order Code</div>
						<div class="col-4">
							<form:select path="grnOrderCode" class="form-control">
								<form:option value="">-SELECT-</form:option>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Note</div>
						<div class="col-4">
							<form:input path="note" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Create Grn" class="btn btn-success">
						</div>
						<div class="col-4"></div>
					</div>
				</form:form>

			</div>
		</div>
	</div>
</body>
</html>