<%@ page import="team.cfw.oms.base.util.AppContext" %>
<%--
  Created by IntelliJ IDEA.
  User: CFWLoader
  Date: 11/1/16
  Time: 5:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Page</title>

    <script type="text/javascript" src="<%=AppContext.getBaseUrl()%>/resource/lib/jquery-3.1.1.min.js"></script>

    <script type="text/javascript">
        function checkUsernameExistence() {
            $.ajax({
                type: "post",
                url: "<%=AppContext.getBaseUrl()%>/user/checkUsernameExistence",
                data: {
                    username: $("#username").val()
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

        function checkUsernameExistence1() {
            $.post("<%=AppContext.getBaseUrl()%>/user/checkUsernameExistence",
                    {
                        username: $("#username").val()
                    },
                    function (data, status) {

                        alert("!!!");

                        if (data.result == "success") {
                            alert("!!!");
                            return;
                        }
                        else {
                            var alert = generate('error', data.result);
                            setTimeout(function () {
                                $.noty.close(alert.options.id);
                            }, 2000);
                        }
                    },
                    "json");
        }
    </script>
</head>
<body>
<form action="<%=AppContext.getBaseUrl()%>/user/doRegister" method="post">
    <label>Username:</label><input type="text" id="username" name="username" onblur="checkUsernameExistence()"/><br/>
    <label>Password:</label><input type="password" id="password1" name="password1"/><br/>
    <label>Phone Number:</label><input type="text" id="phoneNumber" name="phoneNumber"/><br/>
    <label>Address:</label><input type="text" id="address" name="address"/><br/>
    <input type="submit" value="提交申请"/>
</form>
</body>
</html>
