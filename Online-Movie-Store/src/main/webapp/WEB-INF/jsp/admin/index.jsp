<%@ page import="team.cfw.oms.base.util.AppContext" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

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
				Welcome! Administrator.
			</h3>
			<ul>
				<li>
					<a href="<%=AppContext.getBaseUrl()%>/admin/addMoviePage">Add a movie.</a>
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