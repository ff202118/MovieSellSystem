<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--360浏览器优先以webkit内核解析-->
        <link href="static/css/bootstrap.min.css" rel="stylesheet" />
        <link href="static/css/font-awesome.min.css" rel="stylesheet" />
        <link href="static/css/style.min.css" rel="stylesheet" />
        <!-- bootstrap-table 表格插件样式 -->
        <link href="static/ajax/libs/bootstrap-table/bootstrap-table.min.css?v=1.18.3" rel="stylesheet" />
        <link href="static/css/animate.min.css?v=20210831" rel="stylesheet" />
        <link href="static/css/style.min.css?v=20210831" rel="stylesheet" />
        <link href="static/ruoyi/css/ry-ui.css?v=4.7.6" rel="stylesheet" />
    </head>

    <body class="gray-bg">
         <div class="fixed-table-container col-sm-12 select-table table-striped"  style="width: 700px; text-align: center;">
                <h2>电影列表</h2>
                <table id="bootstrap-table" class="table table-bordered table-hover" style="text-align: center;">
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
                                <div class="th-inner ">原价</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">售价</div>
                                <div class="fht-cell"></div>
                            </th>
                            <th style="text-align: center;">
                                <div class="th-inner ">库存</div>
                                <div class="fht-cell"></div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${movielist}">
                            <tr class="warning">
                                <td>${book.id}</td>
                                <td>${book.name}</td>
                                <td>${book.author}</td>
                                <td>${book.press}</td>
                                <td>${book.sellPrice}</td>
                                <td>${book.purchasePrice}</td>
                                <td>${book.stock}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        <div class="row border-bottom dashboard-header"  style="display: inline-block; width: 840px; text-align: center; float: right;">
            <div class="col-sm-12 search-collapse">
                <h2>电影查询</h2>
                <form id="ordinary-form" action="Search" method="post">
                    <div class="select-list">
                        <ul>
                            <li>
                                &emsp;&emsp;&emsp;&emsp;&emsp;
                                    &emsp;&emsp;&emsp;&emsp;&emsp;
                                    &emsp;&emsp;&emsp;&emsp;&emsp;电影名称：<input type="text" name="bookname">
                            </li>
                            <li>

                                <button class="btn btn-primary btn-sm" type="submit"><i
                                        ></i>&nbsp;搜索</button>
                            </li>
                        </ul>
                    </div>
                </form>
            </div>
            <%--<jsp:useBean id="book" class="bean.Book" scope="request" />--%>
            
            <div class="fixed-table-footer"></div>
<div class="fixed-table-container col-sm-12 select-table table-striped" style="width: 800px; text-align: center; float: right;">
                <h2>查询结果</h2>
                <form action="UpdateMovie" method="post">
                    <table id="bootstrap-table" class="table table-bordered table-hover" style="text-align: center;">
                        <thead class="">
                            <tr>
                                <th style="">
                                    <div class="th-inner ">电影名</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="">
                                    <div class="th-inner ">导演</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="">
                                    <div class="th-inner ">发行商</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="">
                                    <div class="th-inner ">原价</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="">
                                    <div class="th-inner ">售价</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="">
                                    <div class="th-inner ">库存</div>
                                    <div class="fht-cell"></div>
                                </th>
                                <th style="text-align: center;">
                                    <div class="th-inner ">操作</div>
                                    <div class="fht-cell"></div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            String name = request.getParameter("moviename");
                            if(name!=null){
                                session.setAttribute("name", name);
                                System.out.println(name);
                        %>
                            <tr data-index="0">
                                <td>
                                    <input type="text" class="form-control valid" name="bookname" placeholder="更改电影名" value="<%=request.getParameter("moviename")%>" aria-invalid="false">
                                </td>
                                <td>
                                    <input type="text" class="form-control valid" name="author" placeholder="更改导演" value="${book.author}" aria-invalid="false">
                                </td>
                                <td>
                                    <input type="text" class="form-control valid" name="press" placeholder="更改发行商" value="${book.press}" aria-invalid="false">
                                </td>
                                <td>
                                    <input type="text" class="form-control valid" name="sellPrice" placeholder="更改售价" value="${book.sellPrice}" aria-invalid="false">
                                </td>
                                <td>
                                    <input type="text" class="form-control valid" name="purchasePrice" placeholder="更改原价" value="${book.purchasePrice}" aria-invalid="false">
                                </td>
                                <td>
                                    <input type="text" class="form-control valid" name="stock" placeholder="更改库存" value="${book.stock}" aria-invalid="false">
                                </td>
                                <td style="text-align: center; "><button class="btn btn-success btn-xs" type="submit" onclick="fun1()"><i
                                            ></i> 保存</button> 
                                
                                    <a class="btn btn-danger btn-xs" href="DeleteMovie" onclick="fun2()"><i ></i>删除</a></td>
                            </tr>
                          <%}%>
                        </tbody>
                    </table>
                </form>           
            </div>
        </div>
        <script src="static/js/jquery.min.js"></script>
        <script src="static/js/bootstrap.min.js"></script>
        <script src="static/ajax/libs/layer/layer.min.js"></script>
        <script>
            function fun1(){
                alert("修改成功！");
            }
            function fun2(){
                alert("删除成功！");
            }
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