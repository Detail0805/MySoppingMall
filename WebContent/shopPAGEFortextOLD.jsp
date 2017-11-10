<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*, com.detail.cart.CartVO"%>
<%@ page import="com.detail.promotion.*"%>
<%
//此段複寫equals 去比較itemno
    ShopService shopSvc = new ShopService();
    List<ShopVO> list = shopSvc.getAll();

    
	ProService proSvc = new ProService();
	List<ProVO> list2 = proSvc.getAllProNow();
    List listforpro=list2;
    pageContext.setAttribute("listforpro", list2);
    
// 	list.remove(list2);
	List<ShopVO> list3 = new ArrayList<ShopVO>();
	for(ShopVO vo:list){
		Boolean tag = false;
		for(ProVO vo2:list2){
			if(vo.equals(vo2)){
				tag = true;
			}
		}
		if(!tag){
			list3.add(vo);
		}
	}
    pageContext.setAttribute("list", list3); // forEach EL用
	list = list3;// include page1.file JSP用
	
	


%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

/*.shoprow {
	background-color: #FFD78C;
	text-align: center;
}

.bigshoprow {
	background-color: #DEFFFF;
	padding: 20px;
}*/
/* .detail img{width: 180px; 
 	height: 180px; }*/
.btn-success:hover {
	background-color: #449d44;
	border-color: #398439;
	color: #ffe200;
}

.special-price {
	font-size: 1.3em;
	color: red;
}

.prices {
	font-weight: 700;
}

.product-title {
	font-size: 20px;
	font-weight: 600;
	line-height: 20px;
}

.pull-text-center:hover {
	background-color: #ffffe0
}

.offer.offer-default.silde-show-offer.pull-text-center {
	height: 420px;
}

.offer-default {
	border-color: #999;
	padding: 10px;
}

.offer {
	background: #fff;
	border: 1px solid rgba(221, 221, 221, 0.45);
	box-shadow: 0 10px 20px rgba(0, 0, 0, .2);
	margin: 15px 0;
	overflow: hidden;
}

.pull-text-center {
	text-align: center;
}

.offer.offer-default.silde-show-offer.pull-text-center {
	height: 420px;
}

.price.old-price {
	text-decoration: line-through;
}

.btn-danger {
	margin-left: 10;
	width: 100px;
}

.mid-content-title {
	font-size: 18px;
	margin: 0;
	background: -webkit-gradient(linear, left top, left bottom, from(#f9ca52),
		to(#ed3123));
	background: -moz-linear-gradient(top, #f9ca52, #ed3123);
	margin: 15px 0;
	color: #fff;
	padding: 8px 12px;
}
/*	.description{
		font-style: bold;
	}
	*/
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.5/sweetalert2.all.js"></script>
        <script type="text/javascript">  
        $(document).ready(function(){  
        	console.log('in jquery1');
            $('form').on('submit',function(event){
                event.preventDefault();
            	console.log($(this).children().eq(2).val());
                var STOCK = $(this).children().eq(0).val();
                var action = $(this).children().eq(1).val(); 
                var ITEMNO = $(this).children().eq(2).val(); 
                console.log('STOCK :'+STOCK+' ,ITEMNO :'+ITEMNO+' ,action :'+action);

                     $.ajax({  
                        type: "POST",  
                        url: "cart.do",  
                        data: {"STOCK" : STOCK,"action" : action,"ITEMNO" : ITEMNO},  
                        success: function(msg){
                        	swal({
                        		  title: '',
                        		  text: "已成功加入購物車。",
                        		  type: 'success',
                        		  timer: 5000,
                        		  showCancelButton: true,
                                  confirmButtonColor: "#8fdd54",
                                  cancelButtonColor: "#DD6B55",
                        		  confirmButtonText: '前往購物車',
                        		  cancelButtonText: '  OK  ',
                        		  confirmButtonClass: 'btn btn-success',
                        		  cancelButtonClass: 'btn btn-danger',
                        		  buttonsStyling: false
                        		}).then(function () {
                        			console.log('按下左邊');
                        			 window.location.href ='<%=request.getContextPath()%>/MasterOrder/Cart.jsp';
                        		}, function (dismiss) {
                        		  // dismiss can be 'cancel', 'overlay',
                        		  // 'close', and 'timer'
                        		  if (dismiss === 'cancel') {
                        			  console.log('按下右邊');
                        		  }
                        		})
                     
//                        	sweetAlert("", "已成功加入購物車。","success");
//                         	$('#myModal').modal();
                        }  
                    });   
               
                

            });  
        });  
      </script>  

<title>Insert title here</title>
</head>
<body>

  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModalforShopCart">Open Modal</button>

  <!-- Modal -->
  <div class="modal fade" id="myModalforShopCart" role="dialog">
    <div class="modal-dialog" style="width:1200px;">
    
      <!-- Modal content-->
      <div class="modal-content" >
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">購物車內容</h4>
        </div>
        <div class="modal-body">
          <%@ include file="MasterOrder/pages/Cartinclude.jsp" %>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<h4 align="center"><img src="<%=request.getContextPath()%>/images/greenpick.png" height="72px" width="72px">已成功添加到購物車！！</h4>
      </div>
      <div class="modal-footer">
      <button onclick="location.href ='<%=request.getContextPath()%>/MasterOrder/Cart.jsp';" type="button" class="btn btn-info btn-lg left" data-dismiss="modal">前往購物車</button>
        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>



<div class="col-xs-12 col-sm-2"></div>
<div class="col-xs-12 col-sm-8">
<div>
<div class="title mid-content-title">
            <strong>熱門推薦</strong>
        </div>
	<div class="bigshoprow">
		<div class="container shoprow">
			<div class="row">
				<c:forEach var="shopVO" items="${list}">
					<div class="col-xs-12 col-sm-3 eachshop">
						<div class="offer offer-default silde-show-offer pull-text-center">
							<div class="detail">
								<div class="picture thumbnail" title="我是商品名稱你好阿">
									<a href="123" title="你好我是商品名稱"> <img class="img-responsive"
										img src="DBPicReader?ITEMNO=${shopVO.ITEMNO}" height="180px"
										width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="##"> ${shopVO.NAME}</a>
									</h2>
									<div class="description">${shopVO.DES.substring(0,15)}...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
									<div class="prices">
										<span class="price special-price">$${shopVO.PRICE}</span>
									</div>

									<div class="buttons">

									<FORM METHOD="post" >
											<select name="STOCK" id="STOCK">
											<c:forEach var="STOCK" begin="1" end="${shopVO.STOCK}"
												step="1">
												<option value="${STOCK}">${STOCK}
											</c:forEach> </select>
									<input type="hidden" name="action" value="ADD" ">
									<input type="hidden" name="ITEMNO" value="${shopVO.ITEMNO}" >
									<input type="submit" class="btn btn-sm btn-success" value="放入購物車">
										</FORM>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</div>


<div class="col-xs-12 col-sm-12">

<br>
<div class="col-xs-12 col-sm-2">
</div>
<div class="col-xs-12 col-sm-8">
<div class="title mid-content-title">
            <strong>熱門推薦</strong>
                    <span class="pull-right">
                    <a class="title-carousel-control" href="#carousel-recently-generic" data-slide="prev">
                        <i class="fa fa-angle-left">1</i>
                    </a>
                    <a class="title-carousel-control" href="#carousel-recently-generic" data-slide="next">
                        <i class="fa fa-angle-right">2</i>
                    </a>
                </span>
                  </div>
                   <div id="carousel-recently-generic" class="carousel slide recently-added-products-page" data-ride="carousel">
	<div class="bigshoprow">
		<div class="container shoprow">
			<div class="row">


				<c:forEach var="proVO" items="${listforpro}" >
					<div class="col-xs-12 col-sm-3 eachshop">
						<div class="offer offer-default silde-show-offer pull-text-center">
							<div class="detail">
								<div class="picture thumbnail" title="我是商品名稱你好阿">
									<a href="123" title="你好我是商品名稱"> <img class="img-responsive"
										img src="DBPicReader?ITEMNO=${proVO.ITEMNO}"  height="180px" width="180px">
									</a>
								</div>
								<div class="middle-content">
									<h2 class="product-title">
										<a href="##"> ${proVO.SHOPNAME}</a>
									</h2>
									<div class="description">${proVO.DES.substring(0,15)}...</div>
								</div>
							</div>
							<div class="add-info">
								<div class="ash-box">
									<div class="prices">
										<span class="price old-price">原價$${proVO.OLDPRICE}</span> <span
											class="price special-price">特價$${proVO.PRICE}</span>
									</div>
									<div class="buttons">
									<FORM METHOD="post" ACTION="cart.do">
									<select name="STOCK" id="STOCK">
											<c:forEach var="quantity" begin="1" end="${proVO.quantity}"
												step="1">
												<option value="${quantity}">${quantity}
											</c:forEach> </select>
											
										<input type="hidden" name="action" value="ADD2" id="ADD2">
										<input type="hidden" name="ITEMNO" value="${proVO.ITEMNO}" id="ITEMNO" > 
										<input type="submit" class="btn btn-sm btn-success" value="放入購物車" >
										</FORM>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
 </div>
  </div>
</div>
</body>
</html>