<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

<%	
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
%>

<h2 align="left"><font><strong>Search by:</strong></font></h2>



<form method=post action="browsebyItem.jsp">
		<input type="submit" value="Item ID" />
	</form>
<form method=post action="browsebyModel.jsp">
		<input type="submit" value="model" />
	</form>
<form method=post action="browsebyType.jsp">
		<input type="submit" value="Type" />
	</form>




</body>
</html>