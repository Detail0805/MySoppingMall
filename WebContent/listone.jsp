<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.shop.model.*"%>
<%
ShopVO shopVO = (ShopVO) request.getAttribute("shopVO"); //EmpServlet.java(Concroller), 存入req的empVO物件

%>
<html>
<head>
<title>員工資料 </title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>商品資料</h3>
		<a href="mainpage.jsp">回查詢頁面</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600' align='center'>
	<tr>
		<th>商品圖片</th>
		<th>商品編號</th>
		<th>產品名稱</th>
		<th>庫存數量</th>
		<th>商品價錢</th>
		<th>產品描述</th>
		

	</tr>
	<tr align='center' valign='middle'>
		<td><img src="DBPicReader?ITEMNO=<%=shopVO.getITEMNO()%>" height="150px" width="200px"></td>
		<td><%=shopVO.getITEMNO()%></td>
		<td><%=shopVO.getNAME()%></td>
		<td><%=shopVO.getSTOCK()%></td>
		<td><%=shopVO.getPRICE()%></td>
		<td><%=shopVO.getDES()%></td>

	</tr>
</table>

</body>
</html>
