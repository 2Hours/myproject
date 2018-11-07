<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<html lang="">
<head>
    <meta charset="UTF-8">
    <title>库存管理系统后台</title>
    <link rel="stylesheet" href="../assets/css/login.css">
    <script src="../assets/js/jquery-1.10.2.js"></script>
</head>

<body>
<div class='nav'>

    <div class='nav-left fl'>
        <div class='lg-t'>
            <img src="../assets/img/logo@3x.png" alt="系统登录" class='fl lg'>
            <h1>库存管理登录界面</h1>
            <p>manage.hzq.com</p>
        </div>
        <div class='lg-b'>
            <h1>BACKSTAGE MANAGEMENT SYSTEM</h1>
            <p>库存管理系统</p>
        </div>
    </div>
    <div class='nav-right fr'>
        <div  class='inputBox'>
        <h1>欢迎登陆</h1>
        <div class='inputBox-top'>
            <span class='fl'></span>
            <input type="text" id="name">
        </div>
        <div  class='inputBox-bottom'>
            <span class='fl'></span>
            <input type="password" class='password' id="pwd">
            <span class='fr isShow' ></span>
        </div>
            <button onclick="login();">登陆</button>
        </div>

    </div>


</div>
<script type="text/javascript" th:inline="javascript">
    var flag = false;
    var password = $('.password');
$('.isShow').click(function () {
    if (flag ===false ){
        password.prop('type','text');
        flag =true;
    } else{
        password.prop('type','password');
        flag =false;
    }

});
function login() {
    var name = $("#name").val();
    var password = $("#pwd").val();
    if (name == null || name == "") {
        return alert("请输入正确的用户名");
    }
    if (password == null || password == "") {
        return alert("请输入正确的密码");
    }
    $.ajax({
        url: '<%=basePath%>api/user/login',
        data: {'username': name, 'password': password},
        dataType: 'json',
        type: 'get',
        success: function (data) {
            alert(data)
        //    window.location = "<%=basePath%>/view/index.jsp";
        },
        error:function(data){
            if (data.status==200){
                window.location = "<%=basePath%>/view/goods-list.html";
            }else{
                alert(data.responseJSON.message);
                return false;
            }

        }
    });
}
</script>
</body>
</html>
