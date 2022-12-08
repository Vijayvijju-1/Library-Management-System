<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/NewProduct-style.css">
<link rel="stylesheet" type="text/css" href="admincss.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>

<div style="color:green; text-align: center; font-size: 40px; margin-bottom:15px; margin-top:20px;">Update Book details </div>
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
menuToggle.onclick=function(){
	
	menuToggle.classList.toggle('active');
	navigation.classList.toggle('active');
}

</script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="navscript.js"></script>

<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h1 class="alert"><center>Book Successfully Updated!</center></h1>
<% 
}
%>
<% 
if("wrong".equals(msg)){
%>
<h1 class="alert">Some thing went wrong! Try again!</h1>
<%} %>


<%
String book_id=request.getParameter("id");
request.getSession().setAttribute("book_id", book_id);
try{
	   ConnectionJDBC o = new ConnectionJDBC();
	   Connection con = o.createConnection();
	   Statement st=con.createStatement();
	   ResultSet rs=st.executeQuery("select category,price from book_details where book_id='"+book_id+"'");
	   while(rs.next()){
%>
 <div class="container" style="margin-top:3%">
    <div class="title">Update Book Price for id=<%=book_id %></div>
    <div class="content">
      <form action="editProductAction.jsp">
          <input type="hidden" name="book_id" value="<% out.println(book_id); %>">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Book Genre</span>
            <input type="text" placeholder="<%= rs.getString(1)%>" name="category" required>
          </div>
          <div class="input-box">
            <span class="details">Book Price</span>
            <input type="text" placeholder="<%= rs.getString(2)%>" name="price"required>
          </div>
        </div>
        <div class="butt">
          <input type="submit" value="Save">
        </div>
      </form>
    </div>
  </div>
  <%}
}
catch(Exception e){
	out.println(e);
}
  
  %>
</body>
<br><br><br>
</body>
</html>