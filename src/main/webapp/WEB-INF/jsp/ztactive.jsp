<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>专题活动</title>
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
    <link rel="stylesheet"   type="text/css" href="static/css/style_9_forum_index.css">
</head>

<style>
    .width{
        width: 80% !important;
    }
    #category_47 table dd,em ,dl dd{
        font-size:12px;
    }
</style>
<body>
<body class="pg_index">

<div id="hd">
    <div id="nextopsxx"></div>
    <%@include file="../../common.jsp"%>
    <div class="w1180">
        <div class="wp">
            <div id="wp" class="wp">
                <!--[diy=diy_chart]--><div id="diy_chart" class="area"></div><!--[/diy]-->
                <div id="pt" class="bm cl">
                    <div class="w1180">
                        <div class="z">
                            <a href="./" class="nvhm" title="首页">骑行天下</a><em>»</em><a href="forum.php">骑行圈</a>                </div>
                        <div class="z"></div>
                        <div class="clear"></div>
                    </div>
                </div>

                <div class="nex_ngepart">
                    <div class="nex_ngl">
                        <div class="nex_ngslider">
                            <!--[diy=nex_ngslider]--><div id="nex_ngslider" class="area"><div id="framepxQL6E" class="frame move-span cl frame-1">
                            <div id="framepxQL6E_left" class="column frame-1-c"><div id="framepxQL6E_left_temp" class="move-span temp"></div>
                                <div id="portal_block_647" class="block move-span">
                                    <div id="portal_block_647_content" class="dxb_bc">
                                        <div class="bd">
                                            <ul style="position: relative; width: 500px; height: 300px;">
                                                <li style="position: absolute; width: 500px; left: 0px; top: 0px; display: none;">
                                                    <div class="nex_ng_innre">
                                                        <div class="nex_ng_piv">
                                                            <a href="forum.php?mod=viewthread&amp;tid=139453" target="_blank">
                                                                <img src="static/upload/post//2e6d295b4fc94e319500bf3f29e39cc1.jpg" width="500" height="300"></a>
                                                        </div>
                                                        <div class="nex_ng_infos">
                                                            <div class="nex_ng_inInters">
                                                                <h5><a href="forum.php?mod=viewthread&amp;tid=139453" target="_blank">重磅预告！ 骑行天下第九届传统24H400KM即</a></h5>
                                                                <div class="nex_ng_btnh">
                                                                    <span>阅读：3060</span>
                                                                    <span>回复：5</span>
                                                                    <span>时间：06-12</span>
                                                                </div>
                                                            </div>
                                                            <div class="nex_ng_Avator">
                                                                <a href="home.php?mod=space&amp;uid=466&amp;do=profile" target="_blank">
                                                                    <img src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=466&amp;size=big"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li><li style="position: absolute; width: 500px; left: 0px; top: 0px; display: none;">
                                                <div class="nex_ng_innre">
                                                    <div class="nex_ng_piv">
                                                        <a href="forum.php?mod=viewthread&amp;tid=139239" target="_blank">
                                                            <img src="static/upload/post/6bc8339dd9c12742465435c5345dbc3e.jpg" width="500" height="300"></a>
                                                    </div>
                                                    <div class="nex_ng_infos">
                                                        <div class="nex_ng_inInters">
                                                            <h5><a href="forum.php?mod=viewthread&amp;tid=139239" target="_blank">不忘初心  继续骑行----记2017夜袭例骑珠海</a></h5>
                                                            <div class="nex_ng_btnh">
                                                                <span>阅读：1824</span>
                                                                <span>回复：35</span>
                                                                <span>时间：10-07</span>
                                                            </div>
                                                        </div>
                                                        <div class="nex_ng_Avator">
                                                            <a href="home.php?mod=space&amp;uid=83242&amp;do=profile" target="_blank">
                                                                <img src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=83242&amp;size=big"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li><li style="position: absolute; width: 500px; left: 0px; top: 0px; display: list-item;">
                                                <div class="nex_ng_innre">
                                                    <div class="nex_ng_piv">
                                                        <a href="forum.php?mod=viewthread&amp;tid=139457" target="_blank">
                                                            <img src="static/upload/post/ae18eb9286443ce6532cf2296b4f702f.jpg" width="500" height="300"></a>
                                                    </div>
                                                    <div class="nex_ng_infos">
                                                        <div class="nex_ng_inInters">
                                                            <h5><a href="forum.php?mod=viewthread&amp;tid=139457" target="_blank">2018-深圳车友七月欢聚马峦山（第六届）</a></h5>
                                                            <div class="nex_ng_btnh">
                                                                <span>阅读：866</span>
                                                                <span>回复：8</span>
                                                                <span>时间：06-21</span>
                                                            </div>
                                                        </div>
                                                        <div class="nex_ng_Avator">
                                                            <a href="home.php?mod=space&amp;uid=44123&amp;do=profile" target="_blank">
                                                                <img src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=44123&amp;size=big"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li><li style="position: absolute; width: 500px; left: 0px; top: 0px; display: none;">
                                                <div class="nex_ng_innre">
                                                    <div class="nex_ng_piv">
                                                        <a href="forum.php?mod=viewthread&amp;tid=139325" target="_blank">
                                                            <img src="static/upload/post//10f45476e7ca92cb65eabb49cd0db65b.jpg" width="500" height="300"></a>
                                                    </div>
                                                    <div class="nex_ng_infos">
                                                        <div class="nex_ng_inInters">
                                                            <h5><a href="forum.php?mod=viewthread&amp;tid=139325" target="_blank">梦想流连马峦山，飞翔不尽三洲田(2017）</a></h5>
                                                            <div class="nex_ng_btnh">
                                                                <span>阅读：600</span>
                                                                <span>回复：5</span>
                                                                <span>时间：12-06</span>
                                                            </div>
                                                        </div>
                                                        <div class="nex_ng_Avator">
                                                            <a href="home.php?mod=space&amp;uid=44123&amp;do=profile" target="_blank">
                                                                <img src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=44123&amp;size=big"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li><li style="position: absolute; width: 500px; left: 0px; top: 0px; display: none;">
                                                <div class="nex_ng_innre">
                                                    <div class="nex_ng_piv">
                                                        <a href="forum.php?mod=viewthread&amp;tid=139216" target="_blank">
                                                            <img src="static/upload/post//bf9cb1a1e0b35a9eac97622fb761208e.jpg" width="500" height="300"></a>
                                                    </div>
                                                    <div class="nex_ng_infos">
                                                        <div class="nex_ng_inInters">
                                                            <h5><a href="forum.php?mod=viewthread&amp;tid=139216" target="_blank">相约2017广东体育博览会 ---尚高在路上！</a></h5>
                                                            <div class="nex_ng_btnh">
                                                                <span>阅读：536</span>
                                                                <span>回复：0</span>
                                                                <span>时间：09-26</span>
                                                            </div>
                                                        </div>
                                                        <div class="nex_ng_Avator">
                                                            <a href="home.php?mod=space&amp;uid=25085&amp;do=profile" target="_blank">
                                                                <img src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=25085&amp;size=big"></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li></ul>
                                        </div></div></div></div></div></div><!--[/diy]-->

                            <div class="hd">
                                <ul>
                                    <li class="">1</li>
                                    <li class="">2</li>
                                    <li class="on">3</li>
                                    <li class="">4</li>
                                    <li class="">5</li>
                                </ul>
                            </div>
                            <div class="timer" style="width: 46.292%; overflow: hidden;"></div>
                        </div>
                        <script type="text/javascript">
                            jQuery(".nex_ngslider").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click",
                                mouseOverStop:true,
                                startFun:function(){
                                    var timer = jQuery(".nex_ngslider .timer");
                                    timer.stop(true,true).animate({ "width":"0%" },0).animate({ "width":"100%" },3500);
                                }
                            });
                        </script>
                    </div>
                    <div class="nex_ngr">
                        <div class="nex_ngr_Tops">
                            <!--[diy=nex_ngr_Tops]--><div id="nex_ngr_Tops" class="area"><div id="frameRR6cZv" class="frame move-span cl frame-1"><div id="frameRR6cZv_left" class="column frame-1-c"><div id="frameRR6cZv_left_temp" class="move-span temp"></div><div id="portal_block_649" class="block move-span"><div id="portal_block_649_content" class="dxb_bc"><h5><a href="forum.php?mod=viewthread&amp;tid=139239" target="_blank">不忘初心  继续骑行----记2017夜袭例骑珠海</a></h5>
                            <p>
                                2017年10月6日晚上，深圳至珠海的夜色中，沿着S111西行方向的路上，依稀隐约的骑行身影，一路与车为伴，与影相随，直奔珠海情侣路，渔女
                                <a href="forum.php?mod=viewthread&amp;tid=139239" target="_blank">[More]</a></p></div></div></div></div></div><!--[/diy]-->

                        </div>
                        <div class="nex_tabtops">
                            <ul>
                                <li class="in">最<br>新</li>
                                <li>热<br>门</li>
                                <li>精<br>华</li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <div class="nex_tabbom">
                            <ul>
                                <li style="display:block;">
                                    <div class="nex_tablists">
                                        <dl>
                                            <!--[diy=nex_tablists]--><div id="nex_tablists" class="area"><div id="frameu6mL5R" class="frame move-span cl frame-1"><div id="frameu6mL5R_left" class="column frame-1-c"><div id="frameu6mL5R_left_temp" class="move-span temp"></div><div id="portal_block_650" class="block move-span"><div id="portal_block_650_content" class="dxb_bc"><dd>
                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=42" target="_blank">[二手交易]</a>
                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139521" target="_blank">花都.大行p18.p8.d8.406.折叠车.弯把.有票</a>
                                            <em>2018-10-31</em>
                                            <div class="clear"></div>
                                        </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=39" target="_blank">[骑行安全、技术装备交流]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139520" target="_blank">把多余的自行车刹线剪短会影响安全吗？</a>
                                                <em>2018-10-27</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=39" target="_blank">[骑行安全、技术装备交流]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139518" target="_blank">JacquesFarelDream(中国“梦”)系列手表—即将上市</a>
                                                <em>2018-10-16</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139515" target="_blank">8个不当自行车运动使膝盖受损的原因</a>
                                                <em>2018-10-12</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139514" target="_blank">骑单车的7+1个好处</a>
                                                <em>2018-10-12</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139513" target="_blank">喜欢骑行的你，是这样的吗？</a>
                                                <em>2018-10-12</em>
                                                <div class="clear"></div>
                                            </dd>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div><!--[/diy]-->

                                        </dl>
                                    </div>
                                </li>
                                <li>
                                    <div class="nex_tablists">
                                        <dl>
                                            <!--[diy=nex_tablists1]--><div id="nex_tablists1" class="area">
                                            <div id="framewmiQq8" class="frame move-span cl frame-1"><div id="framewmiQq8_left" class="column frame-1-c">
                                                <div id="framewmiQq8_left_temp" class="move-span temp">
                                                </div>
                                                <div id="portal_block_651" class="block move-span">
                                                    <div id="portal_block_651_content" class="dxb_bc">
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139239" target="_blank">不忘初心  继续骑行----记2017夜袭例骑珠海渔女</a>
                                                            <em>2017-10-07</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139331" target="_blank">嘟爸2千里单骑滇藏线(昆明-拉萨）-2017年9月骑行游记</a>
                                                            <em>2017-12-09</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=5" target="_blank">[相约骑行]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139457" target="_blank">2018-深圳车友七月欢聚马峦山（第六届）</a>
                                                            <em>2018-06-21</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=5" target="_blank">[相约骑行]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139470" target="_blank">2018 湾区勇士聚己峦照片分享</a>
                                                            <em>2018-07-09</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=9" target="_blank">[骑行分享]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139325" target="_blank">梦想流连马峦山，飞翔不尽三洲田(2017）</a>
                                                            <em>2017-12-06</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                        <dd>
                                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=46" target="_blank">[“超越”极限骑行]</a>
                                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=139453" target="_blank">重磅预告！ 骑行天下第九届传统24H400KM即将发布！！！</a>
                                                            <em>2018-06-12</em>
                                                            <div class="clear"></div>
                                                        </dd>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                        </div><!--[/diy]-->
                                        </dl>
                                    </div>
                                </li>
                                <li>
                                    <div class="nex_tablists">
                                        <dl>
                                            <!--[diy=nex_tablists2]--><div id="nex_tablists2" class="area"><div id="frameyaDt6A" class="frame move-span cl frame-1"><div id="frameyaDt6A_left" class="column frame-1-c"><div id="frameyaDt6A_left_temp" class="move-span temp"></div><div id="portal_block_652" class="block move-span"><div id="portal_block_652_content" class="dxb_bc"><dd>
                                            <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=43" target="_blank">[长途远行；4+2]</a>
                                            <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=1926" target="_blank">大美滇藏，人在路上(全篇完)</a>
                                            <em>2008-11-22</em>
                                            <div class="clear"></div>
                                        </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=43" target="_blank">[长途远行；4+2]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=5017" target="_blank">追寻梦想 骑行天路（第4页开始现场直播川藏线及唐蕃古道线）</a>
                                                <em>2010-07-05</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=43" target="_blank">[长途远行；4+2]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=6796" target="_blank">曾经,我骑行走过一段旅程叫G318...</a>
                                                <em>2011-09-28</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=43" target="_blank">[长途远行；4+2]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=285" target="_blank">即时报导"三剑侠"深圳----和平故乡之行情况(7月4日至7日)</a>
                                                <em>2007-07-04</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=38" target="_blank">[行行色色]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=48" target="_blank">家乡选拍(图)-----</a>
                                                <em>2007-06-01</em>
                                                <div class="clear"></div>
                                            </dd>
                                            <dd>
                                                <a class="nex_Tag_lebs" href="forum.php?mod=forumdisplay&amp;fid=5" target="_blank">[相约骑行]</a>
                                                <a class="nex_Tag_texts" href="forum.php?mod=viewthread&amp;tid=1648" target="_blank">080901滇藏之行36天骑行圆满成功(最新照片24页开始)</a>
                                                <em>2008-08-29</em>
                                                <div class="clear">

                                                </div>
                                            </dd>
                                        </div>
                                        </div>
                                        </div>
                                        </div>
                                        </div><!--[/diy]-->
                                        </dl>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <script type="text/javascript">
                            jq(".nex_tabtops ul li").each(function(s){
                                jq(this).click(function(){
                                    jq(this).addClass("in").siblings().removeClass("in");
                                    jq(".nex_tabbom ul li").eq(s).show().siblings().hide();
                                })
                            })
                        </script>
                    </div>
                    <div class="clear"></div>
                </div>


                <div class="nex_linked">
                    <ul>
                        <!--[diy=nex_tablists21]--><div id="nex_tablists21" class="area"></div><!--[/diy]-->

                        <div class="clear"></div>
                    </ul>
                </div>


                <style id="diy_style" type="text/css"></style>

                <div class="wp">
                    <!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->
                </div>
                <div class="w1180">
                    <div id="ct" class="wp cl">

                        <div class="mn">
                            <div id="chart" class="bm bw0 cl">
                                <p class="chart z">
                                    <span class="nex_jinri">今日<br>4161</span><span class="nex_zuori">昨日<br>1</span><span class="nex_tiezishu">帖子<br>455551</span><span class="nex_shuzi">会员<br>1165047</span></p>
                                <div class="y">
                                    <a href="forum.php?mod=guide&amp;view=new" title="最新回复" class="xi2">最新回复</a>
                                    <span class="pipe">|</span>欢迎新会员: <em>
                                    <a href="home.php?mod=space&amp;username=opoo" target="_blank" class="xi2">opoo</a></em>
                                </div>
                            </div>

                            <div class="fl bm">
                                <%--开始--%>
                                <c:forEach items="${bankuais}" var="vo" varStatus="index">
                                    <div class="bm bmw  flg cl">
                                        <div class="bm_h cl">
                                    <span class="o">
                                        <img id="category_4_img" src="static/upload/post/collapsed_no.gif" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_4');">
                                    </span>
                                       <span class="y">分区版主: <a href="home.php?mod=space&amp;username=%C3%A8%BC%C5" class="notabs" c="1" mid="card_2202">猫寂</a>,
                                       <a href="home.php?mod=space&amp;username=%CE%F7%C0%F6%B0%A2%CE%F7" class="notabs" c="1" mid="card_4452">西丽阿西</a>,
                                       <a href="home.php?mod=space&amp;username=%A1%EF%C2%FC%C1%AA%A1%EF" class="notabs" c="1" mid="card_8224">★曼联★</a>,
                                       <a href="home.php?mod=space&amp;username=%B3%D0%C5%B5" class="notabs" c="1" mid="card_7684">承诺</a>,
                                       <a href="home.php?mod=space&amp;username=%B0%BF%CF%E8" class="notabs" c="1" mid="card_6556">翱翔</a>,
                                       <a href="home.php?mod=space&amp;username=%C3%CE%CF%EB%B7%C9%CF%E8" class="notabs" c="1" mid="card_7136">梦想飞翔</a>,
                                       <a href="home.php?mod=space&amp;username=%A1%B0%D4%B5%A1%B1%D4%B4%B2%BB%B6%CF" class="notabs" c="1" mid="card_5117">“缘”源不断</a>,
                                       <a href="home.php?mod=space&amp;username=%DB%E0%CC%EF-%C1%F9%D4%C2" class="notabs" c="1" mid="card_377">坂田-六月</a>
                                    </span>
                                            <h4><a href="forum.php?gid=4" style="">»${vo.name}</a></h4>
                                        </div>
                                        <div id="category_4" class="bm_c" style="">
                                            <table cellspacing="0" cellpadding="0" class="fl_tb">
                                                <tbody>
                                                <c:forEach items="${vo.postclassList}" var="postVo" varStatus="index2">
                                                    <c:set var="me" value="${index2.index+1}" />
                                                    <c:if test="${index2.index==0||index2.index%3==0}">
                                                        <tr>
                                                    </c:if>
                                                    <td class="fl_g" width="32.9%">
                                                        <div class="fl_icn_g nex_bbs_icon nex_actions fadeIn" style="width: 100px;">
                                                            <a href="postsAction/queryPostInfo?banKuaiClassId=${postVo.id}">
                                                                <img src="${postVo.coverImg}" align="left" alt=""></a>                                                                                                                                        <div class="nex_todayposts_bbs" title="今日"> 131</div>
                                                        </div>
                                                        <dl style="margin-left: 100px;">
                                                            <dt>
                                                                <a href="postsAction/queryPostInfo?banKuaiClassId=${postVo.id}">${postVo.name}</a>
                                                            </dt>
                                                            <em>主题: 3981</em>&nbsp;<em>帖数: <span title="144211">14万</span></em>
                                                            <dd class="xg2">骑行相约，活动回放，突破自我，挑战极限！</dd>
                                                            <dd>
                                                                <em>本版还没有任何帖子</em>
                                                            </dd>
                                                        </dl>
                                                    </td>
                                                    <c:if test="${vo.postclassList.size()==2&&index2.index==1}">
                                                        <td></td>
                                                    </c:if>
                                                    <c:if test="${me!=0&&me%3==0}">
                                                        </tr>
                                                    </c:if>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <div class="mtn">
                                <!--[diy=diy3]--><div id="diy3" class="area"></div><!--[/diy]-->
                            </div>

                            <div id="online" class="bm oll">
                                <div class="bm_h">
                                    <span class="o"><a href="forum.php?showoldetails=no#online" title="收起/展开">
                                        <img src="static/upload/post/collapsed_no.gif" alt="收起/展开"></a></span>
                                    <h3>
                                        <strong><a href="home.php?mod=space&amp;do=friend&amp;view=online&amp;type=member">在线会员</a></strong>
                                        <span class="xs1">- <strong>387</strong> 人在线
                                    - <strong>1</strong> 会员(<strong>0</strong> 隐身),
                                    <strong>386</strong> 位游客
                                    - 最高记录是 <strong>11000</strong> 于 <strong>2016-7-1</strong>.</span>
                                    </h3>
                                </div>
                                <dl id="onlinelist" class="bm_c">
                                    <dt class="ptm pbm bbda">
                                        <img src="static/upload/icon/online_admin.gif"> 管理员 &nbsp; &nbsp; &nbsp;
                                        <img src="static/upload/icon/online_supermod.gif"> 超级版主 &nbsp; &nbsp; &nbsp;
                                        <img src="static/upload/icon/online_moderator.gif"> 版主 &nbsp; &nbsp; &nbsp;
                                        <img src="static/upload/icon/vip.jpg"> 贵宾 &nbsp; &nbsp; &nbsp;
                                        <img src="static/upload/icon/online_member.gif"> 会员 &nbsp; &nbsp; &nbsp;
                                    </dt>
                                    <dd class="ptm pbm">
                                        <ul class="cl">
                                            <li title="时间: 19:07">
                                                <img src="static/upload/icon/online_member.gif" alt="icon">
                                                <a href="home.php?mod=space&amp;uid=180924">高和之</a>
                                            </li>
                                        </ul>
                                    </dd>
                                </dl>
                            </div>
                            <div class="bm lk">
                                <div id="category_lk" class="bm_c ptm">
                                    <ul class="x mbm cl">
                                        <li><a href="http://cycling.sport.org.cn/" target="_blank" title="中国自行车运动协会">中国自行车运动协会</a></li><li><a href="http://www.race51.com" target="_blank" title="赛事无忧">赛事无忧</a></li><li><a href="http://bbs.biketo.com" target="_blank" title="biketo美骑论坛 ">biketo美骑论坛 </a></li><li><a href="http://www.gocycling.cn" target="_blank" title="深圳国际自行车嘉年华">深圳国际自行车嘉年华</a></li><li><a href="http://www.szmb.gov.cn/article/TianQiYuBao/" target="_blank" title="深圳气象查询">深圳气象查询</a></li>                                </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>fixed_top_nv();</script>	</div>
        </div>
    </div>



</body>



</body>
</html>
