<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rent</title>
<style>





.button-65 {
  appearance: none;
  backface-visibility: hidden;
  background-color: #2f80ed;
  border-radius: 7px;
  border-style: none;
  box-shadow: none;
  box-sizing: border-box;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  font-family: Inter,-apple-system,system-ui,"Segoe UI",Helvetica,Arial,sans-serif;
  font-size: 15px;
  font-weight: 500;
  height: 50px;
  letter-spacing: normal;
  line-height: 1.5;
  outline: none;
  overflow: hidden;
  padding: 14px 30px;
  position: relative;
  text-align: center;
  text-decoration: none;
  transform: translate3d(0, 0, 0);
  transition: all .3s;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  vertical-align: top;
  white-space: nowrap;
  width:100px;
}

.button-65:hover {
  background-color: #1366d6;
  box-shadow: rgba(0, 0, 0, .05) 0 5px 30px, rgba(0, 0, 0, .05) 0 1px 4px;
  opacity: 1;
  transform: translateY(0);
  transition-duration: .35s;
}

.button-65:hover:after {
  opacity: .5;
}

.button-65:active {
  box-shadow: rgba(0, 0, 0, .1) 0 3px 6px 0, rgba(0, 0, 0, .1) 0 0 10px 0, rgba(0, 0, 0, .1) 0 1px 4px -1px;
  transform: translateY(2px);
  transition-duration: .35s;
}

.button-65:active:after {
  opacity: 1;
}

@media (min-width: 768px) {
  .button-65 {
    padding: 14px 22px;
    width: 176px;
  }
}



body{
background:#EBF1F2;
	background-size:100% 200%;	
	background-repeat:no-repeat;
	
	
}
#Rental{
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
</style>

</head>
<body>
<div style="color:#0a75ad ; text-align: center; font-size: 30px;font-weight:700;margin:5px 0 10px 0;">Your rented books</div>
<%
String login_id=session.getAttribute("login_id").toString();
String book_id=request.getParameter("book_id");
%>
 <table style="width:97%">
        <thead>
          <tr>
           
            <th scope="col">Book Name</th>
            <th scope="col">Rented date</th>
            <th scope="col">Return date</th>
            <th scope="col">Due Days</th>
            <th scope="col">Billed Amount</th>
            <th scope="col">Returned date</th>
            <th scope="col">Status</th>
          </tr>
        </thead>
        <tbody>

    <% 
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from rental where  login_id='"+login_id+"'");
	
	while(rs.next()){
		float fine=0;
		int charges=10;
		Date curr_date=java.sql.Date.valueOf(java.time.LocalDate.now());
		Date return_date=rs.getDate(4);
		Statement st2=con.createStatement();
	    ResultSet rs2=st2.executeQuery("select DATEDIFF('"+return_date+"','"+curr_date+"')");
	    rs2.next();
	    String rd = "Not Returned";
	    //System.out.println(rs2.getString(1));
	    int due_days=Integer.parseInt(rs2.getString(1));
	    if(due_days<0 && due_days>-4){
	    	
	    	fine+=charges;
	    }
	    else if(due_days<0 && due_days<=-4){
	    	due_days=Math.abs(due_days);
	    	 fine=(Integer.parseInt(rs.getString(7))*5*(due_days)/100);
		     fine=Math.abs(fine)+charges;
	    }
	    
	    else{
	    	fine+=charges;
	    }
	    int returnaa=rs.getInt(9);
	    Date returned_date = rs.getDate(10);
	    if (returned_date!=null) {
			rd = returned_date.toString();
				}
	       %>
	      
	          <tr>
	           
	            <td><%= rs.getString(8)%></td>
	            <td><%= rs.getString(3)%></td>
	            <td><%= rs.getString(4)%></td>
	            <td><%= due_days%></td>
	            <td><b>INR.</b><%= Math.abs(fine)%></td>
	             <td><%= rd%></td>
	            <td><%if (returnaa==0) { %><button class="button-65" onClick="location.href='ReturnDate.jsp?book_id=<%=rs.getString(2)%>'" role="button">RETURN</button><%}else{ %>Return Sucessfull<%} %></td>
	          </tr>
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