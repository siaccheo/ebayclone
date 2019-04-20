<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>

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



%>

    <% if (session.getAttribute("user") == null) { 
    	response.sendRedirect("login.jsp");
    		
    } else{ %>
    
    	<% if((session.getAttribute("security")).equals(2)){
    		
    	%> 
    	
    	<jsp:include page="adminDash.jsp"/>
    	<hr>
    	
    	
    	
    	<%}else if((session.getAttribute("security")).equals(1)){
    	%>
    	
    	
    	<jsp:include page="repDash.jsp"/>
    	<hr>
    	
    	<% }%>
    	
    	<jsp:include page="standardDash.jsp"/>
    	<hr>
    	
    
    
    	<form method=post action="logout.jsp">
		<input type="submit" value="Logout" />
	</form>
    <% }%>
</body>
</html>