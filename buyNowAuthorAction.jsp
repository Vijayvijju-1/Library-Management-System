<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Placed SuccessFully!</title>
<link rel="stylesheet" href="css/signup-style.css">
<style>
body{
	background-image:url("image/letter-bg.jpg");
	background-size:100% 350%;	
	background-repeat:no-repeat;
	
	
}

</style>
</head>
<body>
<% 
 String login_id=session.getAttribute("login_id").toString();

String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String zipcode=request.getParameter("zipcode");
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select book_id,book_title,Category,price,quantity from cart where login_id='"+login_id+"'");
	
	while(rs1.next()){
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from book_details where book_id='"+rs1.getString(1)+"'");
		rs.next();
		String book_id=rs.getString(1);
		int No_current_copies=Integer.parseInt(rs.getString(4));
		int quantity=rs1.getInt(5);
		 No_current_copies-=quantity;
		if(No_current_copies>0){
		PreparedStatement ps=con.prepareStatement("insert into member_books(login_id,book_id,book_title,Category,price,purchase_date,due_date) values(?,?,?,?,?,?,?)");
		ps.setString(1,login_id);
		ps.setString(2,rs1.getString(1));
		ps.setString(3,rs1.getString(2));
		ps.setString(4,rs1.getString(3));
		ps.setString(5,rs1.getString(4));
		ps.setDate(6, java.sql.Date.valueOf(java.time.LocalDate.now()));
		ps.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now().plusDays(3)));
		ps.execute();
	
	Statement st2=con.createStatement();
	st2.executeUpdate("update book_details set No_current_copies='"+No_current_copies+"' where book_id='"+book_id+"'");
	PreparedStatement ps1=con.prepareStatement("update member_books set address=?, city=? ,state=? ,zipcode=? where login_id=?");
	ps1.setString(1,address);
	ps1.setString(2,city);
	ps1.setString(3,state);
	ps1.setString(4,zipcode);
	ps1.setString(5,login_id);
	ps1.execute();
	}
	}
	Statement st3=con.createStatement();
	st3.executeUpdate("truncate table cart");;
%>

<div id='container'>
  <div class='login'>
  <p><b>ThankYou For Shopping with Us : )</b></p>
  <div class="butto">
   <a href="authorBuy.jsp" style="text-decoration:none">Go Back</a>
    </div>   
  </div>
 </div>

</body>
<%
}
catch(Exception e){
	out.println(e);
}

%>
</html>