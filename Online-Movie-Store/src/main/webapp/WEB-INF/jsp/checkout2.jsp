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
                        <li>结账 - 运输方式</li>
                    </ul>
                </div>

                <div class="col-md-9" id="checkout">

                    <div class="box">
                        <form method="post" action="<%=AppContext.getBaseUrl()%>/checkout3">
                            <h1>Checkout - Delivery method</h1>
                            <ul class="nav nav-pills nav-justified">
                                <li><a href="<%=AppContext.getBaseUrl()%>/checkout1"><i class="fa fa-map-marker"></i><br>地址</a>
                                </li>
                                <li class="active"><a href="#"><i class="fa fa-truck"></i><br>运输方式</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-money"></i><br>付款方式</a>
                                </li>
                                <li class="disabled"><a href="#"><i class="fa fa-eye"></i><br>订单回顾</a>
                                </li>
                            </ul>

                            <div class="content">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="box shipping-method">

                                            <h4>申通</h4>

                                            <p>快速直达</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="delivery" value="delivery1">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="box shipping-method">

                                            <h4>圆通</h4>

                                            <p>又快又好</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="delivery" value="delivery2">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="box shipping-method">

                                            <h4>顺丰</h4>

                                            <p>服务至上</p>

                                            <div class="box-footer text-center">

                                                <input type="radio" name="delivery" value="delivery3">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.row -->

                            </div>
                            <!-- /.content -->

                            <div class="box-footer">
                                <div class="pull-left">
                                    <a href="<%=AppContext.getBaseUrl()%>/basket" class="btn btn-default"><i class="fa fa-chevron-left"></i>返回到地址</a>
                                </div>
                                <div class="pull-right">
                                    <button type="submit" class="btn btn-primary">下一步 付款方式<i class="fa fa-chevron-right"></i>
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