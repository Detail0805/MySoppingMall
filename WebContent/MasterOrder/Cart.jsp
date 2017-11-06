<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.detail.cart.CartVO"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function deleteitem() {
		var b = window.confirm("您確認刪除嗎?");
		if (b) {
			return true;
		} else {
			return false
		}
	}

	function clearCart() {
		var b = window.confirm("您確定清空嗎?");
		if (b) {
			return true;
		} else {
			return false
		}
	}
</script>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<body>

						<%
							Vector<CartVO> buylist = (Vector<CartVO>) session.getAttribute("shoppingcart");
							String amount = (String) request.getAttribute("amount");
							request.setAttribute("amount", amount);
							out.println("amount = " + (String) request.getAttribute("amount"));
						%>
						<%if (buylist != null && (buylist.size() > 0)) {%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>產品名稱</th>
							<th>數量</th>
							<th class="text-center">單價</th>
							<th class="text-center">總價</th>
							<th> </th>
						</tr>
					</thead>

						
						<%
							for (int i = 0; i < buylist.size(); i++) {
								CartVO order = buylist.get(i);
								Integer ITEMNO = order.getITEMNO();
								String NAME = order.getNAME();
								Integer QUANTITY = order.getQUANTITY();
								String DES = order.getDES();
								float PRICE = order.getPRICE();
						%>
						<tbody>
							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" href="#"> <img
											src="DBPicReader?ITEMNO=<%=ITEMNO%>" height="72px"
											width="72px">
										</a>
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 25px">
												<a href="#"><%=NAME%></a>
											</h4>

										</div>
									</div>
								</td>

								<td class="col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 25px">
												<%=QUANTITY%>
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 25px">
												<strong>$<%=PRICE%></strong>
											</h4>
										</div>
									</div>
								</td>
								<td class="	col-sm-1 col-md-1 text-center">
									<div class="media">
										<div class="media-body">
											<h4 class="media-heading" style="margin-top: 25px">
												<strong>$<%=PRICE * QUANTITY%></strong>
											</h4>
										</div>
									</div>
								</td>
								<td class="col-sm-1 col-md-1">
										<div align="center">

								<div class="media">
										<div class="media-body">
							<form name="deleteForm" action="<%=request.getContextPath()%>/cart.do" method="POST">
								<button  type="submit" class="btn btn-danger" role="button" style="margin-top:20px">
										 <span class="glyphicon glyphicon-remove"></span>Remove
									</button>
										<input type="hidden" name="action" value="DELETE"> 
										<input type="hidden" name="del" value="<%=i%>"> 
							</form>
								</div>
									</div>
									</button></td>
							</tr>

							<%
								}
							%>

							<tr>
								<td> </td>
								<td> </td>
								<td> </td>
								<td><h3>Total</h3></td>
								<td class="text-right"><h3>
										<strong>$<b id="amountofshow"><%=amount%></b></strong>
									</h3></td>
							</tr>
							<tr>
								<td> </td>
								
								<td> 
								<td><a href="<%=request.getContextPath()%>/shopPAGEFortext.jsp" class="btn btn-warning"
									role="button"><span class="glyphicon glyphicon-remove"></span></span>
									    <input type="hidden" name="action"value="CLEARCART">
									清空購物車</a></td>
								</td>
								<td><a href="<%=request.getContextPath()%>/shopPAGEFortext.jsp" class="btn btn-default"
									role="button"><span
										class="glyphicon glyphicon-shopping-cart"></span> Continue
										Shopping</a></td>
								<td>
								  <form name="checkoutForm" action="<%=request.getContextPath()%>/cart.do" method="POST">
									<button type="submit" class="btn btn-success">
									<input type="hidden" name="action"	value="CHECKOUT"> 
										Checkout <span class="glyphicon glyphicon-play"></span>
									</button>
									</form>
								</td>
								<td> </td>
							</tr>
						</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<%}%>
</body>

<script type="text/javascript">
	function changeQuantity(input, oldValue, price, amount) {

		var quantity = input.value; // 得到要修改的数量
		console.log('input框框裡面新的數量' + quantity)
		var element = document.getElementById("amount");//藏在input裡的總價
		var amountofshow = document.getElementById("amountofshow");//show出來的總價
		var amountofshow2 = parseInt((amountofshow.innerHTML).substring(1));
		var element2 = amountofshow2;
		var neverchange = amount;
		var iwillchange = amount;
		console.log('amountofshow2:' + amountofshow2);
		console.log('element2:' + element2);
		var newamountofshow = document.getElementById("amountofshow");
		var newamount = document.getElementById("amountt");

		//檢查是否為數字
		if (isNaN(quantity)) {
			alert("請輸入數字!");
			//還原原來的值
			input.value = oldValue;
			newamountofshow.innerHTML = neverchange;
			return;
		}
		//檢查輸入是否為正整數
		if (quantity < 0 || quantity != parseInt(quantity)) { // 1.1 != 1     parseInt("abc")返回NaN
			alert("請輸入一個正整數!!");
			input.value = oldValue;
			newamountofshow.innerHTML = neverchange;
			return;
		}
		//oldValue值永遠不變
		if (isNaN(quantity)) {
			alert("請輸入數字!");
			//還原原來的值
			input.value = oldValue;
			newamountofshow.innerHTML = neverchange;
			return;

		} else if (!isNaN(quantity) && oldValue > quantity) {
			console.log('oldValue>quantity :oldValue :' + oldValue
					+ ' quantity' + quantity)
			var news = (oldValue - quantity) * price;
			console.log('news :' + news);
			finalPrice = neverchange - news;
			console.log('finalPrice ' + finalPrice);

			newamountofshow.innerHTML = finalPrice;
			newamount.innerHTML = finalPrice;
			console.log('finalPrice ' + finalPrice);
			console.log('完成newamountofshow.innerHTML後的值 : '
					+ newamountofshow.innerHTML);
			console.log('完成newamount.innerHTML後的值 : ' + newamount.innerHTML);
			iwillchange = finalPrice;
			console.log('neverchange後的值 : ' + neverchange);
			console.log('iwillchange後的值 : ' + iwillchange);
		} else if (!isNaN(quantity) && oldValue < quantity) {
			console.log('oldValue<quantity :oldValue :' + oldValue
					+ ' quantity' + quantity)
			var news = (quantity - oldValue) * price;
			console.log('news :' + news)
			finalPrice = neverchange + news;
			newamountofshow.innerHTML = finalPrice;
			newamount.innerHTML = finalPrice;
			console.log('finalPrice ' + finalPrice);
			console.log('完成newamountofshow.innerHTML後的值 : '
					+ newamountofshow.innerHTML);
			console.log('完成newamount.innerHTML後的值 : ' + newamount.innerHTML);
			console.log('neverchange後的值 : ' + neverchange);
			iwillchange = finalPrice;
			console.log('iwillchange後的值 : ' + iwillchange);
		} else if (!isNaN(quantity) && oldValue == quantity) {
			newamountofshow.innerHTML = neverchange;
			newamount.innerHTML = neverchange;
		}
	}
</script>
</html>