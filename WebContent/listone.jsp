<%@ page contentType="text/html; charset=Big5"%>
<%@ page import="com.shop.model.*"%>
<%
ShopVO shopVO = (ShopVO) request.getAttribute("shopVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����

%>
<html>
<head>
<title>���u��� </title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�ӫ~���</h3>
		<a href="mainpage.jsp">�^�d�߭���</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600' align='center'>
	<tr>
		<th>�ӫ~�Ϥ�</th>
		<th>�ӫ~�s��</th>
		<th>���~�W��</th>
		<th>�w�s�ƶq</th>
		<th>�ӫ~����</th>
		<th>���~�y�z</th>
		

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
