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
<title></title>
</head>
<body>

<%	
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
conn = DriverManager.getConnection(url, "cs336", "Sarat!23");


%>

<h2 align="left"><font><strong>Items Up for Auction </strong></font></h2>
<table align="left" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>item ID</b></td>
<td><b>type</b></td>
<td><b>distributor</b></td>
<td><b>model</b></td>
<td><b>color</b></td>
</tr>

<%
try{ 
Statement statement = null;
ResultSet resultSet = null;
statement= conn.createStatement();
String sql ="SELECT * FROM cs336db.item";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("item_ID") %></td>
<td><%=resultSet.getString("distributor") %></td>
<td><%=resultSet.getString("model") %></td>
<td><%=resultSet.getString("COLOR") %></td>

</tr>
<tr><td><%=resultSet.getString("atype") %></td>
</tr>
<tr></tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<form method="post" action="makeBid">
		<table align="right">
			<tr>
				<td>item_id</td>
				<td><input type="text" name="item_id"></td>
			</tr>
			<tr>
				<td>bid amount</td>
				<td><input type="text" name="b_amount"></td>
			</tr>
			<tr>
				<td>max amount</td>
				<td><input type="text" name="max_amount"></td>
			</tr>
			<tr>
				<td>increment amount</td>
				<td><input type="text" name="incr_amount"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="bid"></td>
			</tr>
		</table>
	</form>


</table>

</body>
</html>