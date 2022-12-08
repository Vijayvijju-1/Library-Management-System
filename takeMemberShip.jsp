<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<meta charset="ISO-8859-1">
<title>Take MemberShip</title>
<style>
body{
background-image:url("mem.jpg");
	background-size:cover;	
	background-repeat:no-repeat;
	
	
}
h4{
text-align:center;
}
</style>
</head>
<body>
<% 
String login_id=session.getAttribute("login_id").toString();

try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	st.executeUpdate("insert into membership values('"+login_id+"','pending')");
%>
<div style="padding:20px;
width:500px;
height:500px;
border-radius:10px;
text-align:center;
font-size:20px;
margin:4% auto auto 37% ;
background:#F2E5E5;color:#4F5BD1;">
<h1 style="color:green;">Request Sent Successfully!!</h1>
<h2>Please Wait for Confirmation</h2>
<h2>Why take Membership</h2>
<h4>Can become an Author and publish books</h4>
<h4>Will have a chance to rent/buy Unlimited Books</h4>
<h4>An author is a special person who can publish his own books</h4>
<a style="font-size;40px;text-decoration:none;" href="memberPage.jsp"><i class="fa-solid fa-circle-chevron-left"></i>&nbsp;Go Back</a>
</div>
<%
}
catch(Exception e){
	out.println(e);
}

%>
</body>
</html>