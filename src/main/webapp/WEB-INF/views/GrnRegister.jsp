<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
</head>
<body>
	<%@include file="Menu.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header bg-primary text-white text-center">
				<h1>Welcome to Grn Register Page</h1>
			</div>
			<div class="card-body">
				<form:form id="myForm" action="save" method="POST"
					modelAttribute="grn">
					<!--new Row -->
					<div class="row mb-3">
						<div class="col-4">
							<label for="grnCode"> GRNCODE<span class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:input path="grnCode" class="form-control" />
						</div>
						<div class="col-4" id="grnCodeError"></div>
					</div>
					<!--new Row -->
					<div class="row mb-3">
						<div class="col-4">
							<label for="grnType"> GRNTYPE<span class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:input path="grnType" class="form-control" />
						</div>
						<div class="col-4" id="grnTypeError"></div>
					</div>
					
					
					<!--new Row -->
					<div class="row mb-3">
						<div class="col-4">
							<label for="po"> PURCHASE ORDER<span class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:select path="po.poId" class="form-control">
								<form:option value="">-SELECT-</form:option>
								<form:options items="${poMap}"/>
							</form:select>
						</div>
						<div class="col-4" id="poError"></div>
					</div>
					
					
					<!--new Row -->
					<div class="row mb-3">
						<div class="col-4">
							<label for="note"> NOTE<span class="text-danger">*</span></label>
						</div>
						<div class="col-4">
							<form:textarea path="note" class="form-control" />
						</div>
						<div class="col-4" id="noteError"></div>
					</div>
					<div class="row">
					<div class="col-4"></div>
					<div class="col-4">
					<input type="submit" value="Register" class="btn btn-success" />
					</div>
					<div class="col-4"></div>
					</div>
				</form:form>
			</div>
			<div class="card-footer bg-info text-white">
				<b>${message}</b>
			</div>
		</div>
	</div>
</body>
</html>