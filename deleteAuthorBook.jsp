<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete book</title>
</head>
<body>
<%
    String book_id =request.getParameter("book_id");
	
	try{
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	Statement st=con.createStatement();
	int k=st.executeUpdate("delete from cart  where book_id='"+book_id+"'");
	if (k==1) {
	response.sendRedirect("viewAuthorCart.jsp?msg=deleted");
	}
	else{
		response.sendRedirect("viewAuthorCart.jsp?msg=notDeleted");
	}
	
	}
	
	catch(Exception e){
		out.println(e);
		}
		%>
</body>
</html>