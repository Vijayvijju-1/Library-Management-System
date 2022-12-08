<%@page errorPage="../error.jsp" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="home-style.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js">
 <script src="https://kit.fontawesome.com/0afb2e1467.js" crossorigin="anonymous"></script>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>admin</title>
<style>
#img{
position:absolute;
margin-left:52%;
margin-top:-8px;
margin-bottom:5px;
padding:15px;
width:75px;
color:#fff;
}
</style>
</head>
    <!--Header-->
   <body>
   <%
   try{
		String login_id=session.getAttribute("login_id").toString();
		ConnectionJDBC o=new ConnectionJDBC();
		Connection con=o.createConnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select name from member_details where login_id='"+login_id+"'");
		rs.next();
   %>
 <header class="header">
  <div class="header-2">
        <nav class="navbar" style="padding:10px;">
       <a href="" class="logo" style="font-size:2.5em;position:absolute;margin-left:-57%;margin-top:-10px;margin-bottom:30px;"> <i class="fas fa-book"></i>&nbsp;Planon Library</a>
         <a href="" style="font-size:19px;margin-right:-46%;margin-left:20%;"></a>&nbsp;&nbsp;
         <a href="" style="font-size:19px;position:absolute;margin-left:890px;"></i></a>
         <a href=""  style="font-size:2em;position:absolute;margin-left:45%;margin-top:-8px;margin-bottom:20px;padding:15px;">Hello&nbsp;<b style=" color:152336;"><%=rs.getString(1)%></b></a> 
         <!--  <a href="#featured">featured</a> <svg width="4.7" height="8" viewBox="0 0 16 27" xmlns="http://www.w3.org/2000/svg" class="RWB9Wm"><path d="M16 23.207L6.11 13.161 16 3.093 12.955 0 0 13.161l12.955 13.161z" fill="#fff" class="_2JzwqO"></path></svg>-->
        </nav>
    </div>
</header>

<%
}
catch(Exception e){
	e.printStackTrace();
}
%>

<!-- 
<div class="side-bar">
<div class="menu">
<div class="item"><a href="addNewProduct.jsp">Dashboard<i class='fas fa-desktop'></i></a></div>
            <a href="addNewProduct.jsp">Add Book <i class='fas fa-plus-square'></i></a>
            <a href="allProductEditProduct.jsp">All Products & Edit Products <i class='fab fa-elementor'></i></a>
            <a href="" class="fa-solid fa-user-plus">Add Admin</a>
            <a href="">Orders Received <i class="fas fa-archive"></i></a>
            <a href="">Delivered Orders <i class='fas fa-dolly'></i></a>
            <a href="">Logout <i class='fas fa-share-square'></i></a>
</div>
</div>

    <div class="topnav sticky">
   
            <a href="addNewProduct.jsp" style="font-size:20px;">Add Book <i class='fas fa-plus-square'></i></a>&nbsp;&nbsp;
            <a href="allProductEditProduct.jsp" style="font-size:20px;">View Books <i class='fab fa-elementor'></i></a>&nbsp;&nbsp;
            <a href="addAdmin.jsp" style="font-size:20px;"> Add Admin<i class="fa-solid fa-user-plus"></i></a>&nbsp;&nbsp;
            <a href="makeAuthor.jsp" style="font-size:20px;">Requests Received <i class="fas fa-archive"></i></a>&nbsp;&nbsp;
            <a href="viewMembers.jsp" style="font-size:20px;">View Members <i class='fas fa-search'></i></a>&nbsp;&nbsp;
            
          </div>
           <br> -->
    <!--table-->
</body>