<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet"   type="text/css" href="static/css/style_9_widthauto.css">
    <link rel="stylesheet"   type="text/css" href="static/css/style_9_common.css">
    <script type="text/javascript">/*HTMLNODE.className += ' widthauto'*/</script>

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
<body>
<div id="nexheader" class="nexheader" style="">
    <div class="w1180">
        <div class="nexlogo"><h2><a href="WEB-INF/jsp" title="骑行天下">
            <img src="static/images/logo.png" alt="骑行天下" border="0" /></a></h2></div>
        <div class="nexnav">
            <ul>
                <li id="mn_portal"><a href="portal.php" hidefocus="true">首页</a></li>
                <li id="mn_forum"><a href="forum.php" hidefocus="true">骑行圈</a></li>
                <li class="a" id="mn_N26b6"><a href="plugin.php?id=dpw_activity:activity" hidefocus="true">结伴</a></li>
                <li id="mn_N5258" onmouseover="showMenu({'ctrlid':this.id,'ctrlclass':'hover','duration':2})">
                    <a href="postClassAction/queryInof" hidefocus="true">专题活动</a></li>
                <li id="mn_N3f9a"><a href="http://www.race51.com/" hidefocus="true">赛事无忧</a></li>                                                                                                        <li id="mn_N453b"><a href="http://www.qxworld.com/bbs/portal.php?mod=list&amp;catid=23" hidefocus="true">关于我们</a></li>                                                                                                   </ul>
        </div>

        <div class="nexdl">
            <div class="nexlogin">
                <div class="nexdenglu">
                    <c:choose>
                        <c:when test="${empty USER_KEY}">
                            <ul>
                                <li class="nexDL_ZC"><a href="register.jsp" target="_blank">注册</a></li>
                                <li class="nexDL_DL"><a href="login.jsp" target="_blank">登录</a></li>
                                <li class="nexDL_sliders"></li>
                                <div class="clear"></div>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <div style="height: inherit;width:150px;">
                                <div><img src="${USER_KEY.headImg}" style="width: 45px;float: left;height: 45px;  border-radius: 50%;" alt=""></div>
                                <div style="height: 45px;float: left;line-height: 45px;color: #fff;font-weight:bold;">${USER_KEY.username}|[<a style="color: #fff;font-weight:bold;">退出</a>]</div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <script type="text/javascript">
                    jq(".nexdenglu ul li").each(function(s){
                        jq(this).hover(function(){
                            jq(this).addClass("cur").siblings().removeClass("cur");
                        })
                    });
                </script>
                <script type="text/javascript">
                    jq(".nexdenglu li").mouseover(function(){
                        var Num=jq(this).index();
                        if(Num==1){
                            jq(this).siblings(".nexDL_sliders").css("left","50%");
                            jq(this).children("a").css("color","#fff");
                            jq(this).siblings(".nexDL_ZC").children("a").css("color","#0095FF");
                        }else{
                            jq(this).siblings(".nexDL_sliders").css("left","0");
                            jq(this).children("a").css("color","#fff");
                            jq(this).siblings(".nexDL_DL").children("a").css("color","#0095FF");
                        }
                    });
                </script>

            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script type="text/javascript">
    jq(function () {
        var nav = jq("#nexheader");
        var win = jq(window);
        var sc = jq(document);
        win.scroll(function () {
            if (sc.scrollTop() >= 10) {
                nav.addClass("nex_subtops");
            } else {
                nav.removeClass("nex_subtops");
            }
        })
    });
</script>
<script src="static/js/nv.js" type="text/javascript"></script>
</body>
