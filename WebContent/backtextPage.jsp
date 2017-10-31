<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.promotion.*"%>

<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport">
    <title>Title Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style type="text/css">
    body {
        padding-top: 20px;
    }
    </style>
</head>

<body>
    <div class="container-fulid">
        <div class="row">
            <div class="col-xs-12 col-sm-12">
                <div role="tabpanel">
                    <!-- 標籤面板：標籤區 -->
                    <div>
                        <a class="navbar-brand">商城後台管理系統</a>
                    </div>
                    <div class="nav nav-tabs" role="tablist" style="margin-left: 2em">
                        <ul class="nav navbar-nav">
                            <li>
                                <a data-toggle="tab" href="#tab1">商品管理</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab2">促銷商品管理</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#tab3">商城訂單管理</a>
                            </li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Dropdown<span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">First</a>
                                    </li>
                                    <li>
                                        <a href="#">Second</a>
                                    </li>
                                    <li>
                                        <a href="#">Third</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fulid">
        <div class="row">
            <div class="col-xs-12 col-sm-3">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title">商品管理</h3>
                    </div>
                    <!--   <div class="panel-body"> -->
                    <div class="list-group">
                        <a class="list-group-item" data-toggle="tab" href="#tab1">商品新增</a> <a class="list-group-item" data-toggle="tab" href="#tab2">商品查詢</a> <a class="list-group-item" data-toggle="tab" href="#tab3">商品修改</a>
                    </div>
                    <!--  </div> -->
                </div>
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">促銷管理</h3>
                    </div>
                    <!--   <div class="panel-body"> -->
                    <div class="list-group">
                        <a class="list-group-item active" data-toggle="tab" href="#tab1">新增促銷</a> <a class="list-group-item" data-toggle="tab" href="#tab2">查詢促銷</a> <a class="list-group-item" data-toggle="tab" href="#tab3">商品加入促銷</a>
                    </div>
                    <!--data-toggle="tab" 控制tab出現-->
                    <!--  </div> -->
                </div>
            </div>
            <div class="col-xs-12 col-sm-1"></div>
            <div class="col-xs-12 col-sm-6">
                <!-- 標籤面板：內容區 -->
                <div class="tab-content">
                    <div class="tab-pane fade" id="tab1" role="tabpanel">
                        目前點擊#TAB2 Directive
                        <%@ include file="textforjsp.jsp" %>  //目前成功要把一些基本資料修改結束
                    </div>
                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                        目前點擊#tab2
                    </div>
                    <div class="tab-pane fade " id="tab3" role="tabpanel">
                        <br>
                        <br>
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:<br> <c:forEach
									var="message" items="${errorMsgs}">
						${message}<br>
								</c:forEach>

							</font>
						</c:if>
						<font size="5"><a href='listAllPro.jsp'>列出所有促銷專案by EL</a></font>
                        <br>
                        <br>
                        <form action="pro.do" class="form-inline" method="post">
                            <div class="form-group">
                                <font size="5">輸入促銷專案編號：</font>
                                <input class="form-control input" name="PRONO" placeholder="促銷專案NO." size="8" type="text">
                                <input name="action" type="hidden" value="getOne_For_Display3">
                                <button class="btn btn-primary btn" data-placement="top" data-toggle="tooltip" title="搜尋"><span class="glyphicon glyphicon-search"></span>查詢</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js">
    </script>
    <button class="btn btn-default" data-placement="top" data-toggle="tooltip" title="不要碰我" type="button">按鈕</button>
    <script>
    $(function() {
        $('[data-toggle="tooltip"]').tooltip();
    })
    </script>
</body>

</html>