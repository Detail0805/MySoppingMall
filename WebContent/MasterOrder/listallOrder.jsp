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
<body background="<%=request.getContextPath()%>/images/leaf.jpg">
<title>Insert title here</title>
</head>
<body>
<b><font color=red>ListallOrder.jsp</font></b><br>
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
		<th>訂單狀態</th>
		<th>刪除訂單</th>
		<th>修改訂單</th>


	</tr>
	<c:forEach var="shoporderVO" items="${list}">
		<tr align='center' valign='middle'>
		
			<td><a href="<%=request.getContextPath()%>/order.do?action=LOOKORDERID&ORDERID=${shoporderVO.orderno}&MEMBERNO=${shoporderVO.memberno}">${shoporderVO.orderno}</a></td>
			<td>${shoporderVO.memberno}</td>
			<td>${shoporderVO.order_date}</td>
			<td>${shoporderVO.customer_name}</td>
			<td>${shoporderVO.order_state}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="ORDERID" value="${shoporderVO.orderno}">
			     <input type="hidden" name="MEMBERNO" value="${shoporderVO.memberno}">
			     <input type="hidden" name="action"	value="DELETE"></FORM>
			</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
						<input type="hidden" name="ORDERID" value="${shoporderVO.orderno}">
						<input type="hidden" name="MEMBERNO"value="${shoporderVO.memberno}"> 
						<input type="submit" value="修改"> 
						<input type="hidden" name="action" value="UPDATE_ORDERID">
					</FORM>
				</td>
		</tr>
	</c:forEach>
</table>


<h2>下面測試用includ購物車網址</h2>



</body>

</html>