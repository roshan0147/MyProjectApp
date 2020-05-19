<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<%@include file="UiMenu.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-header bg-primary text-white text-center">
				<h3>Welcome to User Login Page</h3>
			</div>
			<div class="card-body">
				<c:if test="${param.error!=null}">
					<div style="color: red;">Invalid UserName/password</div>
				</c:if>
				<c:if test="${param.logout!=null}">
					<div style="color: green;">Logout successful</div>
				</c:if>
				<form action="../login" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<!--1st row-->
					<div class="row mb-3">
						<div class="col-4">
							<label for="userName">USER NAME</label>
						</div>

						<div class="col-4">
							<input type="text" name="username" class="form-control"
								maxlength="50" />
						</div>
						<div class="col-4" id="userNameError"></div>
					</div>

					<!--2nd row-->
					<div class="row mb-3">
						<div class="col-4">
							<label for="password">PASSWORD</label>
						</div>
						<div class="col-4">
							<input type="password" name="password" class="form-control" />
						</div>
						<div class="col-4" id="userpasswordError"></div>
					</div>
					<p style="text-align: center;">
						<input type="submit" class="btn btn-success" value="Login" />
					</p>
				</form>
			</div>
		</div>
	</div>

</body>
</html>





