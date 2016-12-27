<%--
  Created by IntelliJ IDEA.
  User: CFWLoader
  Date: 12/19/16
  Time: 3:22 PM
  To change this template use File | Settings | File Templates.
--%>
<!-- *** TOPBAR ***
_________________________________________________________ -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div id="top">
  <div class="container">
    <div class="col-md-6 offer" data-animate="fadeInDown">
      <a href="#" class="btn btn-success btn-sm" data-animate-hover="shake">今日折扣</a> <a href="#">购物超过100元享受8折优惠</a>
    </div>
    <div class="col-md-6" data-animate="fadeInDown">
      <ul class="menu">
        <li><a href="#" data-toggle="modal" data-target="#login-modal">登录</a>
        </li>
        <li><a href="<%=AppContext.getBaseUrl()%>/user/registerPage">注册</a>
        </li>
        <li><a href="contact.html">联系我们</a>
        </li>
        <li><a href="#">最近浏览</a>
        </li>
      </ul>
    </div>
  </div>
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog modal-sm">

      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" id="Login">用户登录</h4>
        </div>
        <div class="modal-body">
          <form action="<%=AppContext.getBaseUrl()%>/user/login" method="post"> <!--customer-orders.html-->
            <div class="form-group">
              <input type="text" class="form-control" id="username" name="username" placeholder="email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="password" name="password" placeholder="password">
            </div>

            <p class="text-center">
              <button class="btn btn-primary"><i class="fa fa-sign-in"></i> 登录</button>
            </p>

          </form>

          <p class="text-center text-muted">还没有账号？</p>

          <p class="text-center text-muted"><a href="<%=AppContext.getBaseUrl()%>/user/registerPage"><strong>现在注册</strong></a>！</p>

        </div>
      </div>
    </div>
  </div>

</div>

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
_________________________________________________________ -->

<div class="navbar navbar-default yamm" role="navigation" id="navbar">
  <div class="container">
    <div class="navbar-header">

      <a class="navbar-brand home" href="<%=AppContext.getBaseUrl()%>/index" data-animate-hover="bounce">
        <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/logo.png" alt="Obaju logo"
             class="hidden-xs">
        <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/logo-small.png" alt="Obaju logo"
             class="visible-xs"><span class="sr-only">Obaju - go to homepage</span>
      </a>

      <div class="navbar-buttons">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation">
          <span class="sr-only">Toggle navigation</span>
          <i class="fa fa-align-justify"></i>
        </button>
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#search">
          <span class="sr-only">Toggle search</span>
          <i class="fa fa-search"></i>
        </button>
        <a class="btn btn-default navbar-toggle" href="<%=AppContext.getBaseUrl()%>/basket?action=view">
          <i class="fa fa-shopping-cart"></i> <span class="hidden-xs">${itemCount} 件物品</span>
        </a>
      </div>
    </div>
    <!--/.navbar-header -->

    <div class="navbar-collapse collapse" id="navigation">

      <ul class="nav navbar-nav navbar-left">
        <li class="active"><a href="<%=AppContext.getBaseUrl()%>/index">主页</a>
        </li>
        <li class="dropdown yamm-fw">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">电影
            <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
              <div class="yamm-content">
                <div class="row">
                  <div class="col-sm-3">
                    <h5>国产电影</h5>
                    <ul>
                      <li><a href="category.html">动作片</a>
                      </li>
                      <li><a href="category.html">悬疑片</a>
                      </li>
                      <li><a href="category.html">爱情片</a>
                      </li>
                      <li><a href="category.html">剧情片</a>
                      </li>
                      <li><a href="category.html">纪录片</a>
                      </li>
                      <li><a href="category.html">文艺片</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <h5>欧美</h5>
                    <ul>
                      <li><a href="category.html">动作片</a>
                      </li>
                      <li><a href="category.html">悬疑片</a>
                      </li>
                      <li><a href="category.html">爱情片</a>
                      </li>
                      <li><a href="category.html">剧情片</a>
                      </li>
                      <li><a href="category.html">纪录片</a>
                      </li>
                      <li><a href="category.html">文艺片</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <h5>日韩</h5>
                    <ul>
                      <li><a href="category.html">动作片</a>
                      </li>
                      <li><a href="category.html">悬疑片</a>
                      </li>
                      <li><a href="category.html">爱情片</a>
                      </li>
                      <li><a href="category.html">剧情片</a>
                      </li>
                      <li><a href="category.html">纪录片</a>
                      </li>
                      <li><a href="category.html">文艺片</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <h5>其他</h5>
                    <ul>
                      <li><a href="category.html">动作片</a>
                      </li>
                      <li><a href="category.html">悬疑片</a>
                      </li>
                      <li><a href="category.html">爱情片</a>
                      </li>
                      <li><a href="category.html">剧情片</a>
                      </li>
                      <li><a href="category.html">纪录片</a>
                      </li>
                      <li><a href="category.html">文艺片</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!-- /.yamm-content -->
            </li>
          </ul>
        </li>

        <li class="dropdown yamm-fw">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">电视剧
            <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
              <div class="yamm-content">
                <div class="row">
                  <div class="col-sm-3">
                    <h5>国产电视剧</h5>
                    <ul>
                      <li><a href="category.html">古装剧</a>
                      </li>
                      <li><a href="category.html">现代剧</a>
                      </li>
                      <li><a href="category.html">情景喜剧</a>
                      </li>
                      <li><a href="category.html">武侠剧</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <h5>欧美电视剧</h5>
                    <ul>
                      <li><a href="category.html">古装剧</a>
                      </li>
                      <li><a href="category.html">现代剧</a>
                      </li>
                      <li><a href="category.html">情景喜剧</a>
                      </li>
                      <li><a href="category.html">武侠剧</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <h5>日韩电视剧</h5>
                    <ul>
                      <li><a href="category.html">古装剧</a>
                      </li>
                      <li><a href="category.html">现代剧</a>
                      </li>
                      <li><a href="category.html">情景喜剧</a>
                      </li>
                      <li><a href="category.html">武侠剧</a>
                      </li>
                    </ul>
                  </div>
                  <div class="col-sm-3">
                    <div class="banner">
                      <a href="#">
                        <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/banner.jpg"
                             class="img img-responsive" alt="">
                      </a>
                    </div>
                    <div class="banner">
                      <a href="#">
                        <img src="<%=AppContext.getBaseUrl()%>/resource/images/obaju-img/banner2.jpg"
                             class="img img-responsive" alt="">
                      </a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.yamm-content -->
            </li>
          </ul>
        </li>

        <li class="dropdown yamm-fw">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">其他
            <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
              <div class="yamm-content">
                <div class="row">
                  <div class="col-sm-3">
                    <h5>其他</h5>
                    <ul>
                      <li><a href="index.html">短片</a>
                      </li>
                      <li><a href="category.html">纪录片</a>
                      </li>
                      <li><a href="category-right.html">特摄片</a>
                      </li>
                      <li><a href="category-full.html">新闻</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <!-- /.yamm-content -->
            </li>
          </ul>
        </li>
      </ul>

    </div>
    <!--/.nav-collapse -->

    <div class="navbar-buttons">

      <div class="navbar-collapse collapse right" id="basket-overview">
        <a href="<%=AppContext.getBaseUrl()%>/basket?action=view" class="btn btn-primary navbar-btn"><i class="fa fa-shopping-cart"></i><span
                class="hidden-sm">${itemCount} 件物品</span></a>
      </div>
      <!--/.nav-collapse -->

      <div class="navbar-collapse collapse right" id="search-not-mobile">
        <button type="button" class="btn navbar-btn btn-primary" data-toggle="collapse" data-target="#search">
          <span class="sr-only">Toggle search</span>
          <i class="fa fa-search"></i>
        </button>
      </div>

    </div>

    <div class="collapse clearfix" id="search">

      <form class="navbar-form" role="search" action="<%=AppContext.getBaseUrl()%>/searchPage" method="post">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="Search" id="keyword" name="keyword">
                        <span class="input-group-btn">

			<button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>

		    </span>
        </div>
      </form>

    </div>
    <!--/.nav-collapse -->

  </div>
  <!-- /.container -->
</div>
<!-- /#navbar -->

<!-- *** NAVBAR END *** -->
