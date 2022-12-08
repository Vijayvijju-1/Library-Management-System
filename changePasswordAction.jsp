<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String login_id = request.getParameter("login_id");
String password = request.getParameter("old");
String new_pass = request.getParameter("new");
String re_enter = request.getParameter("re_enter");
try {

	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	Statement st = con.createStatement();
	if(new_pass.equals(re_enter)){
		st.execute("update member_details set password='"+new_pass+"' where login_id='"+login_id+"'");
		response.sendRedirect("changePassword.jsp?msg=success");
	}
	else{
		response.sendRedirect("changePassword.jsp?msg=NotEqual");
	}
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("changePassword.jsp?msg=ErrorOccured");
}
%>
</body>
</html>