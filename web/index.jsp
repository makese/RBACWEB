<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath %>"/>
	<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
	<link href="css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
<title>用户登录</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand">人事工资系统</a> </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a>首页</a></li>
        <li><a>用户详情</a></li>
        <li><a>角色详情</a></li>
        <li><a>模块详情</a></li>
        <li class="dropdown"> <a  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">账号<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="index">登陆</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
  <div class="row">
    <div class="col-xs-12 main-content">
      <div class="logincontainer">
        <div class="header-lined">
          <h1>登录</h1>
        </div>
        <form method="post" action="users/index" role="form">
          <div class="form-group">
            <label for="inputName">登陆账号</label>
            <input type="text" name="user.userName" class="form-control" value="" autofocus><s:property value="errors.usererror[0]"/> 
          </div>
          <div class="form-group">
            <label for="inputPassword">密码</label>
            <input type="password" name="user.password" class="form-control" autocomplete="off">
          </div>
          <div align="center">
            <input name="submit" id="login" type="submit" class="btn btn-primary" value="登录"> 
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>