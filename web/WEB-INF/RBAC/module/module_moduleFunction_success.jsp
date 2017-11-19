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
<base href="<%=basePath %>"/>
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
</script>
<title>模块授权</title>
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
            <li><a href="<%=basePath %>password.jsp">修改信息</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="user/user_logOut">注销</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
	<div class="col-md-9 pull-left">
      <table id="example" class="table table-bordered table-hover">
        <thead>
          <tr >
			<th>功能名</th>
			<th>删除</th>
          </tr>
        </thead>
        <tbody>
		<s:iterator value="module.moduleFunction"  var="functions">
        <tr>
            <td>${functions.functionName}</td>
			<td>
				<a href="module/module_moduleDeleteFunction?module.id=${module.id}&function.id=${functions.id}">删除功能</a>
			</td>
       	</tr>
		</s:iterator> 
        </tbody>
	  </table>
    </div>
    <div class="col-md-3 pull-right">
		<form action="module/module_moduleAddFunction" method="post">
			<select name="option" class="form-control pull-left">
				<s:if test="module.moduleName!='function'">
					<option value="query">查询</option>
					<option value="update">修改</option>
				</s:if>
				<s:else>
					<option value="">查询</option>
				</s:else>
				<option value="save">添加</option>
				<option value="delete">删除</option>
			</select>	
			<input type="hidden" name="module.id" value="${module.id}" >
			<input type="hidden" name="module.moduleName" value="${module.moduleName}" >
			<input class="btn btn-primary" type="submit" value="添加功能"  >
		</form>
	</div>
</body>
</html>