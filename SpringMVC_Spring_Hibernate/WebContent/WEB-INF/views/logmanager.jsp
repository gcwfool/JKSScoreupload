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
<link rel="stylesheet" href="../css/datepicker.css" />
<link rel="stylesheet" href="../css/colorpicker.css" />
<link rel="stylesheet" href="../css/bootstrap-wysihtml5.css" />



<title>日志管理</title>

</head>

<body>
	
	<div id = "content">

	<div id = "content-header">
		<h1><i class="fa fa-table"></i>
		日志管理
		</h1>


  <div class="container-fluid">
    <div class="row-fluid">
	</div>

  <form action="#" method="post" class="form-horizontal" style="margin-top: 20px; margin-left: 30px;">
                <label class="control-label hlabel" style="width: 80px;">操作人:</label>
                <div class="controls hcontrols"  style="width:80px; margin-left: 10px;">
                  <input style="width: 80px;" type="text" name="studentname" placeholder="">
                </div>






                <label class="control-label hlabel" style="width: 60px; margin-left: 20px;">操作对象:</label>
                <!-- <span class="badge hlabel">所属考试:</span> -->
                <div class="controls hcontrols" style="width:200px; margin-left:10px;">
                  <select>
                    <option value="0">请选择操作对象</option>
                        <option value="48">成绩管理</option>
                        <option value="49">角色管理</option>
                        <option value="49">资料管理</option>
                        
                  </select>
                </div>

                <label class="control-label hlabel" style="width: 60px;">操作类型:</label>
                <div class="controls hcontrols"  style="width:180px; margin-left: 10px;">
                  <select>
                      <option value="0">请选择操作类型</option>
                        <option value="2">登录</option>
                        <option value="18">修改</option>
                        <option value="40">导入</option>
                        <option value="82">导出</option>
                        <option value="114">新增</option>
                  </select>
                </div>



                <label class="control-label hlabel" style="width: 60px;">日期:</label>
              <div  data-date="12-02-2012" class="input-append date datepicker controls hcontrols" style="margin-left: 0px;">
                  <input type="text" value="12-02-2012"  data-date-format="mm-dd-yyyy" style="width: 100px;">
                  <span class="add-on"><i class="icon-th"></i></span> 
              </div>

                              <label class="control-label hlabel" style="width: 60px;">至:</label>
              <div  data-date="12-02-2012" class="input-append date datepicker controls hcontrols" style="margin-left: 0px;">
                  <input type="text" value="12-02-2012"  data-date-format="mm-dd-yyyy" style="width: 100px;">
                  <span class="add-on"><i class="icon-th"></i></span> 
              </div>

            <div id="search" class="controls hcontrols" style="margin-left: 300px;">
              <button type="submit" class="btn btn-info" title="查询"><i class="fa fa-search"></i>查询</button>
            </div>

  </form>





        <div class="widget-box">
          <div class="widget-title">
            <h5><i class="fa fa-th"></i>	日志列表</h5>
          </div>
          <div class="widget-content nopadding">


			<table class="table table-bordered table-striped with-check">
              <thead>
                <tr>
                  
                  <th>编号</th>
                  <th>操作人</th>
                  <th>操作类型</th>
                  <th>操作对象</th>
                  <th>操作时间</th>
              
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>00001</td>
                  <td>admin</td>
                  <td>登录</td>
                  <td>系统</td>
                  <td>2017-08-15 09:57:33</td>
                </tr>
                  <td>00002</td>
                  <td>admin</td>
                  <td>修改</td>
                  <td>角色管理</td>
                  <td>2017-08-15 09:58:21</td>
                </tr>
              </tbody>
            </table>


            </div>

	 </div>

	 </div>
	</div>





<script src="../js/jquery.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/bootstrap-colorpicker.js"></script> 
<script src="../js/bootstrap-datepicker.js"></script> 
<script src="../js/masked.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/matrix.js"></script> 
<script src="../js/matrix.form_common.js"></script> 
<script src="../js/jquery.peity.min.js"></script> 
</body>

</html>