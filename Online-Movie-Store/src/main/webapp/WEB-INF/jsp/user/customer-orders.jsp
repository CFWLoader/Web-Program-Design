<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team.cfw.oms.base.util.AppContext" %>
<%@ page isELIgnored="false" %>
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
        Obaju : e-commerce template
    </title>

    <meta name="keywords" content="">

    <%@include file="../_common/_obaju_css.jsp"%>


</head>

<body>

<%@ include file="../_common/_obaju_top_nav.jsp"%>

<div id="all">

    <div id="content">
        <div class="container">

            <div class="col-md-12">

                <ul class="breadcrumb">
                    <li><a href="#">Home</a>
                    </li>
                    <li>My orders</li>
                </ul>

            </div>

            <div class="col-md-3">
                <!-- *** CUSTOMER MENU ***
_________________________________________________________ -->
                <div class="panel panel-default sidebar-menu">

                    <div class="panel-heading">
                        <h3 class="panel-title">Customer section</h3>
                    </div>

                    <div class="panel-body">

                        <ul class="nav nav-pills nav-stacked">
                            <li class="active">
                                <a href="customer-orders.html"><i class="fa fa-list"></i> My orders</a>
                            </li>
                            <li>
                                <a href="customer-wishlist.html"><i class="fa fa-heart"></i> My wishlist</a>
                            </li>
                            <li>
                                <a href="customer-account.html"><i class="fa fa-user"></i> My account</a>
                            </li>
                            <li>
                                <a href="<%=AppContext.getBaseUrl()%>/index"><i class="fa fa-sign-out"></i> Logout</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /.col-md-3 -->

                <!-- *** CUSTOMER MENU END *** -->
            </div>

            <div class="col-md-9" id="customer-orders">
                <div class="box">
                    <h1>My orders</h1>

                    <p class="lead">Your orders on one place.</p>

                    <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact
                        us</a>, our customer service center is working for you 24/7.</p>

                    <hr>

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Order</th>
                                <th>Date</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderList}" var="order">
                                <tr>
                                    <th># ${order.id}</th>
                                    <td>${order.orderedDate}</td>
                                    <td>$ ${order.totalFee}</td>
                                    <td><span class="label label-info">Being prepared</span>
                                    </td>
                                    <td><a href="<%=AppContext.getBaseUrl()%>/order/customer-order?id=${order.id}" class="btn btn-primary btn-sm">View</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <%--<tr>--%>
                                <%--<th># 1735</th>--%>
                                <%--<td>22/06/2013</td>--%>
                                <%--<td>$ 150.00</td>--%>
                                <%--<td><span class="label label-info">Being prepared</span>--%>
                                <%--</td>--%>
                                <%--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th># 1735</th>--%>
                                <%--<td>22/06/2013</td>--%>
                                <%--<td>$ 150.00</td>--%>
                                <%--<td><span class="label label-info">Being prepared</span>--%>
                                <%--</td>--%>
                                <%--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th># 1735</th>--%>
                                <%--<td>22/06/2013</td>--%>
                                <%--<td>$ 150.00</td>--%>
                                <%--<td><span class="label label-success">Received</span>--%>
                                <%--</td>--%>
                                <%--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th># 1735</th>--%>
                                <%--<td>22/06/2013</td>--%>
                                <%--<td>$ 150.00</td>--%>
                                <%--<td><span class="label label-danger">Cancelled</span>--%>
                                <%--</td>--%>
                                <%--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th># 1735</th>--%>
                                <%--<td>22/06/2013</td>--%>
                                <%--<td>$ 150.00</td>--%>
                                <%--<td><span class="label label-warning">On hold</span>--%>
                                <%--</td>--%>
                                <%--<td><a href="customer-order.html" class="btn btn-primary btn-sm">View</a>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            </tbody>
                        </table>
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
