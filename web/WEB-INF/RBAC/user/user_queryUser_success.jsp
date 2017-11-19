<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort() +path+ "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="../css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap.min.js"></script>
<base href="<%=basePath%>" />
<title>用户详情</title>
<script>
$(document).ready(function() {
	$('#example').DataTable({
language: {
    "sProcessing": "处理中...",
    "sLengthMenu": "显示 _MENU_ 项结果",
    "sZeroRecords": "没有匹配结果",
    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
    "sInfoPostFix": "",
    "sSearch": "搜索:",
    "sUrl": "",
    "sEmptyTable": "表中数据为空",
    "sLoadingRecords": "载入中...",
    "sInfoThousands": ",",
    "oPaginate": {
        "sFirst": "首页",
        "sPrevious": "上页",
        "sNext": "下页",
        "sLast": "末页"
    },
    "oAria": {
        "sSortAscending": ": 以升序排列此列",
        "sSortDescending": ": 以降序排列此列"
    }
}
}
	);
} );
/* 全选 */
		function   cli(Obj)
	    {
			  var collid = document.getElementById("all")
			  var coll = document.getElementsByName(Obj)
			  if (collid.checked){
		    	 for(var i = 0; i < coll.length; i++)
		      	 coll[i].checked = true;
		 	 }else{
		    	 for(var i = 0; i < coll.length; i++)
		         coll[i].checked = false;
		 	 }
	   } 
	 /*删除确定  */
		function confirmit()
		{
			if (confirm("是否确定删除？"))
				{
				return true;
				}
			else
			{
				alert("删除成功")
			return false;				
			}
		}
	/*批量删除  */		
	function deleAll(Obj) {
		var check = document.getElementsByName(Obj);
		var len=check.length;
		var idAll=""
		for(var i=0;i<len;i++){
		if(check[i].checked){
			idAll[i]=check[i].value;
			idAll = idAll + check[i].value + ",";
		}
		}
		window.location.href="users/user_deleteAllUser?idAll="+idAll;		
	}
	
</script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand">权限管理系统</a> </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="">登录界面</a></li>
        <li><a href="users/user_queryUser">用户详情</a></li>
        <li><a href="roles/role_queryRole">角色详情</a></li>
        <li><a href="modules/module_queryModule">模块详情</a></li>
        <li><a href="uploads/upload_save">文件上传</a></li>
        <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.userName} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=basePath %>password.jsp">修改信息</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="users/user_logOut">注销</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
  <div class="container">
  <div class="row">
    <div class="col-md-9 pull-right">
      <div class="header-lined">
        <h1>用户管理</h1>
        <ol class="breadcrumb">
          <li> <a> 系统管理 </a> </li>
          <li class="active"> 用户管理 </li>
        </ol>
      </div>
    </div>
        <div class="col-md-3 pull-left">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"> <i class="fa fa-bookmark"></i>&nbsp;操作 </h3>
        </div>
        <div class="list-group">
        <a class="list-group-item" href="users/user_save">添加用户</a>	
        <a class="list-group-item" onclick="deleAll('boxname')">批量删除</a>
        <a class="list-group-item">&nbsp;注销 </a> </div>
    </div>
  </div>
    <div class="col-md-9 pull-right">
      <table id="example" class="table table-bordered table-hover">
        <thead>
          <tr >
            <th><input type="checkbox" name="boxname"  id="all" onclick="cli('boxname')" value="checkbox" /></th>
			<th>账号</th>
            <th>密码</th>
            <th>角色</th>
			<th>修改</th>
			<th>删除</th>
			<th>添加角色</th>
          </tr>
        </thead>
        <tbody>
		<s:iterator value="#session.userlist"  var="users">
        <tr>
            <td><input type="checkbox" name="boxname" value="${users.id}"/></td>
            <td>${users.userName}</td>
            <td>${users.password}</td>
			<td>
				<s:iterator  value="#users.userRole"  var="roles">   
               		${roles.roleName}
       			</s:iterator> 
			</td>
			<td>
				<a href="users/user_userUpdata?user.id=${users.id}&user.userName=${users.userName}&user.password=${users.password}">修改</a> 
			</td>
			<td>
				<a href="users/user_deleteUser?user.id=${users.id}" onclick="return confirmit()" >删除</a>
			</td>
			<td>
				<a href="users/user_userRole?user.id=${users.id}">添加角色</a> 
			</td>
       	</tr>
		</s:iterator> 
        </tbody>
      </table>
    </div>
</div>
</div>
  </body>
</html>