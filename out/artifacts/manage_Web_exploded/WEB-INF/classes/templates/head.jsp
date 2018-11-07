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
			<a class="navbar-brand" href="index.html"><strong>淘上品管理平台</strong></a>
		</div>

		<ul class="nav navbar-top-links navbar-right">
			<li class="dropdown" style="margin-right: 30px;">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false"> 
					<span>${user.username}</span><i class="fa fa-user fa-fw"></i><i class="fa fa-caret-down"></i>
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
				<c:forEach items="${sysList}" var="List" varStatus="lStatus">
					<li>
						<c:if test="${List.module_id == 10 }"><!-- 机构财务管理 -->
							<a id="agency"><i class="fa fa-fire"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 9 }"><!-- 机构管理 -->
							<a id="gazette-bill3"><i class="fa fa-fire"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 8 }"><!-- 系统管理 -->
							<a id="gazette-bill2"><i class="fa fa-fire"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 7 }"><!-- 报单管理 -->
							<a id="gazette-bill"><i class="fa fa-fire"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 6 }"><!-- 分润管理 -->
							<a id="sys-set1"><i class="fa fa-gear"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 5 }"><!-- 广告管理 -->
							<a id="sys-banner"><i class="fa fa-fw fa-file"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 4 }"><!-- 财务管理 -->
							<a id="sys-set"><i class="fa fa-gear"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 3 }"><!-- 订单管理 -->
							<a id="order"><i class="fa fa-fire"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 2 }"><!-- 商家管理 -->
							<a id="shop"><i class="fa fa-bar-chart-o"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						<c:if test="${List.module_id == 1 }"><!-- 会员管理 -->
							<a id="member"><i class="fa fa-users"></i>${List.name}<span class="fa arrow"></span></a>
						</c:if>
						
						<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
					<c:forEach items="${List.moduleList}" var="moduleList" varStatus="lStatus">
							<li>
		                        <a href="<%=basePath%>view/admin/${moduleList.path}">${moduleList.name}</a>
		                    </li>
					</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		
			
				<%-- <li>
					<a id="member" href="<%=basePath%>view/admin/index.html" class="active-menu"><i class="fa fa-users"></i>会员管理</a>
				</li>
				<li>
					<a id="shop" href="<%=basePath%>view/admin/shopList.html" ><i class="fa fa-desktop"></i>商家管理</a>
				</li>
				<li>
					<a id="order" href="<%=basePath%>view/admin/orderList.html"><i class="fa fa-bar-chart-o"></i>订单管理</a>
				</li>
				<li>
					<a id="sys-set"><i class="fa fa-gear"></i>财务管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
	                    <li>
		                        <a href="<%=basePath%>view/admin/userSysWithdrawalsList.html">用户提现申请</a>
		                    </li>
		                    <li>
		                        <a href="<%=basePath%>view/admin/shopSysWithdrawalsList.html">商店提现申请</a>
		                    </li>
		                    <li>
		                        <a href="<%=basePath%>view/admin/userBorus.html">奖金发放</a>
		                    </li>
					</ul>
				</li>
				<li>
					<a id="sys-banner" href="<%=basePath%>view/admin/sysBannerList.html"><i class="fa fa-fw fa-file"></i>广告管理</a>
				</li>
				<li>
					<a id="sys-set"><i class="fa fa-gear"></i>系统管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
	                    <li>
	                        <a href="<%=basePath%>view/admin/productTypeSet.html">经营类目设置</a>
	                    </li>
	                    <li>
	                        <a href="<%=basePath%>view/admin/gazetteBillSet.html">报单提成设置</a>
	                    </li>
	                    <li>
	                        <a href="<%=basePath%>view/admin/shopShare.html">分润提成设置</a>
	                    </li>
					</ul>
				</li>
				<li>
					<a id="gazette-bill"><i class="fa fa-fire"></i>报单系统<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
	                    <li>
	                        <a href="<%=basePath%>view/admin/gazetteBillList.html">报单管理</a>
	                    </li>
	                    <li>
	                        <a href="<%=basePath%>view/admin/marketList.html">市场管理</a>
	                    </li>
					</ul>
				</li>
				<li>
					<a id="gazette-bill"><i class="fa fa-fire"></i>管理系统<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level collapse" aria-expanded="true" style="">
	                    <li>
	                        <a href="<%=basePath%>view/admin/roleList.html">角色管理</a>
	                    </li>
	                    <li>
	                        <a href="<%=basePath%>view/admin/userList.html">用户管理</a>
	                    </li>
					</ul>
				</li>
			</ul> --%>
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
		});
		
		function logout(){
			$.ajax({
				url:'<%=basePath%>admin/logout',
				data:{},
				dataType:'json',
				type:'post',
				success:function(data){
					if( 0 == data.code){
						alert("退出成功！");
						 window.location.reload(0);
					}else{
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
			 alert(password);
			 
			 $.ajax({
		         url:'<%=basePath%>admin/changePassword',
		         dataType:'json',
		         data:{"userId":'${user.user_id}',"oldPassword":oldPassword,"newPassword":password},
		         type:'post',
		         success:function(data){
		             if(0 == data.code){
		            	 window.location.reload(0);
		             }else {
		           	  	 alert(data.message);
		             }
		         }
		     });
		  }
	</script>
</body>
</html>
