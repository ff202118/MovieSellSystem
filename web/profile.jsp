<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html  lang="zh">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--360浏览器优先以webkit内核解析-->
        <link href="static/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="static/css/font-awesome.min.css" rel="stylesheet"/>
        <link href="static/css/style.min.css" rel="stylesheet"/>
        <!-- bootstrap-table 表格插件样式 -->
        <link href="static/ajax/libs/bootstrap-table/bootstrap-table.min.css?v=1.18.3" rel="stylesheet"/>
        <link href="static/css/animate.min.css?v=20210831" rel="stylesheet"/>
        <link href="static/css/style.min.css?v=20210831" rel="stylesheet"/>
        <link href="static/ruoyi/css/ry-ui.css?v=4.7.6" rel="stylesheet"/>
    </head>

    <%-- 引入Java Bean --%>
    <%--<jsp:useBean id="user" class="bean.User" scope="request" />--%>

    <%-- 给Java Bean设置属性值 --%>
    <%--<c:set target="${user}" property="username" value="${param.username}" />--%>
    <%--<c:set target="${user}" property="phone" value="${param.phone}" />--%>
    <%--<c:set target="${user}" property="email" value="${param.email}" />--%>

    <body class="gray-bg">
        <div class="row border-bottom white-bg dashboard-header">
            <div class="tab-content">
                <!--用户信息-->
                <div class="tab-pane active col-sm-12" id="user_info">
                    <div  class="row border-bottom white-bg dashboard-header">
                        <div  style="width:600px ; float:left;">
                            <div class="container">
                                <h2 style="margin-left: 250px;">个人信息</h2>
                            <form class="form-horizontal" id="form-user-edit" novalidate="novalidate" method="post" action="UpdateUserInfo">
                                <!--隐藏ID-->
                                <!--<input name="id" id="id" type="hidden">-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户ID：</label>
                                    <label class="col-sm-3  control-label" style="text-align: left">${user.id} </label>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户名称：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control valid" name="username" placeholder="请输入用户名称" id="username" value="${user.name}" aria-invalid="false">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">手机号码：</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control valid" name="phone" maxlength="11" placeholder="请输入手机号码" id="phone" value="${user.phone}" aria-invalid="false">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">邮箱：</label>
                                    <div class="col-sm-3">
                                        <input type="text" maxlength="50" class="form-control" name="email" placeholder="请输入邮箱" id="email" value="${user.email}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-sm"><i class="fa fa-check"></i> 保 存</button>&nbsp;
                                    </div>
                                </div>
                            </form> </div>
                        </div>
                        <!--修改密码-->
                        <div style="width:600px; float:right;">
                            <h2 style="margin-left: 100px; margin-bottom: 25px;">修改密码</h2>
                            <form class="form-horizontal" id="form-user-resetPwd" novalidate="novalidate" action="UpdatePassword" method="post">
                                <div class="form-group" style=" margin-bottom: 25px;">
                                    <label class="col-sm-2 control-label">旧密码：</label>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control" name="oldPassword" placeholder="输入旧密码">
                                    </div>
                                </div>
                                <div class="form-group" style=" margin-bottom: 25px;">
                                    <label class="col-sm-2 control-label">新密码：</label>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="输入新密码">
                                    </div>
                                </div>
                                <div class="form-group" style=" margin-bottom: 15px;">
                                    <label class="col-sm-2 control-label">确认密码：</label>
                                    <div class="col-sm-3">
                                        <input type="password" class="form-control" name="confirmPassword" placeholder="确认密码">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-sm"><i class="fa fa-check"></i> 保 存</button>&nbsp;
                                    </div>
                                </div>
                            </form></div>
                    </div>
                </div>

            </div>
        </div>
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/ajax/libs/layer/layer.min.js"></script>
        <script type="text/javascript">
            $('#pay-qrcode').click(function () {
                var html = $(this).html();
                parent.layer.open({
                    title: false,
                    type: 1,
                    closeBtn: false,
                    shadeClose: true,
                    area: ['600px', '360px'],
                    content: html
                });
            });
        </script>
    </body>
</html>
