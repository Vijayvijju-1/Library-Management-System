<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%@page import="java.sql.*"%>
<%@page import="java.time.*" %>
<%
String login_id=session.getAttribute("login_id").toString();

//System.out.println(book_id+login_id);
try{
	ConnectionJDBC o=new ConnectionJDBC();
	Connection con=o.createConnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select book_id,book_title,Category,price from cart where login_id='"+login_id+"'");
	
	String book_id=rs.getString(1);
	
		PreparedStatement ps=con.prepareStatement("insert into member_books(login_id,book_id,book_title,Category,price,purchase_date,due_date) values(?,?,?,?,?,?,?)");
		ps.setString(1,login_id);
		ps.setString(2,rs.getString(1));
		ps.setString(3,rs.getString(2));
		ps.setString(4,rs.getString(3));
		ps.setString(5,rs.getString(4));
		ps.setDate(6, java.sql.Date.valueOf(java.time.LocalDate.now()));
		ps.setDate(7, java.sql.Date.valueOf(java.time.LocalDate.now().plusDays(3)));
		ps.execute();
		
		 response.sendRedirect("buyNow.jsp?book_id="+book_id);
		//System.out.println(rs.getString(7)+No_current_copies);
	
	
}
catch(Exception e){
	e.printStackTrace();
	out.println(e);
	response.sendRedirect("memberPage.jsp?msg=invalid");
}
%>