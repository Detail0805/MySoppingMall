<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shoporder.model.*"%>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
//此段複寫equals 去比較itemno

    ShopOrderService shopOrderSvc = new ShopOrderService();
    List<ShopOrderVO> list = shopOrderSvc.getAllOrder();
    pageContext.setAttribute("list", list);

%>

<html>
<head>
<body background="images/leaf.jpg">
<title>Insert title here</title>
</head>
<body>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b><br>
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
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>訂單成立日期</th>
		<th>會員編號</th>
		<th>按鈕</th>
		<th>按鈕</th>

	</tr>
	<c:forEach var="shoporderVO" items="${list}">
		<tr align='center' valign='middle'>
		
			<td>${shoporderVO.orderno}</td>
			<td>${shoporderVO.memberno}</td>
			<td>${shoporderVO.order_date}</td>
			<td>${shoporderVO.customer_name}</td>
			<td>
			  <FORM METHOD="post" ACTION="shop.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ITEMNO" value="${shoporderVO.itemno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>

				<td>
					<FORM METHOD="post" ACTION="cart.do">
						<input type="submit" value="加入購物車">
						<input type="hidden" name="action" value="ADD">
					</FORM>
				</td>
		</tr>
	</c:forEach>
</table>


<h2>下面測試用includ購物車網址</h2>



</body>
</html>