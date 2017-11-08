<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
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
 	height: 180px; }*/ .btn-success:hover {
	background-color: #449d44;
	border-color: #398439;
	color: #ffe200;
}
.product-title{
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

/*	.description{
		font-style: bold;
	}
	*/
</style>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">  
        $(document).ready(function(){  
        	console.log('in jquery1');
            $('form').on('submit',function(event){
                event.preventDefault();
            	console.log($(this).children().eq(2).val());
                var STOCK = $(this).children().eq(0).val()
                var action = $(this).children().eq(1).val() 
                var ITEMNO = $(this).children().eq(2).val()  
                console.log('STOCK :'+STOCK+' ,ITEMNO :'+ITEMNO+' ,action :'+action);

                     $.ajax({  
                        type: "POST",  
                        url: "cart.do",  
                        data: {"STOCK" : STOCK,"action" : action,"ITEMNO" : ITEMNO},  
                        success: function(msg){  
                            $("#tryajax").html('tryajaxtryajaxtryajaxtryajaxtryajaxtryajax');
                        }  
                    });   
               
                

            });  
        });  
      </script>  

<title>Insert title here</title>
</head>
<body>
<div id="tryajax">	 </div>
<div>
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
	<hr>下面是當天促銷中的產品</hr>
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
										<input type="submit" class="btn btn-sm btn-success" value="放入購物車" id="subm">
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


</body>
</html>