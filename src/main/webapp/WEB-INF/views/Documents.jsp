<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<h4>Select File And Upload</h4>
			</div>
			<div class="card-body">
				<form action="upload" method="POST" enctype="multipart/form-data">
				    <div class="row">
				       <div class="col-4">
				           ID
				       </div>
				       <div class="col-4">
				         <input type="text" name="fileId" class="form-control mb-3">
				       </div>
				       <div class="col-4"></div>
				    </div>
				    <div class="row">
				       <div class="col-4">
				           Document
				       </div>
				       <div class="col-4">
				         <input type="file" name="fileOb" class="form-control-file mb-3">
				       </div>
				       <div class="col-4"></div>
				    </div>
				    <div class="row">
				       <div class="col-4">
				       </div>
				       <div class="col-4">
				         <input type="submit" value="Upload" class="btn btn-primary">
				       </div>
				       <div class="col-4"></div>
				    </div>  
				</form>
			</div>
			<div class="card-footer">
				<table class="table">
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>LINK</th>
					</tr>
					<c:forEach items="${list}" var="ob">
						<tr>
							<td>${ob[0]}</td>
							<td>${ob[1]}</td>
							<td><a href="download?fid=${ob[0]}">Download</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>