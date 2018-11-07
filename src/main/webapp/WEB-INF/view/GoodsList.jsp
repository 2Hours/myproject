<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>HZQ</title>
    <link href="<%=basePath%>/assets/css/sysBannerList.css" rel="stylesheet" />
    <link href="<%=basePath%>/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>/assets/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=basePath%>/assets/css/custom-styles.css" rel="stylesheet" />
    <script src="<%=basePath%>/assets/js/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>/assets/js/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>/assets/js/page.js"></script>
    <script src="<%=basePath%>/assets/js/gazetteBillSwitch/transform.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#main-menu a").removeClass("active-menu");
        $("#goods").addClass("active-menu");
        $("#goods").next().addClass("in");
        loadList(1,10);
    })

    function loadList(pageNum,pageSize) {
        $("#entryList").html("");
        var goods_no = $('input[name="goods_no1"]').val();
        var goods_size = $('input[name="goods_size1"]').val();
        var goods_color = $('input[name="goods_color1"]').val();
        $.ajax({
            url: '<%=basePath%>api/goods/get',
            type: 'get',
            data:{
                'pageNum':pageNum,
                'pageSize':pageSize,
              'goods_no':goods_no,
              'goods_size':goods_size,
              'goods_color':goods_color
            },
            dataType:'json',
            success: function (data) {
                var html='';
                var result = data.goods;
                setPage(data.total, pageNum, pageSize);
                for(var i = 0; i < result.length; i++ ){
                    html += '<tr>'+
                        '<td>'+result[i].goods_no+'</td>'+
                        '<td>'+result[i].goods_name+'</td>'+
                        '<td>'+result[i].goods_color+'</td>'+
                        '<td>'+result[i].goods_size+'</td>'+
                        '<td>'+result[i].face_material+'</td>'+
                        '<td>'+result[i].inner_material+'</td>'+
                        '<td>'+result[i].produce_price+'</td>'+
                        '<td>'+result[i].retail_price+'</td>'+
                        '<td>'+result[i].inventory+'</td>'+
                        '<td>'+result[i].create_time+'</td>'+
                        '<td><a href="javaScript:showUpdateContent(\''+result[i].goods_id+'\')">修改</a>&nbsp;&nbsp;&nbsp;<a href="javaScript:deleteGoods(\''+result[i].goods_id+'\')">删除</a></td>'+'</tr>'
                }
                $("#entryList").html(html);
            }
        })
    }

    function addGoods() {
        var goods_no = $('input[name="goods_no"]').val();
        var goods_name = $('input[name="goods_name"]').val();
        var goods_color = $('input[name="goods_color"]').val();
        var goods_size = $('input[name="goods_size"]').val();
        var face_material = $('input[name="face_material"]').val();
        var inner_material = $('input[name="inner_material"]').val();
        var produce_price = $('input[name="produce_price"]').val();
        var retail_price = $('input[name="retail_price"]').val();
        var inventory = $('input[name="inventory"]').val();
        $.ajax({
            url: '<%=basePath%>api/goods/add',
            type: 'post',
            data:{
                'goods_no':goods_no,
                'goods_name':goods_name,
                'goods_color':goods_color,
                'goods_size':goods_size,
                'face_material':face_material,
                'inner_material':inner_material,
                'produce_price':produce_price,
                'retail_price':retail_price,
                'inventory':inventory
            },
            dataType: 'json',
            success: function (data) {
                alert("添加成功")
                location.reload();
            },
            error:function (data) {
                if (data.status==200){
                    alert("添加成功")
                    location.reload()
                }
            }
        })
    }

    function showUpdateContent(goods_id) {
        $.ajax({
            url: '<%=basePath%>api/goods/get',
            type: 'get',
            data:{
                'goods_id':goods_id
            },
            dataType: 'json',
            success: function (data) {
                var result = data.goods[0];
                $('input[name="goods_id2"]').val(result.goods_id);
                $('input[name="goods_no2"]').val(result.goods_no);
                $('input[name="goods_name2"]').val(result.goods_name);
                $('input[name="goods_color2"]').val(result.goods_color);
                $('input[name="goods_size2"]').val(result.goods_size);
                $('input[name="face_material2"]').val(result.face_material);
                $('input[name="inner_material2"]').val(result.inner_material);
                $('input[name="produce_price2"]').val(result.produce_price);
                $('input[name="retail_price2"]').val(result.retail_price);
                $('input[name="inventory2"]').val(result.inventory);
                $("#updateVersionModal").modal("show");
            }
        })
    }

    function updateGoods() {
        var goods_id = $('input[name="goods_id2"]').val();
        var goods_no = $('input[name="goods_no2"]').val();
        var goods_name = $('input[name="goods_name2"]').val();
        var goods_color = $('input[name="goods_color2"]').val();
        var goods_size = $('input[name="goods_size2"]').val();
        var face_material = $('input[name="face_material2"]').val();
        var inner_material = $('input[name="inner_material2"]').val();
        var produce_price = $('input[name="produce_price2"]').val();
        var retail_price = $('input[name="retail_price2"]').val();
        $.ajax({
            url: '<%=basePath%>api/goods/update',
            type: 'post',
            data:{
                'goods_id':goods_id,
                'goods_no':goods_no,
                'goods_name':goods_name,
                'goods_color':goods_color,
                'goods_size':goods_size,
                'face_material':face_material,
                'inner_material':inner_material,
                'produce_price':produce_price,
                'retail_price':retail_price
            },
            dataType: 'json',
            success: function (data) {
                alert("修改成功")
                location.reload();
            },
            error:function (data) {
                if (data.status==200){
                    alert("修改成功")
                    location.reload()
                }
            }
        })
    }

    function deleteGoods(id) {
        var message = '确定删除？';
        if (confirm(message)){
            $.ajax({
                url: '<%=basePath%>api/goods/delete',
                type: 'post',
                data:{
                    'goodsId':id
                },
                dataType: 'json',
                success: function (data) {
                    alert("删除成功")
                    location.reload();
                },
                error:function (data) {
                    if (data.status==200){
                        alert("删除成功")
                        location.reload()
                    }
                }
            })
        }
    }
</script>
<body>
<div id="wrapper">
    <jsp:include page="head.jsp" flush="ture"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">货品管理</h1>
            <ol class="breadcrumb">
                <li>货品列表</li>
                <a href="#identifier" data-toggle="modal" data-target="#addVersionModal" Style="float:right;">添加货品</a>
            </ol>
        </div>
        <!-- 增加版本模态框 -->
        <div class="modal fade" id="addVersionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="h4modal">
                            填写货品信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">货号</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_no">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">商品名</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">色号</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_color">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">尺码</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_size" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">面料</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="face_material">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">里料</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="inner_material">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">出厂价</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="produce_price" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">零售价</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="retail_price" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">库存量</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="inventory" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="addGoods();">
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <!-- 修改版本模态框 -->
        <div class="modal fade" id="updateVersionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="h3modal">
                            修改货品信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">货号</label>
                                <div class="col-sm-6">
                                    <input type="hidden" name="goods_id2">
                                    <input class="form-control" name="goods_no2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">商品名</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_name2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">色号</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_color2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">尺码</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="goods_size2" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">面料</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="face_material2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">里料</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="inner_material2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">出厂价</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="produce_price2" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">零售价</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="retail_price2" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">库存量</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="inventory2" onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="updateGoods();">
                            修改
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <div id="page-inner">
            <div class="row">
                <div class="modal fade" id="wwModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document" style="width: 600px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">密码修改</h4>
                            </div>
                            <div class="modal-body">
                                <div class='form-group'>
                                    <dl class='dl-horizontal dl-own'><dt class="dt-1">原密码：</dt><dd><input type="password" class="form-control" id="oldPassword" placeholder="请输入"></dd></dl><br/>
                                    <dl class='dl-horizontal dl-own'><dt class="dt-1">新密码：</dt><dd><input type="password" class="form-control" id="password" placeholder="请输入"></dd></dl><br/>
                                    <dl class='dl-horizontal dl-own'><dt class="dt-1">确认密码：</dt><dd><input type="password" class="form-control" id="rePassword" placeholder="请输入"></dd></dl>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-primary" onclick="updatePassword();">确定</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper form-inline">
                                <div class="col-sm-12" style="margin-bottom: 20px;">
                                    <input type="text" class="form-control" placeholder="货号" name="goods_no1">
                                    <input type="text" class="form-control" placeholder="色号" name="goods_color1">
                                    <input type="text" class="form-control" placeholder="尺码" name="goods_size1">
                                    <a class="btn btn-warning" onclick="loadList(1,10)">搜索</a>
                                    <!-- <a class="btn btn-primary" onclick="gazetteBillAdd();">添加报单</a> -->
                                </div>

                                <table class="table table-striped table-bordered dataTable no-footer"
                                       id="dataTables-example" style="text-align: center;">
                                    <thead>
                                    <tr>
                                        <th style="width: 200px;">货号</th>
                                        <th style="width: 200px;">商品名</th>
                                        <th style="width: 200px;">色号</th>
                                        <th style="width: 200px;">尺码</th>
                                        <th style="width: 200px;">面料</th>
                                        <th style="width: 200px;">里料</th>
                                        <th style="width: 200px;">出厂价</th>
                                        <th style="width: 200px;">零售价</th>
                                        <th style="width: 200px;">库存</th>
                                        <th style="width: 200px;">创建时间</th>
                                        <th style="width: 200px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="entryList">

                                    </tbody>

                                </table>
                                <div class="row" style="text-align: center;">
                                    <div class="col-sm-12">
                                        <div class="dataTables_paginate paging_simple_numbers"
                                             id="dataTables-example_paginate">
                                            <ul class="pagination"></ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <!--End Advanced Tables -->
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>
