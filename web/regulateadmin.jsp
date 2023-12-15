<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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
        <style>
            .focus {
                width: 800px;
                height: 300px;
                background-color: pink;
                margin: 100px auto;
            }

            .carousel,
            .carousel img {
                width: 100%;
                height: 400px!important;
            }
        </style>
    </head>
    <body class="gray-bg">
        <div style="text-align: center">
            <div class="row border-bottom white-bg dashboard-header">
                <div class="table-container col-sm-12 select-table table-bordered">
                    <h2>用户列表</h2>
                    <table id="bootstrap-table" class="table table-striped table-bordered" style="text-align: center;">
                        <thead class="">
                            <tr class="info">
                                <th style="text-align: center;">
                                    <div class="th-inner ">ID</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center;">
                                    <div class="th-inner ">用户名</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center;">
                                    <div class="th-inner ">手机号</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center;">
                                    <div class="th-inner ">邮箱</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center;">
                                    <div class="th-inner ">操作</div>
                                    <div class="fht-cell"></div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${userlist}">
                                <tr class="warning">
                                    <td >${user.id}</td>
                                    <td >${user.name}</td>
                                    <td >${user.phone}</td>
                                    <td >${user.email}</td>
                                    <td style="text-align: center; ">
                                            <a href="DeleteAccountAdmin?id=${user.id}" >
                                              <strong style="color:red;">注销</strong>
                                            </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="fixed-table-footer"></div>
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
