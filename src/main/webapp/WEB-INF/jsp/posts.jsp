<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet"   type="text/css" href="static/css/style_11_common.css">
    <script>
        var  UEDITOR_HOME_URL = "<%=basePath%>ueditor/";
        var locatios = window.location.href;
    </script>
    <script>
        var laypage;
        $(function(){

            queryPosts(1,20);

            $.ajax({
                url:'postCategoryAction/queryPostCategory',
                type:'post',
                dataType:'json',
                success:function(res){
                    $("#typeid_fast").empty();
                    var array = [];
                    if(res&&res.length>0){
                        array.push("<option  >选择主题分类</option>")
                        for(var k=0;k<res.length;k++){
                            array.push("<option value='"+res[k].id+"'>"+res[k].name+"</option>")
                        }
                    }
                    $("#typeid_fast").append(array.join(""));
                }
            });


            $("body").on("click","#fastpostsubmit",function(){
                $("#fastpostsubmit").attr("disabled","disabled");
                setTimeout(function(){
                    $("#fastpostsubmit").removeAttr("disabled");
                },3000);
                KindEditor.sync('#container');
                $("#fastpostform").ajaxSubmit({
                    clearForm:true, //提交成功后是否清空表单中的字段值
                    restForm:true, //提交成功后是否重置表单中的字段值，即恢复到页面加载时的状态
                    dataType:'json',
                    url:'<%=basePath%>postsAction/savePosts',
                    beforeSerialize:function(){
                        //用于修改元素的值
                    },
                    beforeSubmit:function(formData, jqForm, options){
                        var title = $("#fastpostform #subject").val();
                        if(!title){
                            alert("请输入标题");
                            return false;
                        }
                        var typeid_fast = $("#fastpostform #typeid_fast").val();
                        if(!typeid_fast){
                            alert("请选择主题分类");
                            return false;
                        }
                        return true;
                    },
                    success:function(data){
                        if(data.status == "success"){
                            alert("保存成功");
                        }else{
                            alert(data.message);
                        }
                    }

                });

            });



        });

        layui.use('laypage', function(){
            laypage = layui.laypage;
            laypage.render({
                elem: 'pageContrain' //注意，这里的 test1 是 ID，不用加 # 号
                ,count: ${pageCount} //数据总数，从服务端得到
                ,limit:20
                ,jump: function(obj, first) {
                    //obj包含了当前分页的所有参数，比如：
                    var page = obj.curr;
                    var limit = obj.limit;
                    //首次不执行
                    if (!first) {
                        queryPosts(page, limit);
                    }
                }
            });
        });


        function queryPosts(page,limit){
            var data = {
                "page":page,
                "limit":limit,
                "postClassId":'${param.banKuaiClassId}'
            };

            $.ajax({
                url:'postsAction/queryInof',
                type:'post',
                dataType:'json',
                data:data,
                success:function(res){
                    $("#threadlisttableid").empty();
                    var array = [];
                    var dataResult = res.data;
                    if(dataResult&&dataResult.length>0){
                        array.push('<tbody id="separatorline" class="emptb"> <tr>'+
                                '<td class="icn"></td> <th></th> <td class="by"></td>'+
                                '<td class="num"></td>'+
                                '<td class="by"></td>'+
                                '</tr> </tbody>');
                        for(var k=0;k<dataResult.length;k++){
                            var str = '<tbody id="normalthread_139437">'+
                                    '<tr>'+
                                    '<td class="icn">'+
                                    '<a href="forum.php?mod=viewthread&amp;tid=139437&amp;extra=page%3D1%26filter%3Dtypeid%26typeid%3D39" title="新窗口打开" target="_blank">'+
                                    '<img src='+selectImg(dataResult[k].topFlag)+'>'+
                                    '</a>'+
                                    '</td>'+
                                    '<th class="common">'+
                                    '<a href="javascript:;" id="content_139437" class="showcontent y" title="更多操作"></a>'+
                                    '<a class="tdpre y" href="postsAction/queryDetail?id='+dataResult[k].id+'"  >预览</a>'+
                                    '<a href="postsAction/queryDetail?id='+dataResult[k].id+'" onclick="atarget(this)" class="s xst">'+dataResult[k].title+'</a>'+
                                    selectImg2(dataResult[k].topFlag)+
                                    '<!--<img src="static/upload/postImg/image_s.gif" alt="attach_img" title="图片附件" align="absmiddle">-->'+
                                    '</th>'+
                                    '<td class="by">'+
                                    '<cite>'+
                                    '<a href="home.php?mod=space&amp;uid=180837" c="1" mid="card_515">度搜解决</a></cite>'+
                                    '<em><span>'+dataHandle(dataResult[k].createTime)+'</span></em>'+
                                    '</td>'+
                                    '<td class="num">'+
                                    '<a href="forum.php?mod=viewthread&amp;tid=139437&amp;extra=page%3D1%26filter%3Dtypeid%26typeid%3D39" class="xi2">1</a>'+
                                    '<em>450</em>'+
                                    '</td>'+
                                    '<td class="by">'+
                                    '<cite><a href="home.php?mod=space&amp;username=%B6%C8%CB%D1%BD%E2%BE%F6" c="1" mid="card_269">度搜解决</a></cite>'+
                                    '<em><a href="forum.php?mod=redirect&amp;tid=139437&amp;goto=lastpost#lastpost">2018-5-9 10:14</a></em>'+
                                    '</td>'+
                                    '</tr>'+
                                    '</tbody>';
                            array.push(str);
                        }
                    }
                    $("#threadlisttableid").append(array.join(""));
                }
            });
        }

        function selectImg(topFlag){
            if(topFlag&&topFlag=='1')
                return "static/upload/postImg/folder_common.gif";
            else if(topFlag&&topFlag=='0')
                return "static/upload/postImg/pin_1.gif";
        }

        function selectImg2(topFlag){
            if(topFlag&&topFlag=='0')
                return '<img src="static/upload/postImg/recommend_1.gif" />';
            else if(topFlag&&topFlag=='1')
                return "";
        }

        function dataHandle(data){
            var vas = new Date(data);
            return vas.getFullYear()+'-'+vas.getMonth()+"-"+vas.getDay()+" "+vas.getHours()+":"+vas.getMinutes();
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
        <style id="diy_style" type="text/css"></style>
        <!--[diy=diynavtop]--><div id="diynavtop" class="area"></div><!--[/diy]-->
        <div id="pt" class="bm cl place" >
            <div class="z">
                <a href="./" class="nvhm" title="首页">骑行天下</a><em>»</em><a href="forum.php">骑行圈</a> <em>›</em> <a href="forum.php?gid=4">» 骑行天下</a><em>›</em> <a href="forum.php?mod=forumdisplay&amp;fid=39">骑行安全、技术装备交流</a></div>
        </div><div class="wp">
        <!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->
    </div>
        <div class="boardnav">
            <div id="ct" class="wp cl">
                <div class="mn">
                    <div class="bm bml pbn" style="border: 1px solid #ededed !important; background: #FFF">
                        <div class="bm_h cl">
<span class="y">
<a href="home.php?mod=spacecp&amp;ac=favorite&amp;type=forum&amp;id=39&amp;handlekey=favoriteforum&amp;formhash=fed9872a" id="a_favorite" class="fa_fav" onclick="showWindow(this.id, this.href, 'get', 0);">收藏本版 <strong class="xi1" id="number_favorite">(<span id="number_favorite_num">8</span>)</strong></a>

</span>
                            <h1 class="xs2">
                                <a href="forum.php?mod=forumdisplay&amp;fid=39">骑行安全、技术装备交流</a>
                                <span class="xs1 xw0 i">今日: <strong class="xi1">142</strong><b class="ico_increase">&nbsp;</b>
                                    <span class="pipe">|</span>主题: <strong class="xi1">3048</strong><span class="pipe">|</span>排名: <strong class="xi1" title="上次排名:28">26</strong><b class="ico_increase">&nbsp;</b></span></h1>
                        </div>
                        <div class="bm_c cl pbn">
                            <div>版主: <span class="xi2"><a href="home.php?mod=space&amp;username=%C4%AB%BC%A3" class="notabs" c="1" mid="card_4814">墨迹</a></span></div></div>
                    </div>



                    <div class="drag">
                        <!--[diy=diy4]--><div id="diy4" class="area"></div><!--[/diy]-->
                    </div>

                    <div id="pgt" class="bm bw0 pgs cl">
                        <%--<span id="fd_page_top"></span>
                        <span class="pgb y" id="visitedforums"   ><a href="forum.php">返&nbsp;回</a></span>
                        <a href="#f_pst" id="newspecial"    title="发新帖">
                            <img src="static/upload/postImg/pn_post.png" alt="发新帖"></a>--%>
                    </div>
                    <ul id="thread_types" class="ttp bm cl">
                        <li id="ttp_all"><a href="forum.php?mod=forumdisplay&amp;fid=39">全部</a></li>
                        <li>
                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=typeid&amp;typeid=34">骑行安全
                                <span class="xg1 num">60</span>
                            </a>
                        </li>
                        <li>
                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=typeid&amp;typeid=35">技术知识
                                <span class="xg1 num">51</span>
                            </a></li>
                        <li>
                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=typeid&amp;typeid=36">骑行装备
                                <span class="xg1 num">82</span>
                            </a>
                        </li>
                        <li>
                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=typeid&amp;typeid=37">经验交流
                                <span class="xg1 num">42</span>
                            </a>
                        </li>
                        <li>
                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=typeid&amp;typeid=38">求助解答
                                <span class="xg1 num">15</span>
                            </a>
                        </li>
                        <li class="xw1 a">
                            <a href="forum.php?mod=forumdisplay&amp;fid=39">其他
                                <span class="xg1 num">14</span>
                            </a>
                        </li>
                    </ul>
                    <script type="text/javascript">showTypes('thread_types');</script>
                    <div id="threadlist" class="tl bm bmw">
                        <div class="th">
                            <table cellspacing="0" cellpadding="0">
                                <tbody><tr>
                                    <th colspan="2">
                                        <div class="tf">
                                            <span id="atarget" onclick="setatarget(1)" class="y" title="在新窗口中打开帖子">新窗</span>
                                            <a id="filter_special" href="javascript:;" class="showmenu xi2" onclick="showMenu(this.id)">全部主题</a>&nbsp;
                                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=lastpost&amp;orderby=lastpost&amp;typeid=39" class="xi2">最新</a>&nbsp;
                                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=heat&amp;orderby=heats" class="xi2">热门</a>&nbsp;
                                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=hot" class="xi2">热帖</a>&nbsp;
                                            <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=digest&amp;digest=1&amp;typeid=39" class="xi2">精华</a>&nbsp;
                                            <a id="filter_dateline" href="javascript:;" class="showmenu xi2" onclick="showMenu(this.id)">更多</a>&nbsp;
                                            <span id="clearstickthread" style="display: none;">
<span class="pipe">|</span>
<a href="javascript:;" onclick="clearStickThread()" class="xi2" title="显示置顶">显示置顶</a>
</span>
                                        </div>
                                    </th>
                                    <td class="by">作者</td>
                                    <td class="num">回复/查看</td>
                                    <td class="by">最后发表</td>
                                </tr>
                                </tbody></table>
                        </div>
                        <div class="bm_c">
                            <script type="text/javascript">var lasttime = 1552216216;var listcolspan= '5';</script>
                            <div id="forumnew" style="display:none"></div>
                            <form method="post" autocomplete="off" name="moderate" id="moderate" action="forum.php?mod=topicadmin&amp;action=moderate&amp;fid=39&amp;infloat=yes&amp;nopost=yes">
                                <input type="hidden" name="formhash" value="fed9872a">
                                <input type="hidden" name="listextra" value="page%3D1%26filter%3Dtypeid%26typeid%3D39">
                                <table summary="forum_39" cellspacing="0" cellpadding="0" id="threadlisttableid">

                                </table><!-- end of table "forum_G[fid]" branch 1/3 -->
                            </form>
                            <div id="pageContrain" style="float: right;position:relative;right:-10px;"></div>
                        </div>
                    </div>

                    <div id="filter_special_menu" class="p_pop" style="display:none" change="location.href='forum.php?mod=forumdisplay&amp;fid=39&amp;filter='+$('filter_special').value">
                        <ul>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39">全部主题</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=poll&amp;typeid=39">投票</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=reward&amp;typeid=39">悬赏</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=debate&amp;typeid=39">辩论</a></li></ul>
                    </div>
                    <div id="filter_reward_menu" class="p_pop" style="display:none" change="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=reward&amp;typeid=39&amp;rewardtype='+$('filter_reward').value">
                        <ul>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=reward&amp;typeid=39">全部悬赏</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=specialtype&amp;specialtype=reward&amp;typeid=39&amp;rewardtype=1">进行中</a></li></ul>
                    </div>
                    <div id="filter_dateline_menu" class="p_pop" style="display:none">
                        <ul class="pop_moremenu">
                            <li>排序:
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=author&amp;orderby=dateline&amp;typeid=39">发帖时间</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=reply&amp;orderby=replies&amp;typeid=39">回复/查看</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=reply&amp;orderby=views&amp;typeid=39">查看</a>
                            </li>
                            <li>时间:
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;typeid=39" class="xw1">全部时间</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=86400&amp;typeid=39">一天</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=172800&amp;typeid=39">两天</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=604800&amp;typeid=39">一周</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=2592000&amp;typeid=39">一个月</a><span class="pipe">|</span>
                                <a href="forum.php?mod=forumdisplay&amp;fid=39&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=7948800&amp;typeid=39">三个月</a>
                            </li>
                        </ul>
                    </div>
                    <div id="filter_orderby_menu" class="p_pop" style="display:none">
                        <ul>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39">默认排序</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=author&amp;orderby=dateline&amp;typeid=39">发帖时间</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=reply&amp;orderby=replies&amp;typeid=39">回复/查看</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=reply&amp;orderby=views&amp;typeid=39">查看</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=lastpost&amp;orderby=lastpost&amp;typeid=39">最后发表</a></li>
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=39&amp;filter=heat&amp;orderby=heats">热门</a></li>
                        </ul>
                    </div>
                    <div class="bm bw0 pgs cl" style="margin-top:-8px;">
                        <span id="fd_page_bottom"></span>
                        <span id="visitedforumstmp" onmouseover="$('visitedforums').id = 'visitedforumstmp';this.id = 'visitedforums';showMenu({'ctrlid':this.id,'pos':'21'})" class="pgb y">
                            <a href="forum.php">返&nbsp;回</a></span>
                        <a href="javascript:;" id="newspecialtmp"
                           onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})" onclick="showWindow('newthread', 'forum.php?mod=post&amp;action=newthread&amp;fid=39')" title="发新帖">
                            <img src="static/upload/postImg/pn_post.png" alt="发新帖"></a></div>
                    <!--[diy=diyfastposttop]-->
                    <div id="diyfastposttop" class="area"></div><!--[/diy]-->
                    <script type="text/javascript">
                        var postminchars = parseInt('10');
                        var postmaxchars = parseInt('10000');
                        var disablepostctrl = parseInt('0');
                        var fid = parseInt('39');
                    </script>
                    <div id="f_pst" class="bm">
                        <div class="bm_h">
                            <h2>快速发帖</h2>
                        </div>
                        <div class="bm_c">
                            <form method="post"   id="fastpostform"  >

                                <div id="fastpostreturn" style="margin:-5px 0 5px"></div>

                                <div class="pbt cl">
                                    <div class="ftid">
                                        <select name="postCategoryId" id="typeid_fast" style="width: 150px !important;"    >

                                        </select>
                                    </div>
                                    标题:<input type="text" id="subject" name="title" class="px" value=""  tabindex="11" style="width: 25em;height:23px;">
                                    <span>还可输入 <strong id="checklen">80</strong> 个字符</span>
                                </div>

                                <div class="cl">
                                    <div id="fastsmiliesdiv" class="y">
                                        <div id="fastsmiliesdiv_data">
                                            <div id="fastsmilies"></div>
                                        </div>
                                    </div>
                                    <div class="hasfsl" id="fastposteditor">
                                        <div class="tedt">
                                            <div class="area">
                                                <textarea id="container" value="" name="content" style="width:95%;height:300px;">
                                                </textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="seccheck_fastpost">
                                    </div>
                                    <input type="hidden" name="postClassId" value="${param.contentId}">
                                </div>


                                <p class="ptm pnpost">
                                    <a href="home.php?mod=spacecp&amp;ac=credit&amp;op=rule&amp;fid=39" class="y" target="_blank">本版积分规则</a>
                                    <button type="submit"   id="fastpostsubmit" value="topicsubmit" tabindex="13" class="pn pnc">
                                        <strong>发表帖子</strong>
                                    </button>
                                    <label>
                                        <input type="checkbox" name="adddynamic" class="pc" value="1" checked="checked">转播给听众
                                    </label>
                                </p>
                            </form>
                        </div>
                    </div>
                    <!--[diy=diyforumdisplaybottom]-->
                    <div id="diyforumdisplaybottom" class="area"></div><!--[/diy]-->
                </div>

            </div>
        </div>

        <div id="visitedforums_menu" class="p_pop blk cl" style="display: none;">
            <table cellspacing="0" cellpadding="0">
                <tbody><tr>
                    <td id="v_forums">
                        <h3 class="mbn pbn bbda xg1">浏览过的版块</h3>
                        <ul class="xl xl1">
                            <li><a href="forum.php?mod=forumdisplay&amp;fid=46">“超越”极限骑行</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=62">潮汕骑行俱乐部</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=64">深圳折腾骑行</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=61">行天下骑行俱乐部</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=5">相约骑行</a></li><li><a href="forum.php?mod=forumdisplay&amp;fid=59">道卡斯俱乐部</a></li></ul>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <script type="text/javascript">document.onkeyup = function(e){keyPageScroll(e, 0, 0, 'forum.php?mod=forumdisplay&fid=39&filter=typeid&orderby=lastpost&typeid=39&', 1);}</script>
        <div class="wp mtn">
            <!--[diy=diy3]-->
            <div id="diy3" class="area"></div>
            <!--[/diy]-->
        </div>
        <script>fixed_top_nv();</script>	</div>

    <script charset="utf-8" src="kingeditor/kindeditor-all.js"></script>
    <script charset="utf-8" src="kingeditor/lang/zh-CN.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function(K) {
            window.editor = K.create('#container',{
                uploadJson : 'kingeditor/jsp/upload_json.jsp',
                fileManagerJson : 'kingeditor/jsp/file_manager_json.jsp',
                allowFileManager : true
            });
        });
    </script>


    <script>

    </script>

</body>



</body>
</html>
