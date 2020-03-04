<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Menu.jsp" %>
	<h3>User Type Register Page !!</h3>
	<form:form action="update" method="POST" modelAttribute="whUserType">
		<pre>
User ID:
      <form:input path="userId" readonly="true"/>
      
UserType:
      <form:radiobutton path="userType" value="Sale"/>Vender
      <form:radiobutton path="userType" value="Purchase"/>Customer
      
UserCode:
      <form:input path="userCode"/>
      
UserFor:
      <form:input path="userFor"/>
      
UserMail:
      <form:input path="userMail"/>
      
UserContact:
      <form:input path="userContact"/>
      
UserIdType:
      <form:select path="userIdType">
        <form:option value="">--Select--</form:option>
        <form:option value="PAN CARD">PAN CARD</form:option>
        <form:option value="AADHAR">AADHAR</form:option>
        <form:option value="VOTERID">VOTERID</form:option>
        <form:option value="OTHER">OTHER</form:option>
      </form:select>
      
Id Number:
     <form:input path="userIdNumber"/>
     
     <input type="submit" value="Update">
</pre>
	</form:form>
	${message}
	<!-- <script type="text/javascript">
		function displayRadioValue(x) {
			document.getElementById("for").value = x;
		}
		function getValue() {
			var obj = document.getElementById("mySelect");
			var i = obj.options[obj.selectedIndex].value;
			if (i == "OTHER") {
				var str = "<pre>UserIdType: <input type='text' name='userIdNumber'>";
				document.getElementById("demo").innerHTML = str;
				document.getElementById("demo").style.display = "block";
			} else {
				document.getElementById("demo").style.display = "none";
			}
		}
	</script> -->
</body>
</html>