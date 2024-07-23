<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Furniture Auction Homepage</title>
<style>
body{
	background-image: url("https://img.freepik.com/free-photo/white-wooden-texture-flooring-background_53876-63634.jpg?w=2000");
	
}

</style>
</head>
<body>
	<h2 style="text-align: center">Please input your login:</h2>
	<form method="post" action="VerifyEmployeeLogin.jsp">
		<table style="margin: 0px auto;">
		<tr>
			<td>Employee ID: <input type="text" name="employee_id" value="" maxlength="30" required/></td>
		</tr>
		<tr>
			<td>Password: <input type="password" name="password" value="" maxlength="30" required/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Log in" style="width: 100%;"/></td>
		</tr>
		<% if (request.getParameter("registerRet") != null) { %>
			<tr>
				<td><p style="text-align: center; color: blue"><%=request.getParameter("registerRet")%></p></td>
			</tr>
		<% } else if (request.getParameter("loginRet") != null) { %>
			<tr>
				<td><p style="text-align: center; color: red"><%=request.getParameter("loginRet")%></p></td>
			</tr>
		<% } %>
		</table>
	</form>
	<p style="text-align:center">Not an employee? <a href="Login.jsp">Login Here!</a></p>
</body>
</html>