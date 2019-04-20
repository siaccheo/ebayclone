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
	PLEASE CREATE A LOGIN


	<form method="post" action="createRepLoginHandler.jsp">
		<table>
			<tr>
				<td>First name</td>
				<td><input type="text" name="fname"></td>
			</tr>
			<tr>
				<td>Last name</td>
				<td><input type="text" name="lname"></td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>