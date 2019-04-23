<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import ="java.text.DateFormat" %>
<%@page import ="java.util.Date"%>
<%@page import ="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>



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
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
try{ 
Statement statement = null;
ResultSet resultSet = null;
statement= conn.createStatement();
String sql ="SELECT * FROM cs336db.item, cs336db.Auction WHERE item_ID=auction_id and winner IS NULL";

// maybe chnage to make sure that item isn't sold
resultSet = statement.executeQuery(sql);
if(resultSet.next()){
	

	do{
	%>
		<tr bgcolor="#DEB887">

	<td><%=resultSet.getString("item_ID") %></td>
	<td><%=resultSet.getString("item_type") %></td>
	<td><%=resultSet.getString("distributor") %></td>
	<td><%=resultSet.getString("item_model") %></td>
	<td><%=resultSet.getString("item_color") %></td>

	</tr>

<% 
	}while(resultSet.next());
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