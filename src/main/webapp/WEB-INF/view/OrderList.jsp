<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>HZQ</title>
    <link href="<%=basePath%>assets/css/sysBannerList.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/css/bootstrap.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/css/font-awesome.css" rel="stylesheet" />
    <link href="<%=basePath%>assets/css/custom-styles.css" rel="stylesheet" />
    <script src="<%=basePath%>assets/js/jquery-1.10.2.js"></script>
    <script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>assets/js/jquery.metisMenu.js"></script>
    <script src="<%=basePath%>assets/js/page.js"></script>
    <script src="<%=basePath%>assets/js/gazetteBillSwitch/transform.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#main-menu a").removeClass("active-menu");
        $("#order").addClass("active-menu");
        $("#order").next().addClass("in");
        loadList(1,10);
    })

    function loadList(pageNum,pageSize) {
        $("#entryList").html("");
        var order_no = $('input[name="order_no1"]').val();
        var order_type = $('#order_type option:selected').val();
        $.ajax({
            url: '<%=basePath%>api/order/items',
            type: 'get',
            data:{
                'pageNum':pageNum,
                'pageSize':pageSize,
                'orderNo':order_no,
                'orderType':order_type
            },
            dataType:'json',
            success: function (data) {
                var html='';
                var type='';
                setPage(data.total, pageNum, pageSize);
                result = data.order;
                for(var i = 0; i < result.length; i++ ){
                    if (result[i].order_type==1){
                        type='出库单';
                    }
                    if (result[i].order_type==2){
                        type='入库单';
                    }
                    html += '<tr>'+
                        '<td>'+result[i].order_no+'</td>'+
                        '<td>'+result[i].keeper+'</td>'+
                        '<td>'+result[i].mobile+'</td>'+
                        '<td>'+type+'</td>'+
                        '<td>'+result[i].create_time+'</td>'+
                        '<td><a href="javaScript:orderDetails(\''+result[i].order_id+'\')">详情</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javaScript:deleteOrder(\''+result[i].order_id+'\')">删除</a></td>'+'</tr>'
                }
                $("#entryList").empty().html(html);
            }
        })
    }

    function addOrder() {
        var order_no = $('input[name="order_no"]').val();
        var order_type = $('input[name=type]:checked').val();
        var keeper = $('input[name="keeper"]').val();
        var mobile = $('input[name="mobile"]').val();
        var goods_no = $('input[name="goods_no"]').val();
        var goods_name = $('input[name="goods_name"]').val();
        var goods_color = $('input[name="goods_color"]').val();
        var goods_size = $('input[name="goods_size"]').val();
        var num = $('input[name="inventory"]').val();
        $.ajax({
            url: '<%=basePath%>api/order/add',
            type: 'post',
            data:{
                'order_no':order_no,
                'goods_no':goods_no,
                'order_type':order_type,
                'keeper':keeper,
                'mobile':mobile,
                'goods_name':goods_name,
                'goods_color':goods_color,
                'goods_size':goods_size,
                'num':num
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
                }else {
                    alert(data.responseJSON.message)
                }
            }
        })
    }

    function showUpdateContent(orderId) {
        $.ajax({
            url: '<%=basePath%>api/order/items',
            type: 'get',
            data:{
                'orderId':orderId
            },
            dataType: 'json',
            success: function (data) {
                var result = data.goods[0];
                $('input[name="order_id2"]').val(result.goods_id);
                $('input[name="order_no2"]').val(result.goods_no);
                $('input[name="goods_name2"]').val(result.goods_name);
                $('input[name="goods_color2"]').val(result.goods_color);
                $('input[name="goods_size2"]').val(result.goods_size);
                $('input[name="face_material2"]').val(result.face_material);
                $("#updateVersionModal").modal("show");
            }
        })
    }

    function showUpdateContent1(goodsId) {
        $.ajax({
            url: '<%=basePath%>api/goods/get',
            type: 'get',
            data:{
                'goods_id':goodsId
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
                $("#updateGoodsModal").modal("show");
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

    function deleteOrder(id) {
        var message = '确定删除？';
        if (confirm(message)){
            $.ajax({
                url: '<%=basePath%>api/order/delete',
                type: 'post',
                data:{
                    'orderId':id
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

    function orderDetails(orderId) {
        var htmlTemp='';
        $.ajax({
            url: '<%=basePath%>api/order/order-details',
            type: 'get',
            data: {
                'orderId': orderId
            },
            dataType: 'json',
            success: function (data) {
                var orderMap = data.orderDetail;
                var d = new Date(data.orderDetail.create_time);
                var type = '';
                if (orderMap.order_type==1){
                    type='出库单';
                }
                if (orderMap.order_type==2){
                    type='入库单';
                }
                var times=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate() + ' ' + d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds();
                htmlTemp += '<div class="Receivables"><h4>订单详细信息</h4><a href="javaScript:showUpdateContent1(\''+orderMap.goods_id+'\')" Style="float:right;">完善 / 修改 订单信息</a><br/><h5>商品信息</h5><br/>'+
                    '<table><tbody><tr>'+
                        '<td width="60px">商品名：</td>'+
                        '<td width="120px">'+ orderMap.goods_name +'</td>'+
                        '<td width="70px">色号：</td>'+
                        '<td width="120px">'+ orderMap.goods_color +'</td>'+
                        '<td width="100px">尺寸：</td>'+
                        '<td width="120px">'+ orderMap.goods_size +'</td>'+
                        '<td width="70px">面料：</td>'+
                        '<td width="120px">'+ orderMap.face_material +'</td>'+
                        '<td width="70px">里料：</td>'+
                        '<td width="120px">'+ orderMap.inner_material +'</td>'+
                        '<td width="70px">出厂价：</td>'+
                        '<td width="120px">'+ orderMap.produce_price +'</td>'+
                        '<td width="70px">零售价：</td>'+
                        '<td width="120px">'+ orderMap.retail_price +'</td>'+
                        '<td width="70px">库存余量：</td>'+
                        '<td width="120px">'+ orderMap.inventory +'</td>'+
                    '</tr></tbody></table></div><br/>'+
                    '<div class="Receivables"><h5>订单信息</h5><br/></div>'+
                    '<table><thead><tr>'+
                    '<td width="60px" align="center">单号 : </td>' +
                    '<td width="200px">'+ orderMap.order_no +'</td>'+
                    '<td width="70px" align="center">类型 : </td>' +
                    '<td width="200px">'+ type +'</td>'+
                    '<td width="70px" align="center">数量 : </td>' +
                    '<td width="200px">'+ orderMap.num +'</td>'+
                    '<td width="60px" align="center">联系人 : </td>'+
                    '<td width="200px">'+ orderMap.keeper +'</td>'+
                    '<td width="100px" align="center">联系人电话 : </td>'+
                    '<td width="200px">'+ orderMap.mobile +'</td>'+
                    '<td width="100px" align="center">创建时间 : </td>'+
                    '<td width="300px">'+ times +'</td>'+
                    '</tr></thead><tbody>';
                $("#show").empty().append(htmlTemp);
            },
            error: function (data) {

            }
        })
    }
</script>
<body>
<div id="wrapper">
    <jsp:include page="head.jsp" flush="ture"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">订单管理</h1>
            <ol class="breadcrumb">
                <li><a href="<%=basePath%>view/order-list.html">订单明细</a></li>
                <a href="#identifier" data-toggle="modal" data-target="#addVersionModal" Style="float:right;">添加订单</a>
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
                            填写订单信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">单号</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="order_no">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">联系人</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="keeper" placeholder="来源人  /  接收人">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">联系电话</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="mobile" placeholder="来源人电话  /  接收人电话">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">类型</label>
                                <div class="col-sm-8">
                                    <input type="radio" name="type" value="1">出库单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="type" value="2">入库单
                                </div>
                            </div>
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
                                <label class="control-label col-sm-4">数量</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="inventory">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="addOrder();">
                            添加
                        </button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
        <div class="modal fade" id="updateGoodsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="hmodal">
                            完善信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal" id="updateGoodsForm">
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
                <div class="col-md-12" id="show">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading"></div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <div class="dataTables_wrapper form-inline">
                                <div class="col-sm-12" style="margin-bottom: 20px;">
                                    <input type="text" class="form-control" placeholder="订单号" name="order_no1">
                                    &nbsp;&nbsp;&nbsp;&nbsp;订单类型：<select id="order_type" name="order_type1">
                                    <option value ="">请选择</option>
                                    <option value ="1">出库单</option>
                                    <option value ="2">入库单</option>
                                </select>
                                    <a class="btn btn-warning" onclick="loadList(1,10)">搜索</a>
                                </div>

                                <table class="table table-striped table-bordered dataTable no-footer"
                                       id="dataTables-example" style="text-align: center;">
                                    <thead>
                                    <tr>
                                        <th style="width: 200px;">订单号</th>
                                        <th style="width: 200px;">来源 / 接收人</th>
                                        <th style="width: 200px;">手机号</th>
                                        <th style="width: 200px;">订单类型</th>
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
