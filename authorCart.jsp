<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<%	String login_id=session.getAttribute("login_id").toString();
    String book_id=request.getParameter("book_id");
%>

<% 
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *  from book_details where book_id='"+book_id+"'");
	rs.next();
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select exists(select book_id from cart where book_id='"+book_id+"' and login_id='"+login_id+"')");
	rs1.next();
	if(rs1.getBoolean(1)){
		Statement st2=con.createStatement();
		st2.executeUpdate("update cart set quantity=quantity+1 where book_id='"+book_id+"' and login_id='"+login_id+"'");
		response.sendRedirect("viewCart.jsp?msg=increased");
	}
	else{
	PreparedStatement  ps=con.prepareStatement("insert into cart(book_id, price,quantity, login_id,book_title,category ) values(?,?,?,?,?,?)");
	ps.setString(1,rs.getString(1));
	ps.setString(5,rs.getString(2));
	ps.setString(2,rs.getString(7));
	ps.setInt(3,1);
	ps.setString(4,login_id);
	ps.setString(6,rs.getString(5));
	ps.execute();
	response.sendRedirect("authorBuy.jsp?msg=added");
	}
}
catch(Exception e){
	   out.println(e);
}
	%>
	














<!--  

<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<h3 class="alert">There is only one Quantity! So click on remove!</h3>

<h3 class="alert">Quantity  Increased Successfully!</h3>

<h3 class="alert">Quantity  Decreased Successfully!</h3>

<h3 class="alert">Product Successfully Removed!</h3>

<table style="width:99%">
<thead>

          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i> </th>
            <th scope="col"><a href="">Proceed to order</a></th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      
          <tr>

           <td></td>
            <td></td>
            <td></td>
            <td><i class="fa fa-inr"></i> </td>
            <td><a href=""><i class='fas fa-plus-circle'></i></a>  <a href=""><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i> </td>
            <td><a href="">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>

        </tbody>
      </table>
      <br>
      <br>
      <br>
-->
</body>
</html>