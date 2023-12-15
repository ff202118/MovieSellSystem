<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

    <body class="gray-bg">
        <div style="text-align: center">
        <div class="row border-bottom white-bg dashboard-header">
            <div class="table-container col-sm-12 select-table table-bordered" style="width: 800px; text-align: center;">
                <h2>电影列表</h2>
                <table id="bootstrap-table" class="table table-striped table-bordered" style="text-align: center;">
                    <thead class="">
                        <tr class="info">
                            <th style="text-align: center;">
                                <div class="th-inner ">序号</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">电影名</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">导演</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">发行商</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">售价</div>
                                <div class="fht-cell"></div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="book" items="${movielist}">
                        <tr class="warning">
                            <td >${book.id}</td>
                            <td >${book.name}</td>
                            <td >${book.author}</td>
                            <td >${book.press}</td>
                            <td >${book.sellPrice}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="fixed-table-footer"></div>
            <br>
            <br>
            <br>
            <h2>
                热门电影售票统计
            </h2>
            <hr>
                <img src="./static/img/1.jpg">
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
