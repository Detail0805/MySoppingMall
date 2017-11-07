<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式 - Checkout.jsp</title>
</head>
<body bgcolor="#FFFFFF">
 <font size="+3">訂單截帳CHECKOUT.JSP</font>
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
		<input type="text" name="quantity<%=i%>" id="exampleInputEmail1" value="<%=QUANTITY%>" 
		style="width: 35px" onchange="changeQuantity(this,<%=QUANTITY%>,<%=PRICE%>,<%=amount%>)" /></div></td>

	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>總金額：</b></font></div></td>
		<td> <font color="red"><b id="amountofshow">$<%=amount%></b></font> </td>
	</tr>
</table>


	<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
	<input type="hidden" name="amount" id="amountt" value="${amount}">
	<!-- 						假裝會員已經登入了 -->
	<input type="hidden" name="MEMNO" value="MEM0001">
	<input type="hidden" name="action" value="CONFIRM">
	<div align="center">
		<input type="submit" value="確認購買">
	</div>
	</FORM>
					
<div  align="center" >
<a href="Shop/listAll.jsp" >繼續購物</a>
</div>
</body>
 <script type="text/javascript">
    function changeQuantity(input,oldValue,price,amount) {

        var quantity = input.value; // 得到要修改的数量
        console.log('input框框裡面新的數量'+quantity)
        var element=document.getElementById("amount");//藏在input裡的總價
        var amountofshow=document.getElementById("amountofshow");//show出來的總價
        var amountofshow2=parseInt((amountofshow.innerHTML).substring(1));
        var element2=amountofshow2;
        var neverchange=amount;
        var iwillchange=amount;
        console.log('amountofshow2:'+amountofshow2);
        console.log('element2:'+element2);
        var newamountofshow=document.getElementById("amountofshow");
        var newamount=document.getElementById("amountt");
        
        //檢查是否為數字
        if(isNaN(quantity)) {
            alert("請輸入數字!");
            //還原原來的值
            input.value = oldValue;
            newamountofshow.innerHTML=neverchange;
            return;
        }
        //檢查輸入是否為正整數
        if(quantity<0 || quantity!=parseInt(quantity)) {    // 1.1 != 1     parseInt("abc")返回NaN
            alert("請輸入一個正整數!!");
            input.value = oldValue;
            newamountofshow.innerHTML=neverchange;
            return;
        }
        //oldValue值永遠不變
        if(isNaN(quantity)) {
            alert("請輸入數字!");
            //還原原來的值
            input.value = oldValue;
            newamountofshow.innerHTML=neverchange;
            return;
            
        }else if(!isNaN(quantity) && oldValue>quantity) {
        	console.log('oldValue>quantity :oldValue :'+oldValue+' quantity'+quantity)
        	var news=(oldValue-quantity)*price;
        	console.log('news :'+news);
        	finalPrice=neverchange-news;
        	console.log('finalPrice '+finalPrice);

			newamountofshow.innerHTML=finalPrice;
			newamount.innerHTML=finalPrice;
        	console.log('finalPrice '+finalPrice);
        	console.log('完成newamountofshow.innerHTML後的值 : '+newamountofshow.innerHTML);
        	console.log('完成newamount.innerHTML後的值 : '+newamount.innerHTML);
        	iwillchange=finalPrice;
        	console.log('neverchange後的值 : '+neverchange);
        	console.log('iwillchange後的值 : '+iwillchange);
        } else if(!isNaN(quantity) && oldValue<quantity){
        	console.log('oldValue<quantity :oldValue :'+oldValue+' quantity'+quantity)
        	var news=(quantity-oldValue)*price;
        	console.log('news :'+news)
        	finalPrice=neverchange+news;
			newamountofshow.innerHTML=finalPrice;
			newamount.innerHTML=finalPrice;
        	console.log('finalPrice '+finalPrice);
        	console.log('完成newamountofshow.innerHTML後的值 : '+newamountofshow.innerHTML);
        	console.log('完成newamount.innerHTML後的值 : '+newamount.innerHTML);
        	console.log('neverchange後的值 : '+neverchange);
        	iwillchange=finalPrice;
        	console.log('iwillchange後的值 : '+iwillchange);
        }else if (!isNaN(quantity) && oldValue==quantity)
        	{
			newamountofshow.innerHTML=neverchange;
			newamount.innerHTML=neverchange;
        	}
    }
</script>
</html>
