<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
</head>

<body>
	<nav class="navbar navbar-default top-navbar" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".sidebar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="goods-list.html"><strong>库存管理平台</strong></a>
		</div>

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown" style="margin-right: 30px;">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"> 
					<span>${user.user_name}</span><i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
				</a>
				<ul class="dropdown-menu dropdown-user">
					<li>
						<a id="aaa" data-toggle="modal" data-target="#wwModal"><i class="fa fa-user fa-fw"></i>修改密码</a>
					</li>
					<li class="divider"></li>
					<li>
						<a href="#" onclick="logout();"><i class="fa fa-sign-out fa-fw" ></i>退出</a>
					</li>
				</ul>
			</li>
		</ul>
		
		
		
	</nav>
	<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li>
					<a id="goods"><i class="fa fa-fire"></i>商品管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
						<li>
							<a href="<%=basePath%>view/goods-list.html">商品管理</a>
						</li>
					</ul>
				</li>
				<li>
					<a id="order"><i class="fa fa-fire"></i>订单管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
						<li>
							<a href="<%=basePath%>view/order-list.html">订单管理</a>
						</li>
					</ul>
				</li>
				<li>
					<a id="user" ><i class="fa fa-fire"></i>用户管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
						<li>
							<a id="userM" href="<%=basePath%>view/user-list.html">用户管理</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
		
	</nav>
	<script type="text/javascript">
		$(function(){
			var $a = $(".arrow").parent();
			$($a).bind('click',function(){
				if($(this).next().length > 0){
					var $class = $(this).next().attr("class");
					if($class.indexOf("in") == -1){
						$(this).next().addClass("in");
					}else{
						$(this).next().removeClass("in")
					}
				}
			})
			var user_type = '${user.user_type}';
			var user = '${user.user_name}';
			if(user==null || user==''){
			    alert("请登录")
                window.location = "<%=basePath%>/view/admin-login.html";
            }
			if(user_type==1){
                $('#user').remove();
			}
		});
		
		function logout(){
			$.ajax({
				url:'<%=basePath%>api/user/logout',
				data:{},
				dataType:'json',
				type:'post',
				success:function(data){
				    if (data==true){
                        alert("退出成功");
                        window.location = "<%=basePath%>/view/admin-login.html";
					}
				},
				error:function (data) {
					if (data.status==200){
					    alert("退出成功");
                        window.location = "<%=basePath%>/view/admin-login.html";
					}else {
					    alert("退出失败");
					}
                }
			});
		}
		
		function updatePassword(){
			 var oldPassword = $("#oldPassword").val();
			 var password = $("#password").val();
			 var rePassword = $("#rePassword").val();
			 if(oldPassword == ''){
				 alert("请输入原密码");
				 return;
			 }
			 if(password == ''){
				 alert("请输入新密码");
				 return;
			 }
			 if(rePassword == ''){
				 alert("请输入确认密码");
				 return;
			 }
			 if(password != rePassword){
				 alert("新密码和确认密码不一致");
				 return;
			 }
			 
			 $.ajax({
		         url:'<%=basePath%>api/user/update',
		         dataType:'json',
		         data:{"user_id":'${user.user_id}',"user_name":'${user.user_name}',"oldPassword":oldPassword,"password":password},
		         type:'post',
		         success:function(data){
						alert(data)
		         },
				 error:function (data) {
					 if (data.status==200){
					     alert("修改成功")
						 window.location = "<%=basePath%>/view/admin-login.html";
                     }
                 }
		     });
		  }
	</script>
</body>
</html>
