<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- <link rel="stylesheet" type="text/css" href="css/searchitem.css"> -->

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/matrix-style2.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'> -->

<link rel="stylesheet" type="text/css" href="../css/searchitem.css">

<title>个人管理</title>

</head>

<body>
	
	<div id = "content">

	<div id = "content-header">
		<h1><i class="fa fa-table"></i>
		个人管理
		</h1>


  <div class="container-fluid">
    <div class="row-fluid">
	</div>


        <div class="widget-box span6">
<!--           <div class="widget-title">
            <h5><i class="fa fa-th"></i>	个人信息</h5>
          </div> -->
          <div class="widget-content nopadding">


            <div class="todo">
              <ul>
                <li class="clearfix">
                  <div class="txt"><span class="badge badge-info">账户名称:</span> <span style="padding-left: 20px;">admin</span> </div>
                  <!-- <div class="pull-right" style="margin-right: 20px;"> <a class="tip" href="#" title="Edit Task"><i class=" fa fa-pencil"></i></a> </div> -->
                </li>
                <li class="clearfix">
                  <div class="txt"><span class="badge badge-info">密码:</span> <span style="padding-left: 20px;">******</span> </div>
                  <div class="pull-right" style="margin-right: 20px;"> <a class="tip" href="changepassword" title="编辑"><i class=" fa fa-pencil"></i></a> </div>
                </li>
                <li class="clearfix">
                  <div class="txt"><span class="badge badge-info">所在部门:</span> <span style="padding-left: 20px;">柳州市教科所</span> </div>
                  <!-- <div class="pull-right" style="margin-right: 20px;"> <a class="tip" href="#" title="Edit Task"><i class=" fa fa-pencil"></i></a> </div> -->
                </li>
                <li class="clearfix">
                  <div class="txt"><span class="badge badge-info">手机:</span> <span style="padding-left: 20px;">2887321</span> </div>
                  <div class="pull-right" style="margin-right: 20px;"> <a class="tip" href="#" title="编辑"><i class=" fa fa-pencil"></i></a> </div>
                </li>             
                <li class="clearfix">
                  <div class="txt"><span class="badge badge-info">邮箱:</span> <span style="padding-left: 20px;">fdjksal@126.com</span> </div>
                  <div class="pull-right" style="margin-right: 20px;"> <a class="tip" href="#" title="编辑"><i class=" fa fa-pencil"></i></a> </div>
                </li>                                        
              </ul>
            </div>

            </div>

	</div>

	</div>
	</div>






<script src="../js/jquery.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/jquery.dataTables.min.js"></script> 
<script src="../js/matrix.js"></script> 
<script src="../js/matrix.tables.js"></script>
</body>

</html>