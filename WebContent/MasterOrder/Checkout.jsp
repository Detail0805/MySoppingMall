<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式 - Checkout.jsp</title>
</head>
 <script type="text/javascript">
    function changeQuantity(input,oldValue) {
        var quantity = input.value; // 得到要修改的数量
       
        // 检查用户输入的数量是不是一个数字
        if(isNaN(quantity)) {
            alert("請輸入數字!");
            // 得到输入项原来的值
            input.value = oldValue;
            return;
        }
      
        // 检查用户输入的数量是不是一个正整数
        if(quantity<0 || quantity!=parseInt(quantity)) {    // 1.1 != 1     parseInt("abc")返回NaN
            alert("請輸入一個正整數!!");
            input.value = oldValue;
            return;
        }
        var b = window.confirm("您確定把數量設定為"+quantity+"嗎?")
        if(b) {
        }
    }
</script>
<body bgcolor="#FFFFFF">
<img src="images/tomcat.gif"> <font size="+3">訂單截帳CHECKOUT.JSP</font>
<hr><p>

<table border="1" align="center" >
	<tr bgcolor="#999999">
			<th width="200">產品圖片</th>
			<th width="200">產品名稱</th>
			<th width="200">產品編號</th>
			<th width="100">商品價格</th>
			<th width="100">商品描述</th>
			<th width="100">購買數量</th>
	</tr>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do"  align="center" >
	<%
		Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
		request.setAttribute("amount",amount);
		out.println("amount = " + (String)request.getAttribute("amount"));
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
		
<%-- 		<td width="100"><div align="center"><b><%=QUANTITY%></b></div></td> --%>
		<td width="100"><div align="center">
		<input type="text" name="quantity<%=i%>" id="txt1" value="<%=QUANTITY%>" 
		style="width: 35px" onchange="changeQuantity(this,<%=QUANTITY%>)" /></div></td>

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
				
						<input type="submit" value="確認購買">
						<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}"> 
						<input type="hidden" name="amount" value="${amount}">
						<!-- 						假裝會員已經登入了 -->
						<input type="hidden" name="MEMNO" value="MEM0001">
						<input type="hidden" name="action" value="CONFIRM">
					</FORM>
					
<div  align="center" >
<a href="listAll.jsp" >繼續購物</a>
</div>
</body>
</html>
