<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<title>模块详情</title>
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
        <li><a href="user/user_queryUser">用户详情</a></li>
        <li><a href="role/role_queryRole">角色详情</a></li>
        <li><a href="module/module_queryModule">模块详情</a></li>
        <li><a href="upload/upload_save">文件上传</a></li>
        <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.userName} <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="LogoutServlet">注销</a></li>
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
        <h1>模块管理</h1>
        <ol class="breadcrumb">
          <li> <a> 权限管理 </a> </li>
          <li class="active"> 模块管理 </li>
        </ol>
      </div>
    </div>
        <div class="col-md-3 pull-left">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"> <i class="fa fa-bookmark"></i>&nbsp;操作 </h3>
        </div>
        <div class="list-group">
		<a class="list-group-item" href="module/module_save">添加模块</a>
        <a class="list-group-item" onclick="deleAll('boxname')">批量删除</a>
        <a class="list-group-item">&nbsp;注销 </a> </div>
    </div>
  </div>
    <div class="col-md-9 pull-right">
      <table id="example" class="table table-bordered table-hover">
        <thead>
          <tr >
            <th><input type="checkbox" name="boxname"  id="all" onclick="cli('boxname')" value="checkbox" /></th>
			<th>模块名</th>
			<th>修改</th>
			<th>删除</th>
			<th>添加功能</th>
          </tr>
        </thead>
        <tbody>
		<s:iterator value="#session.modulelist"  var="modules">
        <tr>
            <td><input type="checkbox" name="boxname" value="${modules.id}"/></td>
            <td>${modules.moduleName}</td>
			<td>
				<a href="module/module_moduleUpdata?module.id=${modules.id}&module.moduleName=${modules.moduleName}" >修改</a>
			</td>
			<td>
				<a href="module/module_deleteModule?module.id=${modules.id}" onclick="return confirmit()" >删除</a>
			</td>
			<td>
				<a href="module/module_moduleFunction?module.id=${modules.id}">添加功能</a>
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