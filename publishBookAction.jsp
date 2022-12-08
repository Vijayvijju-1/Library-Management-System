<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddBook</title>

</head>
<body>
	<%try{
	String login_id=session.getAttribute("login_id").toString();
	
	String book_title = request.getParameter("book_title");
	String No_actual_copies = request.getParameter("No_actual_copies");
	String No_current_copies = No_actual_copies;
	String category = request.getParameter("category");
	String Published_year = request.getParameter("published_year");
	String price = request.getParameter("price");
	String book_author = request.getParameter("book_author");
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	PreparedStatement ps = con.prepareStatement(
			"insert into book_details(book_title,No_actual_copies,No_current_copies,category,Published_year,price,book_author) values(?,?,?,?,?,?,?)");
	ps.setString(1, book_title);
	ps.setString(2, No_actual_copies);
	ps.setString(3, No_current_copies);
	ps.setString(4, category);
	ps.setString(5, Published_year);
	ps.setString(6, price);
	ps.setString(7,book_author);
	int z = ps.executeUpdate();
	Statement st1=con.createStatement();
	ResultSet rs=st1.executeQuery("select book_id from book_details where book_title='"+book_title+"'");
	rs.next();
	String book_id=rs.getString(1);
	Statement st2=con.createStatement();
	int k=st1.executeUpdate("insert into author_books values('"+login_id+"','"+book_title+"','"+price+"','"+book_id+"')");
	if (k==1) {
	response.sendRedirect("publishBooks.jsp?msg=done");
	}
	else{
		response.sendRedirect("publishBooks.jsp?msg=wrong");
	}
	}
	catch(Exception  e){
		System.out.println(e);
		System.out.println(e.getMessage());
		response.sendRedirect("publishBooks.jsp?msg=error");

	}
	%>
</body>
</html>