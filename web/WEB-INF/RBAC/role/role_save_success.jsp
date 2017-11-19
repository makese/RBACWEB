<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>添加角色</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
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
  <div class="col-md-3 pull-left">
    <div class="panel panel-default panel-actions">
      <div class="panel-heading">
        <h3 class="panel-title">&nbsp;添加角色 </h3>
      </div>
      <div class="list-group"> <a href="roles/role_queryRole" class="list-group-item active" > 返回 </a> </div>
    </div>
   </div>
    <div class="col-md-9 pull-right">
      <div class="header-lined">
        <h1>添加角色</h1>
        <ol class="breadcrumb">
          <li>权限管理</li>
          <li>模块管理</li>
          <li class="active"> 添加角色 </li>
        </ol>
      </div>
    </div>
    <div class="col-md-9 pull-right">
      <form method="post" action="roles/role_saveRole" >
        <div class="row">
          <div class="col-sm-12">
            <div class="form-group col-sm-6 pull-left">
              <label class="control-label">角色名</label>
              <input type="text" name="role.roleName" class="form-control">
            </div>
          </div>
        </div>
        <div class="form-group text-center">
          <input class="btn btn-primary" type="submit" name="save" value="增加角色">
          <input class="btn btn-default" type="reset" value="取消">
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>