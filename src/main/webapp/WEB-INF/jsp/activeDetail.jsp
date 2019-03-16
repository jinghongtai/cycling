<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <title>活动报名-骑行天下-活动详情!</title>
    <link rel="stylesheet"   type="text/css" href="static/css/style_9_widthauto.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_9_common.css">
    <script type="text/javascript">/*HTMLNODE.className += ' widthauto'*/</script>
    <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        var jq=jQuery.noConflict();
    </script>
    <script src="static/js/jquery.flexslider-min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function(){
            jQuery('.flexslider').flexslider({
                directionNav: true,
                pauseOnAction: true
            });
        });
    </script>

    <script src="static/js/nexactions.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="static/js/animate.min.css">
    <script>
        var wow = new WOW({boxClass: 'nexactions',});wow.init();
    </script>
    <script src="static/js/jquery.pagnation.js" type="text/javascript"></script>
    <script type="text/javascript" src="static/js/jquery.SuperSlide.2.1.1.js"></script>

    <script type="text/javascript">
        jQuery(function(){
            jQuery('#nexGoToTop').click(function(){jQuery('html,body').animate({scrollTop:jQuery('#nextopsxx').offset().top}, 600);});})
    </script>
    <script language="javascript" type="text/javascript">
        function killErrors() {
            return true;
        }
        window.onerror = killErrors;
    </script>
</head>
<body id="nv_plugin" class="pg_dpw_activity" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div><div id="ajaxwaitid"></div>
<div id="toptb" class="cl" style="display:none;">
    <div class="wp">
        <div class="z"><a href="forum.php?mobile=yes">手机版</a><a href="sale.php">二手</a></div>
        <div class="y">
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="nex_plugin_reserved">
    <div class="w1180">
        <div class="z">
        </div>
        <div class="y">
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="qmenu_menu" class="p_pop blk" style="display: none;">
    <div class="ptm pbw hm">
        请 <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>登录</strong></a>
        后使用快捷导航<br>没有帐号？<a href="member.php?mod=zhuc" class="xi2 xw1">注  册</a>
    </div>
    <div id="fjump_menu" class="btda"></div>
</div>
<div id="hd">
    <div id="nextopsxx"></div>
    <%@include file="../../common.jsp"%>
    <li id="scrolltop" style="left: auto; right: 0px; visibility: hidden;">
        <div class="nexstout nexstout_up">
            <a id="nexGoToTop">
                <img src="template/nex_enterprise_180102/neoconex/sidetools/up.png">
                <span>返回顶部</span>
            </a>
        </div>

    </li>

</div>
<script type="text/javascript" src="static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    $(function(){

        /**
         * 点击页码
         */
        $("body").on("click","div.click>a",function(){
            $(this).parent().find(".pageBloak").removeClass("pageBloak");
            $(this).addClass("pageBloak")
            var page = $(this).attr("page");
            alert(page);
        })




    });


</script>
<div class="wp">
    <div class="hdc cl">



    </div>


    <div class="p_pop h_pop" id="mn_userapp_menu" style="display: none"></div><ul class="p_pop h_pop" id="mn_N5258_menu" style="display: none"><li><a href="http://www.qxworld.com" hidefocus="true">江河万里</a></li><li><a href="http://www.24h400km.com/" hidefocus="true">24H400KM</a></li></ul><div id="mu" class="cl">
    <ul class="cl " id="snav_mn_userapp" style="display:none">
    </ul>
</div></div>



<div id="wp" class="wp">
    <div id="pt" class="bm cl place">
        <div class="z"> <a href="./" class="nvhm" title="首页">骑行天下</a><em>»</em><a href="plugin.php?id=dpw_activity:activity">活动报名</a><em> › </em>
        </div>
    </div>
    <style id="diy_style" type="text/css"></style>
    <!--[diy=diy11]-->
    <div id="diy11" class="area"></div>
    <!--[/diy]--><script src="static/js/focusimg.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="static/css/css.focus.css">
    <div class="bm cl mx_focus_img" style="display:none;">
        <div class="mx_big_area">
            <div class="mx_big_img" id="con_1" style="width: 685px; height: 278px; overflow: hidden;">
                <div><a target="_blank" href=""><img width="685" height="278" src="./source/plugin/dpw_activity/image/adtop4.jpg"></a>
                </div>
            </div>
            <div class="mx_titlebg"></div>
            <h3 id="h2title">探险佳户外运动</h3>
            <div id="intro" style="dispaly:none;"><span>探险佳户外运动俱乐部定位于进行户外活动信息交流的俱乐部</span></div>
        </div>
        <div class="mx_thurmb" id="con_2"><div class="small_div">
            <a target="_blank" href="">
                <img src="./source/plugin/dpw_activity/image/adtop2.jpg">
                <span>参与活动的志愿者务必有爱心,有耐心,喜欢老人、幼儿，善于与人善于Ç</span>
            </a></div>
            <div class="small_div ">
                <a target="_blank" href="">
                    <img src="./source/plugin/dpw_activity/image/adtop1.jpg">
                    <span>菲魅肚皮舞，用料足，设计感强，万能的蕾丝和流苏，又是连体服，又有</span></a>
            </div>
            <div class="small_div "><a target="_blank" href="">
                <img src="./source/plugin/dpw_activity/image/adtop3.jpg"><span>探险佳户外运动俱乐部定位于进行户外活动信息交流的俱乐部,倡导自助&amp;#</span>
            </a></div><div class="small_div  selected">
                <a target="_blank" href=""><img src="./source/plugin/dpw_activity/image/adtop4.jpg">
                    <span>探险佳户外运动俱乐部定位于进行户外活动信息交流的俱乐部</span></a>
            </div>
        </div>
    </div>
    <!--focus_img end-->
    <script type="text/javascript">
        var focusImg= new FocusImg();
        focusImg.bigDiv="con_1";
        focusImg.smallDiv="con_2";
        focusImg.imgW=685;
        focusImg.imgH=278;
        focusImg.sTime=5000;
        focusImg.titleDiv="h2title";
        focusImg.introDiv="intro";
        var s = {};
        s.bigimg="./source/plugin/dpw_activity/image/adtop2.jpg";
        s.title="月满中秋，情暖湛江";
        s.intro="<span>参与活动的志愿者务必有爱心,有耐心,喜欢老人、幼儿，善于与人善于&#199;</span>";
        s.url="";
        focusImg.imgList.push(s);

        var s = {};
        s.bigimg="./source/plugin/dpw_activity/image/adtop1.jpg";
        s.title="菲魅肚皮舞";
        s.intro="<span>菲魅肚皮舞，用料足，设计感强，万能的蕾丝和流苏，又是连体服，又有</span>";
        s.url="";
        focusImg.imgList.push(s);

        var s = {};
        s.bigimg="./source/plugin/dpw_activity/image/adtop3.jpg";
        s.title="探险佳户外运动";
        s.intro="<span>探险佳户外运动俱乐部定位于进行户外活动信息交流的俱乐部,倡导自助&#</span>";
        s.url="";
        focusImg.imgList.push(s);

        var s = {};
        s.bigimg="./source/plugin/dpw_activity/image/adtop4.jpg";
        s.title="探险佳户外运动";
        s.intro="<span>探险佳户外运动俱乐部定位于进行户外活动信息交流的俱乐部</span>";
        s.url="";
        focusImg.imgList.push(s);



        focusImg.init();
        focusImg.autoPlay();
    </script>
    <div class="ct2 wp cl" style="width:1200px;margin:0 auto">
        <div id="activity_ad" class="bm"></div>
        <div class="mxi_main z">
            <!--[diy=diy2]-->
            <div id="diy2" class="area"></div>
            <!--[/diy]-->




            <div class="activity-lx">

                <div class="">
                    <dl class="tabar" id="tabar_1">
                         cccc

                    </dl>
                </div>





            </div>
        </div>
        <div class="mxi_side y">
            <div class="acenter cl">
                <ul>
                    <li class="z"> <a class="dpwptn dpwb2 brs" href="index/newactive"> 快速发布 </a> </li>
                    <li class="y"> <a class="dpwptn dpwb2 brs " href="home.php?mod=space&amp;do=activity&amp;view=me"> 我的活动 </a> </li>
                </ul>
            </div>
            <!--[diy=diy14]-->
            <div id="diy14" class="area"></div>
            <!--[/diy]-->
            <div class="bm">
                <div class="bm_h cl">
                    <h2>活动日历</h2>
                </div>
                <div class="calendar" id="calendar">
                    <table border="0" cellpadding="0" cellspacing="0">
                        <tbody><tr>
                            <td colspan="7" class="bar">
                                &nbsp;<a href="javascript:ajaxget('plugin.php?id=dpw_activity:activity&amp;mod=ajax&amp;do=calendar&amp;year=2018&amp;month=3', 'calendar');" title="上一年">«</a> 2019 年
                                <a href="javascript:ajaxget('plugin.php?id=dpw_activity:activity&amp;mod=ajax&amp;do=calendar&amp;year=2020&amp;month=3', 'calendar');" title="下一年">»</a> &nbsp;<a href="javascript:ajaxget('plugin.php?id=dpw_activity:activity&amp;mod=ajax&amp;do=calendar&amp;year=2019&amp;month=2','calendar');" title="上一月">«</a> <a href="plugin.php?id=dpw_activity:activity&amp;date=201903">3</a> 月&nbsp;<a href="javascript:ajaxget('plugin.php?id=dpw_activity:activity&amp;mod=ajax&amp;do=calendar&amp;year=2019&amp;month=4','calendar');" title="下一月">»</a> </td>
                        </tr>
                        <tr class="weekheader">
                            <td>日</td>
                            <td>一</td>
                            <td>二</td>
                            <td>三</td>
                            <td>四</td>
                            <td>五</td>
                            <td>六</td>
                        </tr>
                        <tr class="days">
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                        <tr class="days">
                            <td><span class="today">3</span></td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                            <td>9</td>
                        </tr>
                        <tr class="days">
                            <td><span class="sunday"> 10</span></td>
                            <td>11</td>
                            <td>12</td>
                            <td>13</td>
                            <td>14</td>
                            <td>15</td>
                            <td>16</td>
                        </tr>
                        <tr class="days">
                            <td><span class="sunday"> 17</span></td>
                            <td>18</td>
                            <td>19</td>
                            <td>20</td>
                            <td>21</td>
                            <td>22</td>
                            <td>23</td>
                        </tr>
                        <tr class="days">
                            <td><span class="sunday"> 24</span></td>
                            <td>25</td>
                            <td>26</td>
                            <td>27</td>
                            <td>28</td>
                            <td>29</td>
                            <td>30</td>
                        </tr>
                        <tr class="days">
                            <td><span class="sunday"> 31</span></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody></table>
                </div>
            </div>

            <div class="bm">
                <div class="bm_h cl">
                    <h2> 热心的活动组织者 TOP10 </h2>
                </div>
                <div class="block module cl xl xl1">
                    <ol>
                        <li><em>185次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=107692&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=107692&amp;do=profile" title="楚留香" c="1" target="_blank" mid="card_6623">楚留香</a></li>
                        <li><em>112次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=83242&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=83242&amp;do=profile" title="★曼联★" c="1" target="_blank" mid="card_2483">★曼联★</a></li>
                        <li><em>68次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=44123&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=44123&amp;do=profile" title="梦想飞翔" c="1" target="_blank" mid="card_6331">梦想飞翔</a></li>
                        <li><em>32次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=62588&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=62588&amp;do=profile" title="老三" c="1" target="_blank" mid="card_4282">老三</a></li>
                        <li><em>30次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=35&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=35&amp;do=profile" title="猫寂" c="1" target="_blank" mid="card_8023">猫寂</a></li>
                        <li><em>28次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=47256&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=47256&amp;do=profile" title="可乐男" c="1" target="_blank" mid="card_9746">可乐男</a></li>
                        <li><em>27次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=85363&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=85363&amp;do=profile" title="悟心" c="1" target="_blank" mid="card_5132">悟心</a></li>
                        <li><em>23次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=132066&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=132066&amp;do=profile" title="西丽阿西" c="1" target="_blank" mid="card_7579">西丽阿西</a></li>
                        <li><em>21次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=79887&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=79887&amp;do=profile" title="§随缘§" c="1" target="_blank" mid="card_8660">§随缘§</a></li>
                        <li><em>21次</em><img class="vm" src="http://www.qxworld.com/bbs/uc_server/avatar.php?uid=10&amp;size=small" width="16" height="16"> <a href="home.php?mod=space&amp;uid=10&amp;do=profile" title="桃源闲人" c="1" target="_blank" mid="card_8906">桃源闲人</a></li>
                    </ol>
                </div>

            </div>
            <div id="diy13" class="area"></div>
        </div>
    </div>
    <script src="static/js/jquery.js" type="text/javascript"></script>
    <script src="static/js//activity.js" type="text/javascript"></script>
    <script src="static/js/validators.js" type="text/javascript"></script>
    <script type="text/javascript">
        var jquery = jQuery.noConflict(); //解决JS 冲突
        function ijoin(tid,e){
            var cancel='';
            if(e){var cancel="&cancel=1";}
            var query = "plugin.php?id=dpw_activity:activity&amp;mod=ajax&amp;do=getjoin&amp;tid="+tid+cancel;
            url  = query.replace(eval("/&amp;/gi"),"&");
            jquery.get((SITEURL + url), function(data){
                showDialog(data, 'info', '我要参加');
                var payvalueOBJ = jquery(data).find('#payvalue');
                if(payvalueOBJ && !isNaN(payvalueOBJ.val()) ){
                    var cost = payvalueOBJ.val();
                    jquery("#myfriends").keyup(function(){
                        var myfriends = jquery('#myfriends').val();
                        jquery('#payvalue').val(!isNaN(myfriends) ? Math.ceil((parseInt(myfriends )+1)  * cost ) : 0 );
                    });
                }
            });
        }
        var tabara =jQuery('#tabar a');
        jQuery('#tabar a').click(function(){
            tabara.removeClass('curTaber');
            jQuery(this).addClass('curTaber')

        })
        function friend_ext(){
            var add= '<span><input type="text" name="friends_ext[]" id="friends_ext"width="150" maxlength="200" class="px mtm" value="" /> <img style="cursor:pointer"src="static/image/common/access_disallow.gif"onClick="friend_ext_del(this);"  /></span>';
            jQuery(add).appendTo(jQuery('#firendexts'))
        }
        function friend_ext_del(obj){
            jQuery(obj).parents('span').remove();
        }
    </script>	</div>


<script type="text/javascript">var cookieLogin = Ajax("TEXT");cookieLogin.get("connect.php?mod=check&op=cookie", function() {});</script>



<script type="text/javascript">
    _attachEvent(window, 'load', getForbiddenFormula, document);
    function getForbiddenFormula() {
        var toGetForbiddenFormulaFIds = function () {
            ajaxget('plugin.php?id=cloudsearch&formhash=8aaf009c');
        };
        var a = document.body.getElementsByTagName('a');
        for(var i = 0;i < a.length;i++){
            if(a[i].getAttribute('sc')) {
                a[i].setAttribute('mid', hash(a[i].href));
                a[i].onmousedown = function() {toGetForbiddenFormulaFIds();};
            }
        }
        var btn = document.body.getElementsByTagName('button');
        for(var i = 0;i < btn.length;i++){
            if(btn[i].getAttribute('sc')) {
                btn[i].setAttribute('mid', hash(btn[i].id));
                btn[i].onmousedown = function() {toGetForbiddenFormulaFIds();};
            }
        }
    }
</script>


<div class="nexfooter">
    <div class="nexfttop">
        <div class="w1180">
            <div class="nexfttop_L">
                <ul>
                    <li>
                        <h4>关于</h4>
                        <div class="clear"></div>
                        <a href="#" target="_blank">关于我们</a>
                        <a href="http://www.qxworld.com/about/contact.php" target="_blank">联系我们</a>
                        <a href="http://www.qxworld.com/about/suggest.php" target="_blank">投诉建议</a>
                        <a href="#" target="_blank">条款</a>

                    </li>
                    <li>
                        <!------<h4>价格与服务</h4>
                    <div class="clear"></div>
                    <a href="#" target="_blank">产品价格</a>
                    <a href="#" target="_blank">服务条款</a>
                    <a href="#" target="_blank">常见问题</a>
                </li>
                <li>------->
                        <!------<h4>资源</h4>
                    <div class="clear"></div>
                    <a href="#" target="_blank">帮助文档</a>
                    <a href="#" target="_blank">开放API</a>
                    <a href="#" target="_blank">问答社区</a>
                    <a href="#" target="_blank">技术博客</a>
                </li>
                <li>------->
                        <!------<h4>关于</h4>
                    <div class="clear"></div>
                    <a href="#" target="_blank">关于我们</a>
                    <a href="#" target="_blank">合作伙伴</a>
                    <a href="#" target="_blank">媒体报道</a>
                    <a href="#" target="_blank">联系我们</a>
                    <a href="#" target="_blank">友情链接</a>
                </li>------->
                    </li><li class="nex_ft_contacts">
                    <h4>联系方式</h4>
                    <div class="clear"></div>
                    <div class="nexft_teltxt nexft_teltxt1">服务热线：</div>
                    <div class="nexft_telnum">0755-86134949</div>

                    <div class="nexft_adds">深圳市南山区高新园北六道兰光科技大厦C713</div>
                    <div class="nexft_teltxt">用户支持：</div>
                    <a href="mailto:szqxtx@szqxtx.net">szqxtx@szqxtx.net</a>
                </li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="nexfttop_R">
                <div class="nexft_gzbox">
                    <h3>微信二维码</h3>
                    <p>扫一扫Get更多资讯</p>
                    <div class="nexft_gzimg"><img src="template/nex_enterprise_180102/neoconex/footer/wechat.gif"></div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="nexftbottom">
        <div class="w1180">
            <p>Powered by <a href="http://www.discuz.net" target="_blank">Discuz!</a> <em>X3.2</em>© 2001-2013 <a href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a>( <a href="http://www.miitbeian.gov.cn/" target="_blank">粤ICP备12077654号</a> )&nbsp;<a href="http://discuz.qq.com/service/security" target="_blank" title="防水墙保卫网站远离侵害"><img src="static/image/common/security.png"></a></p>
        </div>
    </div>
</div>

<div id="ft" style="margin:0;padding:0; height:0;"></div>
<script src="home.php?mod=misc&amp;ac=sendmail&amp;rand=1551613348" type="text/javascript"></script>
<div id="scrolltop_2" style="display:none;">
    <span hidefocus="true"><a title="返回顶部" onclick="window.scrollTo('0','0')" id="scrolltopa"><b>返回顶部</b></a></span>
</div>


<script type="text/javascript">_attachEvent(window, 'scroll', function () { showTopLink(); });checkBlind();</script>

<!--
去除引入外部代码
{//eval output();}

-->



</body>
</html>