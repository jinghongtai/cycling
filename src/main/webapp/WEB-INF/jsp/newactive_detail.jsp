<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>骑行详情</title>
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


    </div>
    <div class="wp">

    </div>

</body>


</body>
</html>
