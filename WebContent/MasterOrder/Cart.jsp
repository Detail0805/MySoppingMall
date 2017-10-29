<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO" %>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式  - Cart.jsp</title>
</head>
<body bgcolor="#FFFFFF">

<%Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");%>
<%if (buylist != null && (buylist.size() > 0)) {%>

<img src="images/tomcat.gif"> <font size="+3">目前您購物車的內容如下：</font><p>

<table border="1" width="740">
		<tr bgcolor="#999999">
			<th width="200">產品名稱</th>
			<th width="100">商品價格</th>
			<th width="100">商品描述</th>
			<th width="100">購買數量</th>
			<th width="100">商品編號</th>
			<th width="120"></th>
		</tr>

		<%
	 for (int index = 0; index < buylist.size(); index++) {
		 CartVO order = buylist.get(index);
	%>
	<tr>
		<td width="200"><div align="center"><b><%=order.getNAME()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getPRICE()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getDES().substring(0,10)%>....</b></div></td>
		<td width="100"><div align="center"><b><%=order.getQUANTITY()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getITEMNO()%></b></div></td>
		
		
		<td width="100"><div align="center">
          <form name="deleteForm" action="cart.do" method="POST">
              <input type="hidden" name="action" value="DELETE">
              <input type="hidden" name="del" value="<%= index %>">
              <input type="submit" value="刪除"></div>
        </td></form>
	</tr>
	<%}%>
</table>
<p>
          <form name="checkoutForm" action="cart.do" method="POST">
              <input type="hidden" name="action"	value="CHECKOUT"> 
              <input type="submit" value="付款結帳">
          </form>
          
                    <form name="claerForm" action="cart.do" method="POST">
              <input type="hidden" name="action"value="CLEARCART"> 
              <input type="submit" value="清空購物車">
          </form>
<%}%>
</body>
</html>