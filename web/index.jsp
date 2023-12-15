<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  lang="zh">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="renderer" content="webkit">
        <title>系统首页（普通用户）</title>
        <!-- 避免IE使用兼容模式 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link href="static/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="static/css/jquery.contextMenu.min.css" rel="stylesheet"/>
        <link href="static/css/font-awesome.min.css" rel="stylesheet"/>
        <link href="static/css/animate.min.css" rel="stylesheet"/>
        <link href="static/css/style.min.css" rel="stylesheet"/>
        <link href="static/css/skins.css" rel="stylesheet"/>
        <link href="static/ruoyi/css/ry-ui.css?v=4.7.7" rel="stylesheet"/>
        
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
        
        <style>
            .nav>li>a:focus{
                /*background-color: #337ab7;*/
                background-color: #3C8DBC;
                color: #fff;
            }
            #content-main {
                height: calc(100% - 51px);
            }
        </style>

    </head>
    <body style="overflow: hidden;" class="fixed-sidebar full-height-layout gray-bg" th:classappend="${isMobile} ? 'canvas-menu'" >
        <div id="wrapper" >
            <!--右侧部分开始-->
            <div id="page-wrapper" class="gray-bg dashbard-1" style="margin-left: 0;">
                <div class="row border-bottom" style=" margin-bottom: 0;">
                    <nav class="navbar navbar-default"style=" margin-bottom: 0;background-color:  #906bff;">
                        <div class="navbar-header" style=" margin-bottom: 0;">
                            <a href="index.jsp#menu_1" onclick="loadPage('search.jsp')">
                                <li class="logo hidden-xs" style="background-color:  #906bff;">
                                    <span class="logo-lg"><strong style="color:black;"> 电影售票系统</strong></span>
                                </li>
                            </a>
                        </div>
                        <div id="navMenu">
                            <ul class="nav navbar-toolbar nav-tabs navbar-left hidden-xs">
                                <!-- 顶部菜单列表 -->
                                
                                <li role="presentation" id="tab_1">

                                    <a data-toggle="tab"  href="#menu_1" onclick="loadPage('search.jsp')">
                                        <i style="color:gray;"></i> <span>电影查询</span>
                                    </a>
                                </li>

                                <li role="presentation" id="tab_2">
                                    <a data-toggle="tab"  href="#menu_2" onclick="loadPage('GetAllMovies')">
                                        <i style="color:gray;"></i>  <span>电影列表</span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <ul class="nav navbar-top-links navbar-right welcome-message">

                            <li class="dropdown user-menu">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-hover="dropdown" style="text-align:center">
                                    <div style="width: 130px; text-align:center;">
                                        欢迎你
                                    <span class="hidden-xs"><%=session.getAttribute("username")%></span>
                                    </div>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="mt5">
                                        <a class="menuItem noactive" onclick="loadPage('GetUserInfo')">
                                            &emsp;<strong style="color:green;">个人中心</strong></a>
                                    </li>
                                    <!--<li class="divider"></li>-->
                                    <li>
                                        <a href="login.jsp">
                                            &emsp;<strong style="color:blueviolet;">退出登录</strong></a>
                                    </li>
                                    <li style="margin-bottom:15px;"> 
                                           <a href="DeleteAccount" >
                                               &emsp;&nbsp;<strong style="color:red;">注销账号</strong>
                                            </a>
                                        </i> 
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>

                <a id="ax_close_max" class="ax_close_max" href="#" title="关闭全屏"> <i class="fa fa-times-circle-o"></i> </a>

                <div class="row mainContent" id="content-main">
                    <iframe class="RuoYi_iframe" name="iframe0" width="100%" height="100%" id="page-frame"
                            src="search.jsp" frameborder="0" seamless></iframe>
                </div>

            </div>
            <!--右侧部分结束-->
        </div>
        
        <!-- 全局js -->
        <script th:src="@{/js/jquery.min.js}"></script>
        <script th:src="@{/js/bootstrap.min.js}"></script>
        <script th:src="@{/js/plugins/metisMenu/jquery.metisMenu.js}"></script>
        <script th:src="@{/js/plugins/slimscroll/jquery.slimscroll.min.js}"></script>
        <script th:src="@{/js/jquery.contextMenu.min.js}"></script>
        <script th:src="@{/ajax/libs/blockUI/jquery.blockUI.js}"></script>
        <script th:src="@{/ajax/libs/layer/layer.min.js}"></script>
        <script th:src="@{/ruoyi/js/ry-ui.js?v=4.7.7}"></script>
        <script th:src="@{/ruoyi/js/common.js?v=4.7.7}"></script>
        <script th:src="@{/ruoyi/index.js?v=20201208}"></script>
        <script th:src="@{/ajax/libs/fullscreen/jquery.fullscreen.js}"></script>
        <!-- 动态改变iframe页面 -->
        <script>
            function loadPage(url) {
                var iframe = document.getElementById('page-frame');
                iframe.src = url;
            }
        </script>
        <script>
            window.history.forward(1);
                    var ctx = [[@{/}]]; 
                    var lockscreen = [[${session.lockscreen}]];
                    if (lockscreen) {
                        window.top.location = ctx + "lockscreen";
                    }
                    // 皮肤缓存
                    var skin = storage.get("skin");
                    // history（表示去掉地址的#）否则地址以"#"形式展示
                    var mode = "history";
                    // 历史访问路径缓存
                    var historyPath = storage.get("historyPath");
                    // 是否页签与菜单联动
                    var isLinkage = true;
                    // 本地主题优先，未设置取系统配置
                    if ($.common.isNotEmpty(skin)) {
                        $("body").addClass(skin.split('|')[0]);
                        $("body").addClass(skin.split('|')[1]);
                    } else {
                        $("body").addClass([[${sideTheme}]]);
                        $("body").addClass([[${skinName}]]);
                    }

                    /* 用户管理-重置密码 */
                    function resetPwd() {
                        var url = ctx + 'system/user/profile/resetPwd';
                        $.modal.open("重置密码", url, '770', '380');
                    }

                    /* 切换主题 */
                    function switchSkin() {
                        layer.open({
                            type: 2,
                            shadeClose: true,
                            title: "切换主题",
                            area: ["530px", "386px"],
                            content: [ctx + "system/switchSkin", 'no']
                        })
                    }

                    /* 切换菜单 */
                    function toggleMenu() {
                        $.modal.confirm("确认要切换成横向菜单吗？", function () {
                            $.get(ctx + 'system/menuStyle/topnav', function (result) {
                                window.location.reload();
                            });
                        })
                    }

                    /** 刷新时访问路径页签 */
                    function applyPath(url) {
                        $('a[href$="' + decodeURI(url) + '"]').click();
                        if (!$('a[href$="' + url + '"]').hasClass("noactive")) {
                            $('a[href$="' + url + '"]').parent("li").addClass("selected").parents("li").addClass("active").end().parents("ul").addClass("in");
                        }
                    }

                    $(function () {
                        var lockPath = storage.get('lockPath');
                        if ($.common.equals("history", mode) && window.performance.navigation.type == 1) {
                            var url = storage.get('publicPath');
                            if ($.common.isNotEmpty(url)) {
                                applyPath(url);
                            }
                        } else if ($.common.isNotEmpty(lockPath)) {
                            applyPath(lockPath);
                            storage.remove('lockPath');
                        } else {
                            var hash = location.hash;
                            if ($.common.isNotEmpty(hash)) {
                                var url = hash.substring(1, hash.length);
                                applyPath(url);
                            } else {
                                if ($.common.equals("history", mode)) {
                                    storage.set('publicPath', "");
                                }
                            }
                        }

                        /* 初始密码提示 */
                        if ([[${isDefaultModifyPwd}]]) {
                            layer.confirm("您的密码还是初始密码，请修改密码！", {
                                icon: 0,
                                title: "安全提示",
                                btn: ['确认', '取消'],
                                offset: ['30%']
                            }, function (index) {
                                resetPwd();
                                layer.close(index);
                            });
                        }

                        /* 过期密码提示 */
                        if ([[${isPasswordExpired}]]) {
                            layer.confirm("您的密码已过期，请尽快修改密码！", {
                                icon: 0,
                                title: "安全提示",
                                btn: ['确认', '取消'],
                                offset: ['30%']
                            }, function (index) {
                                resetPwd();
                                layer.close(index);
                            });
                        }
                        $("[data-toggle='tooltip']").tooltip();
                    });
        </script>
    </body>
</html>
