<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="authorHeader.jsp"%>
<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<%
String login_id=session.getAttribute("login_id").toString();
try {
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	Statement st = con.createStatement();
	
	int z = st.executeUpdate("update member_details set role='1' where login_id='"+login_id+"'");
   if(z==1){
	   %>
	   <script>
       setTimeout(function(){
          window.location.href = 'memberPage.jsp';
       }, 5000);
    </script>
    <h2 style="text-align:center;margin-top:13%;color:#F47878;"><b>MemberShip is Cancelled, Redirecting you to Basic Member Page</b></h2>
     <center ><img src="loader.gif"></center>
<%
   }
   else{
	   %>
   
	   <h3 style="text-align:center;margin-top:10%;color:red;"><b>Something Went Wrong!!</b></h3> 
<% 
   }
}
catch(Exception e){
	out.println(e);
}
%>


</body>
</html>