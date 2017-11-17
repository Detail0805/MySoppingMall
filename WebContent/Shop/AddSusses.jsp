<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AddSusses.jsp</title>
</head>
<body>
  	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="text-center">產品照片</th>
							<th class="text-center">產品名稱</th>
							<th class="text-center">數量</th>
							<th class="text-center">商品編號</th>
							<th class="text-center">單價</th>
							<th class="text-center">修改</th>
							<th class="text-center">下架</th>
						</tr>
					</thead>
						<tbody>
							<tr>
								<td class="col-sm-8 col-md-1">
									<div class="media">
										<a class="thumbnail pull-left" href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.key}&PRO=0"" style=" margin-top: 10px;"> <img
											src="<%=request.getContextPath()%>/DBPicReader?ITEMNO=${shopVO.key}" height="72px"width="72px">
										</a>

									</div>
								</td>
								<td class="col-sm-8 col-md-2">
											<h4 class="media-heading" style="margin-top: 39px">
												<a href="<%=request.getContextPath()%>/shop.do?action=checkone&ITEMNO=${shopVO.key}&PRO=0">${shopVO.NAME}</a>
											</h4>
								</td>
								<td class="col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												${shopVO.STOCK}
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<strong>$${shopVO.PRICE}</strong>
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 36px">
												<strong>內容${shopVO.DES}</strong>
											</h4>
										</div>
									</div>
								</td>
								<td class="col-sm-1 col-md-1">
										<div align="center">

								<div class="media">
										<div class="media-body">
							<form  name="deleteForm" action="<%=request.getContextPath()%>/shop.do" method="POST" ">
								<button  type="submit" class="btn btn-danger" role="button" style="margin-top:30px">
										 <span class="glyphicon glyphicon-remove"></span>Remove
									</button>
										<input type="hidden" name="ITEMNO" value="${shopVO.key}"> 
										<input type="hidden" name="action" value="delete"> 
							</form>
								</div>
									</div>
								</td>
								
								<td class="col-sm-1 col-md-1">
										<div align="center">

								<div class="media">
										<div class="media-body">
							<form  name="deleteForm" action="<%=request.getContextPath()%>/shop.do" method="POST" ">
								<button  type="submit" class="btn btn-warning" role="button" style="margin-top:30px">
										 getOne_For_Update
									</button>
										<input type="hidden" name="ITEMNO" value="${shopVO.key}"> 
										<input type="hidden" name="action" value="getOne_For_Update"> 
							</form>
								</div>
									</div>
								</td>
							</tr>

					

							<tr>
								<td>?</td>
								<td>?</td>
								<td>?</td>
								<td><h3>Total</h3></td>
								<td class="text-right"><h3>
										<strong>$<b id="amountofshow">amount</b></strong>
									</h3></td>
							</tr>
							<tr>
								<td>?</td>
								
								<td>?
								<td>
								<form name="claerForm" id="2" action="<%=request.getContextPath()%>/cart.do" method="POST" onsubmit="return clearCart()">
								<input type="hidden" name="action" value="CLEARCART">
								<button type="submit" class="btn btn-warning">
								<span class="glyphicon glyphicon-remove"></span>
									清空購物車</button>
									</form>
									</td>
								</td>
								<td><a href="<%=request.getContextPath()%>/front/shopindex.jsp" class="btn btn-default"
									role="button"><span
										class="glyphicon glyphicon-shopping-cart"></span> Continue
										Shopping</a></td>
								<td>
								<a href="<%=request.getContextPath()%>/cart.do?action=CHECKOUT" class="btn btn-success" role="button">
								Checkout <span class="glyphicon glyphicon-play"></span></a>
		
								</td>
								<td>?</td>
							</tr>
						</tbody>
				</table>
				
			</div>
		</div>
	</div>
	
</body>
</html>