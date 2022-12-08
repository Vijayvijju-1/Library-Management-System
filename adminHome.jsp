<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>welcome</title>
<style>
body{
	background-image:url("admin-home.png");
	background-size:cover;	
	background-repeat:no-repeat;
	
	
}

</style>
<link rel="stylesheet" type="text/css" href="admincss.css">
</head>
<body >
<div class="navigation">
<ul >

<li class="list active">
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
</body>
</html>