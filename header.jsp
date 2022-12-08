<%@page errorPage="error.jsp" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- font awesome cdn link  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 <script src="https://kit.fontawesome.com/0afb2e1467.js" crossorigin="anonymous"></script>
 <!-- custom css file link  -->
    <link rel="stylesheet" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>

@import url("https://fonts.googleapis.com/css?family=Crushed");

.notification .badge {
  position: absolute;
  width:23px;
  height:23px;
  top: 12px;
  left:36px;
  right: -10px;
  padding: 5px 10px;
  border-radius: 100%;
  background: red;
  color: white;
  text-align:center;
}

</style>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>

$(document).ready(function() {
	   $('[data-toggle="popover"]').popover({
	      placement: 'top',
	      trigger: 'hover'
	   });
	});

</script>
</head>
<%
try{
	String login_id=session.getAttribute("login_id").toString();
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select name from member_details where login_id='"+login_id+"'");
	rs.next();
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select count(book_id) from cart where login_id='"+login_id+"'");
	rs1.next();
	String count=rs1.getString(1);
%>
    <!--Header-->
    

    
     <header class="header">
  <div class="header-2">
        <nav class="navbar">
        <a href="#" class="logo" style="position:absolute;left:150px;font-size:23px;margin-top:7px;"> <i  class="fas fa-book"></i>&nbsp;Planon Library</a>
        <!--  <a href="" class="logo"> <i class="fas fa-book"></i>&nbsp;Planon Library</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
            <a href="memberPage.jsp" id="home">Home&nbsp;<i class="fa fa-home"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            
            <a href="takeMemberShip.jsp"  data-toggle="popover" title="Take MemberShip Now!!" data-content="Become an Author and publish your own books, also enjoy unlimited benefits!!">Take Membership&nbsp;<i class="fa-solid fa-upload"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="myOrders.jsp" id="History">Purchase History &nbsp; <i class='fab fa-elementor'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="rent.jsp" id="Rental">Rental History &nbsp; </a>&nbsp;&nbsp;&nbsp;&nbsp;
            <!--  <a href="">Change Details&nbsp; <i class="fa fa-edit"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="">Cancel Membership&nbsp;<i class="fa-solid fa-power-off"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;-->
            
            <a href="logout.jsp">Logout &nbsp;<i class='fas fa-share-square'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="viewCart.jsp" class="notification" style="position:absolute;margin-left:12%;margin-top:5px;font-size:32px;"> <span><ion-icon name="cart-outline" ></ion-icon></span><%if(!count.equals("0")){%><span class="badge" ><%=count %></span><%} %></a>
          <span> <a href="" style="position:absolute;margin-left:15%;margin-top:11px;">Hello&nbsp;<b><%=rs.getString(1)%></b>&nbsp; </a>&nbsp;</span>
   </nav>
    </div>
</header>




<%
}
catch(Exception e){
	e.printStackTrace();
}
%>

           <br>
           <!--table-->
