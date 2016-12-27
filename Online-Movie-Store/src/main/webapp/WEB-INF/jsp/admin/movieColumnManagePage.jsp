<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="team.cfw.oms.base.util.AppContext" %>
<%@ page isELIgnored="false" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>电影专栏管理页面</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="<%=AppContext.getBaseUrl()%>/resource/stylesheets/bt3-css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=AppContext.getBaseUrl()%>/resource/stylesheets/bt3-css/style.css" rel="stylesheet">

    <script type="text/javascript" src="<%=AppContext.getBaseUrl()%>/resource/lib/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">
        function addMovieToColumn(movieIdVal)
        {
            $.ajax({
                type: "post",
                url: "<%=AppContext.getBaseUrl()%>/admin/addMovieToMovieColumn",
                data: {
                    movieId: movieIdVal
                },
                dataType: "json",
                success: function (data, status) {
                    alert(data.result);
                },
                error: function (XMLHttpRequest, textStatus, errorThrown){
                    alert(XMLHttpRequest.status);

                    alert(XMLHttpRequest.readyState);

                    alert(textStatus);

                    alert(errorThrown);
                }
            });
        }
    </script>

</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr>
                    <th>
                        编号
                    </th>
                    <th>
                        电影名称
                    </th>
                    <th>
                        单价
                    </th>
                    <th>
                        加入电影列表
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${movieList}" var="movie">
                    <tr>
                        <td>
                                ${movie.id}
                        </td>
                        <td>
                                ${movie.movieName}
                        </td>
                        <td>
                                ${movie.price}
                        </td>
                        <td>
                            <input type="button" value="Add" onclick="addMovieToColumn('${movie.id}')"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/bootstrap.min.js"></script>
<script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/scripts.js"></script>
</body>
</html>