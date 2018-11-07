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
        $("#user").addClass("active-menu");
        $("#user").next().addClass("in");
        loadList(1,10);
    })

    function loadList(pageNum,pageSize) {
        $("#entryList").html("");
        $.ajax({
            url: '<%=basePath%>api/user/items',
            type: 'get',
            data:{
                'pageNum':pageNum,
                'pageSize':pageSize
            },
            dataType:'json',
            success: function (data) {
                var html='';
                var type = '';
                var sex = '';
                setPage(data.total, pageNum, pageSize);
                result = data.user;
                for(var i = 0; i < result.length; i++ ){
                    if (result[i].user_type==2){
                        type = '管理员'
                    }
                    if (result[i].user_type==1){
                        type = '普通用户'
                    }
                    if (result[i].sex==1){
                        sex = '男'
                    }
                    if (result[i].sex==2){
                        sex = '女'
                    }
                    html += '<tr>'+
                        '<td>'+result[i].user_name+'</td>'+
                        '<td>'+result[i].nickname+'</td>'+
                        '<td>'+sex+'</td>'+
                        '<td>'+result[i].mobile+'</td>'+
                        '<td>'+type+'</td>'+
                        '<td>'+result[i].create_time+'</td>'+
                        '</tr>'
                }
                $("#entryList").empty().html(html);
            }
        })
    }

    function addUser() {
        var username = $('input[name="username"]').val();
        var password = $('input[name="password"]').val();
        var nickname = $('input[name="nickname"]').val();
        var mobile = $('input[name="mobile"]').val();
        var type = $('input[name="type"]:checked').val();
        var sex = $('input[name="sex"]:checked').val();
        $.ajax({
            url: '<%=basePath%>api/user/add',
            type: 'post',
            data:{
                'user_name':username,
                'password':password,
                'nickname':nickname,
                'mobile':mobile,
                'user_type':type,
                'sex':sex
            },
            dataType:'json',
            success: function (data) {
                alert("添加成功");
                window.location.reload();
            },
            error:function (data) {
                if(data.status==200){
                    alert("添加成功");
                    window.location.reload();
                }
            }
        })
    }

</script>
<body>
<div id="wrapper">
    <jsp:include page="head.jsp" flush="ture"/>
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">用户管理</h1>
            <ol class="breadcrumb">
                <li><a href="<%=basePath%>view/user-list.html">用户列表</a></li>
                <a href="#identifier" data-toggle="modal" data-target="#addVersionModal" Style="float:right;">添加用户</a>
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
                            填写用户信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">用户名</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="username">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">密码</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">昵称</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="nickname">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">性别</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="sex" value="1">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="sex" value="2">女
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">手机号</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="mobile" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">用户类型</label>
                                <div class="col-sm-8">
                                    <input type="radio" name="type" value="1">普通用户&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="type" value="2">管理员
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="addUser();">
                            添加
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

                                    </div>

                                    <table class="table table-striped table-bordered dataTable no-footer"
                                           id="dataTables-example" style="text-align: center;">
                                        <thead>
                                        <tr>
                                            <th style="width: 200px;">用户名</th>
                                            <th style="width: 200px;">昵称</th>
                                            <th style="width: 200px;">性别</th>
                                            <th style="width: 200px;">手机号</th>
                                            <th style="width: 200px;">类型</th>
                                            <th style="width: 200px;">创建时间</th>
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
