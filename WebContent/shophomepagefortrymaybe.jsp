<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>


<%


%>

<html lang="">
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- 此行為顯示IE相容性版本 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<link rel="shortcut icon" href="imgs/Houselogo1.png" />
<title>好事多_房屋瀏覽</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<style type="text/css">

/*強迫限制大小*/
.limited {
	width: 64.3em;
}

/*水平置中*/
.vertical-horizontal::before {
	content: '';
	width: 0;
	height: 100%;
	display: inline-block;
	position: relative;
	vertical-align: middle;
	background: #f00;
}

/*hr美化*/
hr {
	height: 2px;
	background-color: #555;
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
}
/*強迫不換行*/
.sameRow {
	display: inline
}
/*預約看屋按鈕*/
.check_btn {
	width: 100%;
	background-color: #0678c2;
	color: white;
	box-shadow: 2px 2px 2px gray;
}
/*收藏房屋按鈕*/
.follow_btn {
	width: 100%;
	background-color: #F6BF02;
	color: white;
	box-shadow: 2px 2px 2px gray;
}
/*主區塊*/
.main_block {
	background: #eeeeee;
	border: solid 1px #dddddd;
}
/*主區塊圖片*/
.main_img {
	min-width: 600px;
	max-width: 600px;
	min-height: 400px;
	max-height: 400px;
}

.main_img img {
	min-width: 600px;
	max-width: 600px;
	min-height: 400px;
	max-height: 400px;
}

/*主區塊標題*/
.info_title {
	margin-top: 0;
	font-size: 2em;
	font-weight: bold;
	font-family: Microsoft JhengHei;
}
/*主區塊價錢*/
.price_highlight {
	color: red;
	font-size: 2em;
	font-weight: bold
}
/*主區塊小字區塊*/
.main_block_detail {
	margin-top: 1em
}
/*主區塊的小字區塊的小字*/
.main_block_detail div {
	font-family: Microsoft JhengHei;
	font-size: 1.2em
}
/*細節表單*/
.detail-total-form {
	/*border: solid 1px #dddddd;*/
	background: #ffffff;
}
/*細節表單每個td標籤*/
.detail-total-form td {
	height: 3.5em
}

.detail-total-form td li {
	line-height: 1.5em
}
/*細節表單每個td標籤都垂直置中*/
.detail-total-form td::before {
	content: '';
	width: 0;
	height: 100%;
	display: inline-block;
	position: relative;
	vertical-align: middle;
	background: #f00;
}
/*主區塊外的標題*/
.form_title {
	font-weight: bold;
	font-size: 1.5em;
	color: #f37748;
}
/*廣告CSS*/
#abgne_float_ad {
	display: none;
	position: absolute;
}

#abgne_float_ad img {
	border: none;
}

.ad_btn {
	width: 100px;
	height: 60px;
}
/*廣告CSS結束*/
#map {
	height: 400px;
	width: 100%;
}
/*一欄推薦物件*/
.rec_item {
	background-color: white
}

.rec_item * {
	color: black
}
/*推薦物件的圖片*/
.rechouse_Img {
	width: 100%;
	height: 210px
}
/*推薦物件的標題*/
.rec_price h4 {
	color: red;
}

.mb10 {
	margin-bottom: 20px
}

.w80 {
	width: 80%;
}

.pd20 {
	padding: 20px;
}

div.backgroundpng {
	position: fixed;
	top: 0;
	z-index: -15;
}

.backgroundpng img {
	width: 115%;
	opacity: 0.9;
}

body {
	font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體,
		sans-serif;
}

.navbar {
	background-color: #ffffff;
	margin-bottom: 0;
	border-radius: 0;
	height: 80px;
	box-shadow: 0px 2px 1px #bdbdbd;
}

.navshadow {
	box-shadow: 0px 2px 1px #bdbdbd;
}

.activebar>li>a {
	background-color: #ffffff;
	font-size: 22px;
	padding-top: 30px;
	padding-bottom: 0px;
	height: 80px;
}

.logina>li>a {
	background-color: #ffffff;
	padding-top: 2em;
	padding-bottom: 0px;
	height: 80px;
}

.backgroundpng {
	position: fixed;
	top: 0;
	z-index: -15;
}

.backgroundpng img {
	width: 115%;
	opacity: 0.9;
}

.form-control {
	height: 38.4px;
	border-radius: 0px;
}

.searchbar {
	position: absolute;
	top: 21em;
}

.search-filter {
	height: 38.4px;
	text-align: center;
	border: none;
	font-size: 20px;
}

.search-form-btn {
	color: #fff;
	background: #231f20;
	border: none;
	height: 38.4px;
	border-radius: 0 3px 3px 0;
	width: calc(60px);
}

.navbar-brand {
	z-index: 20;
}

.navbar-brand img {
	background-color: #FFF;
	border-radius: 15px;
}

.tooltip-inner {
	font-size: 22px;
	background-color: #fff;
	border-radius: 0px;
}

.input-group-btn:last-child>.btn, .input-group-btn:last-child>.btn-group
	{
	padding-top: 0.7em;
}

a {
	color: #00ADEE;
}

a:hover {
	text-decoration-line: none;
}

a:active {
	　text-decoration-line: none;
}

a:visited {
	text-decoration-line: none;
}

footer {
	font-weight: 700;
	background-color: white;
	position: absolute;
	width: 100%;
	padding: 25px;
	padding-top: 4em;
}

.copyri {
	margin-top: 3em;
}

nav * {
	font-weight: bold;
}

.unlimited {
	width: 69%;
}
</style>
</head>
<body>
	<div class="backgroundpng">
		<img class="backgroundpng" src="<%=request.getContextPath()%>/images/tooopen.jpg">
	</div>

	<div style="height: 50px"></div>


	

	<!-- 麵包屑 -->
	<div class="limited container">
		<div class="col-xs-12 col-sm-3"></div>
		<ol class="breadcrumb">
			<li><a href="#">首頁</a></li>
			<li><a href="#">商品區</a></li>
			<li class="active">商品名稱</li>
		</ol>
		<div class="col-xs-12 col-sm-9"></div>
	</div>

	<!-- 主區塊 -->
	<div class="limited container main_block">
		<div class="row">
			<!-- 主區塊左側 -->
			<div class="col-xs-12 col-sm-8">
				<div class="row">
					<!-- 跑馬燈區塊開始 -->
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
							<li data-target="#myCarousel" data-slide-to="3"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item main_img active">
								<img class="img_of_td"
									src="<%=request.getContextPath()%>/">
							</div>
							<div class="item main_img">
								<img src="/project/house/imgs/bedRoom.jpg" alt="Chicago">
							</div>
							<div class="item main_img">
								<img src="/project/house/imgs/kitchen.jpg" alt="Chicago">
							</div>
							<div class="item main_img">
								<img src="/project/house/imgs/house.jpg" alt="New York">
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>
					<!-- 跑馬燈區塊結束 -->
				</div>
			</div>
			<!-- 左側區塊結束 -->
			<!-- 主區塊右側 -->
			<div class="col-xs-12 col-sm-4">
				<div class="col-sx-12 col-sm-12">
					<!-- 標題 -->
					<div class="row info_title">
						<p>我是標題</p>
					</div>
					<!-- 地區+編號+價錢 -->
					<div class="row">
						<div class="col-xs-12 col-sm-8">
							<div class="row">
								123<br>
								456
							</div>
						</div>
						<div class="col-sx-12 col-sm-4">
							<div class="row">
								<p class="sameRow price_highlight">500000</p>
								<p class="sameRow">萬</p>
							</div>
						</div>
					</div>
					<!-- 主要區塊的細節們 -->
					<div class="row main_block_detail"></div>
					<div class="row main_block_detail">
						<div>1111</div>
					</div>
					<div class="row main_block_detail">
						<div>資訊:100年</div>
					</div>
					<div class="row main_block_detail">
						<div class="sameRow">類型...</div>
					</div>
					<div class="row main_block_detail">
						<div class="sameRow">樓層:ffff</div>
					</div>

					<div class="row">
						<a href="appointment1.html"
							class="check_btn main_block_detail btn  dropdown-toggle">
							加入購物車 </a>
					</div>
					<div class="row">
						<a class="follow_btn main_block_detail btn  dropdown-toggle">
							購買 </a>
					</div>
				</div>
			</div>
			<!-- 主區塊右側結束 -->
		</div>
		<!-- 主區塊第一列結束 -->
	</div>
	<!-- 主區塊結束 -->

	<!-- 分隔線 -->
	<div class="limited container">
		<div class="row">
			<hr>
		</div>
	</div>



	<!-- 詳細資訊表單開始 -->
	<div class="limited container detail-total-form">
		<!-- 詳細資訊表格左邊 -->
		<!-- 其中一欄資訊表格開始 -->
		<div class="row">
			<h3 class="form_title">商品詳細資訊</h3>
			<table class="table table-hover">

				<thead>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">地址：</td>
					</tr>
					<tr>
						<td>2</td>
						<td>1</td>
					</tr>

					<tr>
						<td>2</td>
						<td>1</td>

					</tr>
					<tr>
						<td>2</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>1</td>

					</tr>
					<tr>
						<td colspan="2">停車位：</td>


					</tr>
					<tr>
						<td>土地坪數：</td>
						<td>土地使用分區：</td>
					</tr>


				</tbody>
			</table>

		</div>
		<!-- 其中一欄資訊表格結束 -->

		<!-- 其中一欄資訊表格開始 -->
	


</body>
</html>