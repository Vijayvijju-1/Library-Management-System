<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body{
	background:#EBF1F2;
	background-size:100% 200%;	
	background-repeat:no-repeat;
	
	
}
#History{
background:#fff;
border-radius:7px;
padding:10px;
background:#fff;
color:#5F4B8BFF;
margin-bottom:-1px;
}
table th{
text-align:center;
}

.products {
margin:auto auto 10px auto;
	border-radius: 20px;
	padding:5px;
	background: #fff;
	box-shadow:  10px  grey;
	width: 50%;
	height: 150px;
	box-shadow:4px 4px #E9DCD9;
}

.title {
	padding: 20px;
	margin-bottom: 0;
	justify-content: center;
}

.wrapper {
	height: 50px;
	width: 150px;
	display: flex;
	background: #fff;
	border-radius: 12px;
	border: 1px solid #00FFAB;
	float: right;
	position: absolute;
	margin: -90px auto 0 55%;
}

.wrapper span {
	width: 100%;
	text-alignment: center;
	font-size: 35px;
	font-weight: 500;
}

.wrapper span.num {
	padding: 4px;
	font-size: 35px;
	border-right: 2px solid rgba(0, 0, 0, 0.2);
	border-left: 2px solid rgba(0, 0, 0, 0.2);
}

.price{
width:400px;
height:50px;
padding:20px 100px 10px 20px;
}

</style>

</head>
<body>
<div style="color:#0a75ad ; text-align: center; font-size: 30px;font-weight:700;margin:5px 0 10px 0;">My Orders </div>

 <%
 String login_id=session.getAttribute("login_id").toString();
       try{
    	   ConnectionJDBC o = new ConnectionJDBC();
    	   Connection con = o.createConnection();
    	   Statement st=con.createStatement();
    	   ResultSet rs=st.executeQuery("select book_id,book_title,Category,price,purchase_date from member_books  where login_id='"+login_id+"' order by purchase_date desc");
    	   while(rs.next()){
       %>
       
	<div class="products">
		<div class="title" style="font-size:24px;margin-right:45%;"><%=rs.getString(2)%></div><div class="price" style="font-size:17px;margin:-70px 50px 50px 75%;">Amount Paid: <i class="fa fa-inr"></i><%=rs.getString(4)%></div>
			<div class="cat" style="font-size:17px;margin-left:20px;padding-right:50px;width:150px;margin-top:-30px;color:grey;">category	<%=rs.getString(3)%></div><div class="date" style="font-size:17px;margin:-50px 50px 50px 80%;border-left:1px solid grey;margin-left:50%;padding-left:30%;color:grey;">Ordered Date	<%=rs.getString(5)%></div>
		</div>
		
	
       
         <%
    	   }
       }
       catch(Exception e){
    	   out.println(e);
       }
         %>
        </tbody>
      </table>
     

</body>
</html>