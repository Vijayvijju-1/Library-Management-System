<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%
int k=0;
String name=request.getParameter("name");
String email=request.getParameter("email");
String log_id=request.getParameter("login_id");
String password=request.getParameter("password");
try{
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	
	PreparedStatement ps=con.prepareStatement("insert into member_details(login_id,name,password,email,role) values(?,?,?,?,3)");
	ps.setString(1, log_id);
	ps.setString(2, name);
	ps.setString(3, password);
	ps.setString(4, email);
	k=ps.executeUpdate();
	if(k==1){
		response.sendRedirect("addAdmin.jsp?msg=added");
	}
	else{
		response.sendRedirect("addAdmin.jsp?msg=error");
	}
}
catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>