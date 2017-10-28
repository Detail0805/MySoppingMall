<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>※此頁面測試未來整合的可能性※※此頁面測試未來整合的可能性※※此頁面測試未來整合的可能性※</h2>
	<h3 align="center">
		資料查詢:<br>
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

						<br> <br> <font size="5"><a
							href='ShowAll.jsp'>列出所有商品</a><br>
							<a href='listAll.jsp'>列出所有商品by EL</a></font><br> <br>

						<form action="emp.do" class="form-inline" method="POST">
							<div class="form-group">
								<font size="5">輸入商品編號：</font><input placeholder="輸入 ID"
									class="form-control input" type="text" size="8" name="ITEMNO"> 
									<input type="hidden" name="action" value="getOne_For_Display">
								<button class="btn btn-primary btn">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>
					</div>
				</div>
				<jsp:useBean id="empSvc" scope="page"
					class="com.shop.model.ShopService" />
				<div class="row">
					<div class="col-sm-2"></div>
					<div class="col-sm-12">
						<form action="emp.do" class="form-inline" method="POST">
							<input type="hidden" name="action" value="getOne_For_Display">
							<div class="form-group">
								<font size="5">選擇商品編號：<select name="ITEMNO"
									class="form-control">

										<c:forEach var="empVO" items="${empSvc.all}">
											<option value="${empVO.ITEMNO}">${empVO.ITEMNO}
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
						<form action="emp.do" class="form-inline" method="POST">
						<input type="hidden" name="action" value="getOne_For_Display2">
							<div class="form-group">
								<font size="5">選擇商品名稱：<select  name="ITEMNO"
									class="form-control">
										  <c:forEach var="empVO" items="${empSvc.all}" > 
         									 <option value="${empVO.NAME}">${empVO.NAME}
       									  </c:forEach>   
								</select></font>
								<button class="btn btn-primary btn">
									<span class="glyphicon glyphicon-search"></span>查詢
								</button>
							</div>
						</form>

						<font size="5">商品管理:</font> <br> <br> <font size="5"><a
							href='addproduct.html'>新增商品</a></font><br> <br>

					</div>
				</div>
			</div>
		</div>
	</div>