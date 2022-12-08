<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planon Library</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://kit.fontawesome.com/0afb2e1467.js"
	crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://kit.fontawesome.com/0afb2e1467.js" crossorigin="anonymous"></script>
    <!-- custom css file link  -->
    <link rel="stylesheet" href="style.css">

</head>
<body >
    <%  
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("SELECT * FROM book_details order by book_id desc LIMIT 3");
	rs.next();
	%>
<!-- header section starts  -->

<header class="header">

    <div class="header-1">

        <a href="#" class="logo"> <i class="fas fa-book"></i>&nbsp;Planon Library</a>

        

        <div class="icons">
        
            <div id="search-btn" class="fas fa-search"></div>
            <a href="login.jsp" class="fa-sharp fa-solid fa-arrow-right-to-bracket">Login</a>
            <a href="signup.jsp" class="fa-solid fa-user-plus">Register</a>
            
        </div>

    </div>

    <div class="header-2">
        <nav class="navbar">
            <a href="homePage.jsp">home</a>&nbsp;&nbsp;
            <a href="#arrivals">new arrivals</a>
        </nav>
    </div>

</header>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="row">

        <div class="content">
            <h3>upto 50% off</h3>
            <p>Every day new books are added, so keep Exploring,Keep enjoying!</p>
            <a href="login.jsp" class="btn">shop now</a>
        </div>

        

</section>

<!-- home section ense  -->

<!-- icons section starts  

<section class="icons-container">

    <div class="icons">
        <i class="fas fa-shipping-fast"></i>
        <div class="content">
            <h3>free shipping</h3>
            <p>order over $100</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-lock"></i>
        <div class="content">
            <h3>secure payment</h3>
            <p>100 secure payment</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-redo-alt"></i>
        <div class="content">
            <h3>easy returns</h3>
            <p>10 days returns</p>
        </div>
    </div>

    <div class="icons">
        <i class="fas fa-headset"></i>
        <div class="content">
            <h3>24/7 support</h3>
            <p>call us anytime</p>
        </div>
    </div>

</section>

 icons section ends -->

<!-- featured section starts  -->


<!-- featured section ends -->

<!-- newsletter section starts -->


<!-- newsletter section ends -->

<!-- arrivals section starts  -->

<section class="arrivals" id="arrivals">

    <h1 class="heading"> <span>new arrivals</span> </h1>

    <div class="swiper arrivals-slider">

        <div class="swiper-wrapper">

            <a href="login.jsp" class="swiper-slide box">
                <div class="image">
                    <img src="newest4.jpg" alt="img">
                </div>
                <div class="content">
                    <h3><%=rs.getString("book_title") %></h3>
                    <div class="price" style="font-size: 2.8rem;"><i class="fa fa-inr"></i><%=rs.getString("price") %><span style="padding:10px;"><i class="fa fa-inr"></i><%=Integer.parseInt(rs.getString("price"))*2 %></span></div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
            </a>

        </div>

    </div>
          <%rs.next(); %>
    <div class="swiper arrivals-slider">

        <div class="swiper-wrapper">

            <a href="login.jsp" class="swiper-slide box">
                <div class="image">
                    <img src="newest2.jpg" alt="">
                </div>
                <div class="content">
                    <h3><%=rs.getString("book_title") %></h3>
                    <div class="price" style="font-size: 2.8rem;"><i class="fa fa-inr"></i><%=rs.getString("price") %><span style="padding:10px;"><i class="fa fa-inr"></i><%=Integer.parseInt(rs.getString("price"))*2 %></span></div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
            </a>


           
            

        </div>

    </div>
 <%rs.next(); %>
 <div class="swiper arrivals-slider">

        <div class="swiper-wrapper">

            <a href="login.jsp" class="swiper-slide box">
                <div class="image">
                    <img src="newest3.png" alt="">
                </div>
                <div class="content">
                    <h3><%=rs.getString("book_title") %></h3>
                    <div class="price" style="font-size: 2.8rem;"><i class="fa fa-inr"></i><%=rs.getString("price") %><span style="padding:10px;"><i class="fa fa-inr"></i><%=Integer.parseInt(rs.getString("price"))*2 %></span></div>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
            </a>


           
            

        </div>

    </div>

</section>

<!-- arrivals section ends -->

<!-- deal section starts  -->

<!-- custom js file link  -->
<script src="js/script.js"></script>
<%
	    	   
	       }
	       catch(Exception e){
	    	   out.println(e);
	       }
	         %>
</body>
</html>