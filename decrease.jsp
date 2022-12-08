<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%	String login_id=session.getAttribute("login_id").toString();
    String book_id=request.getParameter("book_id");
%>

<% 
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st1=con.createStatement();
	Statement st2=con.createStatement();
	ResultSet rs2=st2.executeQuery("select quantity from cart where book_id='"+book_id+"' and login_id='"+login_id+"'");
	rs2.next();
	int count=rs2.getInt(1);
	if(count>1){
	st1.executeUpdate("update cart set quantity=quantity-1 where book_id='"+book_id+"' and login_id='"+login_id+"'");
	}
	else if(count==0){
		st1.executeUpdate("delete from  cart  where book_id='"+book_id+"' and login_id='"+login_id+"'");
	}
	else {
		st1.executeUpdate("delete from  cart  where book_id='"+book_id+"' and login_id='"+login_id+"'");
	}
	response.sendRedirect("viewCart.jsp?msg=decreased");
	
}
catch(Exception e){
	   out.println(e);
}
	%>
</body>
</html>