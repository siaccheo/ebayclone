<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
Connection myCon = null;

try{ 
	
	Statement statement = null;
	ResultSet resultSet = null;
	statement= myCon.createStatement();

	String itemID = request.getParameter("item_id");
	String bamount = request.getParameter("b_amount");
	String mamount = request.getParameter("max_amount");
	String iamount = request.getParameter("incr_amount");
	//get user name making the bid
	String help = session.getAttribute("user").toString();
	
	String sql = "insert into cs336db.bid"
			+ "(username,auction_ID,bid_amount, max_amount,increment_amount)"
			+ "values(" +"'"+help+ "'"+ ","+ //need to know how to input current username
						"'"+itemID+ "'"+ ","+
						"'"+bamount+ "'"+ ","+
						"'"+mamount+ "'"+ ","+
						"'"+iamount+ "'"
			+ ")";
	statement.executeUpdate(sql);
	response.sendRedirect("successforPostedAndBid.jsp"); 
// autmatic bidding steps?
/*find the bids that are for the same item and and where max_bids are more than the current bid made: step 1
— find where increment of bid ISN’T zero….
make sure that the new bidder exicsts 
or bidders aren’t same person and there bid increment isn’t zero
check to make sure the bid JUST MADE + new persons bid increment is not greater than new persons max bid
then update bid 
*/

boolean hasAuto;
double increment = 0;
double maxPrice = 0;
String userNew = null;
///step1
	String bidNew = "SELECT * FROM bid WHERE auction_id= "+ itemID +" AND increment_amount<>0 AND max_amount >"+ bamount;
	Statement second;
	second = myCon.createStatement();
	ResultSet autoBids = second.executeQuery(bidNew);
//step 2
if(autoBids.next()){
	hasAuto = true;
	userNew = autoBids.getString("username");
	increment = autoBids.getDouble("increment_amount");
	maxPrice = autoBids.getDouble("max_amount");
	
}else{
	hasAuto = false;
}
double newBid =0;
newBid = Double.parseDouble(bamount);
if (newBid + increment <= maxPrice) {
	newBid = newBid + increment;
} else {
	newBid = maxPrice;
}
//step3
if(userNew!=null && !userNew.equals(help)) {
	Statement third; 
	third = myCon.createStatement();
	String changeBamount = "UPDATE bid SET bid_amount =" +newBid + "WHERE username ='" +userNew+ "' AND auction_ID= "+ itemID;
	third.executeQuery(changeBamount); 
}

}catch(SQLException e){
	e.printStackTrace();
}
%>