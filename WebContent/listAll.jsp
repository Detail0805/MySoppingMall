<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.detail.promotion.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
//此段複寫equals 去比較itemno
    ShopService shopSvc = new ShopService();
    List<ShopVO> list = shopSvc.getAllFromBack();
    pageContext.setAttribute("list", list);
// 	ProService proSvc = new ProService();
// 	List<ProVO> list2 = proSvc.getAll();
	
// // 	list.remove(list2);
// 	List<ShopVO> list3 = new ArrayList<ShopVO>();
// 	for(ShopVO vo:list){
// 		Boolean tag = false;
// 		for(ProVO vo2:list2){
// 			if(vo.equals(vo2)){
// 				tag = true;
// 			}
// 		}
// 		if(!tag){
// 			list3.add(vo);
// 		}
// 	}
//     pageContext.setAttribute("list", list3); // forEach EL用
// 	list = list3;// include page1.file JSP用
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

				<jsp:useBean id="empSvc" scope="page" class="com.shop.model.ShopService" />
<table border='1' bordercolor='#CCCCFF' width='800' align='center'>
	<tr>
		<th>商品圖片</th>
		<th>產品編號</th>
		<th>商品類別</th>
		<th>商品狀態</th>
		<th>產品描述</th>
		<th>修改</th>
		<th>上下架</th>
		<th>購買數量</th>
		<th>加入購物車</th>

	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="shopVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
			<td width="200"><img src="DBPicReader?ITEMNO=${shopVO.ITEMNO}" height="150px" width="200px">
		</td>
			<td>${shopVO.ITEMNO}</td>
			<td>${shopVO.CLASSNO}</td>
			<td>${shopVO.STATE}</td>
			<td>${shopVO.DES}</td>
			<td>
			  <FORM METHOD="post" ACTION="shop.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
			<td>
			  <FORM METHOD="post" ACTION="shop.do">
			    <input type="submit" value="${((shopVO.STATE)==1)?'下架':'上架'}">
			    <input type="hidden" name="STATE" value="${shopVO.STATE}">
			    <input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}">
			    <input type="hidden" name="action"value="shelf"></FORM>
			</td>
				<FORM METHOD="post" ACTION="cart.do">
				
				<td><select name="STOCK">
						<c:forEach var="STOCK" begin="0" end="${shopVO.STOCK}" step="1">
							<option value="${STOCK}">${STOCK}
         						</c:forEach> 
						</td> 
				</select>
				<td>
					
						<input type="submit" value="加入購物車">
							<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}"> 
						</td>	
						
<!-- 						改成MVC寫法以後只需要商品ITEMO去送以免遭人串改總金額  -->
<%-- 					     <input type="hidden" name="CLASSNO" value="${empVO.CLASSNO}"> --%>
<%-- 					     <input type="hidden" name="STATE" value="${empVO.STATE}"> --%>
<%-- 					     <input type="hidden" name="DES" value="${empVO.DES}"> --%>
<%-- 					     <input type="hidden" name="PRICE" value="${empVO.PRICE}"> --%>
<%-- 					     <input type="hidden" name="NAME" value="${empVO.NAME}"> --%>
					     
						<input type="hidden" name="action" value="ADD">
					</FORM>
				</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<h2>下面測試用includ購物車網址</h2>

<%@ include file="/MasterOrder/Cart.jsp" %>

</body>
</html>