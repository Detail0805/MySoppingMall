<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>
<%
	ProDAO dao = new ProDAO();
    List<ProVO> list = dao.activity();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet"></link>

<style type="text/css">
font {
	font-family: DFKai-sb;
}
</style>
</head>

<body background="images/page.jpg" style="background-size: cover;">


	<h3 align="center">
		查詢促銷專案資料mainforpro.jsp:<br>
		<c:if test="${not empty errorMsgs}">
			<font color='red'>請修正以下錯誤:<br>

					<c:forEach var="message" items="${errorMsgs}">
						${message}<br>
					</c:forEach>

			</font>
		</c:if>
	</h3>
	<br>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-5"></div>
			<div class="col-sm-4">
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-12">

						<br> <br> <font size="5">
							<a href='Promotion/listAllPro.jsp'>列出所有促銷專案by EL</a></font><br> <br>

						<form action="pro.do" class="form-inline" method="POST">
							<div class="form-group">
								<font size="5">輸入促銷專案編號：</font><input placeholder="促銷專案NO."
									class="form-control input" type="text" size="8" name="PRONO"> 
									<input type="hidden" name="action" value="getOne_For_Display3">
								<button class="btn btn-primary btn">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
					</div>
				</div>
				<jsp:useBean id="proSvc" scope="page"
					class="com.detail.promotion.ProService" />
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-12">
						<form action="pro.do" class="form-inline" method="POST">
							<input type="hidden" name="action" value="getOne_For_Display">
							<div class="form-group">
								<font size="5">選擇專案名稱：<select name="ITEMNO"
									class="form-control">

										<c:forEach var="proVO" items="${list}">
											<option value="${proVO.ACTIVITYNAME}">${proVO.ACTIVITYNAME}
      									</c:forEach>   
								</select></font>
								<button class="btn btn-primary btn">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-12">
						<form action="pro.do" class="form-inline" method="POST">
						<input type="hidden" name="action" value="getOne_For_Display2">
							<div class="form-group">
								<font size="5">選擇商品名稱：<select  name="ITEMNO"
									class="form-control">
										  <c:forEach var="proVO" items="${proSvc.getAllProShop()}" > 
         									 <option value="${proVO.SHOPNAME}">${proVO.SHOPNAME}
       									  </c:forEach>   
								</select></font>
								<button class="btn btn-primary btn">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>

						<font size="5">商品管理:</font> <br> <br> <font size="5"><a
							href='Promotion/addpromotion.jsp'>新增促銷專案</a></font><br> <br>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
