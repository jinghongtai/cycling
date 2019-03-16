<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="stylesheet" href="static/css/style.css" type="text/css">
    <script src="static/js/jquery-1.11.1.min.js"></script>
    <script src="static/js/register.js"></script>


    <title>骑行天下注册|登录</title>
    <style>
        html,body{
            height:100%;
        }

        .other-login .other-title{
            text-align:center;
            padding:10px 0;
            color:#3E3B3B;
        }
        .other-login .login-icon{
            text-align:center;
        }
        .other-login .login-icon .login_a{

            padding-right:20px;
        }


    </style>
</head>
<body>
<div class="res_page" style="height: 100% !important;">
    <div class="login_wrap">
        <div class="login_logo">
            <h1> <img src="static/images/qxtx_logo.png" alt="logo" > </h1>
        </div>
        <div class="clearfix">
            <div class="login_left fl">
                <div>
                    <img src="static/images/app.png" alt="app下载" title="app下载" style="width: 120px;">
                    <p>扫一扫<br>手机下载App</p>
                </div>
                <div>
                    <img src="static/images/app.png" alt="微信下载" title="微信扫一扫" style="width: 120px;">
                    <p>扫一扫<br>关注微信公众号</p>
                </div>
            </div>
            <div class="login_right fr">


                <div class="user_login">
                    <div>
                        <span class="login_title">欢迎登录</span>
                        <span>没有账号，</span><span class="register"><a href="register.jsp">立即注册</a></span>
                    </div>
                    <div id="login_form"  >
                        <input type="text" class="user" id="user" placeholder="手机号或骑行天下账号" name="username">
                        <span class="error" id="user_hint"></span>
                        <input type="password" class="pass" id="pass" placeholder="请输入登录密码" name="password">
                        <span class="error" id="pass_hint"></span>

                        <div class="login_info">
                            <input type="checkbox" class="number" name="remember" id="Checkbox1"><label for="Checkbox1">7天内免登录</label>
                            <div class="forget"><a href="/index.php?s=/User/findPwd">忘记密码</a></div>
                        </div>
                        <input type="submit" value="登录" id="submit" class="login_in">
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<script>
    var username = false;
    var email = true;
    var password = false;
    var phone = false;
    var code = false;
    var timecount = 60;
    var smsSwitch = true;
    var smsUrl = "/index.php?s=/user/getRegisterCode";
    var usernameUrl = "/userAction/queryUnique";
    var emailUrl = "/userAction/queryEmail";
    $(function(){
        //用户名
        $(window).resize(function(){


        })

        $('#user').focus();
        $('#user').blur(function(){
            var userName = $("#user").val();
            if(!userName||userName.length<2){
                $('#user').next().html("用户名至少2位").show().css("color","red");
            }
        });

        //密码
        $('#pass').blur(function(){
            var pass = $("#pass").val();
            if(!pass){
                $('#pass').next().html("密码不能为空").show().css("color","red");
            }
        });

        $('#passa').blur(function(){


            if($(this).val()!=""){

                return true;

            }else{
                return false;
            }


        });



        $('#submit').click(function(){
            var userName = $("#user").val();
            var passWord = $("#pass").val();
            if(checkSubmitLogin()){

                $.post("userAction/login",{
                    "username":userName,
                    "pwd":passWord,
                },function(res){
                    if(res.status=="success"){
                        window.location.href="index.jsp";
                        tip("登录成功");
                    }else{
                        tip(res.message);
                    }
                });
            } else {
                return false;
            }
        });

    });

    function checkSubmitLogin(){
        var userName = $("#user").val();
        var passWord = $("#pass").val();
        if(!userName)
            return false;
        if(!passWord)
            return false;
        return true;
    }


    function closeInfo(){
        window.setTimeout(function (){
            $("#myMessage").hide();
        },20000);

    }


    function tip(message){
        $("#myMessage #message").text(message);
        $("#myMessage").show();
        closeInfo();
    }

</script>
<div id="myMessage" style="display: none;background-color: #2E2D3C;width:120px;height:50px;z-index: 2000;position:absolute;top:250px;left:45%;line-height:50px;text-align: center;border:5px;">
    <span id="message" style="color: white;"></span>
</div>
</body>
</html>