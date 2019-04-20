<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Please select the type of Sales Report to Generate:
	<hr>
	<form method=post action="salesReport.jsp">
		<input type="submit" value="Total Earnings" />
	</form>
	<hr>

	<table>
		<tr>
			<td>Earnings Per</td>
			<td>
				<form method=post action="salesReport.jsp">
					<input type="submit" value="Item" />
				</form>
				<form method=post action="salesReport.jsp">
					<input type="submit" value="Item type" />
				</form>
				<form method=post action="salesReport.jsp">
					<input type="submit" value="end-user" />
				</form>
			</td>
		</tr>

	</table>
	<hr>


	<form method=post action="salesReport.jsp">
		<input type="submit" value="best-selling items" />
	</form>
	<form method=post action="salesReport.jsp">
		<input type="submit" value="best buyers" />
	</form>
</body>
</html>