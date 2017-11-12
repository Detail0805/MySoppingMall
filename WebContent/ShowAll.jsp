<%@ page contentType="text/html; charset=Big5" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<link rel="stylesheet" href="css/ShowAll.css">

<title>Insert title here</title>
</head>
<body background="images/leaf.jpg">

	<%
		Context ctx = new javax.naming.InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
		Connection con = ds.getConnection();
		Statement stmt1 = con.createStatement();
		ResultSet rs1 = stmt1.executeQuery("SELECT COUNT(*) AS TOTAL FROM SHOPPINGMALL");
		rs1.next();
		int totalCount = rs1.getInt(1);
		Statement stmt2 = con.createStatement();
		ResultSet rs2 = stmt2.executeQuery("SELECT * FROM SHOPPINGMALL ORDER BY ITEMNO");
	%>
	<%
		for (int i = 1; i < totalCount + 1; i++) {
	%>
	<div align="center">
		<%
			rs2.next();
				int ITEMNO = rs2.getInt("ITEMNO");
				String NAME = rs2.getString("NAME");
				int stock = rs2.getInt("STOCK");
				String des = rs2.getString("DES");
		%>
		<!-- <img src="images/p<%=ITEMNO%>.jpg" height="150px">  -->
		<table border="1" cellpadding="5">
		<tr><td width="200"><img src="DBPicReader?ITEMNO=<%=ITEMNO%>" height="150px" width="200px">
		</td>
		<td width="400">產品編號:<%=ITEMNO%><br>產品名稱 :<%=NAME%><br>庫存數量 : <select name="number" id="number<%=i%>">
			<%
				if (stock > 0) {
						for (int j = 1; j < stock + 1; j++) {
			%>
			<option value="<%=j%>"><%=j%></option>
			<%
				}
						;
					} else {
			%>
			<option>Sold out</option>
			<%
				}
			%>
		</select><br>產品描述:<%=des %></td>
		<td width="50">
					<form name="empnoForm" method="post" action="emp.do">
						<input type="submit" value="修改"> <input type="hidden"
							name="ITEMNO" value=<%=ITEMNO%>> <input type="hidden"
							name="action" value="getOne_For_Update">
					</form>
					<form name="empnoForm" method="post" action="emp.do">
						<input type=submit value=刪除> <input type="hidden"
							name="ITEMNO" value=<%=ITEMNO%>> <input type="hidden"
							name="action" value="delete">
					</form>
				</td>>
		</tr>
		
		
		</table>
	</div>
	<%
		}
		;
		con.close();
	%>

	<div id="fontA"><a href="javascript:history.go(-1);">回上一頁</a></div>
</body>
</html>