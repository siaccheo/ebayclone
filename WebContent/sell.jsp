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
Fill in all entries to auction off new item. Press submit when finished.

	<form method="post" action="NewAuction">
		<table>
			<tr>
				<td>Type</td>
				<td><input type="text" name="atype"></td>
			</tr>
			<tr>
				<td>Distributor</td>
				<td><input type="text" name="distr"></td>
			</tr>
			<tr>
				<td>Model</td>
				<td><input type="text" name="model"></td>
			</tr>
			<tr>
				<td>color</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td>Initial Price</td>
				<td><input type="text" name="iprice"></td>
			</tr>
			<tr>
				<td>bid increments</td>
				<td><input type="text" name="incrumbid"></td>
			</tr>
			<tr>
				<td>Minimum bid (this is kept secret from buyers)</td>
				<td><input type="text" name="minbid"></td>
			</tr>
				<td>Closing date and time. please input in form yyyy-MM-dd hh:mm:ss</td>
				<td><input type="datetime-local" value="yyyy-MM-dd hh:mm" min="2018-06-07T00:00"
				 max="2050-06-14T00:00" name="cdatetime"></td>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>

</body>
</html>