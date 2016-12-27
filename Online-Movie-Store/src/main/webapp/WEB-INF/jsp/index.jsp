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
                <div id="main-slider">
                    <div class="item">
                        <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/main-slider1.jpg" alt=""
                             class="img-responsive">
                    </div>
                    <div class="item">
                        <img class="img-responsive"
                             src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/main-slider2.jpg" alt="">
                    </div>
                    <div class="item">
                        <img class="img-responsive"
                             src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/main-slider3.jpg" alt="">
                    </div>
                    <div class="item">
                        <img class="img-responsive"
                             src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/main-slider4.jpg" alt="">
                    </div>
                </div>
                <!-- /#main-slider -->
            </div>
        </div>

        <!-- *** ADVANTAGES HOMEPAGE ***
_________________________________________________________ -->
        <div id="advantages">

            <div class="container">
                <div class="same-height-row">
                    <div class="col-sm-4">
                        <div class="box same-height clickable">
                            <div class="icon"><i class="fa fa-heart"></i>
                            </div>

                            <h3><a href="#">顾客至上</a></h3>

                            <p>我们提供最好的服务</p>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="box same-height clickable">
                            <div class="icon"><i class="fa fa-tags"></i>
                            </div>

                            <h3><a href="#">价格优惠</a></h3>

                            <p>我们提供最优惠的价格，每天都有新惊喜</p>
                        </div>
                    </div>

                    <div class="col-sm-4">
                        <div class="box same-height clickable">
                            <div class="icon"><i class="fa fa-thumbs-up"></i>
                            </div>

                            <h3><a href="#">质量保证</a></h3>

                            <p>7天免费退换货</p>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container -->

        </div>
        <!-- /#advantages -->

        <!-- *** ADVANTAGES END *** -->

        <!-- *** HOT PRODUCT SLIDESHOW ***
_________________________________________________________ -->
        <div id="hot">

            <div class="box">
                <div class="container">
                    <div class="col-md-12">
                        <h2>本周热门</h2>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="product-slider">

                    <c:forEach items="${movieColumn}" var="movie">
                        <div class="item">
                            <div class="product">
                                <div class="flip-container">
                                    <div class="flipper">
                                        <div class="front">
                                            <a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}">
                                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/upload/${movie.picAddress}"
                                                     alt="" class="img-responsive">
                                            </a>
                                        </div>
                                        <div class="back">
                                            <a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}">
                                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/upload/${movie.picAddress}"
                                                     alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}" class="invisible">
                                    <img src="<%=AppContext.getBaseUrl()%>/resource/images/upload/${movie.picAddress}"
                                         alt="" class="img-responsive">
                                </a>

                                <div class="text">
                                    <h3><a href="<%=AppContext.getBaseUrl()%>/movie/detail?id=${movie.id}">${movie.movieName}</a></h3>

                                    <p class="price">$${movie.price}</p>
                                </div>
                                <!-- /.text -->
                            </div>
                            <!-- /.product -->
                        </div>
                    </c:forEach>


                </div>
                <!-- /.product-slider -->
            </div>
            <!-- /.container -->

        </div>
        <!-- /#hot -->

        <!-- *** HOT END *** -->

        <!-- *** GET INSPIRED ***
_________________________________________________________ -->
        <div class="container" data-animate="fadeInUpBig">
            <div class="col-md-12">
                <div class="box slideshow">
                    <h3>随便看看</h3>

                    <p class="lead">从我们的商品中寻找您的目标</p>

                    <div id="get-inspired" class="owl-carousel owl-theme">
                        <div class="item">
                            <a href="#">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/getinspired1.jpg"
                                     alt="Get inspired" class="img-responsive">
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/getinspired2.jpg"
                                     alt="Get inspired" class="img-responsive">
                            </a>
                        </div>
                        <div class="item">
                            <a href="#">
                                <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/getinspired3.jpg"
                                     alt="Get inspired" class="img-responsive">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- *** GET INSPIRED END *** -->

        <!-- *** BLOG HOMEPAGE ***
_________________________________________________________ -->

        <div class="box text-center" data-animate="fadeInUp">
            <div class="container">
                <div class="col-md-12">
                    <h3 class="text-uppercase">电影影评</h3>

                    <p class="lead">今年最好看的是哪部电影？ <a href="blog.html">来看看热门影评吧</a>
                    </p>
                </div>
            </div>
        </div>

        <div class="container">

            <div class="col-md-12" data-animate="fadeInUp">

                <div id="blog-homepage" class="row">
                    <div class="col-sm-6">
                        <div class="post">
                            <h4><a href="post.html">Forever</a></h4>

                            <p class="author-category"> <a href="#">大思极</a> 评论 <a href="">不死法医</a>
                            </p>
                            <hr>
                            <p class="intro">很棒的一部剧，很遗憾被砍了。剧情紧凑精彩，故事性很强，对人性和生命的探讨很能引人深思。男主的声音很有磁性，鸡汤旁白也不会出戏～

                                “我见过无数死亡，数不尽的痛苦和折磨。可我也见过无数的生命，无数的美好和奇迹。我们能活多少年，并不重要。我们的生命无非是无数的瞬间组成。我们永远无法得知他们会出现在何时何处，但这些瞬间会伴我们一生，在灵魂印上永恒的标记”

                                Forever的意义又是什么呢？是恩赐还是惩罚？永生又会把一个人变成什么样呢？是对生命麻木进而游戏人间还是对生命里珍贵的瞬间，爱，感动，回忆仍然有反应。

                                假如你也可以永生，你会变成什么样呢？</p>

                            <p class="read-more"><a href="post.html" class="btn btn-primary">阅读全文</a>
                            </p>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <div class="post">
                            <h4><a href="post.html">这该死的爱情</a></h4>

                            <p class="author-category"> <a href="#">看剧的竹影 </a> 评论 <a href="">孤单又灿烂的神：鬼怪</a>
                            </p>
                            <hr>
                            <p class="intro">恩倬想要学会一个很厉害的法术，比如可以飞，比如可以变出很多很多的金子。她不知道，其实自己早就拥有了这世界最可怕的法术——爱情

                                wuli帅气的，强大的，善良人的守护神，罪人的惩罚者，地狱使者的同居伴侣，孤单生活了九百多年的鬼怪大人，中了这道无可救药的法术，彻底沦陷了。

                                他面对恩倬的小脾气，无可奈何，谁叫她是“正在生气的19岁高中女生”呢，不能凶她，要靠哄的。被恩倬召唤了，脸上都笑出皱纹了，还装着若无其事地在那凹造型。明明猜到，恩倬只是在诳他一顿饭，却还是心甘情愿被宰，烤肉不够就再加一杯果汁，但要是说其他的男人帅，果汁就没有了。</p>

                            <p class="read-more"><a href="post.html" class="btn btn-primary">阅读全文</a>
                            </p>
                        </div>

                    </div>

                </div>
                <!-- /#blog-homepage -->
            </div>
        </div>
        <!-- /.container -->

        <!-- *** BLOG HOMEPAGE END *** -->


    </div>
    <!-- /#content -->

    <%@ include file="_common/_obaju_footer.jsp"%>

</div>
<!-- /#all -->

</body>

<%@include file="_common/_obaju_js.jsp"%>

</html>