<%@ page import="team.cfw.oms.base.util.AppContext" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>在线电影商店</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="<%=AppContext.getBaseUrl()%>/resource/stylesheets/bt3-css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=AppContext.getBaseUrl()%>/resource/stylesheets/bt3-css/style.css" rel="stylesheet">

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">
                欢迎回来，管理员！
            </h3>
            <ul>
                <li>
                    <a href="<%=AppContext.getBaseUrl()%>/admin/addMoviePage">添加电影。</a>
                </li>
                <li>
                    <a href="<%=AppContext.getBaseUrl()%>/admin/movieColumnManagePage">管理电影列表</a>
                </li>
                <li>
                    <a href="<%=AppContext.getBaseUrl()%>/admin/showMovieColumnPage">显示电影列表</a>
                </li>
            </ul>
        </div>
    </div>
</div>

<script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/jquery.min.js"></script>
<script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/bootstrap.min.js"></script>
<script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/scripts.js"></script>
</body>
</html>