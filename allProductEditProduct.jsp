<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<%@include file="modal.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="admincss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body{
	background: #fff;
	
}
h3
{
	color: yellow;
	text-align: center;
}

.tablediv{
width:90%;
margin:1% auto ;
margin-left:6%;
}
.b{
margin-left:7%;

}


</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h1 style="text-align:center;margin-top:20px;">Book Added SuccesFully</h1>
<%
}
else if("wrong".equals(msg)){
%>
<h1 style="text-align:center;margin-bottom:20px;">Some Error Occured,Book connot be added!</h1>
<%} %>


<div style="color:green; text-align: center; font-size: 40px; margin-bottom:15px; margin-top:20px;">All Books </div>
<div class="b"><button onclick="document.getElementById('id01').style.display='block'">Add Book</button></div>
<div class="navigation">
<ul >

<li class="list ">
<a href="adminHome.jsp">
<span class="icon"><ion-icon name="home-outline"></ion-icon></span>
<span class="title">Home</span>
</a>
</li>
<li class="list active">
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
let tablediv=document.querySelector('.tablediv');
menuToggle.onclick=function(){
	
	menuToggle.classList.toggle('active');
	navigation.classList.toggle('active');
	tablediv.classList.toggle('size');
}

</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="navscript.js"></script>

<div class="tablediv">
<table >
        <thead>
          <tr>
            <th scope="col">Book_ID</th>
            <th scope="col">Name</th>
            <th scope="col">No of actual copies</th>
            <th scope="col">No of current copies</th>
            <th scope="col">Category</th>
            <th scope="col">Published year</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Author</th>
            <th scope="col">Edit</th>
            <th scope="col">Delete</th>
          </tr>
        </thead>
        <tbody>
       <%
       try{
    	   ConnectionJDBC o = new ConnectionJDBC();
    	   Connection con = o.createConnection();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select * from book_details where status='1'");
    	   while(rs.next()){
       %>
          <tr>
            <td><%= rs.getString(1)%></td>
            <td><%= rs.getString(2)%></td>
            <td><%= rs.getString(3)%></td>
            <td><%= rs.getString(4)%></td>
            <td><%= rs.getString(5)%></td>
            <td><%= rs.getString(6)%></td>
            <td style="font-weight:300"><i   class="fa fa-inr"><%= rs.getString(7)%></i></td>
            <td><%= rs.getString(8)%></td>
           <td><div class="button_container">

	        <a class="action-icon" style="font-size: 25px;color:#F6F3BE;" href="editProduct.jsp?id=<%=rs.getString(1)%>"><i class="fa-solid fa-pen-to-square" style="font-weight:400"></i></a>
            
            </div>
            </td>
            <td>
            <div class="frame">
            <a class="action-icon" style="font-size:25px;color:#B3EAF3;" href="deleteBookFromAdmin.jsp?book_id=<%=rs.getString(1)%>"><i class="fa-solid fa-trash"></i></a>
            </div>
            </td>
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
      <br>
      <br>
      <br>
      <%
      if("deleted".equals(msg)){
    	  %>
    	  <h3 style="text-align:center; color:violet;" >Book deleted!</h3>
      <%
      }
      if("notDeleted".equals(msg)){
    	  %>
    	  <h3 style="text-align:center; color:red;" >Unable to delete! Something went Wrong, Please Try again after sometime!!</h3>
     <% }
      %>

</body>
</html>