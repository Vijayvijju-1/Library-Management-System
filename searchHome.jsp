<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="header.jsp"%>
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
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../css/style.css">
<title>Home</title>
<style>


.button-37 {
  background-color: #13aa52;
  border: 1px solid #13aa52;
  border-radius: 6px;
  box-shadow: rgba(0, 0, 0, .1) 0 2px 4px 0;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  font-family: "Akzidenz Grotesk BQ Medium", -apple-system, BlinkMacSystemFont, sans-serif;
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

@media (min-width: 768px) {
  .button-37 {
    padding: 10px 30px;
  }
}
h3 {
	color: green;
	text-align: center;
}
.frame {
  margin-left: 200px;
  margin-right:-220px;
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
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-3 {
  background: rgb(0,172,238);
background: linear-gradient(0deg, rgba(0,172,238,1) 0%, rgba(2,126,251,1) 100%);
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
.btn-3:before,
.btn-3:after {
  position: absolute;
  content: "";
  right: 0;
  top: 0;
   background: rgba(2,126,251,1);
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
.btn-3:hover{
   background: transparent;
  box-shadow: none;
}
.btn-3:hover:before {
  height: 100%;
}
.btn-3:hover:after {
  width: 100%;
}
.btn-3 span:hover{
   color: rgba(2,126,251,1);
}
.btn-3 span:before,
.btn-3 span:after {
  position: absolute;
  content: "";
  left: 0;
  bottom: 0;
   background: rgba(2,126,251,1);
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

.copies{
color:red;
font-size:2rem;
}


</style>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<div style="color: white; text-align: center; font-size: 30px;">
		Home <i class="fa fa-institution"></i>
	</div>
<% 
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
	<h3 class="alert">Product added successfully!</h3>
<%
}
if("alreadyExist".equals(msg)){
%>
	<h3 class="alert">Product already exist in you cart! Quantity increased!</h3>
<% 
}
if("invalid".equals(msg)){
%>
<h1 style="color:red;text-align:center;">Something went wrong! Try Again After Sometime!</h1>
<%
}
%>
<h1 style="color:#336699;text-align:center;padding-bottom:10px;padding-top:5px;">Your Search Results:</h1>
<section class="arrivals" id="arrivals" style="margin-top:-50px;">

<%  
int z=0;
try{
	String login_id=session.getAttribute("login_id").toString();
	String search=request.getParameter("search");
	 //out.println(search);
	 
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select book_id,book_title,category,price from book_details where book_title like '%"+search+"%'  or category like '%"+search+"%' and status='1'");
    while(rs.next()){
    	z=1;
    	String book_id=rs.getString(1);
    	Statement st1=con.createStatement();
    	ResultSet rs1=st1.executeQuery("select exists(select book_id from cart where book_id='"+book_id+"' and login_id='"+login_id+"')");
    	rs1.next();
    	%>
     	
    <div class="swiper arrivals-slider" style="margin-top:10px;">

        <div class="swiper-wrapper">

            <a href="#" class="swiper-slide box">
                <div class="image">
                    <img src="http://cdn.shopify.com/s/files/1/0064/5342/8271/collections/Aspen_Style_1200_grey.jpg?v=1625672489" alt="">
                </div>
                <div class="content">
                    <h2><%=rs.getString(2)%></h2>
                    <h3 style="margin-left:9px;">Genre: <%=rs.getString(3)%></h3>
                    <div class="price"><i class="fa fa-inr"></i><%=rs.getString(4)%></div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
<div class="copies">Hurry up, Only <%=rs.getString(1)%> left!</div>
<%if(rs1.getBoolean(1)){ %>
<div class="frame"> <button onClick="location.href='viewCart.jsp'" class="button-37" role="button" style="background:#388e3c"><span>GO TO CART</span></button></div>
<%}
else{ %>
<div class="frame"> <button onClick="location.href='myCart.jsp?book_id=<%=rs.getString(1)%>'" class="custom-btn btn-3"><span>ADD TO CART</span></button></div>
<%} %>                       
<div class="frame"> <button onClick="location.href='rentNow.jsp?book_id=<%=rs.getString(1)%>'" class="custom-btn btn-3"><span>RENT NOW</span></button></div>
            </a>


        </div>

    </div>
   
<%}
    }
    catch(Exception e){
    	e.printStackTrace();
    }
    %>
 
		
	   <%
	  
    if(z==0){
    	%>
    	<h1 style="text-align:center;color:red;margin-top:20px;font-size:30px;">Nothing to Show</h1>
   <% }
    
    
    %>
 </section>
</body>

</html>