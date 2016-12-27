<%@ page import="team.cfw.oms.base.util.AppContext" %>
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


    <script src="<%=AppContext.getBaseUrl()%>/resource/lib/jquery-3.1.1.min.js">
    </script>

    <script language="javascript" type="text/javascript">

        var uExistence = false;

        function checkUsernameExistence() {
            $.ajax({
                type: "post",
                url: "<%=AppContext.getBaseUrl()%>/user/checkUsernameExistence",
                data: {
                    username: $("#email").val()
                },
                dataType: "json",
                success: function (data, status) {
                    //alert(data.result);

                    if(data.result == 'existed')
                    {
                        uExistence = true;
                        return true;
                    }
                    else
                    {
                        uExistence = false;
                        return false;
                    }
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

        function checkName(){
            var username=document.getElementById("name").value;
            var regex=/^[0-9A-Za-z_]{6,15}$/
            if(username.length==0){
                flag=false;
                document.getElementById("checkname").style.color="red";
                document.getElementById("checkname").style.fontSize="12px";
                document.getElementById("checkname").innerText="用户名不能为空！";
                return false;
            }

            if(regex.exec(username)){
                document.getElementById("checkname").style.color="green";
                document.getElementById("checkname").style.fontSize="12";
                document.getElementById("checkname").innerText="√";
                return true;
            }else{
                document.getElementById("checkname").style.color="red";
                document.getElementById("checkname").style.fontSize="12px";
                document.getElementById("checkname").innerText="非法用户名！";
                return false;
            }
        }

        function checkEmail(){
            var email=document.getElementById("email").value;
            var regex=/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;

            checkUsernameExistence();

            if(uExistence)
            {
                document.getElementById("checkemail").style.color="red";
                document.getElementById("checkemail").style.fontSize="12px";
                document.getElementById("checkemail").innerText="该邮箱已经被注册！";
                return false;
            }
            if(email.length==0){
                document.getElementById("checkemail").style.color="red";
                document.getElementById("checkemail").style.fontSize="12px";
                document.getElementById("checkemail").innerText="邮箱不能为空！";
                return false;
            }
            if(regex.exec(email)){
                document.getElementById("checkemail").style.color="green";
                document.getElementById("checkemail").style.fontSize="12px";
                document.getElementById("checkemail").innerText="√";
                return true;
            }
            else{
                document.getElementById("checkemail").style.color="red";
                document.getElementById("checkemail").style.fontSize="12px";
                document.getElementById("checkemail").innerText="非法邮箱地址！";
                return false;
            }
        }

        function checkPassword(){
            var pass=document.getElementById("password1").value;
            if(pass.length<6){
                document.getElementById("checkpassword").style.color="red";
                document.getElementById("checkpassword").style.fontSize="12px";
                document.getElementById("checkpassword").innerText="密码长度至少6位！";
                return false;
            }else{
                document.getElementById("checkpassword").style.color="green";
                document.getElementById("checkpassword").style.fontSize="12px";
                document.getElementById("checkpassword").innerText="√";
                return true;
            }
        }

        function checkRepassword(){
            var pass=document.getElementById("password1").value;
            var rpass=document.getElementById("password2").value;
            if(pass==rpass){
                document.getElementById("checkrepeatpassword").style.color="green";
                document.getElementById("checkrepeatpassword").style.fontSize="12px";
                document.getElementById("checkrepeatpassword").innerText="√";
                return true;
            }else{
                document.getElementById("checkrepeatpassword").style.color="red";
                document.getElementById("checkrepeatpassword").style.fontSize="12px";
                document.getElementById("checkrepeatpassword").innerText="两次密码不一致！";
                return false;
            }
        }

        function checkAll(){

            if(checkName()&&checkEmail()&&checkPassword()&&checkRepassword()){

                document.form1.action="<%=AppContext.getBaseUrl()%>/user/doRegister";
                document.form1.submit();
                return true;
            }else{
                document.form1.action="";
                return false;
            }
        }

        $(document).ready(function(){
            $("#sub").click(function(){
                if(checkName()&&checkEmail()&&checkPassword()&&checkRepassword())
                {
                    $("#form1").attr("action","<%=AppContext.getBaseUrl()%>/user/doRegister");
                    $("#form1").submit();
                }
                else
                {
                    $("#form1").attr("action","");
                }
            });
            $("#password1").keyup(function(){
                var password1=$("#password1").val();
                if(password1.length<9)
                {
                    $("#password1").css("background-color","red");
                }
                else if(password1.length<12)
                {
                    $("#password1").css("background-color","yellow");
                }
                else
                {
                    $("#password1").css("background-color","green");
                }
            });
        });
    </script>



</head>

<body>
    <%@ include file="../_common/_obaju_top_nav.jsp"%>

    <div id="all">

        <div id="content">
            <div class="container">

                <div class="col-md-12">

                    <ul class="breadcrumb">
                        <li><a href="#">主页</a>
                        </li>
                        <li>新用户注册</li>
                    </ul>

                </div>

                <div class="col-md-12">
                    <div class="box">
                        <h1>新用户注册</h1>

                        <p class="lead">还没有用户账号？</p>
                        <p>仅需花费几分钟，即可注册我们的用户账号，同时您将拥有更多的专属特权！</p>
                        <p class="text-muted">如果你有任何疑问，请<a href="contact.html">联系我们</a>，我们的客户服务中心将会全天候为您服务。</p>

                        <hr>

                        <form action="" method="post" id="form1" name="form1">
                            <div class="form-group">
                                <label for="name">姓名</label>
                                <input type="text" width="100" class="form-control" onblur="checkName()" id="name">
                                <label id="checkname"> </label>
                            </div>
                            <div class="form-group">
                                <label for="email">邮箱</label>
                                <input type="text" width="200" class="form-control" onblur="checkEmail()" id="email" name="email">
                                <label id="checkemail"> </label>
                            </div>
                            <div class="form-group">
                                <label for="password1">密码</label>
                                <input type="password" class="form-control" onblur="checkPassword()" id="password1" name="password1">
                                <label id="checkpassword"> </label>
                            </div>
                            <div class="form-group">
                                <label for="password2">重复密码</label>
                                <input type="password" class="form-control" onblur="checkRepassword()" id="password2">
                                <label id="checkrepeatpassword"> </label>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary" id="sub"><i class="fa fa-user-md"></i> 注册</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </div>
        <!-- /#content -->


        <%@include file="../_common/_obaju_footer.jsp"%>



    </div>
    <!-- /#all -->


    

    <%@ include file="../_common/_obaju_js.jsp"%>



</body>

</html>
