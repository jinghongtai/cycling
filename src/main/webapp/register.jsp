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
        <div class="clearfix" <%--style="margin-bottom:120px;"--%>>
            <div class="login_left fl">
                <div>
                    <img style="width:120px;" src="static/images/app.png" alt="app下载" title="app下载">
                    <p>扫一扫<br>手机下载App</p>
                </div>
                <div>
                    <img style="width:120px;" src="static/images/weixin.png" alt="微信下载" title="微信扫一扫">
                    <p>扫一扫<br>关注微信公众号</p>
                </div>
            </div>
            <div class="login_right fr">


                <div class="user_login">
                    <div>
                        <span class="login_title">新用户注册</span>
                        <span>已有账号，</span><span class="register"><a href="login.jsp">立即登录</a></span>
                    </div>
                    <div class="register_form" id="register_form"  >
                        <input type="text" class="user" placeholder="请输入用户名" id="username" name="username">
                        <span></span>
                        <input type="text" class="email" placeholder="请输入邮箱地址(选填)" id="email" name="email">
                        <span></span>
                        <input type="password" class="pass" placeholder="填写8-20位密码" id="password" name="password">
                        <span></span>
                        <input type="password" class="pass" placeholder="确认密码" id="passa" name="passa">
                        <span></span>
                        <div class="phone">
                            <input type="text" placeholder="请输入验证码" class="validate" name="validate" id="validate">
                            <input type="text" placeholder="手机号码" class="phone_text" id="phone" name="mobile">
                            <input type="button" value="获取验证码" class="gain" id="second">
                        </div>
                        <input type="submit" value="注册" id="submit_btn" class="login_in register">
                    </div>
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

        $('#username').focus();
        $('#username').blur(function(){
            checkUsername();
        });
        $('#email').blur(function(){
            //checkEmail();
        });
        //密码
        $('#password').blur(function(){
            checkPwd();
        });

        $('#passa').blur(function(){


            if($(this).val()!=""){

                if( ($(this).val()== $('#password').val())&& $(this).val().length>7){
                    $(this).next().html("").show().css("color","green");
                    password = true;
                }else{
                    $(this).next().html("密码不一致或小于8位").show().css("color","red");

                    password = false;
                }

            }else{
                return false;
            }


        });

        $('#second').click(function(){
            if( !isPhoneNum( $('#phone').val() ) ){
                alert('请输入正确的手机号码' );
                return false;
            }
            if(smsSwitch){
                $re = getRegisterCode( $('#phone').val() );
            }

        });

        $('#submit_btn').click(function(){
            var userName = $("#username").val();
            var email = $("#email").val();
            var passWord = $("#password").val();
            var phone = $("#mobile").val();
            var validate = $("#validate").val();
            if(checkSubmit()){

                $.post("userAction/register",{
                    "username":userName,
                    "pwd":passWord,
                    "telphone":phone,
                    "code":validate
                },function(res){
                    if(res.status=="success"){
                        tip("注册成功");
                        window.location.href="login.jsp"
                    }else{
                        tip(res.message);
                    }
                });
            } else {
                return false;
            }
        });





    });

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