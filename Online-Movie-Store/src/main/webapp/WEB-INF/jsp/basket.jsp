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

    <%@ include file="_common/_obaju_css.jsp"%>


</head>

<body>

<%@ include file="_common/_obaju_top_nav.jsp"%>

<div id="all">

    <div id="content">
        <div class="container">

            <div class="col-md-12">
                <ul class="breadcrumb">
                    <li><a href="#">Home</a>
                    </li>
                    <li>Shopping cart</li>
                </ul>
            </div>

            <div class="col-md-9" id="basket">

                <div class="box">

                    <form method="post" action="<%=AppContext.getBaseUrl()%>/checkout1">

                        <h1>Shopping cart</h1>

                        <p class="text-muted">You currently have ${itemCount} item(s) in your cart.</p>

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th colspan="2">Product</th>
                                    <th>Quantity</th>
                                    <th>Unit price</th>
                                    <th>Discount</th>
                                    <th colspan="2">Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="totalCost" value="${0.0}" />
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
                                        <td>
                                            <input type="number" value="${item.y}" class="form-control">
                                        </td>
                                        <td>$${item.z.price}</td>
                                        <td>$0.00</td>
                                        <td>$${item.z.price * item.y}</td>
                                        <c:set var="totalCost" value="${totalCost + item.z.price * item.y}" />
                                        <td><a href="<%=AppContext.getBaseUrl()%>/basket?action=delete&targetId=${item.x}"><i class="fa fa-trash-o"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                                <tfoot>
                                <tr>
                                    <th colspan="5">Total</th>
                                    <th colspan="2">${totalCost}</th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                        <!-- /.table-responsive -->

                        <div class="box-footer">
                            <div class="pull-left">
                                <a href="<%=AppContext.getBaseUrl()%>/index" class="btn btn-default"><i class="fa fa-chevron-left"></i>
                                    Continue shopping</a>
                            </div>
                            <div class="pull-right">
                                <button class="btn btn-default"><i class="fa fa-refresh"></i> Update basket</button>
                                <button type="submit" class="btn btn-primary">Proceed to checkout <i
                                        class="fa fa-chevron-right"></i>
                                </button>
                            </div>
                        </div>

                    </form>

                </div>
                <!-- /.box -->

<%--
                <div class="row same-height-row">
                    <div class="col-md-3 col-sm-6">
                        <div class="box same-height">
                            <h3>You may also like these products</h3>
                        </div>
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product2.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product2_2.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product2.jpg" alt=""
                                     class="img-responsive">
                            </a>

                            <div class="text">
                                <h3>Fur coat</h3>

                                <p class="price">$143</p>
                            </div>
                        </div>
                        <!-- /.product -->
                    </div>

                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product1.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product1_2.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product1.jpg" alt=""
                                     class="img-responsive">
                            </a>

                            <div class="text">
                                <h3>Fur coat</h3>

                                <p class="price">$143</p>
                            </div>
                        </div>
                        <!-- /.product -->
                    </div>


                    <div class="col-md-3 col-sm-6">
                        <div class="product same-height">
                            <div class="flip-container">
                                <div class="flipper">
                                    <div class="front">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product3.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="back">
                                        <a href="detail.html">
                                            <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product3_2.jpg"
                                                 alt="" class="img-responsive">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <a href="detail.html" class="invisible">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/product3.jpg" alt=""
                                     class="img-responsive">
                            </a>

                            <div class="text">
                                <h3>Fur coat</h3>

                                <p class="price">$143</p>

                            </div>
                        </div>
                        <!-- /.product -->
                    </div>

                </div>
--%>

            </div>
            <!-- /.col-md-9 -->

            <div class="col-md-3">
                <div class="box" id="order-summary">
                    <div class="box-header">
                        <h3>Order summary</h3>
                    </div>
                    <p class="text-muted">Shipping and additional costs are calculated based on the values you have
                        entered.</p>

                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>Order subtotal</td>
                                <th>$${totalCost}</th>
                            </tr>
                            <tr>
                                <td>Shipping and handling</td>
                                <th>$0.00</th>
                            </tr>
                            <tr>
                                <td>Tax</td>
                                <th>$0.00</th>
                            </tr>
                            <tr class="total">
                                <td>Total</td>
                                <th>$${totalCost}</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>


                <div class="box">
                    <div class="box-header">
                        <h4>Coupon code</h4>
                    </div>
                    <p class="text-muted">If you have a coupon code, please enter it in the box below.</p>

                    <form>
                        <div class="input-group">

                            <input type="text" class="form-control">

                                <span class="input-group-btn">

					<button class="btn btn-primary" type="button"><i class="fa fa-gift"></i></button>

				    </span>
                        </div>
                        <!-- /input-group -->
                    </form>
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