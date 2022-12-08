<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="authorHeader.jsp"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/0afb2e1467.js"
	crossorigin="anonymous"></script>
<!-- custom css file link  -->
<link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body {
	background: #fff;
	background-size: 100% 200%;
	background-repeat: no-repeat;
	font-family: Roboto, Arial, sans-serif;
}

#home {
	background: #fff;
	border-radius: 7px;
	padding: 10px;
	background: #fff;
	color: #5F4B8BFF;
	margin-bottom: -1px;
}
</style>
<style>
.button-37 {
	background-color: #13aa52;
	border: 1px solid #13aa52;
	border-radius: 6px;
	box-shadow: rgba(0, 0, 0, .1) 0 2px 4px 0;
	box-sizing: border-box;
	color: #fff;
	cursor: pointer;
	font-family: "Akzidenz Grotesk BQ Medium", -apple-system,
		BlinkMacSystemFont, sans-serif;
	font-size: 14px;
	font-weight: 400;
	outline: none;
	outline: 0;
	padding: 12px 25px;
	text-align: center;
	transform: translateY(0);
	transition: transform 150ms, box-shadow 150ms;
	user-select: none;
	-webkit-user-select: none;
	touch-action: manipulation;
}

.button-37:hover {
	box-shadow: rgba(0, 0, 0, .15) 0 3px 9px 0;
	transform: translateY(-2px);
}

@media ( min-width : 768px) {
	.button-37 {
		padding: 10px 30px;
	}
}

h3 {
	color: green;
	text-align: center;
}

.frame {
	margin-left: 250px;
	margin-right: -220px;
	text-align: center;
}

button {
	margin: 10px;
}

.custom-btn {
	width: 130px;
	height: 45px;
	color: #fff;
	border-radius: 6px;
	padding: 12px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

.btn-3 {
	background: rgb(0, 172, 238);
	background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
	width: 130px;
	height: 40px;
	line-height: 42px;
	padding: 0;
	border: none;
}

.btn-3 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.btn-3:before, .btn-3:after {
	position: absolute;
	content: "";
	right: 0;
	top: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3:before {
	height: 0%;
	width: 2px;
}

.btn-3:after {
	width: 0%;
	height: 2px;
}

.btn-3:hover {
	background: transparent;
	box-shadow: none;
}

.btn-3:hover:before {
	height: 100%;
}

.btn-3:hover:after {
	width: 100%;
}

.btn-3 span:hover {
	color: rgba(2, 126, 251, 1);
}

.btn-3 span:before, .btn-3 span:after {
	position: absolute;
	content: "";
	left: 0;
	bottom: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3 span:before {
	width: 2px;
	height: 0%;
}

.btn-3 span:after {
	width: 0%;
	height: 2px;
}

.btn-3 span:hover:before {
	height: 100%;
}

.btn-3 span:hover:after {
	width: 100%;
}

.copies {
	color: red;
	font-size: 2rem;
}

.sorting {
	background: #EFFFFD;
	border: 1px solid #DEE0E3;
	width: 240px;
	height: 260px;
	justify-contents: center;
	text-align: left;
	position: absolute;
	top: 15%;
	left: 25px;
	padding-left: 7px;
  position: fixed;
  border-top-right-radius:40px;
  border-bottom-left-radius:40px;
}

.sorting span {
	font-family: Roboto, Arial, sans-serif;
	padding: 20px;
	padding-bottom: 10px;
	color: black;
	font-weight: 700;
}

.sorting a {
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="home-style.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/0afb2e1467.js"
	crossorigin="anonymous"></script>
<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<style>
h3 {
	color: green;
	text-align: center;
}

.frame {
	width: 90%;
	margin: 20px auto;
	text-align: center;
}

button {
	margin: 5px;
}

.custom-btn {
	width: 130px;
	height: 45px;
	color: #fff;
	border-radius: 12px;
	padding: 12px 25px;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: transparent;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
	box-shadow: inset 2px 2px 2px 0px rgba(255, 255, 255, .5), 7px 7px 20px
		0px rgba(0, 0, 0, .1), 4px 4px 5px 0px rgba(0, 0, 0, .1);
	outline: none;
}

.btn-3 {
	background: rgb(0, 172, 238);
	background: linear-gradient(0deg, rgba(0, 172, 238, 1) 0%,
		rgba(2, 126, 251, 1) 100%);
	width: 130px;
	height: 40px;
	line-height: 42px;
	padding: 0;
	border: none;
}

.btn-3 span {
	position: relative;
	display: block;
	width: 100%;
	height: 100%;
}

.btn-3:before, .btn-3:after {
	position: absolute;
	content: "";
	right: 0;
	top: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3:before {
	height: 0%;
	width: 2px;
}

.btn-3:after {
	width: 0%;
	height: 2px;
}

.btn-3:hover {
	background: transparent;
	box-shadow: none;
}

.btn-3:hover:before {
	height: 100%;
}

.btn-3:hover:after {
	width: 100%;
}

.btn-3 span:hover {
	color: rgba(2, 126, 251, 1);
}

.btn-3 span:before, .btn-3 span:after {
	position: absolute;
	content: "";
	left: 0;
	bottom: 0;
	background: rgba(2, 126, 251, 1);
	transition: all 0.3s ease;
}

.btn-3 span:before {
	width: 2px;
	height: 0%;
}

.btn-3 span:after {
	width: 0%;
	height: 2px;
}

.btn-3 span:hover:before {
	height: 100%;
}

.btn-3 span:hover:after {
	width: 100%;
}

.auth {
	box-shadow: 5px blue;
	width: 80%;
	margin: 7% auto;
	box-shadow: 2px 2px 15px grey;
}
.a{
margin:15px;
	padding-top:7px;
	padding-bottom:7px;
}
.b{
margin:15px;
	padding-top:7px;
	padding-bottom:7px;
}
.c{
margin:15px;
	padding-top:7px;
	padding-bottom:7px;
}
</style>

</head>
<body>
	<div class="sorting" style="font-size: 16px;">
		<div style="padding-left:15px;padding-top:20px;">
			<B>sort-by</B>
		</div>
		<div class="c">
			<a href="authorBuy.jsp?msg=newest">Newest First</a>
		</div>
		<div class="a">
			<a href="authorBuy.jsp?msg=lowToHigh">Price -- Low to High</a>
		</div>
		<div class="b">
			<a href="authorBuy.jsp?msg=highToLow">Price -- High to Low</a>
		</div>
	</div>

	<section class="arrivals" id="arrivals"
		style="margin-top: 80px; margin-left: 7%;">
		<h1 class="heading">
			<span>Buy Now @50% off</span>
		</h1>
		<%
		String login_id = session.getAttribute("login_id").toString();
		String msg = request.getParameter("msg");
		try {
			ConnectionJDBC o = new ConnectionJDBC();
			Connection con = o.createConnection();
			Statement st = con.createStatement();
			ResultSet rs;
			if ("lowToHigh".equals(msg)) {
				rs = st.executeQuery(
				"select book_id,book_title,category,price,No_current_copies from book_details ORDER BY price ASC ");
		%><style>
.a {
	color:black;
	cursor: default;
	border-top: 1px solid #B0B5BE;
	border-bottom: 1px solid #B0B5BE;
	font-weight: 500;
	margin:15px;
	padding:7px;
}
</style>
		<%
		}

		else if ("highToLow".equals(msg)) {
		rs = st.executeQuery(
				"select book_id,book_title,category,price,No_current_copies from book_details ORDER BY price DESC ");
		%><style>
.b {
	color:black;
	cursor: default;
	border-top: 1px solid #B0B5BE;
	border-bottom: 1px solid #B0B5BE;
	font-weight: 500;
	margin:15px;
	padding:7px;
}
</style>
		<%
		} else if ("newest".equals(msg)) {
		rs = st.executeQuery(
				"select book_id,book_title,category,price,No_current_copies from book_details ORDER BY book_id DESC ");
		%><style>
.c {
	color:black;
	cursor: default;
	border-top: 1px solid #B0B5BE;
	border-bottom: 1px solid #B0B5BE;
	font-weight: 500;
	margin:15px;
	padding:7px;
}
</style>
		<%
		} else {
		rs = st.executeQuery("select book_id,book_title,category,price,No_current_copies from book_details ");

		}

		while (rs.next()) {
		String book_id = rs.getString(1);
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(
				"select exists(select book_id from cart where book_id='" + book_id + "' and login_id='" + login_id + "')");

		rs1.next();
		%>


		<div class="swiper arrivals-slider" style="margin-top: 5px;">

			<div class="swiper-wrapper">

				<a href="#" class="swiper-slide box">
					<div class="image">
						<img
							src="http://cdn.shopify.com/s/files/1/0064/5342/8271/collections/Aspen_Style_1200_grey.jpg?v=1625672489"
							alt="">
					</div>
					<div class="content" style="text-align:left;">
						<h2 style="font-size: 20px;color:black;style="margin-left: 9px;""><%=rs.getString(2)%></h2>
						<h3 style="font-size: 16px;font-weight:400;" >
							Genre:
							<%=rs.getString(3)%></h3>
						<div class="price">
							<i class="fa fa-inr"></i><%=rs.getString(4)%></div>
						<div class="stars">
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star"></i> <i class="fas fa-star"></i> <i
								class="fas fa-star-half-alt"></i>
						</div>
					</div>
					<div class="copies" style="margin-right:250px;">
						
						<%=rs.getString(5)%>&nbsp;&nbsp;<span>Left!</span>
					</div> <%
 if (rs1.getBoolean(1)) {
 %>
					<div class="frame">
						<button onClick="location.href='viewAuthorCart.jsp'" class="button-37"
							role="button" style="background: #388e3c">
							<span>GO TO CART</span>
						</button>
					</div> <%
 } else {
 %>
					<div class="frame">
						<button
							onClick="location.href='authorCart.jsp?book_id=<%=rs.getString(1)%>'"
							class="custom-btn btn-3">
							<span>ADD TO CART</span>
						</button>
					</div> <%
 }
 %>
					<div class="frame">
						<button
							onClick="location.href='authorRent.jsp?book_id=<%=rs.getString(1)%>'"
							class="custom-btn btn-3">
							<span>RENT NOW</span>
						</button>
					</div>
				</a>


			</div>

		</div>


		<%
		}

		if ("added".equals(msg)) {
		%>
		<h3 class="alert">Book added successfully!</h3>
		<%
		}
		if ("exist".equals(msg)) {
		%>
		<h3 class="alert">Product already exist in you cart! Quantity
			increased!</h3>
		<%
		}
		if ("invalid".equals(msg)) {
		%>
		<h1 style="color: red; text-align: center;">Only One Book is
			allowed per Customer!</h1>
		<%
		}
		%>
	</section>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>


</body>
</html>