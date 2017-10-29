<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式 - Checkout.jsp</title>
</head>
<body bgcolor="#FFFFFF">
<img src="images/tomcat.gif"> <font size="+3">訂單截帳CHECKOUT.JSP</font>
<hr><p><center>

<table border="1" width="720">
	<tr bgcolor="#999999">
			<th width="200">產品圖片</th>
			<th width="200">產品名稱</th>
			<th width="200">產品編號</th>
			<th width="100">商品價格</th>
			<th width="100">商品描述</th>
			<th width="100">購買數量</th>
	</tr>
	
	<%
		Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
			CartVO order = buylist.get(i);
			Integer ITEMNO=order.getITEMNO();
			String NAME = order.getNAME();
			Integer QUANTITY = order.getQUANTITY();
			String DES = order.getDES();
			float PRICE = order.getPRICE();
	%>
	<tr>
		<td width="200"><img src="DBPicReader?ITEMNO=<%=ITEMNO%>" height="150px" width="200px">
		</td>
		<td width="200"><div align="center"><b><%=NAME%></b></div></td>
		<td width="200"><div align="center"><b><%=ITEMNO%></b></div></td>
		<td width="100"><div align="center"><b><%=PRICE%></b></div></td>
		<td width="100"><div align="center"><b><%=DES.substring(0,7)%>...</b></div></td>
		<td width="100"><div align="center"><b><%=QUANTITY%></b></div></td>
		
	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>總金額：</b></font></div></td>
		<td> <font color="red"><b>$<%=amount%></b></font> </td>
	</tr>
</table>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do">
						<input type="submit" value="確認購買">
						<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}"> 
						</td>			     
						<input type="hidden" name="action" value="CONFIRM">
						<!-- 						假裝會員已經登入了 -->
						<input type="hidden" name="MEMNO" value="MEMNO0001">
						<input type="hidden" name="action" value="CONFIRM">
					</FORM>

<p><a href="listAll.jsp">繼續購物</a>
</center>
</body>
</html>
