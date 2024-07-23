<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Homepage</title>
<style>
body{
	background-image: url("https://img.freepik.com/free-photo/white-wooden-texture-flooring-background_53876-63634.jpg?w=2000");
	
}

</style>
</head>
<body>
	
	
	<h2 style="text-align: center">Please enter your login credentials:</h2>
	<form method="post" action="VerifyLogin.jsp">
		<table style="margin: 0px auto;">
		<tr>
			<td>Username: <input type="text" name="username" value="" maxlength="30" required/></td>
		</tr>
		<tr>
			<td>Password: <input type="password" name="password" value="" maxlength="30" required/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Log in" style="width: 100%;"/></td>
		</tr>
		<tr>
			<td><p style="text-align: center">Don't have an account? <a href="Register.jsp">Create one</a></p></td>
		</tr>
		<tr>
			<td>Administrator or Customer Representative? <a href="AdminRepLogin.jsp">Click here!</a></td>
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
</body>
</html>