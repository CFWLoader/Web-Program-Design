<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team.cfw.oms.base.util.AppContext" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="robots" content="all,follow">
    <meta name="googlebot" content="index,follow,snippet,archive">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Obaju e-commerce template">
    <meta name="author" content="Ondrej Svestka | ondrejsvestka.cz">
    <meta name="keywords" content="">

    <title>
        在线电影商店
    </title>

    <meta name="keywords" content="">

    <%@ include file="_common/_obaju_css.jsp"%>

</head>

<body>
<%@ include file="_common/_obaju_top_nav.jsp"%>

<div id="all">

    <div id="content">
        <div class="container">

            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="#">主页</a>
                    </li>
                    <li>结账 - 订单回顾</li>
                </ul>
            </div>

            <div class="col-md-9" id="checkout">

                <div class="box">
                    <form method="post" action="<%=AppContext.getBaseUrl()%>/order/customer-orders">

                        <input type="hidden" name="action" value="add" />

                        <h1>结账 - 订单回顾</h1>
                        <ul class="nav nav-pills nav-justified">
                            <li><a href="<%=AppContext.getBaseUrl()%>/checkout1"><i class="fa fa-map-marker"></i><br>地址</a>
                            </li>
                            <li><a href="<%=AppContext.getBaseUrl()%>/checkout2"><i class="fa fa-truck"></i><br>运输方式</a>
                            </li>
                            <li><a href="<%=AppContext.getBaseUrl()%>/checkout3"><i class="fa fa-money"></i><br>付款方式</a>
                            </li>
                            <li class="active"><a href="#"><i class="fa fa-eye"></i><br>订单总览</a>
                            </li>
                        </ul>

                        <div class="content">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th colspan="2">商品</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>折扣</th>
                                        <th>总价</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${itemList}" var="item">
                                        <tr>
                                            <td>
                                                <a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${item.x}">
                                                    <img src="<%=AppContext.getBaseUrl()%>/resource/images/upload/${item.z.picAddress}"
                                                         alt="${item.z.movieName}">
                                                </a>
                                            </td>
                                            <td><a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${item.x}">${item.z.movieName}</a>
                                            </td>
                                            <td>${item.y}</td>
                                            <td>$${item.z.price}</td>
                                            <td>$0.00</td>
                                            <td>$${item.y * item.z.price}</td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th colspan="5">总计</th>
                                        <th>$${totalCost}</th>
                                    </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.content -->

                        <div class="box-footer">
                            <div class="pull-left">
                                <a href="<%=AppContext.getBaseUrl()%>/checkout3" class="btn btn-default"><i
                                        class="fa fa-chevron-left"></i>返回到付款方式</a>
                            </div>
                            <div class="pull-right">
                                <button type="submit" class="btn btn-primary">生成订单<i
                                        class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box -->


            </div>
            <!-- /.col-md-9 -->

            <div class="col-md-3">

                <div class="box" id="order-summary">
                    <div class="box-header">
                        <h3>订单总览</h3>
                    </div>
                    <p class="text-muted">购物的额外费用也将计算于其中。</p>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>订单总价</td>
                                <th>$${totalCost}</th>
                            </tr>
                            <tr>
                                <td>快递费用</td>
                                <th>$0</th>
                            </tr>
                            <tr>
                                <td>税收</td>
                                <th>$0.00</th>
                            </tr>
                            <tr class="total">
                                <td>总价</td>
                                <th>$${totalCost}</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>

            </div>
            <!-- /.col-md-3 -->

        </div>
        <!-- /.container -->
    </div>
    <!-- /#content -->


    <%@ include file="_common/_obaju_footer.jsp"%>


</div>
<!-- /#all -->


<%@ include file="_common/_obaju_js.jsp"%>


</body>

</html>