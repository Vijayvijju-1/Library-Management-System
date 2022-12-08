<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<%@include file="authorHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
<link rel="stylesheet" href="home-style.css">
<link rel="stylesheet" href="style.css">
<style>
body {
	margin: 0;
	height: 100%;
	background-image:url("authorimg.jpg");
	background-repeat: no-repeat;
  background-size: cover;
  background-attachment: fixed;
}
.revenue{
background:#fff;
width:450px;
margin:15px  auto;
font-size:25px;
border-radius:10px;
}
</style>
</head>
<body style="margin-top:8%">

<div style="color:yellow; text-align: center; font-size: 40px; margin-bottom:15px; margin-top:20px;">Your Books Sales </div>

<table style="width:95%;margin:auto;color:#fff; ">
        <thead>
          <tr>
            <th scope="col">Book Name</th>
            <th scope="col">Price</th>
            <th scope="col">No of Sales</th>
            <th scope="col">Profit</th>
          </tr>
        </thead>
        <tbody>
<%
String login_id=session.getAttribute("login_id").toString();
try{
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select book_id from author_books where login_id='"+login_id+"'");
	
	int sum=0;
	int profit=0;
	while(rs.next()){
	
		String book_id=rs.getString(1);
		Statement st2=con.createStatement();
		ResultSet rs2=st2.executeQuery("select book_title,price,No_actual_copies,No_current_copies from book_details where book_id='"+book_id+"'");
		rs2.next();
		int actual=Integer.parseInt(rs2.getString(3));
		int current=Integer.parseInt(rs2.getString(4));
		int price=Integer.parseInt(rs2.getString(2));//getting price to calc profit
		int sales=actual-current;
		profit=sales*price;
		sum+=profit;
%>
          <tr>
            <td><%= rs2.getString(1)%></td>
            <td><%= rs2.getString(2) %></td>
            <td><%= sales%></td>
            <td><%= profit %></td>
          </tr>
       <%
       }
       %>
         </tbody>
      </table>
	<div class="revenue"><h2 style="text-align:center;color:#FC519C;padding:20px;font-size:30px;"><i><b>The total Revenue is INR.<%=sum %></b></i></h2></div>
<%
}
       catch(Exception e){
    	   e.printStackTrace();
       }
         %>
      



</body>
</html>