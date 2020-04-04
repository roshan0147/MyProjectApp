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
				<H3>WELCOME TO ORDER METHOD PAGE !!</H3>
			</div>
			<div class="card-body">
				<form:form action="update" method="POST"
					modelAttribute="orderMethod">
					<div class="row mb-3">
						<div class="col-4">Order ID:</div>
						<div class="col-4">
							<form:input path="orderId" class="form-control" readonly="true" />
						</div>
						<div class="col-4"></div>
					</div>
					<div class="row mb-3">
						<div class="col-4">Order Mode:</div>
						<div class="col-4">
							<label class="radio-inline"> <form:radiobutton
									path="orderMode" value="Sale" /> Sale
							</label> <label class="radio-inline"> <form:radiobutton
									path="orderMode" value="Purchase" /> Purchase
							</label>
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
						<div class="col-4">Order Type:</div>
						<div class="col-4">
							<form:select path="orderType" class="form-control">
								<form:option value="">--SELECT--</form:option>
								<form:option value="FIFO">FIFO</form:option>
								<form:option value="LIFO">LIFO</form:option>
								<form:option value="FCFO">FCFO</form:option>
								<form:option value="FEFO">FEFO</form:option>
							</form:select>
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Order Accept:</div>
						<div class="col-4">
							<form:checkbox path="orderAccept" value="Multi Model" />
							Multi Model
							<form:checkbox path="orderAccept" value="Accept Return" />
							Accept Reutrn
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4">Description:</div>
						<div class="col-4">
							<form:textarea path="orderDesc" class="form-control" />
						</div>
						<div class="col-4"></div>
					</div>

					<div class="row mb-3">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" value="Update" class="btn btn-success">
						</div>
						<div class="col-4"></div>
					</div>
				</form:form>
			</div>
			<c:if test="${!empty message }">
				<div class="card-footer text-success">${message}</div>
			</c:if>
		</div>
	</div>
</body>
</html>