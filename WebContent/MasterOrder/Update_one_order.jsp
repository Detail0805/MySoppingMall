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
	session.setAttribute("OrderList", OrderList);
%>
<%int i=0;%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
 <script type="text/javascript">
    function changeQuantity(input,oldValue) {

        var quantity = input.value; // 得到要修改的数量

        //檢查是否為數字
        if(isNaN(quantity)) {
            alert("請輸入數字!");
            //還原原來的值
            input.value = oldValue;
            return;
        }
        //檢查輸入是否為正整數
        if(quantity<0 || quantity!=parseInt(quantity)) {    // 1.1 != 1     parseInt("abc")返回NaN
            alert("請輸入一個正整數!!");
            input.value = oldValue;
            return;
        }

    }
</script>
</head>
<body>
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
		<th>按鈕1</th>

		

	</tr>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order.do"  align="center" >
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

				<td>
			     <input type="text" name="quantity<%=i++%>" onchange="changeQuantity(this,${OrderList.ordercount})" value="${OrderList.ordercount}" style="width: 35px"  />
   </td>
			</td>
		</tr>
</c:forEach>
</table>
	<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
	<input type="hidden" name="amount" id="amount" value="${total}">
	<!-- 						假裝會員已經登入了 -->
	<input type="hidden" name="MEMNO" value="MEM0001">
	<input type="hidden" name="action" value="CONFIRM_UPDATE_ORDERID">
	<div align="center">
		<input type="submit" value="確認購買">
	</div>
	</FORM>
total=<%=total%> 
EL total=${total}
Update_one_order.jsp
</body>
</html>