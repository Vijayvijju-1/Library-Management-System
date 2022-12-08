<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="MainPack.ConnectionJDBC"%>
<%
String login_id = request.getParameter("login_id");
String password = request.getParameter("password");
/*if ("8886716894".equalsIgnoreCase(login_id) && "Vijaykumar@123".equalsIgnoreCase(password)) {
	session.setAttribute("login_id", login_id);
	response.sendRedirect("admin/adminHome.jsp");
} else {
	
}
*/   


if(login_id.length()==10){
	
	try {
		int z = 0;
		ConnectionJDBC o = new ConnectionJDBC();
		Connection con = o.createConnection();
		
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(
		"select * from member_details where login_id='" + login_id + "'and password='" + password + "'");

		while (rs.next()) {
			String role = rs.getString(5);
			z = 1;
			if (role.equals("1")) {
				session.setAttribute("login_id", login_id);
				response.sendRedirect("memberPage.jsp");
			} else if (role.equals("2")) {
				session.setAttribute("login_id", login_id);
				response.sendRedirect("authorPage.jsp");
			} else if (role.equals("3")) {
				session.setAttribute("login_id", login_id);
				response.sendRedirect("adminHome.jsp");
				
			} else {
				response.sendRedirect("signup.jsp");
				
			}
		}
		//out.println(rs.getString(1));
		if (z == 0) {
	      response.sendRedirect("login.jsp?msg=UserNotExist");
		}
	}

catch (Exception e) {
		e.printStackTrace();
		//response.sendRedirect("login.jsp?msg=ErrorOccured");
	}
}
else{
	
	response.sendRedirect("login.jsp?msg=not_ten_digits");
}
/* finally{
	RequestDispatcher dd=request.getRequestDispatcher(newpage);
	dd.forward(request, response);
}*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

</body>
</html>