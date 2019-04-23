<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


    <% if (session.getAttribute("user") == null) { 
    	response.sendRedirect("login.jsp");

    		
    } else{ %>
    
    	    <form action="cancelAuctionHandler.jsp" method="POST">
           		<label>Seller</label>
           		<input type="text" name="seller" placeholder="Username" required><br>
           		<label>item_ID</label>
            	<input type="text" name="item_ID" placeholder="item_ID" required><br>    			
    			<input type="submit" value="Cancel The Auction">
    		</form>
    
    
    <% }%>

</body>
</html>