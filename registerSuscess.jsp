<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://kit.fontawesome.com/0afb2e1467.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <style>
    .tab{
    background:#fff;
    border:1px solid grey;
    width:400px;
    height:600px;
    margin:7% auto;
    border-radius:15px;
    color:#4d5bf9;
    padding:35px;
    font-size:2rem;
    }
    </style>
</head>
<body style="background-color:#EFFFFD;" >

<div class="tab" style="text-align:center;">
<h1>Registeration Successful</h1><br>
<h3>Go back to Login page</h3><br>
<input type="button" class="btn" onClick="location.href='login.jsp'" value="Login">
 <center ><img src="loader.gif" width="100%"></center>
 <script>
       setTimeout(function(){
          window.location.href = 'login.jsp';
       }, 3000);
    </script>
</div>
</body>
</html>