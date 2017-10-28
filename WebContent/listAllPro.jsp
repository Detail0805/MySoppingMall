<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ProService proSvc = new ProService();
	List<ProVO> list = proSvc.getAllProShop();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<body background="images/leaf.jpg">
<title>Insert title here</title>
</head>
<body>
<b><font color=red>全部促銷商品瀏覽listAllPro.jsp</font></b><br>
<a href="javascript:history.go(-1);">回上一頁</a>
<br><br>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

<table border='1' bordercolor='#CCCCFF' width='800' align='center'>
		<tr>
			<th>商品圖片</th>
			<th>商品專案名稱</th>
			<th>商品名稱</th>
			<th>促銷編號</th>
			<th>商品編號</th>
			<th>促銷價格</th>
			<th>修改</th>
			<th>刪除</th>

		</tr>
		<%@ include file="page1.file" %> 
	<c:forEach var="proVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
			<tr align='center' valign='middle'>
				<td width="200"><img src="DBPicReader?ITEMNO=${proVO.ITEMNO}"
					height="150px" width="200px">
				<td>${proVO.NAME}</td>
				<td>${proVO.SHOPNAME}</td>
				<td>${proVO.PROMOTIOMNO}</td>
				<td>${proVO.ITEMNO}</td>
				<td>${proVO.PRICE}</td>

				<td>
					<FORM METHOD="post" ACTION="pro.do">
						<input type="submit" value="修改"> 
						<input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}">
						
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="pro.do">
						<input type="submit" value="刪除"> <input type="hidden"
							name="ITEMNO" value="${proVO.ITEMNO}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>