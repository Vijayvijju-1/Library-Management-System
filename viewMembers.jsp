<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admincss.css">
<meta charset="ISO-8859-1">
<title>All Members</title>
<style>
.tablediv {
	width: 800px;
	margin: 1% auto;
}
</style>



</head>
<body>

<div class="navigation">
<ul >

<li class="list">
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
<li class="list ">
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
<li class="list active" >
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


<div style="color:green; text-align: center; font-size: 40px; margin-bottom:15px; margin-top:20px;">Our Customers and Team</div>
<div class="tablediv">
<table style="width:99%">
        <thead>
          <tr>
            <th scope="col">Phone Num</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   ConnectionJDBC o = new ConnectionJDBC();
    	   Connection con = o.createConnection();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select login_id,name,email,role from member_details");
    	   while(rs.next()){
    		   String role=rs.getString(4);
    		   if(role.equals("1")){
    			   role="Member";
    		   }
    		   else  if(role.equals("2")){
    			   role="Author";
    		   }
    		   else  if(role.equals("3")){
    			   role="Manager";
    		   }
    		   %>
          <tr>
            <td><%= rs.getString(1)%></td>
            <td><%= rs.getString(2)%></td>
            <td><%= rs.getString(3)%></td>
            <td><%= role%></td>
          </tr>
         <%
    	   }
       }
       catch(Exception e){
    	   out.println(e);
       }
         %>
        </tbody>
      </table>
      </div>
</body>
</html>