<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>O了吧</title>
    <link href="../assets/css/sysBannerList.css" rel="stylesheet" />
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../assets/css/custom-styles.css" rel="stylesheet" />
    <link href="../assets/css/my.css" rel="stylesheet" />
    <script src="../assets/js/jquery-1.10.2.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/jquery.metisMenu.js"></script>
    <script src="../assets/js/page.js"></script>
    <script src="../assets/js/gazetteBillSwitch/transform.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("#main-menu a").removeClass("active-menu");
        $("#gazette-bill2").addClass("active-menu");
        $("#gazette-bill2").next().addClass("in");
        loadList(1,10);
    })

    function loadList(pageNum,pageSize) {
        $("#entryList").html("");
        var keyId = $('input[name="versionId1"]').val();
        var keyName = $('input[name="name1"]').val();
        var keyType = $('#type1 option:selected') .val();
        var keyIsForce = $('#isForce1 option:selected') .val();
        var keyDistinction = $('#distinction1 option:selected') .val();
        var keyCode = $('input[name="code1"]').val();
        $.ajax({
            url: 'api/app/version/items',
            type: 'get',
            data:{
              'versionId':keyId,
              'versionName':keyName,
              'type':keyType,
              'distinction':keyDistinction,
              'code':keyCode,
              'isForce':keyIsForce
            },
            dataType:'json',
            success: function (data) {
                var html='';
                var type = '';
                var intact = '';
                var is_force = '';
                var distinction = '';
                setPage(data.total, pageNum, pageSize);
                result = data.records;
                for(var i = 0; i < result.length; i++ ){
                    if(result[i].type==1){
                        type='ios';
                    }
                    if(result[i].type==2){
                        type='android';
                    }
                    if(result[i].intact==1){
                        intact='是';
                    }
                    if(result[i].intact==2){
                        intact='否';
                    }
                    if(result[i].is_force==1){
                        is_force='是';
                    }
                    if(result[i].is_force==2){
                        is_force='否';
                    }
                    if(result[i].distinction==1){
                        distinction='用户端';
                    }
                    if(result[i].distinction==2){
                        distinction='商家端';
                    }
                    html += '<tr>'+
                        '<td>'+result[i].sys_version_id+'</td>'+
                        '<td>'+result[i].code+'</td>'+
                        '<td>'+result[i].name+'</td>'+
                        '<td>'+result[i].url+'</td>'+
                        '<td>'+type+'</td>'+
                        '<td>'+intact+'</td>'+
                        '<td>'+result[i].suffix+'</td>'+
                        '<td>'+is_force+'</td>'+
                        '<td>'+result[i].file_size+'</td>'+
                        '<td>'+result[i].described+'</td>'+
                        '<td>'+distinction+'</td>'+
                        '<td>'+result[i].createTime+'</td>'+
                        '<td><a href="javaScript:showUpdateContent(\''+result[i].sys_version_id+'\')">修改</a>&nbsp;&nbsp;&nbsp;<a href="javaScript:deleteVersion(\''+result[i].sys_version_id+'\')">删除</a></td>'+'</tr>'
                }
                $("#entryList").empty().html(html);
            }
        })
    }

    function addVersion() {
        var versionId = $('input[name="versionId"]').val();
        var name = $('input[name="name"]').val();
        var code = $('input[name="code"]').val();
        var url = $('input[name="url"]').val();
        var suffix = $('input[name="suffix"]').val();
        var fileSize = $('input[name="fileSize"]').val();
        var described = $('input[name="described"]').val();
        var type = $('input[name="type"]:checked').val();
        var intact = $('input[name="intact"]:checked').val();
        var isForce = $('input[name="isForce"]:checked').val();
        var distinction = $('input[name="distinction"]:checked').val();
        $.ajax({
            url: 'api/app/version/add',
            type: 'post',
            data:{
                'sysVersionId':versionId,
                'name':name,
                'code':code,
                'url':url,
                'suffix':suffix,
                'fileSize':fileSize,
                'described':described,
                'type':type,
                'intact':intact,
                'isForce':isForce,
                'distinction':distinction
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

    function showUpdateContent(versionId) {
        $.ajax({
            url: 'api/app/version/items',
            type: 'get',
            data:{
                'versionId':versionId
            },
            dataType: 'json',
            success: function (data) {
                var result = data.records[0];
                $('input[name="versionId2"]').val(result.sys_version_id);
                $('input[name="name2"]').val(result.name);
                $('input[name="code2"]').val(result.code);
                $('input[name="url2"]').val(result.url);
                $('input[name="suffix2"]').val(result.suffix);
                $('input[name="fileSize2"]').val(result.file_size);
                $('input[name="described2"]').val(result.described);
                $(':radio[name="type2"][value="'+result.type+'"]').prop("checked", "checked");
                $(':radio[name="intact2"][value="'+result.intact+'"]').prop("checked", "checked");
                $(':radio[name="isForce2"][value="'+result.is_force+'"]').prop("checked", "checked");
                $(':radio[name="distinction2"][value="'+result.distinction+'"]').prop("checked", "checked");
                $("#updateVersionModal").modal("show");
            }
        })
    }

    function updateVersion() {
        var versionId = $('input[name="versionId2"]').val();
        var name = $('input[name="name2"]').val();
        var code = $('input[name="code2"]').val();
        var url = $('input[name="url2"]').val();
        var suffix = $('input[name="suffix2"]').val();
        var fileSize = $('input[name="fileSize2"]').val();
        var described = $('input[name="described2"]').val();
        var type = $('input[name="type2"]:checked').val();
        var intact = $('input[name="intact2"]:checked').val();
        var isForce = $('input[name="isForce2"]:checked').val();
        var distinction = $('input[name="distinction2"]:checked').val();
        $.ajax({
            url: 'api/app/version/update',
            type: 'post',
            data:{
                'sysVersionId':versionId,
                'name':name,
                'code':code,
                'url':url,
                'suffix':suffix,
                'fileSize':fileSize,
                'described':described,
                'type':type,
                'intact':intact,
                'isForce':isForce,
                'distinction':distinction
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

    function deleteVersion(id) {
        var message = '确定删除？';
        if (confirm(message)){
            $.ajax({
                url: 'api/app/version/'+id+'/delete',
                type: 'post',
                data:{
                    'id':id
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
    <jsp:include page="head.jsp"></jsp:include>

    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">版本管理</h1>
            <ol class="breadcrumb">
                <li><a href="<%=basePath%>view/version-list.html">版本列表</a></li>
                <a href="#identifier" data-toggle="modal" data-target="#addVersionModal" Style="float:right;">添加版本</a>
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
                            填写版本信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本Id</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="versionId">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本code</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="code">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本名称</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">下载地址</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="url">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">后缀</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="suffix">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">app大小</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="fileSize">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">描述</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="described">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">类型</label>
                                <div class="col-sm-8">
                                    <input type="radio" name="type" value="1">ios&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="type" value="2">android
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">是否完整包/增量包</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="intact" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="intact" value="2">否
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">是否强制更新</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="isForce" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="isForce" value="2">否
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">app类别</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="distinction" value="1">用户端&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="distinction" value="2">商家端
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="addVersion();">
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
                            修改版本信息
                        </h4>
                    </div>
                    <div class="form-group modal-body">
                        <form class="form-horizontal" id="updateForm">
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本Id</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="versionId2" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本code</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="code2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">版本名称</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="name2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">下载地址</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="url2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">后缀</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="suffix2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">app大小</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="fileSize2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">描述</label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="described2">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">类型</label>
                                <div class="col-sm-8">
                                    <input type="radio" name="type2" value="1">ios&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="type2" value="2">android
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">是否完整包/增量包</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="intact2" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="intact2" value="2">否
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">是否强制更新</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="isForce2" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="isForce2" value="2">否
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">app类别</label>
                                <div class="col-sm-6">
                                    <input type="radio" name="distinction2" value="1">用户端&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="distinction2" value="2">商家端
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" class="btn btn-primary alterMS"  onclick="updateVersion();">
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
                                    <input type="text" class="form-control" placeholder="版本Id" name="versionId1">
                                    <input type="text" class="form-control" placeholder="版本code" name="code1">
                                    <input type="text" class="form-control" placeholder="版本名称" name="name1">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    APP类别：<select id="distinction1" name="distinction1" onchange="">
                                                <option value ="">请选择</option>
                                                <option value ="1">用户端</option>
                                                <option value ="2">商家端</option>
                                            </select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    是否强制更新：<select id="isForce1" name="isForce1" onchange="">
                                                <option value ="">请选择</option>
                                                <option value ="1">是</option>
                                                <option value ="2">否</option>
                                            </select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    类型：<select id="type1" name="type1" onchange="">
                                                <option value ="">请选择</option>
                                                <option value ="1">ios</option>
                                                <option value ="2">android</option>
                                            </select>
                                    <a class="btn btn-warning" onclick="loadList(1,10)">搜索</a>
                                    <!-- <a class="btn btn-primary" onclick="gazetteBillAdd();">添加报单</a> -->
                                </div>

                                <table class="table table-striped table-bordered dataTable no-footer"
                                       id="dataTables-example" style="text-align: center;">
                                    <thead>
                                    <tr>
                                        <th style="width: 200px;">版本Id</th>
                                        <th style="width: 200px;">版本code</th>
                                        <th style="width: 200px;">版本名称</th>
                                        <th style="width: 200px;">下载地址</th>
                                        <th style="width: 200px;">类型</th>
                                        <th style="width: 200px;">是否完整包/增量包</th>
                                        <th style="width: 200px;">后缀</th>
                                        <th style="width: 200px;">是否强制更新</th>
                                        <th style="width: 200px;">app大小</th>
                                        <th style="width: 200px;">描述</th>
                                        <th style="width: 200px;">app类别</th>
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