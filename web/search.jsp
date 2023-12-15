<%@page import="bean.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin-bottom:20px;">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="static/img/1.jpeg" alt="...">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    <img src="static/img/2.jpg" alt="...">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                <div class="item">
                    <img src="static/img/3.jpg" alt="...">
                    <div class="carousel-caption">
                        ...
                    </div>
                </div>
                ...
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        
        <div class="row border-bottom  dashboard-header" style="display: inline-block; width: 815px; text-align: center; float: right;">
            <div class="col-sm-12 search-collapse">
                <div style="text-align: center;">
                    <h2>购票查询</h2>
                    <form id="ordinary-form" action="Search" method="post">
                        <div class="select-list">
                            <ul>
                                <li>
                                    &emsp;&emsp;&emsp;&emsp;&emsp;
                                    &emsp;&emsp;&emsp;&emsp;&emsp;
                                    &emsp;&emsp;&emsp;&emsp;&emsp;
                                    电影名称：<input type="text" name="bookname">
                                </li>
                                <li>
                                    <button class="btn btn-primary btn-sm" type="submit">搜索</button>               
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        
        <jsp:useBean id="book" class="bean.Movie" scope="request"/>
        <div class="fixed-table-container col-sm-12 select-table table-bordered" style="width: 800px; text-align: center; float: right;">
            <div style="text-align: center;">
                <h2>查询结果</h2>
            </div>
            <table id="bootstrap-table" class="table table-bordered table-hover" style="text-align: center;">
                <thead class="info">
                    <tr class="info">
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
                        <th style="text-align: center;">
                            <div class="th-inner ">操作</div>
                            <div class="fht-cell"></div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr data-index="0" class="active">
                        <%
                            String name = request.getParameter("moviename");
                            if(name!=null){
                                System.out.println(name);
                        %>
                            <td><jsp:getProperty name="book" property="name"/></td>
                            <td><jsp:getProperty name="book" property="author"/></td>
                            <td><jsp:getProperty name="book" property="press"/></td>
                            <td><jsp:getProperty name="book" property="sellPrice"/></td>
                            <td style="text-align: center; "><a class="btn btn-success btn-xs" id="purchase" type="button" href="PurchaseSearch?name=<%=request.getParameter("moviename")%>"><i
                                        ></i>购买</a> </td>
                        <%}%>
                    </tr>
                </tbody>
            </table>

        </div>
        <div class="row border-bottom white-bg dashboard-header" style="width: 700px; text-align: center; ">
            <div style="text-align: center;">
                <h2>电影购票</h2>
            </div>
            <table id="bootstrap-table" class="table table-bordered table-hover" style="text-align: center;">
                <thead class="info">
                    <tr class="info">
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
                        <th style="text-align: center;">
                            <div class="th-inner ">操作</div>
                            <div class="fht-cell"></div>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${movielist}">
                        <tr class="success">
                            <td >${book.name}</td>
                            <td >${book.author}</td>
                            <td >${book.press}</td>
                            <td >${book.sellPrice}</td> 
                            <td style="text-align: center;"><a class="btn btn-success btn-xs" type="button" href="Buy?name=${book.name}">
                                         购买</a> </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="fixed-table-footer"></div>

        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/ajax/libs/layer/layer.min.js"></script>
        <script>
            function fun(){
               alert("购买成功！");
            }
        </script>
        <script>
            $('.carousel').carousel({
                interval: 2000
            })
        </script>
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
