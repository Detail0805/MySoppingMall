<%@ page contentType="text/html; charset=Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>
<%
List<ProVO> list = (List)request.getAttribute("proVO"); //EmpServlet.java(Concroller), �s�Jreq��empVO����

pageContext.setAttribute("list",list);

%>
<html>
<head>
<title>���u���  listonepro.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='1200' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>�P�P�M�� listonepro.jsp</h3>
		<a href="mainforpro.jsp">�^�d�߭���</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='1200' align='center'>
	<tr>
		<th>�ӫ~�Ϥ�</th>
		<th>�P�P���ʦW��</th>
		<th>���ʽs��</th>
		<th>�P�P����</th>
		<th>�ӫ~�s��</th>
		<th>�ק�</th>
		<th>�R��</th>


	<c:forEach var="proVO" items="${list}">
		<tr align='center' valign='middle'>
			<td width="200"><img src="DBPicReader?ITEMNO=${proVO.ITEMNO}" height="150px" width="200px">
		</td>
			<td>${proVO.NAME}</td>
			<td>${proVO.PROMOTIOMNO}</td>
			<td>${proVO.PRICE}</td>
			<td>${proVO.ITEMNO}</td>
			<td>
			  <FORM METHOD="post" ACTION="pro.do">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="pro.do">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>
