<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="signup-style.css">
<title>Login</title>
<style>
body{
	background-image:url("image/login_img.png");
	background-size:100% 200%;	
	background-repeat:no-repeat;
	
	
}

</style>
</head>
<body>
<%String msg=request.getParameter("msg"); %>

<div id='container'>
  <div class='login'>
  <div class="planon" style="text-align:center;margin-top:-100px;margin-bottom:50px;margin-left:-20px;"><img  src="https://planonsoftware.com/upload_mm/7/e/1/4975_fullimage_planon-blue-tagline.svg" width="200px"><img style="position:absolute;margin-top:70px;margin-left:-55px;padding-bottom:15px;"src="https://see.fontimg.com/api/renderfont4/p73DK/eyJyIjoiZnMiLCJoIjo2NSwidyI6MTAwMCwiZnMiOjY1LCJmZ2MiOiIjMkJFODI3IiwiYmdjIjoiI0ZGRkZGRiIsInQiOjF9/TGlicmFyeQ/summer-daisy-personal-use.png" alt="Tattoo fonts" width="80px"></div>
    <h1 style="color:black">Login</h1><%if("UserNotExist".equals(msg)){%><p style="color:red;margin:2px;">Invalid Credentials!!</p><%} else if("ErrorOccured".equals(msg)){ %><p style="color:red;">Some Error Occured!!</p><%} else if("not_ten_digits".equals(msg)){ %><p style="color:red;">Phone num must be 10 digits!!</p><%} %>
    <form action="loginAction.jsp" method="post"> <!-- validates user and takes to user page-->
      <input type="text" name="login_id" placeholder="Enter loginId/PhoneNo" required>
      <input name="password" type="password" placeholder="Enter Your Password" required/>
      <a href="changePassword.jsp" style="text-decoration:none;color:black;text-align:center;padding:5px;">Change Password&nbsp;&nbsp;<i class="fa-solid fa-lock"></i></a>
      <input id="login_button"  type="submit" value="Login">
    </form>   
      <h4 style="font-family:verdana;font-size:15px;">New to Library?&nbsp;<a style="text-decoration:none;color:#047BD5;"href="signup.jsp">Create an account</a></h4>
       
  </div>
 </div>
</body>
</html>
