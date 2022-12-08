<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Returned Successful!</title>
<link rel="stylesheet" href="dialogg.css">

</head>
<body>
<% 
String login_id=session.getAttribute("login_id").toString();
String book_id=request.getParameter("book_id");

try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
		Date returneddate = java.sql.Date.valueOf(java.time.LocalDate.now());
		Statement st2=con.createStatement();
		st2.executeUpdate("update rental set returned_date='"+returneddate+"',returned='1' where book_id='"+book_id+"' and login_id='"+login_id+"'");
	
	response.sendRedirect("rent.jsp?status=returned");
}
	

catch(Exception e){
	out.println(e);
}

%>
</body>
</html>