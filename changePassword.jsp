<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="css/signup-style.css">
<title>Change Password</title>
<style>
body{
	background-image:url("image/login_img.png");
	background-size:100% 100%;	
	background-repeat:no-repeat;
	
	
}

</style>
</head>
<body>
<%
String msg=request.getParameter("msg");


%>

 
<div id='container'>
  <div class='login'>
  <% if("success".equals(msg)){%>
        <h3 style="color:green;margin:2px;">Password changed successfully</h3>
        <%} %>
  <h1 style="color:black"> <a href="login.jsp"><i class="fa-solid fa-arrow-left" style="font-size:30px;margin-left:-40px;cursor:pointer;"></i></a> &nbsp;&nbsp;Password</h1>
    <form action="changePasswordAction.jsp" method="post"> 
     <input type="text" name="login_id" placeholder="Enter Your Login Id" required style="border-radius:7px;">
      <input type="text" name="old" placeholder="Enter Your Old Password" required style="border-radius:7px;">
      <input name="new" type="password" placeholder=" New Password" required style="border-radius:7px;"/>
      <input name="re_enter" type="password" placeholder="Confirm new password" required style="border-radius:7px;"/>
      <%if("NotEqual".equals(msg)){%>
      <p style="color:red;margin:2px;">Passwords don't match</p>
      <%} else if("ErrorOccured".equals(msg)){ %>
      <p style="color:red;margin:2px;">Some Error Occured!!</p>
      <%}
      %>
      <input id="login_button" type="submit" value="Change Password">
    </form>   
       
  </div>
 </div>
</body>
<br><br><br>
</html>