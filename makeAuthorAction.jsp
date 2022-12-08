<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<%
String member_id=request.getParameter("member_id");
try{
	int z=0;
	ConnectionJDBC o=new ConnectionJDBC();
	 Connection con=o.createConnection();
	Statement st=con.createStatement();
	z=st.executeUpdate("update  member_details set role='2' where login_id='"+member_id+"'");
	Statement st2=con.createStatement();
	st2.executeUpdate("update membership set status='accepted' where login_id='"+member_id+"'");
	if(z==1){
		response.sendRedirect("makeAuthor.jsp?status=accepted");
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>