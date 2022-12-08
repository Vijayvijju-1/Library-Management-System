<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="authorHeader.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Bree+Serif&family=EB+Garamond:ital,wght@0,500;1,800&display=swap');


body {
	background-image:url("authorimg.jpg");
	background-attachment: fixed;	
	background-size: cover;
  
	}

#container{
	box-shadow: 0 15px 30px 1px grey;
	background: rgba(255, 255, 255, 0.90);
	text-align: center;
	border-radius: 7px;
	overflow: hidden;
	margin: 10em auto;
	height: 500px;
	width: 700px;
  
	
}



.product-details {
	position: relative;
	text-align: left;
	overflow: hidden;
	padding: 20px;
	height: 100%;
	float: left;
	width: 40%;

}

#container .product-details h1{
	font-family: 'Bebas Neue', cursive;
	display: inline-block;
	position: relative;
	font-size: 30px;
	color: #344055;
	margin: 0;
	
}

#container .product-details h1:before{
	position: absolute;
	content: '';
	right: 0%; 
	top: 0%;
	transform: translate(25px, -15px);
	font-family: 'Bree Serif', serif;
	display: inline-block;
	background: #ffe6e6;
	border-radius: 5px;
	font-size: 14px;
	padding: 1px;
	color: white;
	margin: 0;
	animation: chan-sh 6s ease infinite;

}




#container .product-details > p {
font-family: 'EB Garamond', serif;
	text-align: center;
	font-size: 18px;
	color: #7d7d7d;
	
}
.control{
	position: absolute;
	bottom: 20%;
	left: 22.8%;
	
}
.btn {

	transform: translateY(0px);
	transition: 0.3s linear;
	background:  #809fff;
	border-radius: 5px;
  position: relative;
  overflow: hidden;
	cursor: pointer;
	outline: none;
	border: none;
	color: #eee;
	padding: 0;
	margin: 0;
	
}

.btn:hover{transform: translateY(6px);
	background: #1a66ff;}

.btn span {
	font-family: 'Farsan', cursive;
	transition: transform 0.3s;
	display: inline-block;
  padding: 10px 20px;
	font-size: 1.2em;
	margin:0;
	
}


.btn .shopping-cart {
	transform: translateX(-100%);
  position: absolute;
	background: #333;
	z-index: 1;
  left: 0;
  top: 0;
}

.btn .buy {z-index: 3; font-weight: bolder;}

.btn:hover .price {transform: translateX(-110%);}

.btn:hover .shopping-cart {transform: translateX(0%);}



.product-image {
	transition: all 0.3s ease-out;
	display: inline-block;
	position: relative;
	overflow: hidden;
	height: 100%;
	float: right;
	width: 45%;
	display: inline-block;
}

#container img {width: 100%;height: 100%;}

.info {
    background: rgba(27, 26, 26, 0.9);
    font-family: 'Bree Serif', serif;
    transition: all 0.3s ease-out;
    transform: translateX(-100%);
    position: absolute;
    line-height: 1.8;
    text-align: left;
    font-size: 105%;
    cursor: no-drop;
    color: #FFF;
    height: 100%;
    width: 100%;
    padding:20px;
    left: 0;
    top: 0;
}

.info h2 {text-align: center}
.product-image:hover .info{transform: translateX(0);}

.info ul li{transition: 0.3s ease;}
.info ul li:hover{transform: translateX(50px) scale(1.3);}

.product-image:hover img {transition: all 0.3s ease-out;}
.product-image:hover img {transform: scale(1.2, 1.2);}


</style>
</head>
<body>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div id="container">	
	
	<div class="product-details">
		
	<h1 style="font-size:35px;">Cancel Membership</h1>
<br><br><br><br>
<p class="information" style="font-size:30px;"><b>Oh no!...<br>We feel bad to see you unsubscribe from our Library Membership!</b></p>
		
<div class="control">
	<span>
	<button class="btn"  onClick="location.href='authorPage.jsp'" style="background-color:black;">
   <span class="buy">Cancel</span>
   </button>
	<button class="btn" onClick="location.href='cancelAction.jsp'">
   <span class="buy" >Confirm</span>
   </button>
   </span>
</div>
			
</div>
	
<div class="product-image">
	
	<img src="https://images.pexels.com/photos/5872365/pexels-photo-5872365.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="" width="100%">
	

<div class="info">
	<h2> You are gonna miss 50% discount during this sale!</h2>
	<ul>
	<li style="font-size:18px"><strong>Early access Starts 1 day before</strong></li>
		
		
	</ul>
</div>
</div>

</div>

</body>
</html>