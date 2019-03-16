//校验手机号是否合法
function isPhoneNum(phonenum){
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if(!myreg.test(phonenum)){
        return false;
    }else{
        return true;
    }
}
function isEmail(email){
    var bo = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(email);
    if(bo==false){
        return false;
    }
    return true;
}

function checkSubmit(){

    if(!username){
        $('#username').focus();
        return false;
    }
    if(!email){
        $('#email').focus();
        return false;
    }

    if( !isPhoneNum($('#phone').val()) ){
        $('#phone').focus();
        return false;
    }

    if( checkPwd() )
        return true;
    else
        return false;
}

function checkUsername(){

    if($('#username').val()!=""){

        if($('#username').val().length < 2){
            $('#username').next().html("用户名至少2位").show().css("color","red");
            username = false;
            return false;
        } else {
            checkUsernameUnique($('#username').val());
            //$('#username').next().html("用户名填写正确").show().css("color","green");
            //username = true;
            return true;
        }

    }else{
        return false;
    }
}
function checkEmail(){
    if($('#email').val()!=""){
        if(!isEmail($('#email').val())){
            $('#email').next().html("邮箱地址不正确").show().css("color","red");
            email = false;
            return false;
        }else {
            checkeEmailUnique($('#email').val());
            return true;
        }
    }else{
        return false;
    }
}

function checkPwd(){
    if($('#password').val()!=""){
        if($('#password').val().length > 7){
            $('#password').next().html("用户密码格式正确").show().css("color","green");
            return true;
        }else{
            $('#password').next().html("密码长度为8-18位").show().css("color","red");

            return false;
        }
    }
    return false;
}
//将手机利用ajax提交到后台的发短信接口
function getRegisterCode(mobile) {
    if(!username || !email || !checkPwd() ){
        alert('请先完善用户名、邮箱、密码等资料后再获取');
        return false;
    }
    $.ajax({
        type : 'POST',
        url : window.smsUrl,// 请求的action路径
        data:{mobile:mobile},
        success:function(data){	//回调
            $re = eval('('+data+')');
            if($re.status == 200){
                sendTimeCount();
                return true;
            } else {
                alert($re.error);
                return false;
            }
        },
        error:function(){
            return false;
        }
    });
}

//计时器
function sendTimeCount()
{
    window.timecount--;
    if(window.timecount > 0){
        smsSwitch = false;
        $('#second').val(window.timecount+'秒后获取');
        $('#second').css('background', '#CECECE');
        setTimeout( function(){ sendTimeCount(); }, 1000 );
    } else {
        smsSwitch = true;
        $('#second').val('获取验证码');
        $('#second').css('background', '#f7f7f7');
        window.timecount = 60;
        return true;
    }
}

function checkUsernameUnique($username){
    $.ajax({
        url:"userAction/queryPage",
        type:"post",
        dataType:'json',
        data:{"username":$username},
        success:function(data){
            if(data.code==200&&data.data.length==0){
                username = true;
                $('#username').next().html("用户名可用").show().css("color","green");
            } else if(data.code==200&&data.data.length>=1){
                username = false;
                $('#username').next().html("用户名已存在").show().css("color","red");
            }
        }
    });
}
function checkeEmailUnique(emailvalue){
    $.ajax({
        url:window.emailUrl,
        type:"post",
        data:{email:emailvalue},
        success:function(data){
            $re = eval('('+data+')');
            if($re.status==200){
                email = true;
                $('#email').next().html("邮箱可用").show().css("color","green");
            } else if($re.status == 300){
                email = false;
                $('#email').next().html($re.error).show().css("color","red");
            }
        }
    });
}
