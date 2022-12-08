<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
    <%@page import="MainPack.ConnectionJDBC"%>
<%@include file="adminHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="admincss.css">
<!-- Jquery for button approve -->
 <script>
 document.getElementById('btn').onclick = test;

 function test(){
   document.getElementById('btn').innerHTML = 'Approved';   
 }
 </script>
<meta charset="ISO-8859-1">
<title>Membership requests</title>
<style>
.tablediv {
	width: 800px;
	margin: 1% auto;
}
</style>
</head>
<body>
<%
String status = request.getParameter("status");
%>

<div style="color:green; text-align: center; font-size: 40px; margin-bottom:15px; margin-top:20px;">Membership Requests </div>
<div class="navigation">
<ul >

<li class="list ">
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
<li class="list active">
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




   <div class="tablediv">

<!--  <button onClick=location.href="makeAuthorAction.jsp"></button>-->
<% 

try{
	   ConnectionJDBC o = new ConnectionJDBC();
	   Connection con = o.createConnection();
	   Statement st=con.createStatement();
	   ResultSet rs=st.executeQuery("select * from membership where status='pending'");
	   if(rs.next()==false){
		   %>
		   <h1 style="text-align:center;color:	#ff0080;padding:10px;">No Pending Requests!</h1>
	   <% }
	   else{
		   %>
		   <table style="width:99%">
		   <thead>
		     <tr>
		       <th scope="col">Member_ID</th>
		       <th scope="col">Accept Request <i class='fas fa-pen-fancy'></i></th>
		       <th scope="col">Status</th>
		     </tr>
		   </thead>
		   <tbody>
	<%      do{
%>
    <tr>
            <td><%= rs.getString(1)%></td>
            <td><div class="accept" ><button onClick="location.href='makeAuthorAction.jsp?member_id=<%=rs.getString(1)%>'" id='btn' class="btn btn-danger btnClick">Approve</button></div></td>
            <td><% if("accepted".equals(status)){%>
                  <h3>Accepted</h3>
            <%
                }
            else{
            %>
            <h3>Waiting For Approval</h3>
            <%} %>
            </td>
          </tr>
         <%
    	   } while(rs.next());
       }
	   }
       catch(Exception e){
    	   out.println(e);
       }
         %>
        
        </tbody>
      </table>
      </div> 
</body>
</html>