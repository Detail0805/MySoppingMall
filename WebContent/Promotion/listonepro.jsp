<%@ page contentType="text/html; charset=Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>
<%
List<ProVO> list = (List)request.getAttribute("proVO"); //EmpServlet.java(Concroller), 存入req的empVO物件

pageContext.setAttribute("list",list);

%>
<html>
<head>
<title>員工資料  listonepro.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='1200' align='center'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>促銷專案 listonepro.jsp</h3>
		<a href="mainforpro.jsp">回查詢頁面</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='1200' align='center'>
	<tr>
		<th>商品圖片</th>
		<th>促銷活動名稱</th>
		<th>活動編號</th>
		<th>促銷價格</th>
		<th>商品編號</th>
		<th>修改</th>
		<th>刪除</th>


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
			     <input type="submit" value="修改">
			     <input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="pro.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>
