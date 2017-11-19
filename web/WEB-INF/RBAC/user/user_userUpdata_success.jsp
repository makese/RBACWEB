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
<base href="<%=basePath%>">
<title>修改用户</title>
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
        <h3 class="panel-title">&nbsp;修改用户 </h3>
      </div>
      <div class="list-group"> <a href="users/user_queryUser" class="list-group-item active" > 返回 </a> </div>
    </div>
   </div>
    <div class="col-md-9 pull-right">
      <div class="header-lined">
        <h1>修改用户</h1>
        <ol class="breadcrumb">
          <li>权限管理</li>
          <li>用户管理</li>
          <li class="active"> 修改用户 </li>
        </ol>
        <div class="col-md-12 pull-left">
      		<form method="post" action="users/user_updataUser" >
        		<div class="row">
          			<div class="col-sm-12">
            			<div class="col-sm-6 form-group  pull-left">
              				<label class="control-label">用户名</label>
			  				<input type="hidden" name="user.id" value="${userup.id}" >
              				<input type="text" name="user.userName" class="form-control" value="${userup.userName}">
            			</div>
            			<div class="col-sm-6 form-group pull-right">
              			<label class="control-label">密码</label>
             			<input type="password" name="user.password" class="form-control" value="${userup.password}">
            			</div>
          			</div>
        		</div>
        		<div class="form-group text-center">
        		<input class="btn btn-primary" type="submit" name="save" value="修改用户">
        		<input class="btn btn-default" type="reset" value="取消">
        		</div>
      		</form>
    	</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>