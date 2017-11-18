<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.detail.promotion.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>addpromotion.jsp</title>
</head>
<body  style="background-size: cover;">
	<h3 align="center">促銷商品新增</h3>


		<c:if test="${not empty errorMsgs}">
			<font color='red'>請修正以下錯誤:<br>

					<c:forEach var="message" items="${errorMsgs}">
						${message}<br>
					</c:forEach>

			</font>
		</c:if>

	
		<table align="center">

			<tr>
				<td>促銷專案名稱：</td>
				<div>
				  <a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${proVOproject.ITEMNO}&PRO=0"><img class="img-responsive" img src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${proVOproject.ITEMNO}" style=" height: 188px; width: 188px;margin-right: auto;margin-left: auto;" title="##"></a>
				  </div>
				<td><input type="text" name="NAME" size="20"></td>
			</tr>
			<form id="submit" action="<%=request.getContextPath()%>/pro.do" method=post >
			<tr>
			<td>活動開始日期：</td>
			<td>	
				<div class="calendarWarp">
					<input type="text" name="BEGINDATE" size="20"  class="ECalendar" id="ECalendar_case1"></td>
				</div>
			</td>
			</tr>
			<tr>
				<td>促銷開始日期：</td>
				<td>
					<div class="calendarWarp">
						<input type="text" name="ENDDATE" size="20"  class="ECalendar" id="ECalendar_case2"></td>
				</div>
				</td>
			</tr>
PRICE:${proVOproject.PRICE}
PROMOTIOMNO:${proVOproject.PROMOTIOMNO}
ITEMNO:${proVOproject.ITEMNO}
DES:${proVOproject.DES}
	<select >
		<option value="${proVOproject.ACTIVITYNAME}">${proVOproject.ACTIVITYNAME}
	</select>
         
			<tr>
			<td><input type="hidden" name="action" value="addpromotion"></td>
			<td><input type="submit" value="新增為促銷商品"></td>
				<br>
			</tr>
		</table>
	</form>
----------------------------------------------------------------------------------


</body>
</html>