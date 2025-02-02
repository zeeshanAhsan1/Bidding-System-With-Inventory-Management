<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="com.dbapp.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Verify Listing</title>
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
			
			String username = (String) session.getAttribute("username");
			if (username == null) {
				response.sendRedirect("Login.jsp");
			}
			String itemname = request.getParameter("itemname");
			String subcategory = request.getParameter("subcategory");
			if(subcategory.equals("NONE")){
				%>
				<jsp:forward page="CreateListing.jsp">
				<jsp:param name="msg" value="You must select a subcategory."/> 
				</jsp:forward>
			<%}else{
				String subattribute = request.getParameter("subattribute");
				String price = request.getParameter("price");
				String minsale = request.getParameter("minsale");
				String dt = request.getParameter("dt");
				
				//Statement 1: Insert into listings table
				String insert = "INSERT INTO listings(itemname, subcategory, subattribute, price, minsale, dt) " 
						+ "VALUES(?, ?, ?, ?, ?, ?)";
				
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setString(1, itemname);
				ps.setString(2, subcategory);
				ps.setString(3, subattribute);
				ps.setString(4, price);
				ps.setString(5, minsale);
				ps.setString(6, dt);
				ps.executeUpdate();
				
				//Statement 2: Insert into listings posts
				insert = "INSERT INTO posts(l_id, username) " 
						+ "VALUES((SELECT MAX(l_id) FROM listings),?)";
				ps = con.prepareStatement(insert);
				ps.setString(1, username);
				ps.executeUpdate();
			} 		
			
			%>
			<jsp:forward page="Account.jsp">
			<jsp:param name="createListingRet" value="Listing successfully created."/> 
			</jsp:forward>
			<% 
		} catch (SQLException e) {
			String code = e.getSQLState();
			if (code.equals("23000")) {
				%>
				<jsp:forward page="CreateListing.jsp">
				<jsp:param name="msg" value="This Listing already exists."/> 
				</jsp:forward>
				<%
			} else {
				%>
				<jsp:forward page="Account.jsp">
				<jsp:param name="msg" value="Error creating listing. Please try again."/> 
				</jsp:forward>
				<%
			}
		} catch (Exception e) {
			out.print("Unknown exception.");
			%>
			<jsp:forward page="Account.jsp">
			<jsp:param name="msg" value="Error creating listing. Please try again."/> 
			</jsp:forward>
			<%
		}
	%>
</body>
</html>
