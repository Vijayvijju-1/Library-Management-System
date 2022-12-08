<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddBook</title>
<style>
body{
	background-image: url(bg-image.png);
	background-size:cover;	
	background-repeat:no-repeat;
	background-position:stretch;
	
}
</style>
</head>
<body>
	<%
	String Book_title = request.getParameter("book_title");
	String No_actual_copies = request.getParameter("No_actual_copies");
	String No_current_copies = No_actual_copies;
	String category = request.getParameter("category");
	String Published_year = request.getParameter("published_year");
	String price = request.getParameter("price");
	String book_author = request.getParameter("book_author");
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	PreparedStatement ps = con.prepareStatement(
			"insert into book_details(Book_title,No_actual_copies,No_current_copies,category,Published_year,price,book_author) values(?,?,?,?,?,?,?)");
	ps.setString(1, Book_title);
	ps.setString(2, No_actual_copies);
	ps.setString(3, No_current_copies);
	ps.setString(4, category);
	ps.setString(5, Published_year);
	ps.setString(6, price);
	ps.setString(7,book_author);
	int rs = ps.executeUpdate();
	if (rs == 1) {
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	}
	else{
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
	%>
</body>
</html>