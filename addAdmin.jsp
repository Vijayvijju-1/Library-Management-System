<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admincss.css">
<link rel="stylesheet" href="NewProduct-style.css">
<link rel="stylesheet" href="signup_page.css">
<style>
body{
background-color:white;

}
</style>
<meta charset="ISO-8859-1">
<title>Add Admin</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
	%>
	<h1 style="text-align:center;">Admin Added,They Can Login From Now</h1>
<% 
}
%>
<div class="navigation">
<ul >

<li class="list ">
<a href="adminHome.jsp">
<span class="icon"><ion-icon name="home-outline"></ion-icon></span>
<span class="title">Home</span>
</a>
</li>
<li class="list ">
<a href="allProductEditProduct.jsp">
<span class="icon"><ion-icon name="library-outline"></ion-icon></span>
<span class="title">View Books</span>
</a>
</li>
<li class="list active">
<a href="addAdmin.jsp">
<span class="icon"><ion-icon name="person-add-outline"></ion-icon></span>
<span class="title">Add Admin</span>
</a>
</li>
<li class="list ">
<a href="makeAuthor.jsp">
<span class="icon"><ion-icon name="download-outline"></ion-icon></span>
<span class="title">Requests</span>
</a>
</li>
<li class="list " >
<a href="viewMembers.jsp">
<span class="icon"><ion-icon name="people-outline"></ion-icon></span>
<span class="title">View Members </span>
</a>
</li>
<li class="list ">
<a href="logout.jsp">
<span class="icon"><ion-icon name="log-out-outline"></ion-icon></span>
<span class="title">Logout</span>
</a>
</li>
</ul>

</div>

<div class="toggle"><ion-icon name="menu-outline" class="open"></ion-icon><ion-icon name="close-outline" class="close"></ion-icon></div>
<script>
let menuToggle=document.querySelector('.toggle');
let navigation=document.querySelector('.navigation');
menuToggle.onclick=function(){
	
	menuToggle.classList.toggle('active');
	navigation.classList.toggle('active');
}

</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="navscript.js"></script>



<!-- ADD ADMIN CONTAINER -->
<div class="container" style="margin:4% auto;">
    <div class="title">Add New Admin</div>
    <div class="content">
      <form action="adminAdded.jsp">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Admin Name</span>
            <input type="text" placeholder="Enter Name" name="name" required>
          </div>
          <div class="input-box">
            <span class="details">Phone num</span>
            <input type="text" placeholder="Enter admin phone num" name="login_id" required>
          </div>
          
        
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter admin's email" name="email" required>
          </div>
           <div class="input-box">
          
            <span class="details"> Password</span>
            <input type="password" placeholder="Set Password" name="password"required>
          </div>
        </div>
        
			
        <div class="butt">
          <input type="submit" value="Add Member">
        </div>
      </form>
    </div>
  </div>
</body>
</html>