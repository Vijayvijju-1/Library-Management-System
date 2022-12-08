<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<!-- for nav bar -->
<link rel="stylesheet" href="NewProduct-style.css"><!-- for form -->
<title>Add New Product</title>
<style>
body{
	background-image: url(bg-image.png);
	background-size:cover;	
	background-repeat:no-repeat;
	background-position:stretch;
}

</style>
</head>
<body>
<!--  
<h3 class="alert">Product Added Successfully!</h3>

<h3 class="alert">Some thing went wrong! Try Again!</h3>


<h3 style="color: yellow;">Product ID: </h3>


   <div class="left-div">
 <h3>Enter Name</h3>
 
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
   
<hr>
</div>
 <i class='far fa-arrow-alt-circle-right'></i>

</body>
<br><br><br>
-->
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h1 style="text-align:center;margin-bottom:20px;">Book Added SuccesFully</h1>
<%
}
else if("wrong".equals(msg)){
%>
<h1 style="text-align:center;margin-bottom:20px;">Some Error Occured,Book connot be added!</h1>
<%} %>
<div class="container">
    <div class="title">Add Book</div>
    <div class="content">
      <form action="bookAdded.jsp" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Book Name</span>
            <input type="text" placeholder="Enter your Book Name" name="book_title" required>
          </div>
          <div class="input-box">
            <span class="details">Book Author</span>
            <input type="text" placeholder="Enter your Book Author" name="book_author" required>
          </div>
          <div class="input-box">
            <span class="details">No of Copies</span>
            <input type="text" placeholder="Enter No of Copies" name="No_actual_copies" required>
          </div>
          <div class="input-box">
            <span class="details">Book Genre</span>
            <input type="text" placeholder="Enter Book Genre" name="category" required>
          </div>
          <div class="input-box">
            <span class="details">Book Price</span>
            <input type="text" placeholder="Enter Book Price" name="price"required>
          </div>
          <div class="input-box">
            <span class="details">Published Year</span>
            <input type="text" placeholder="Enter Year" name="published_year"required>
          </div>
        </div>
        <div class="butt">
          <input type="submit" value="Add Book">
        </div>
      </form>
    </div>
  </div>
</body>
</html>