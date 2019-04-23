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

<%
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;

try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	String unsoldAuctions = "SELECT * FROM cs336db.Auction WHERE WINNER IS NULL";
	Statement str;
	str = conn.createStatement();
	ResultSet unsold = str.executeQuery(unsoldAuctions);
	
	//define current date 
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date dateobj = new Date();
	String currdate = dateFormat.format(dateobj);
	if(unsold.next()){
		do{
			String aucEndDate = unsold.getString("end_time");
			if(currdate.compareTo(aucEndDate) >=0 ){/// it is the enddate for auction, or end date has passed
				Statement second;
				second = conn.createStatement();
				int auctionID = unsold.getInt("auction_id");
				String max_bid = "SELECT username,MAX(bid_amount) FROM cs336db.Bid WHERE auction_id=" + auctionID;
				ResultSet winner = second.executeQuery(max_bid);
			
				if(winner.next()){ // there is a person who bidded on item
					if(unsold.getDouble("min_price") != 0){  //must make sure that max bid matches constraints of min bid
						double minbid = unsold.getDouble("min_price");
						if(winner.getDouble("bid_amount") >= minbid){ // make sure max bid is higher than min price
							//change winner 
							Statement third; 
							third = conn.createStatement();
							String changeWinner = "UPDATE Auction SET winner =" 
							+ winner.getString("username")+ "WHERE auction_id=" + auctionID;
							third.executeQuery(changeWinner); 
						}// else no winner
						
					}else{ // no minimum price
					Statement third; 
					third = conn.createStatement();
					String changeWinner = "UPDATE Auction SET winner =" 
					+ winner.getString("username")+ "WHERE auction_id=" + auctionID;
					third.executeQuery(changeWinner);
					
					}
				}//else no winner must redirect to 
				
			}
			
			
		}while(unsold.next());
	}
	Statement userstat = null;
	ResultSet resultSet = null;
	userstat= conn.createStatement();
	String help = session.getAttribute("user").toString();
	/// this is wrong, need to match post and auctionID for the specific user 
	//String usertable = "SELECT * FROM cs 336db.post WHERE username ="+  help;
	String sql = "SELECT * FROM cs336db.Auction WHERE auction_id IN(SELECT auction_id FROM cs336db.post WHERE username = '" +  help +"')";
	
	resultSet = userstat.executeQuery(sql);
	if(resultSet.next()){
	do{
	%>
	<h2 align="left"><font><strong> My Auctions </strong></font></h2>
	<table align="left" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="#A52A2A">
<td><b>auction ID</b></td>
<td><b>winner</b></td>
<td><b>start date</b></td>
<td><b>end date</b></td>
<td><b>minimum price</b></td>
<td><b>initial price</b></td>
<td><b>increment bid</b></td>
</tr>
	<tr bgcolor="#DEB887">

	<td><%=resultSet.getString("auction_id") %></td>
	<td><%=resultSet.getString("winner") %></td>
	<td><%=resultSet.getString("start_time") %></td>
	<td><%=resultSet.getString("end_time") %></td>
	<td><%=resultSet.getString("min_price") %></td>
	<td><%=resultSet.getString("initial_price") %></td>
	<td><%=resultSet.getString("increment_bid") %></td>

	</tr>

	<% 
	}while(resultSet.next());
	
	}

}catch (SQLException e){
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>