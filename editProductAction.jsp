<%@page import="java.sql.*" %>
<%@page import="MainPack.ConnectionJDBC" %>
<%@include file="adminHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/NewProduct-style.css">
<meta charset="ISO-8859-1">
<title>Update Book</title>
</head>
<body>
<%
   String book_id =request.getParameter("book_id");
   String category = request.getParameter("category");
	String price = request.getParameter("price");
	try{
	ConnectionJDBC o = new ConnectionJDBC();
	Connection con = o.createConnection();
	Statement st=con.createStatement();
	int k=st.executeUpdate("update book_details set category='"+category+"', price='"+price+"' where book_id='"+book_id+"'");
	if (k>0) {
	response.sendRedirect("editProduct.jsp?msg=done");
	}
	else{
		response.sendRedirect("editProduct.jsp?msg=wrong");
	}
	out.println(book_id);
	}
	
	catch(Exception e){
		out.println(e);
		}
		%>
	
</body>
</html>