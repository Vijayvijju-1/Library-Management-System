<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/0afb2e1467.js"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>My Cart</title>
<style>
body {
	margin: 0;
	background: #EFFFFD;
}

.cart {
	background: #fff;
	box-shadow: 2px 2px 10px grey;
	width: 120%;
	height: 60px;
	margin:0%;
}

.cart h2 {
	color: #1687A7;
	margin: -32px auto auto 90px;
}

.products {
	border-radius: 7px;
	margin-left: 50px;
	margin-top: 45px;
	margin-bottom: -40px;
	background: #fff;
	box-shadow:  10px  grey;
	width: 68%;
	height: 200px;
	border:2px solid #E9DCDA;
}

.title {
	padding: 20px;
	margin-bottom: 0;
	justify-content: center;
}

.wrapper {
	height: 50px;
	width: 150px;
	display: flex;
	background: #fff;
	border-radius: 12px;
	border: 1px solid #00FFAB;
	float: right;
	position: absolute;
	margin: -90px auto 0 55%;
}

.wrapper span {
	width: 100%;
	text-alignment: center;
	font-size: 35px;
	font-weight: 500;
}

.wrapper span.num {
	padding: 4px;
	font-size: 35px;
	border-right: 2px solid rgba(0, 0, 0, 0.2);
	border-left: 2px solid rgba(0, 0, 0, 0.2);
}

.delete {
	font-size: 20px;
	position: absolute;
	margin: -130px 0 0 65%;
}
.price{
width:400px;
height:50px;
padding:20px 100px 10px 20px;
}
.checkout {
	height: 450px;
	width: 450px;
	display: flex;
	background: #fff;
	border-radius: 12px;
	box-shadow: 2px 2px 10px grey;
	float: right;
	position: fixed;
	
	position:absolute;
	top:16%;
	right:3%;
 display: inline-block;
}
table {
    border: 0;
    text-align:left;
  }
  
 
  table tr {
 
  font-size:20px;
  padding:20px;
    display: block;
    margin-bottom: .625em;
  }
    table td {
    padding-right:200px;
    text-align:left;
  }
.button-41 {
	background-color: initial;
	background-image: linear-gradient(-180deg, #00D775, #00BD68);
	border-radius: 5px;
	box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
	color: #FFFFFF;
	cursor: pointer;
	display: inline-block;
	font-family: Inter, -apple-system, system-ui, Roboto, "Helvetica Neue",
		Arial, sans-serif;
	height: 44px;
	font-size: 18px;
	line-height: 44px;
	outline: 0;
	overflow: hidden;
	padding: 0 20px;
	pointer-events: auto;
	position: relative;
	text-align: center;
	touch-action: manipulation;
	user-select: none;
	-webkit-user-select: none;
	vertical-align: top;
	white-space: nowrap;
	width: 80%;
	border: 0;
	margin:10% auto 20px 40px;
	
}

.button-41:hover {
	background: #00bd68;
}



</style>
</head>
<body style=" overflow-x:hidden; overflow-y:auto;margin:0;" >
	<%
	String login_id = session.getAttribute("login_id").toString();
	try {
		ConnectionJDBC o = new ConnectionJDBC();
		Connection con = o.createConnection();
		Statement st = con.createStatement();
		ResultSet rs = st
		.executeQuery("select book_id,book_title,price,quantity  from cart where login_id='" + login_id + "'");
		%>
	<script type="module"
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule
		src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

	<header>
		<div class="cart">
			<nav>
				<a href="authorBuy.jsp"><ion-icon name="arrow-back-outline"
						style="font-size:2rem;margin:13px auto auto 50px;"></ion-icon></a>
				<h2>CART</h2>
			</nav>
		</div>
	</header>
	<h1 style="margin: 20px auto auto 60px;">Books In Your Cart</h1>
	<% %>
	
	
	
<%

		while (rs.next()) {
	%>
	
	<div class="products">
		<div class="title">
			<h1><%=rs.getString(2)%></h1>
			<h2>
				<i class="fa fa-inr"></i><%=rs.getString(3)%></h2>
		</div>
		<div class="delete">
			<a href="deleteAuthorBook.jsp?book_id=<%=rs.getString(1)%>"><i
				class="fa-solid fa-trash" style="color: skyblue;"></i></a>
		</div>
		<div class="wrapper">

			<span class="minus"><a
				href="decreaseAuthor.jsp?book_id=<%=rs.getString(1)%>"><ion-icon
						name="remove-outline"
						style="color:#00FFAB;margin:5px 10px 5px 10px;"></ion-icon></a></span> <span
				class="num"><%=rs.getString(4)%></span> <span class="plus"><a
				href="increaseAuthor.jsp?book_id=<%=rs.getString(1)%>"><ion-icon
						name="add-outline" style="color:#00FFAB;margin:5px 10px 5px 10px;"></ion-icon></a></span>
		</div>
	</div>
<% }
int total=0;
int quantity=0;
Statement st1 = con.createStatement();
ResultSet rs1 = st.executeQuery("select price,quantity from cart where login_id= '" + login_id + "'");
while(rs1.next()){
	total+=rs1.getInt(1)*rs1.getInt(2);
	quantity+=rs1.getInt(2);
}
%>	
<div class="checkout">
<table>

<tr><td style="padding-right:230px;">No of Books:</td><td><%=quantity %></td></tr>
<tr><td>Delivery Charges:</td><td style="color:#388e3c">FREE</td></tr>
<tr><td style="padding-right:270px;">Total:</td><td><%=total %></td></tr>

</table>

<%if(quantity!=0){ %>
<button class="button-41" role="button" onClick="location.href='buyNowAuthor.jsp'">Proceed To Checkout</button>
<%}
else{
%><h2 style="margin:auto;padding:15px;text-align:center;">Your cart is empty!</h2>
<h4 style="margin:auto;text-align:center;">Explore our wide selection and find something you like</h4>
<%} %>
	</div>
	
	<%
	
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>