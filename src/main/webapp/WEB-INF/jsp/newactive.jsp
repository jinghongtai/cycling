<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>快速发布</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="static/corn/iconfont.css" media="all"/>
    <link rel="stylesheet" href="static/layui/css/layui.css" />
    <script type="text/javascript" src="static/layui/layui.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="common/js/html5.min.js"></script>
    <script type="text/javascript" src="common/js/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="<%=basePath%>static/js/jquery.js"></script>
    <script type="text/javascript" src="static/js/jquery.form.js"></script>

</head>

<style>
    .width{
        width: 80% !important;
    }
    .layui-form-item .layui-input-inline {
        float: left;
        width: 370px;
        margin-right: 10px;
    }
</style>
<body>
<body>

<div id="hd">
    <div id="nextopsxx"></div>
    <%@include file="../../common.jsp"%>
    <div id="wp" class="wp">
        <div id="pt" class="bm cl place">
            <div class="z"> <a href="./" class="nvhm" title="首页">骑行天下</a>
                <em>»</em><a href="plugin.php?id=dpw_activity:activity">活动报名</a><em> › </em>
            </div>
        </div>
        <div id="activity_ad" class="bm"></div>
        <li id="scrolltop" style="left: auto; right: 0px; visibility: hidden;">
            <div class="nexstout nexstout_up">
                <a id="nexGoToTop">
                    <img src="template/nex_enterprise_180102/neoconex/sidetools/up.png">
                    <span>返回顶部</span>
                </a>
            </div>

        </li>

    </div>
    <div class="wp">

    </div>
    <style>

        #fileContrain{
            background-image: url('<%=basePath%>static/icon/tupian.png')  ;
            background-repeat: no-repeat ;
            /*width:100%;*/
            height:200px;
            position: relative;
            cursor:pointer;
        }
        .fileInput{
            width:100%;
            height:200px;
            overflow: hidden;
            font-size: 200px;
            right:0;
            top:0;
            opacity: 0;
            filter:alpha(opacity=0);
            cursor:pointer;
        }

    </style>
    <div class="ztreeEdit layui-fluid">

        <div id="updateOrInsert" style="font-size:14px;margin-left:60px;margin-top: 30px;"  >
            <div>
                <div id="userForm" class="layui-form" method="post" >
                    <input type="hidden" id="id" name="id" value="">
                    <div class="layui-form-item　" style="margin-bottom:10px; ">
                        <label class="layui-input-inline layui-form-label">活动封面：</label>
                        <div class="layui-input-block " id="fileContrain">
                            <input type="file" onchange="chageImge()" id="headImg" value="" onclick='
		                                    this.value="";
		                                    $("#fileContrain").css({"background-image":""});
		                                        '
                                   class="fileInput" name="file">
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline width">
                            <label class="layui-form-label">活动标题：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" value=""  placeholder="请输入标题" class="layui-input">
                            </div>
                            <label class="layui-form-label">活动类型：</label>
                            <div class="layui-input-inline">
                                <select type="text" name="activeType"   placeholder="请选择活动类型"   class="layui-input">
                                    <option value="XXLVQX">休闲旅游骑行</option>
                                    <option value="QDYYQX">轻度越野骑行</option>
                                    <option value="TQDYYQX">强度越野骑行</option>
                                    <option value="ZQDLL">中强度拉练</option>
                                    <option value="PPS">爬坡赛</option>
                                    <option value="CYJXHD">超越极限活动</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline width">
                            <label class="layui-form-label">开始地址：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="activeAddressBegin" value=""   placeholder="请输入活动开始地址" class="layui-input">
                            </div>
                            <label class="layui-form-label">结束地址：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="activeAddressEnd" value="" placeholder="请输入活动结束地址"   class="layui-input">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline width">
                            <label class="layui-form-label">开始时间：</label>
                            <div class="layui-input-inline">
                                <input type="text" class="showData layui-input" name="beginTime" value=""   placeholder="请输入开始时间"  >
                            </div>
                            <label class="layui-form-label">结束时间：</label>
                            <div class="layui-input-inline">
                                <input type="text" class="showData layui-input" name="endTime" value="" placeholder="请输入结束时间"  >
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline width">
                            <label class="layui-form-label">报名开始时间：</label>
                            <div class="layui-input-inline">
                                <input type="text" class="showData layui-input" name="loginTime" value=""   placeholder="请输入报名开始时间"  >
                            </div>
                            <label class="layui-form-label">报名结束时间：</label>
                            <div class="layui-input-inline">
                                <input type="text" class="showData layui-input" name="loginEndTime" value="" placeholder="请输入报名结束时间"    >
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">人数限制：</label>
                        <div class="layui-input-inline">
                            <input type="checkbox" name="flagPersonLimit" value="N" lay-filter="checkboxInput" title="是"  />
                        </div>
                        <label class="layui-form-label">限制人数：</label>
                        <div class="layui-input-inline">
                            <input type="text" class="  layui-input" name="activeCount" value=""    placeholder="请输入报名开始时间"  >
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline width">
                            <label class="layui-form-label">活动内容：</label>
                            <div class="layui-input-inline">
                                <textarea type="text" style="width: 233%;" class="layui-textarea" name="content" value=""   placeholder="请输入活动内容"  >

                                </textarea>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <div class="layui-input-inline">
                                <div class="layui-input-inline" style="margin-left:200%;">
                                    <button class="layui-btn layui-btn-sm" data-type="saveOrUpdateUser"  >保存</button>
                                    <button class="layui-btn layui-btn-sm" data-type="goBack">返回</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</body>



<script>
    var table;
    var layer;
    var  form;
    var $2;

    function chageImge(){
        var imgs = $2('.fileInput').val(),         //获取到input的value，里面是文件的路径
                fileFormat = imgs.substring(imgs.lastIndexOf(".")).toLowerCase(),
                fileObj = document.getElementById('headImg').files[0]; //上传文件的对象,要这样写才行，用jquery写法获取不到对象
        // 检查是否是图片
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            tip('仅支持:png/jpg/jpeg',$('.fileInput'));
            return;
        }
        var url = getObjectURL(fileObj);
        $2("#fileContrain").css({'background-image':'url("'+url+'")'});

    }
    function getObjectURL(file) {
        var url = null ;
        if (window.createObjectURL!=undefined) {
            url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) {
            url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) {
            url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
    }
    layui.use(['table','layer','form','laydate','upload'], function(){
        table = layui.table;
        layer = layui.layer;
        form = layui.form;
        $2 = layui.$;
        var  laydate = layui.laydate,upload = layui.upload;

        //监听提交
        form.on('submit(*)', function(data){
            return false;
        });

        lay('.showData').each(function(){
            laydate.render({
                elem: this
                ,trigger: 'click'
                ,type: 'datetime'
                ,format:'yyyy-MM-dd HH:mm:ss'
            });
        });

        form.on('checkbox(checkboxInput)', function(data){
            if(data.elem.checked){
                 $("input[name=flagPersonLimit]").val('Y');
            }else{
                $("input[name=flagPersonLimit]").val('N');
            }

        });

        var $ = layui.$, active = {
            goBack:function(){
                $("#updateOrInsert").hide();
                $('.ztreeEdit').show();
            }
            ,
            //返回
            modify:function(){
                $("#updateOrInsert").show();
                $('.ztreeEdit').hide();
            },
            // 启用 禁用
            startUser:function(){
                var checkStatus = table.checkStatus('usercretificateTab');
                var data = checkStatus.data;
                if(data&&data.length==0){
                    tip("请选择数据",$("#userTableId"));
                    return ;
                }
                var ids = new Array();
                data.forEach(function(e){
                    ids.push(e.id);
                });

                if(ids.length>1){
                    tip("只允许单用户操作",$("#userTableId"));
                    return;
                }

                $.post("userAction/modifyUserInfo",{id:ids[0],state:1},function(res){
                    if(res.status=="success"){
                        msg("启用成功");
                        tableReload();
                    }else
                        msg(res.message);
                },"json");
            }
            ,

            saveOrUpdateUser: function(){
                formSubmit();
                return false;
            }

        };

        $('#personDiv .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        $('#updateOrInsert .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });



    });

    function formSubmit(){
        $2("#userForm").ajaxSubmit({
            clearForm:false, //提交成功后是否清空表单中的字段值
            restForm:false, //提交成功后是否重置表单中的字段值，即恢复到页面加载时的状态
            dataType:'json',
            contentType:"multipart/form-data",
            url:'<%=basePath%>cyclingAction/saveCycling',
            beforeSerialize:function(){
                //用于修改元素的值
            },
            beforeSubmit:function(formData, jqForm, options){
                var title = $2("#updateOrInsert input[name=title]").val();
                if(!title){
                    tip("标题不能为空",$2("#updateOrInsert input[name=title]"));
                    return false;
                }
                var activeType = $2("#updateOrInsert select[name=activeType]").val();
                if(!activeType){
                    tip("活动类型不能为空",$2("#updateOrInsert input[name=activeType]"));
                    return false;
                }
                return true;
            },
            success:function(data){
                if(data.status == "success"){
                    msg("保存成功");
                }
            }

        });


    }


    //保存或更新
    function saveOrUpdate(url,data,tip){
        $2.ajax({
            dataType:'json',
            url:url,
            data:data,
            type:'post',
            success:function(res){
                if(res&&res.status=="success"){
                    msg("修改成功！");
                    tableReload();
                }else{
                    msg(res.message);
                }
            }

        });
    }

    function setUserInfo(data){
        $2("#id").val(data.id);
        $2("#updateOrInsert input[name=username]").val(data.username);
        $2("#updateOrInsert input[name=telphone]").val(data.telphone);
        $2("#updateOrInsert input[name=address]").val(data.address);
        $2("#updateOrInsert input[name=utype]").prop("checked","false");
        $2("#updateOrInsert input[name=utype][value="+data.utype+"]").prop("checked","true");
        if(data.headImg)
            $2("#uploadImage").attr("src",data.headImg);
        else
            $2("#uploadImage").removeAttr("src");
        //ie有bug注释了
        form.render();
    }

    function resetUserInfo(){
        $2("#id").val("");
        $2("#username").val("");
        $2("#xgphone").val("");
        $2("#address").val("");
        $2("#remark").val("");

        //ie有bug注释了
        //form.render("select");
    }

    function tip(content,position){
        layer.tips(content, $2(position)); //在元素的事件回调体中，follow直接赋予this即可
    }


    function msg(content){
        layer.msg(content, {
            time: 2000
        });
    }

</script>
</body>
</html>
