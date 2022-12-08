<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello User!</title>
<link rel="stylesheet" type="text/css" href="NewFile.css">
</head>
<body>
<div class="role_login">
<form action="UserLoginServlet" method="post">
                Enter Your Name: <br><br>
                <input name="username" required/><br><br>
                 Password:<br><br>
                <input name="password" type="password" required/><br><br>
                Select your role:<br><br>
                <select name="role">
                  <option>
                    Member
                  </option>
                  <option>
                    Manager 
                  </option>
                  <option>
                   author
                  </option>
                </select>
                <br><br>
               <input type="submit" class="button" value="Login" />
                </form>
</div>

</body>
</html>