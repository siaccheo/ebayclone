<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

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
<td><b>Item Type</b></td>
<td><b>Winner</b></td>
<td><b>Start Time</b></td>
<td><b>End Time</b></td>
<td><b>Minimum Price</b></td>
<td><b>Initial Price</b></td>
<td><b>Increment Bid</b></td>
</tr>
</body>

<% 

String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;

try {
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	
	String Item_Type = request.getParameter("Item_Type");
	Statement myStmt;
	myStmt = conn.createStatement();

	
	ResultSet myRs = myStmt.executeQuery("select * from cs336db.has h,cs336db.item i,cs336db.Auction a where h.item_ID = i.item_ID AND h.auction_id = a.auction_id AND i.atype = '"+ Item_Type +"';");
	
	
	
	while(myRs.next()){
		%>
		<tr bgcolor="#DEB887">
		<td><%=myRs.getString("item_ID") %></td>
		<td><%=myRs.getString("atype") %></td>
		<td><%=myRs.getString("distributor") %></td>
		<td><%=myRs.getString("item_model") %></td>
		<td><%=myRs.getString("COLOR") %></td>
		<td><%=myRs.getString("atype") %></td>
		<td><%=myRs.getString("winner") %></td>
		<td><%=myRs.getString("start_time") %></td>
		<td><%=myRs.getString("end_time") %></td>
		<td><%=myRs.getString("min_price") %></td>
		<td><%=myRs.getString("initial_price") %></td>
		<td><%=myRs.getString("increment_bid") %></td>
		</tr>
		<% 
	}
	
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>
		<form method=post action="logout.jsp">
		<input type="submit" value="Logout" />
	</form>
	
	<form method=post action="search.jsp">
		<input type="submit" value="Back to Browse" />
	</form>
		

