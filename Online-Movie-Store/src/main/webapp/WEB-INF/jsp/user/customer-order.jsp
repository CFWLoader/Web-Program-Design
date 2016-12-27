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

    <%@ include file="../_common/_obaju_css.jsp"%>


</head>

<body>
    <%@ include file="../_common/_obaju_top_nav.jsp"%>

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="<%=AppContext.getBaseUrl()%>/index">主页</a>
                        </li>
                        <li><a href="#">我的订单</a>
                        </li>
                        <li>订单 # ${order.id}</li>
                    </ul>

                </div>

                <div class="col-md-3">
                    <!-- *** CUSTOMER MENU ***
 _________________________________________________________ -->
                    <div class="panel panel-default sidebar-menu">

                        <div class="panel-heading">
                            <h3 class="panel-title">用户选项</h3>
                        </div>

                        <div class="panel-body">

                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="<%=AppContext.getBaseUrl()%>/order/customer-orders"><i class="fa fa-list"></i> 我的订单</a>
                                </li>
                                <li>
                                    <a href="customer-wishlist.html"><i class="fa fa-heart"></i> 我的愿望清单</a>
                                </li>
                                <li>
                                    <a href="customer-account.html"><i class="fa fa-user"></i> 我的账户</a>
                                </li>
                                <li>
                                    <a href="<%=AppContext.getBaseUrl()%>/index"><i class="fa fa-sign-out"></i> 登出</a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <!-- /.col-md-3 -->

                    <!-- *** CUSTOMER MENU END *** -->
                </div>

                <div class="col-md-9" id="customer-order">
                    <div class="box">
                        <h1>订单 #1735</h1>

                        <p class="lead">订单 #1735 产生于 <strong>${order.orderedDate}</strong> ，现在 <strong>正在处理中</strong>.</p>
                        <p class="text-muted">如果你有任何疑问，请 <a href="contact.html">联系我们</a>，我们的用户服务中心将全天候为您服务。</p>

                        <hr>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2">产品</th>
                                        <th>数量</th>
                                        <th>单价</th>
                                        <th>折扣</th>
                                        <th>总价</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalCost" value="0.0"/>
                                <c:forEach items="${order.movies}" var="movie">
                                    <tr>
                                        <td>
                                            <a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}">
                                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/upload/${movie.picAddress}" alt="White Blouse Armani">
                                            </a>
                                        </td>
                                        <td><a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}">${movie.movieName}</a>
                                        </td>
                                        <td>1</td>
                                        <td>$${movie.price}</td>
                                        <td>$0.00</td>
                                        <td>$${movie.price}</td>
                                    </tr>
                                    <c:set var="totalCost" value="${totalCost + movie.price}" />
                                </c:forEach>
                                    <%--<tr>--%>
                                <%--<td>--%>
                                <%--<a href="#">--%>
                                <%--<img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/detailsquare.jpg" alt="White Blouse Armani">--%>
                                <%--</a>--%>
                                <%--</td>--%>
                                <%--<td><a href="#">White Blouse Armani</a>--%>
                                <%--</td>--%>
                                <%--<td>2</td>--%>
                                <%--<td>$123.00</td>--%>
                                <%--<td>$0.00</td>--%>
                                <%--<td>$246.00</td>--%>
                                <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>--%>
                                            <%--<a href="#">--%>
                                                <%--<img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/basketsquare.jpg" alt="Black Blouse Armani">--%>
                                            <%--</a>--%>
                                        <%--</td>--%>
                                        <%--<td><a href="#">Black Blouse Armani</a>--%>
                                        <%--</td>--%>
                                        <%--<td>1</td>--%>
                                        <%--<td>$200.00</td>--%>
                                        <%--<td>$0.00</td>--%>
                                        <%--<td>$200.00</td>--%>
                                    <%--</tr>--%>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="5" class="text-right">订单总价</th>
                                        <th>$${totalCost}</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-right">快递</th>
                                        <th>$0.00</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-right">税收</th>
                                        <th>$0.00</th>
                                    </tr>
                                    <tr>
                                        <th colspan="5" class="text-right">总计</th>
                                        <th>$${totalCost}</th>
                                    </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="row addresses">
                            <div class="col-md-6">
                                <h2>发货地址</h2>
                                <p>${order.receiverFirstName} ${order.receiverLastName}<br/>
                                ${order.receiverAddress}</p>
                            </div>
                            <div class="col-md-6">
                                <h2>运送地址</h2>
                                <p>${order.receiverFirstName} ${order.receiverLastName}<br/>
                                ${order.receiverAddress}</p>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


        <%@ include file="../_common/_obaju_footer.jsp"%>


    </div>
    <!-- /#all -->

    <%@ include file="../_common/_obaju_js.jsp"%>

</body>

</html>
