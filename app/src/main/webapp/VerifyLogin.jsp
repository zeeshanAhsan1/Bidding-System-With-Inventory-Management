<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.dbapp.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body{
	background-image: url("https://img.freepik.com/free-photo/white-wooden-texture-flooring-background_53876-63634.jpg?w=2000");
	
}

</style>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			Statement stmt = con.createStatement();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			String lookup = "SELECT username, password FROM users WHERE " 
						+ "username=(?) AND password=(?)";
			PreparedStatement ps = con.prepareStatement(lookup);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet result = ps.executeQuery();

			if (result.next()) {
				session.setAttribute("username", username);
				%>
				<jsp:forward page="home.jsp">
				<jsp:param name="user" value="<%=username%>"/> 
				</jsp:forward>
				<% //ABOVE: FORWARD TO HOME PAGE WITH CURRENT USERNAME ATTACHED
			} else {
				%>
				<jsp:forward page="Login.jsp">
				<jsp:param name="loginRet" value="Incorrect username or password."/> 
				</jsp:forward>
				<%
			}

		} catch (Exception e) {
			%>
			<jsp:forward page="Login.jsp">
			<jsp:param name="loginRet" value="Error logging in. Please try again."/> 
			</jsp:forward>
			<%
		}
	%>
</body>
</html>
