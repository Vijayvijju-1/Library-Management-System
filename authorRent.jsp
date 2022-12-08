<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank you</title>
<link rel="stylesheet" href="signup-style.css">
</head>
<body>
<%
String login_id=session.getAttribute("login_id").toString();
String book_id=request.getParameter("book_id");
%>


<% 
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select price,book_title from book_details where book_id='"+book_id+"'");
	rs.next();
	
	PreparedStatement ps=con.prepareStatement("insert into rental(login_id,book_id,rented_date,return_date,price,book_title) values(?,?,?,?,?,?)");
    ps.setString(1,login_id);
    ps.setString(2,book_id);
    ps.setDate(3,java.sql.Date.valueOf(java.time.LocalDate.now()));
    ps.setDate(4, java.sql.Date.valueOf(java.time.LocalDate.now().plusDays(3)));
    ps.setString(5,rs.getString(1));
    ps.setString(6,rs.getString(2));
	int k=ps.executeUpdate();
	if(k==1){
		%>
<div id='container'>
  <div class='login' style="padding:20px;
width:400px;
height:245px;
border-radius:10px;
text-align:center;
font-size:25px;
margin:10% auto auto 40% ;
background:#F2E5E5;">
  <p><b>ThankYou Your book is Successfully rented : )</b></p>
  <div class="butto">
   <button type="submit" onClick="location.href='authorBuy.jsp'" >Go back</button>
    </div>   
  </div>
 </div>
		<% 
	}
}
catch(Exception e){
	out.println(e.getMessage());
}
	%>
</body>
</html>