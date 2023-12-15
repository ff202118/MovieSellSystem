<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="zh">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <title>注册</title>
        <meta name="description" content="后台管理">
        <link href="static/css/bootstrap.min.css" th:href="@{/css/bootstrap.min.css}" rel="stylesheet"/>
        <link href="static/css/font-awesome.min.css" th:href="@{/css/font-awesome.min.css}" rel="stylesheet"/>
        <link href="static/css/style.min.css" th:href="@{/css/style.min.css}" rel="stylesheet"/>
        <link href="static/css/login.min.css" th:href="@{/css/login.min.css}" rel="stylesheet"/>
        <link href="static/ruoyi/css/ry-ui.css" th:href="@{/ruoyi/css/ry-ui.css?v=4.7.7}" rel="stylesheet"/>
        <!-- 360浏览器急速模式 -->
        <meta name="renderer" content="webkit">
        <!-- 避免IE使用兼容模式 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <style type="text/css">label.error { position:inherit;  }</style>
    </head>
    <body class="signin">
       <div class="signinpanel" >
            <div style="text-align:center">
                <h2>欢迎使用 <strong> 电影售票系统</strong></h2>
            </div>
                <div style="margin-left:200px;" class="col-sm-6">
                    <form id="registerForm" autocomplete="off" action="RegisterCheck" method="post">
                        <div style="text-align:center">
                            <h2 style="color:blueviolet;"><strong>注册</strong></h2>
                        </div>
                        <input type="text"     name="username" class="form-control uname"         placeholder="用户名"   maxlength="20" />
                        <input type="password" name="password" class="form-control pword"         placeholder="密码"     maxlength="20" />
                        <input type="password" name="confirmPassword" class="form-control pword"  placeholder="确认密码" maxlength="20" />
                        <div class="row m-t">
                            <div class="col-xs-6">
                                <input type="text" name="code" class="form-control code"  placeholder="验证码"   maxlength="5" >
                            </div>
                            <div class="col-xs-6">
                                <a href="javascript:void(0);" title="点击更换验证码">
                                    <img name="imgValidate" src="Code" class="imgcode" width="85%" onclick="refresh()"/>
                                </a>
                            </div>
                        </div>
                        <strong style="color:purple;">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;已有账号？ <a href="login.jsp" style="color:black;">立即登录&raquo;</a></strong>
                        <button class="btn btn-info btn-block" id="btnSubmit" data-loading="正在验证注册，请稍候...">注册</button>
                    </form>
                </div>
            </div>
        <script th:inline="javascript"> var ctx = [[@{/}]]; var captchaType = [[${captchaType}]]; </script>
        <!-- 全局js -->
        <script src="static/js/jquery.min.js" th:src="@{/js/jquery.min.js}"></script>
        <script src="static/ajax/libs/validate/jquery.validate.min.js" th:src="@{/ajax/libs/validate/jquery.validate.min.js}"></script>
        <script src="static/ajax/libs/layer/layer.min.js" th:src="@{/ajax/libs/layer/layer.min.js}"></script>
        <script src="static/ajax/libs/blockUI/jquery.blockUI.js" th:src="@{/ajax/libs/blockUI/jquery.blockUI.js}"></script>
        <script src="static/ruoyi/js/ry-ui.js" th:src="@{/ruoyi/js/ry-ui.js?v=4.7.7}"></script>
        <script src="static/ruoyi/register.js" th:src="@{/ruoyi/register.js}"></script>

        <script type="text/javascript">
                   function refresh() {
                       var d = new Date();
                       imgValidate.src = 'Code?t=' + d.toString(38);
                   }

        </script>

    </body>
</html>
