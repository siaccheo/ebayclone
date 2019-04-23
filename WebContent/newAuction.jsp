<%@page import="java.sql.Connection"%>
<%@page import="project336.DbManager"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="java.text.SimpleDateFormat" %>
<%@page import ="java.text.DateFormat" %>
<%@page import ="java.util.Date" %>

<% 
String url = "jdbc:mysql://cs336db.ce9vreyc2dac.us-east-2.rds.amazonaws.com";
Connection conn = null;
PreparedStatement ps = null;


try {
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection(url, "cs336", "Sarat!23");
	
	//get information from text 
			String type = request.getParameter("atype");
			String distr = request.getParameter("distr");
			String model = request.getParameter("model");
			String color = request.getParameter("color");
			String minbid = request.getParameter("minbid");
			String iprice = request.getParameter("iprice");
			String incrumbid = request.getParameter("incrumbid");
			
			Double initial_price = Double.parseDouble(iprice);
			Double helpbid = Double.parseDouble(minbid);
			Double i_bid = Double.parseDouble(incrumbid);
			
			String enddate = request.getParameter("cdatetime"); 
			
			Statement myStmt;
			myStmt = conn.createStatement();
			//Item first then aunction 
			
			//get count of items
			Statement sta;
			sta = conn.createStatement();
			ResultSet result = sta.executeQuery("SELECT * from cs336db.item");
            int k=0;
            while(result.next()) {
                k++;
            }
           int count = k+1;
           // fill in data for item
           String sql = "insert into cs336db.item"
					+ "(item_ID,item_type,distributor,item_model,item_color)"
					+ "values(" +"'"+count+ "'"+ ","+
								"'"+type+ "'"+ ","+
								"'"+distr+ "'"+ ","+
								"'"+model+ "'"+ ","+
								"'"+color+ "'"
					+ ")";
           System.out.print(sql);
			myStmt.executeUpdate(sql);
			/// now auction
			
			/// date ????
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = new Date();
			String currdate = dateFormat.format(date);
			///get count of auctions 
			
			Statement second;
			second = conn.createStatement();
			ResultSet test = sta.executeQuery("SELECT * from cs336db.Auction");
            int j=0;
            while(test.next()) {
                j++;
            }
            int total = j+1;
            
            String intoA = "insert into cs336db.Auction"
					+ "(auction_id,winner,start_time,end_time,min_price,initial_price,increment_bid)"
					+ "values(" +"'"+total+ "'"+ ","+
								"'"+null+ "'"+ ","+
								"'"+currdate+ "'"+ ","+
								"'"+enddate+ "'"+ ","+
								"'"+helpbid+ "'"+ ","+
								"'"+initial_price+"'"+","+
								"'"+i_bid+ "'"
					+ ")";
            second.executeUpdate(intoA);
            
            //change post table 
            String user = session.getAttribute("user").toString();
            Statement third;
            third = conn.createStatement();
            String intoB = "insert into cs336db.post"
            		+ "(username,auction_ID)" + "values("+"'"+user+ "'"+ ","+	"'"+total+ "'"
        					+ ")";
			third.executeUpdate(intoB);
			response.sendRedirect("successforPostedBid.jsp"); 
			
		}catch (SQLException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>
