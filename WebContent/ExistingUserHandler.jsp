<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	
	String uname = request.getParameter("uname");
	String password = request.getParameter("password");
	Statement myStmt;
	myStmt = conn.createStatement();
	String actualPassword = null;
	int security =0;
	
	ResultSet myRs = myStmt.executeQuery("select password, security from cs336db.enduser where username = '"+ uname +"';");
	while(myRs.next()) {
		 actualPassword = (myRs.getString("password"));
		 security = (myRs.getInt("security"));
	}
	
	if(password.equals(actualPassword)) {
		session.setAttribute("user", uname);
		session.setAttribute("security", security);

		response.sendRedirect("index.jsp");
		
	}else {
		response.sendRedirect("LoginFail.jsp");
		
	}
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}












%>