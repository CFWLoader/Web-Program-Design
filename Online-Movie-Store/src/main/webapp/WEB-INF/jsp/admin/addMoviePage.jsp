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
			<form role="form" action="<%=AppContext.getBaseUrl()%>/admin/doAddMovie" method="post" enctype="multipart/form-data">
				<div class="form-group">
					 
					<label for="movieName">
						电影名称
					</label>
					<input type="text" class="form-control" id="movieName" name="movieName">
				</div>
				<div class="form-group">
					 
					<label for="priceStr">
						单价
					</label>
					<input type="text" class="form-control" id="priceStr" name="priceStr">
				</div>
				<div class="form-group">
					 
					<label for="moviePic">
						电影截图
					</label>
					<input type="file" id="moviePic" name="moviePic">
				</div>
				<button type="submit" class="btn btn-default">
					提交
				</button>
			</form>
		</div>
	</div>
</div>

    <script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/jquery.min.js"></script>
    <script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/bootstrap.min.js"></script>
    <script src="<%=AppContext.getBaseUrl()%>/resource/lib/bt3-js/scripts.js"></script>
  </body>
</html>