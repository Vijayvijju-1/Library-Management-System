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
	int k1=st.executeUpdate("delete from book_details  where book_id='"+book_id+"'");
	Statement st1=con.createStatement();
	int k2=st.executeUpdate("delete from author_books  where book_id='"+book_id+"'");
	if (k1==1 && k2==1) {
	response.sendRedirect("allProductEditProduct.jsp?msg=deleted");
	}
	else{
		response.sendRedirect("allProductEditProduct.jsp?msg=notDeleted");
	}
	
	}
	
	catch(Exception e){
		out.println(e);
		}
		%>
</body>
</html>