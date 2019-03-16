<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>帖子</title>
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
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_forum_forumdisplay.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_widthauto.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_forum_viewthread.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_widthauto.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_common.css">
    <script>
        var  UEDITOR_HOME_URL = "<%=basePath%>ueditor/";
        var locatios = window.location.href;
    </script>
    <script>
        var laypage;
        $(function(){

            queryMessage();

            $("body").on("click","#saveHf",function(){
                KindEditor.sync('#container');
                $("#fastpostform").ajaxSubmit({
                    clearForm:true, //提交成功后是否清空表单中的字段值
                    restForm:true, //提交成功后是否重置表单中的字段值，即恢复到页面加载时的状态
                    dataType:'json',
                    url:'<%=basePath%>postMessageAction/saveMessage',
                    beforeSerialize:function(){
                        //用于修改元素的值
                    },
                    beforeSubmit:function(formData, jqForm, options){
                        var content = $("#fastpostform #container").val();
                        if(!content){
                            alert("请输入内容");
                            return false;
                        }
                        return true;
                    },
                    success:function(data){
                        if(data.status == "success"){
                            alert("保存成功");
                            editor.html("");
                            queryMessage();
                        }else{
                            alert(data.message);
                        }
                    }

                });

            });

            /**
             * 用户评论之间回复
             */
            $("body").on("click",".huifuInfo",function(){
                var userId = $(this).attr("userId");
                if(!userId)
                    return ;
                $("#userId").val(userId);
            })


        });


        /**
         * 查询评论信息
         */
        function queryMessage() {
            var data = {"postId":'${post.id}'};
            $.ajax({
                url:'postMessageAction/queryPostMessage',
                type: 'post',
                dataType: 'json',
                data: data,
                success: function (res) {
                    $("#messageContrain").empty();
                    var array = [];
                    var dataResult = res;
                    if (dataResult && dataResult.length > 0) {
                        for(var k=0;k<dataResult.length;k++)
                            array.push(lookInfo(dataResult[k]));
                    }
                    $("#messageContrain").append(array.join(""));
                }
            });
        }


        function lookInfo(vars){
            if(vars){
                if(vars.toUserId)
                    return  '<li>'+'<img style="width:20px;height:20px;border-radius:50%" src="'+vars.forUserImg+'">【'+vars.formUserName+'】<a userId="'+vars.userId+'" class="huifuInfo">回复</a>'+vars.toUserName+':'+vars.content+'<em> <a class="fastre" href="javascript:void(0)">回复</a> </em></li>';
                else
                    return  '<li>'+'<img style="width:20px;height:20px;border-radius:50%" src="'+vars.forUserImg+'">【'+vars.formUserName+'】:'+vars.content+'<em> <a userId="'+vars.userId+'"  class="fastre huifuInfo" href="javascript:void(0)">回复</a> </em></li>'
            }
        }


    </script>
</head>

<style>
    .width{
        width: 80% !important;
    }
    #category_47 table dd,em ,dl dd{
        font-size:12px;
    }
    table tr td,th,th a{
        font-size: 12px;
    }
    .common a{
        font-size: 12px;
    }
</style>
<body>
<body class="pg_forumdisplay">

<div id="hd">
    <div id="nextopsxx"></div>
    <%@include file="../../common.jsp"%>
    <div id="wp" class="wp">
        <script type="text/javascript">var fid = parseInt('9'), tid = parseInt('139512');</script>

        <script src="static/js/forum_viewthread.js?cc7" type="text/javascript"></script>
        <script type="text/javascript">zoomstatus = parseInt(0);var imagemaxwidth = '840';var aimgcount = new Array();</script>

        <style id="diy_style" type="text/css"></style>
        <!--[diy=diynavtop]--><div id="diynavtop" class="area"></div><!--[/diy]-->
        <div id="pt" class="bm cl place">
            <div class="z">
                <a href="./" class="nvhm" title="首页">骑行天下</a><em>»</em>
                <a href="javascript:void(0)">骑行圈</a> <em>›</em>
                <a href="javascript:void(0)"> ${post.title}</a> <em>›</em>
            </div>
        </div>


        <div class="wp">
            <!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->
        </div>

        <div id="ct" class="wp cl">
            <div id="pgt" class="pgs mbm cl ">
                <div class="pgt"></div>
                <span class="y pgb" id="visitedforums" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'34'})"><a href="javascript:void(0)">返回列表</a></span>
                <a id="newspecial" onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})" onclick="showWindow('newthread', 'forum.php?mod=post&amp;action=newthread&amp;fid=9')" href="javascript:;" title="发新帖">
                    <img src="static/upload/postImg/pn_post.png" alt="发新帖"></a>
            </div>
            <div id="postlist" class="pl bm">
                <table cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td class="pls ptn pbn">
                            <div class="hm ptn">
                                <span class="xg1">查看:</span> <span class="xi1">328</span><span class="pipe">|</span>
                                <span class="xg1">回复:</span> <span class="xi1">0</span>
                            </div>
                        </td>
                        <td class="plc ptm pbn vwthd">
                            <div class="y">
                                <a href="javascript:void(0)" title="打印" target="_blank">
                                    <img src="static/upload/postImg/print.png" alt="打印" class="vm"></a>
                                <a href="javascript:void(0)" title="上一主题">
                                    <img src="static/upload/postImg/thread-prev.png" alt="上一主题" class="vm"></a>
                                <a href="javascript:void(0)" title="下一主题">
                                    <img src="static/upload/postImg/thread-next.png" alt="下一主题" class="vm"></a>
                            </div>
                            <h1 class="ts">
                                <span id="thread_subject">${post.title}</span>
                            </h1>
                            <span class="xg1">
<a href="javascript:void(0)" onclick="return copyThreadUrl(this, '骑行天下')">[复制链接]</a>
</span>
                        </td>
                    </tr>
                    </tbody></table>


                <table cellspacing="0" cellpadding="0" class="ad">
                    <tbody><tr>
                        <td class="pls">
                        </td>
                        <td class="plc">
                        </td>
                    </tr>
                    </tbody></table><div id="post_634165"><table id="pid634165" class="plhin" summary="pid634165" cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td class="pls" rowspan="2">
                        <div id="favatar634165" class="pls favatar">
                            <a name="lastpost"></a><div class="pi">
                            <div class="authi">
                                <a href="javascript:void(0)" target="_blank" class="xw1">${post.userName}</a>
                            </div>
                        </div>
                            <div class="p_pop blk bui card_gender_" id="userinfo634165" style="display: none; margin-top: -11px;">
                                <div class="m z">
                                    <div id="userinfo634165_ma"></div>
                                </div>
                                <div class="i y">
                                    <div>
                                        <strong><a href="javascript:void(0)" target="_blank" class="xi2">${post.userName}</a></strong>
                                        <em>当前离线</em>
                                    </div><dl class="cl">
                                    <dt>积分</dt><dd>
                                    <a href="javascript:void(0)" target="_blank" class="xi2">157</a></dd>
                                </dl><div class="imicn">
                                    <a href="javascript:void(0)" target="_blank" title="查看详细资料">
                                        <img src="${post.userImg}" alt="查看详细资料"></a>
                                    <a href="javascript:void(0)" id="a_showip_li_634165" class="xi2" onclick="showWindow(this.id, this.href)"><img src="static//image/magic/showip.small.gif" alt=""> IP卡</a>
                                    <a href="javascript:void(0)" id="a_repent_634165" class="xi2" onclick="showWindow(this.id, this.href)"><img src="static//image/magic/checkonline.small.gif" alt=""> 狗仔卡</a>
                                </div>
                                    <div id="avatarfeed"><span id="threadsortswait"></span></div>
                                </div>
                            </div>
                            <div>
                                <div class="avatar"><a href="javascript:void(0)" class="avtm" target="_blank"><img src="${post.userImg}"></a></div>
                            </div>

                            <p><img src="static/upload/postImg/run.png">参加活动: <em>0  </em>次</p>
                            <p><img src="static/upload/postImg/run.png">组织活动: <em>0  </em>次</p>
                        </div>
                    </td>
                    <td class="plc">
                        <div class="pi">
                            <div id="fj" class="y">
                                <label class="z">电梯直达</label>
                                <input type="text" class="px p_fre z" size="2" onkeyup="$('fj_btn').href='forum.php?mod=redirect&amp;ptid=139512&amp;authorid=0&amp;postno='+this.value" onkeydown="if(event.keyCode==13) {window.location=$('fj_btn').href;return false;}" title="跳转到指定楼层">
                                <a href="javascript:;" id="fj_btn" class="z" title="跳转到指定楼层">
                                    <img src="static/upload/postImg/fj_btn.png" alt="跳转到指定楼层" class="vm"></a>
                            </div>
                            <strong>
                                <a href="javascript:void(0)" id="postnum634165" onclick="setCopy(this.href, '帖子地址复制成功');return false;">
                                    <em>1</em>楼</a>
                            </strong>
                            <div class="pti">
                                <div class="pdbt">
                                </div>
                                <div class="authi">
                                    <img class="authicn vm" id="authicon634165" src="static/image/common/online_member.gif">
                                    <em id="authorposton634165">发表于<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${post.createTime}"></fmt:formatDate></em>
                                    <span class="pipe">|</span>
                                    <a href="forum.php?mod=viewthread&amp;tid=139512&amp;page=1&amp;authorid=166851" rel="nofollow">只看该作者</a>
                                    <span class="none"><img src="static/upload/postImg/arw_r.gif" class="vm" alt="回帖奖励"></span>
                                    <span class="pipe show">|</span><a href="forum.php?mod=viewthread&amp;tid=139512&amp;extra=page%3D1&amp;ordertype=1" class="show">倒序浏览</a>
                                    <span class="pipe show">|</span><a href="javascript:;" onclick="readmode($('thread_subject').innerHTML, 634165);" class="show">阅读模式</a>
                                </div>
                            </div>
                        </div><div class="pct"><style type="text/css">.pcb{margin-right:0}</style><div class="pcb">

                        <div class="t_fsz">
                            <table cellspacing="0" cellpadding="0">
                                <tbody>
                                <tr>
                                    <td class="t_f" id="postmessage_634165"><strong><font color="#FF0000"></font></strong>
                                        ${post.content}
                                    </td>
                                </tr>
                                </tbody>
                            </table>


                        </div>
                        <div id="comment_634165" class="cm">
                        </div>

                        <div id="post_rate_div_634165"></div>

                        <div id="relate_subject"></div>
                    </div>
                    </div>

                    </td></tr>
                <tr><td class="plc plm">
                    <div id="p_btn" class="mtw mbm hm cl">
                        <a href="javascript:void(0)" id="k_favorite" onclick="showWindow(this.id, this.href, 'get', 0);" onmouseover="this.title = $('favoritenumber').innerHTML + ' 人收藏'" title="收藏本帖"><i>
                            <img src="static/upload/postImg/fav.gif" alt="收藏">收藏<span id="favoritenumber" style="display:none">0</span></i></a>
                        <a class="followp" href="javascript:void(0)" onclick="showWindow('relaythread', this.href, 'get', 0);" title="转播求扩散"><i>
                            <img src="static/upload/postImg/rt.png" alt="转播">转播</i></a>
                        <a class="sharep" href="javascript:void(0)" onclick="showWindow('sharethread', this.href, 'get', 0);" title="分享推精华"><i>
                            <img src="static/upload/postImg/oshr.png" alt="分享">分享</i></a>
                        <a href="javascript:void(0)" id="k_collect" onclick="showWindow(this.id, this.href);return false;" onmouseover="this.title = $('collectionnumber').innerHTML + ' 人淘帖'" title="淘好帖进专辑"><i>
                            <img src="static/upload/postImg/collection.png" alt="分享">淘帖<span id="collectionnumber" style="display:none">0</span></i></a>
                        <a id="recommend_add" href="javascript:void(0)" onclick="showWindow('login', this.href)" onmouseover="this.title = $('recommendv_add').innerHTML + ' 人顶'" title="顶一下"><i>
                            <img src="static/upload/postImg/rec_add.gif" alt="顶">顶<span id="recommendv_add" style="display:none">0</span></i></a>
                    </div>
                </td>
                </tr>
                <tr id="_postposition634165"></tr>
                <tr>
                    <td class="pls"></td>
                    <td class="plc" style="overflow:visible;">
                        <div class="po hin">
                            <style>
                                .pob ul li em{

                                }
                            </style>
                            <div class="pob cl" >
                                <div>
                                    <%--评论信息--%>
                                    <ul id="messageContrain">

                                    </ul>

                                </div>
                                <p>
                                    <a href="javascript:;" id="mgc_post_634165" onmouseover="showMenu(this.id)" class="showmenu">使用道具</a>
                                    <a href="javascript:;" onclick="showWindow('miscreport634165', 'misc.php?mod=report&amp;rtype=post&amp;rid=634165&amp;tid=139512&amp;fid=9', 'get', -1);return false;">举报</a>
                                </p>

                                <ul id="mgc_post_634165_menu" class="p_pop mgcmn" style="display: none;">
                                    <li><a href="javascript:void(0)" id="a_bump" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/bump.small.gif">提升卡</a></li>
                                    <li><a href="javascript:void(0)" id="a_stick" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/stick.small.gif">置顶卡</a></li>
                                    <li><a href="javascript:void(0)" id="a_stick" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/close.small.gif">沉默卡</a></li>
                                    <li><a href="javascript:void(0)" id="a_stick" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/open.small.gif">喧嚣卡</a></li>
                                    <li><a href="javascript:void(0)" id="a_stick" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/highlight.small.gif">变色卡</a></li>
                                    <li><a href="javascript:void(0)" id="a_namepost_634165" onclick="showWindow(this.id, this.href)"><img src="static/image/magic/namepost.small.gif">显身卡</a></li><li>
                                </li></ul>
                                <script type="text/javascript" reload="1">checkmgcmn('post_634165')</script>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr class="ad">
                    <td class="pls">
                    </td>
                    <td class="plc">
                    </td>
                </tr>
                </tbody>
            </table>
                <script type="text/javascript" reload="1">
                    aimgcount[634165] = ['MK84R'];
                    attachimggroup(634165);
                    attachimgshow(634165);
                    var aimgfid = 0;
                </script>
            </div>
                <div id="postlistreply" class="pl">
                    <div id="post_new" class="viewthread_table" style="display: none">

                    </div>
                </div>
            </div>




            <div class="pgs mtm mbm cl">
                <span class="pgb y" id="visitedforumstmp" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'21'})"><a href="forum.php?mod=forumdisplay&amp;fid=9&amp;page=1">返回列表</a></span>
            </div>

            <div id="diyfastposttop" class="area"></div>
            <script type="text/javascript">
                var postminchars = parseInt('10');
                var postmaxchars = parseInt('10000');
                var disablepostctrl = parseInt('0');
            </script>

            <div id="f_pst" class="pl bm bmw">
                <form method="post"  id="fastpostform">
                    <table cellspacing="0" cellpadding="0">
                        <tbody><tr>
                            <td class="pls">
                            </td>
                            <td class="plc">

                                <span id="fastpostreturn"></span>
                                <div class="cl">
                                    <div id="fastsmiliesdiv" class="y">
                                        <div id="fastsmiliesdiv_data">
                                            <div id="fastsmilies"></div>
                                        </div>
                                    </div>
                                    <div class="hasfsl" id="fastposteditor">
                                        <div class="tedt mtn">
                                            <input type="hidden" name="postId" value="${post.id}">
                                            <input type="hidden" id="userId" name="toUserId" value="">
                                            <div class="area">
                                                <textarea id="container" value="" name="content" style="width:95%;height:150px;">
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="seccheck_fastpost">
                                </div>
                                <p class="ptm pnpost">
                                    <a href="home.php?mod=spacecp&amp;ac=credit&amp;op=rule&amp;fid=9" class="y" target="_blank">本版积分规则</a>
                                    <button type="button"   class="pn pnc vm"  id="saveHf" tabindex="5"><strong>发表回复</strong></button>
                                    <label class="lb"><input type="checkbox" name="adddynamic" class="pc" value="1">回帖并转播</label>
                                    <label for="fastpostrefresh"><input id="fastpostrefresh" type="checkbox" class="pc">回帖后跳转到最后一页</label>
                                    <script type="text/javascript">if(getcookie('fastpostrefresh') == 1) {$('fastpostrefresh').checked=true;}</script>
                                </p>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>




            <div id="visitedforums_menu" class="p_pop blk cl" style="display: none;">
                <table cellspacing="0" cellpadding="0">
                    <tbody><tr>
                        <td id="v_forums">
                            <h3 class="mbn pbn bbda xg1">浏览过的版块</h3>
                            <ul class="xl xl1">
                                <li>
                                    <a href="javascript:void(0)">商业信息</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">相约骑行</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">骑行安全、技术装备交流</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">“超越”极限骑行</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">潮汕骑行俱乐部</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">深圳折腾骑行</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">行天下骑行俱乐部</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">道卡斯俱乐部</a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <script type="text/javascript">document.onkeyup = function(e){keyPageScroll(e, 0, 0, 'forum.php?mod=viewthread&tid=139512', 1);}</script>
        </div>

        <div class="wp mtn">
            <!--[diy=diy3]--><div id="diy3" class="area"></div><!--[/diy]-->
        </div>
        <script type="text/javascript">
            var relatedlink = [];relatedlink[0] = {'sname':'骑行天下', 'surl':'http://www.szbike.com'};
            relatedlink[1] = {'sname':'', 'surl':''};
            relatedlinks('postmessage_634165');
        </script>

    </div>

    <script charset="utf-8" src="kingeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="kingeditor/lang/zh-CN.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            window.editor = K.create('#container',{
                uploadJson : 'kingeditor/jsp/upload_json.jsp',
                fileManagerJson : 'kingeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                items:['emoticons','baidumap']
            });
        });
    </script>


    <script>

    </script>

</body>



</body>
</html>
