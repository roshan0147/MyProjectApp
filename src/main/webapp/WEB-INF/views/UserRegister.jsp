<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="UiMenu.jsp"%>
<div class="container">
<div class="card">
   <div class="card-header bg-info text-center text-white">
   <h3>Welcome to User Register Page</h3>
   </div>
  <div class="card-body">
  <form action="save" method="post">
     <div class="row mb-3">
          <div class="col-4">
             NAME<span class="text-danger">*</span>
          </div>
          <div class="col-4">
            <input type="text" name="userName" class="form-control"/>
          </div>
          <div class="col-4">
          
          </div>
     </div>
     <div class="row mb-3">
          <div class="col-4">
             EMAIL<span class="text-danger">*</span>
          </div>
          <div class="col-4">
            <input type="text" name="userEmail" class="form-control"/>
          </div>
          <div class="col-4">
          
          </div>
     </div>
     <div class="row mb-3">
          <div class="col-4">
             PASSWORD<span class="text-danger">*</span>
          </div>
          <div class="col-4">
            <input type="password" name="userPwd" class="form-control"/>
          </div>
          <div class="col-4">
          
          </div>
     </div>
     <div class="row mb-3">
          <div class="col-4">
             ROLES<span class="text-danger">*</span>
          </div>
          <div class="col-4">
            <div class="form-check">
            <input  type="checkbox" name="roles" value="ADMIN" class="form-check-input">ADMIN
           </div>
           <div class="form-check">
            <input  type="checkbox" name="roles" value="EMPLOYEE" class="form-check-input">EMPLOYEE  
           </div>
          </div>
          <div class="col-4">
          
          </div>
     </div>
      <div class="row">
          <div class="col-4">
             
          </div>
          <div class="col-4">
            <input type="submit" value="Register" class="btn btn-success"/>	
          </div>
          <div class="col-4">
          
          </div>
     </div>
  </form>
  </div>
</div>
<div class="card-footer">
${message}
</div>
</div>	
</body>
</html>



