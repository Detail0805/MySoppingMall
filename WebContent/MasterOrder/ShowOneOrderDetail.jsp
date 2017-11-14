<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shoporder.model.*" %>
<%@ page import="com.detail.promotion.*"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	List<ShopOrderVO> OrderList= (List<ShopOrderVO>) request.getAttribute("OrderList");
	Integer total =(Integer)request.getAttribute("total");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>

</head>
<body>
<div align='center'>
<a href="javascript:history.go(-1);" >回上一頁</a></div>

<table border='1' bordercolor='#CCCCFF' width='800' align='center'>
total :${total}
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>商品編號</th>
		<th>訂購數量</th>
		<th>商品名稱</th>
		<th>會員名子</th>
		<th>會員地址</th>
		<th>會員手機</th>
		<th>訂單成立時間</th>
		<th>商品價格</th>
	</tr>
	<c:forEach var="OrderList" items="${OrderList}">
	
		<tr align='center' valign='middle'>

				<td>${OrderList.orderno}</td>
				<td>${OrderList.memberno}</td>
				<td>${OrderList.itemno}</td>
				<td>${OrderList.ordercount}</td>
				<td>${OrderList.customer_name}</td>
				<td>${OrderList.shopname}</td>
				<td>${OrderList.customer_address}</td>
				<td>${OrderList.customer_phone}</td>
				<td>${OrderList.order_date}</td>
				<td>${OrderList.price}</td>
		</tr>
</c:forEach>
</table>
total=<%=total%> 
EL total=${total}
ShowOneOrderDetail.jsp
</body>
</html>