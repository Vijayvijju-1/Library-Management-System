<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="authorHeader.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/NewProduct-style.css">
<title>Publish Your Book</title>
<style>
body{
background-image:url("authorimg.jpg");
	background-size:cover;	
	background-repeat:no-repeat;
}


</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h1 style="text-align:center;margin-bottom:20px;margin-top:6%;color:#fff;">Congrats!! Your Book is Successfully Published!<!-- button for view books --></h1>
<%
}
else if("error".equals(msg)){
%>
<h1 style="text-align:center;10px;margin-top:6%;">Some Error Occured!</h1>
<%} %>
<div class="container" style="margin-top:10%;">
    <div class="title">Publish Your Creativity</div>
    <div class="content">
      <form action="publishBookAction.jsp">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Book Name</span>
            <input type="text" placeholder="Enter your Book Name" name="book_title" required>
          </div>
          <div class="input-box">
            <span class="details">Book Author</span>
            <input type="text" placeholder="Enter your Name" name="book_author" required>
          </div>
          <div class="input-box">
            <span class="details">No of Copies You want to Publish</span>
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
            <input type="text" placeholder="Enter Book Year" name="published_year"required>
          </div>
        </div>
        <div class="butt">
          <input type="submit" value="Publish Now!">
        </div>
      </form>
    </div>
  </div>
</body>
</html>