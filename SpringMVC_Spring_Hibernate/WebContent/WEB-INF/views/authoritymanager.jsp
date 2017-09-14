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

<link rel="stylesheet" type="text/css" href="../css/searchitem.css">

<link rel="stylesheet" href="../css/bootstrap.min.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/matrix-style2.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<title>角色管理</title>

</head>

<body>
	
	<div id = "content">

	<div id = "content-header">
		<h1><i class="fa fa-table"></i>
		角色管理
		</h1>


  <div class="container-fluid">
    <div class="row-fluid">
	</div>


        <div class="widget-box">
          <div class="widget-title">
            <h5><i class="fa fa-th"></i>	角色列表</h5>

            <button class="btn btn-primary pull-center" data-toggle= "modal" data-target = "#addkemuModal"><i class="fa fa-plus-circle"></i>	新增角色</button>

          </div>
          <div class="widget-content nopadding">




			<table class="table table-bordered table-striped with-check">
              <thead>
                <tr>
                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <th>角色名称</th>
                  <th>修改时间</th>
                  <th>权限</th>
                  <th>描述</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>县区教研室</td>
                  <td>2017-09</td>
                  <td><a href="#">点击查看</a></td>
                  <td>县区教研室角色</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>学校上传员</td>
                  <td>2017-09</td>
                  <td><a href="#">点击查看</a></td>
                  <td>学校上传员角色</td>
                </tr>
              </tbody>
            </table>


            </div>

	</div>

	</div>
	</div>





<div class="modal hide fade" id="addkemuModal">

    <div class="modal-body" style="max-height: 380px;">


      <div id = "content">
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-list"></i>
          新增角色
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content">

            <form action="#" >
              
	              <label class="control-label hlabel" style="width: 60px;">角色名称:</label>
	              <div class="controls"  style="width:80px; margin-bottom: 10px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="juesename" >
	              </div>


	              <label class="control-label hlabel" style="width: 60px;">角色描述:</label>
	              <div class="controls"  style="width:80px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="kemuname"  title = "请输入科目名称">
	              </div>			              

	              <label class="control-label hlabel" style="width: 60px;">权限设置:</label>
<!-- 	              <div class="controls"  style="width:80px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="kemuscore"  title = "请输入满分成绩">
	              </div> -->




                <div class="widget-box" style="width: 400px;">
                  <div class="widget-title">
                    成绩管理
                  </div>
                  <div class="widget-content">
                    
                    <table class="table table-bordered with-check">
                      <thead>
                        <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"></th>
                        <th>成绩管理</th>
                      </thead>
                      <tbody>
                        <tr>
                          <td><input type="checkbox" ></td>
                          <td>上传</td>
                        </tr>
                        <tr>
                          <td><input type="checkbox" ></td>
                          <td>导出</td>
                        </tr>
                        <tr>
                          <td><input type="checkbox" ></td>
                          <td>删除</td>
                        </tr>                                                
                      </tbody>
                    </table>

                  </div>
                  
                </div>


                <div class="widget-box" style="width: 400px;">
                  <div class="widget-title">
                    考试管理
                  </div>
                  <div class="widget-content">
                    
                    <table class="table table-bordered with-check">
                      <thead>
                        <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox"></th>
                        <th>考试管理</th>
                      </thead>
                      <tbody>
                        <tr>
                          <td><input type="checkbox" ></td>
                          <td>新增</td>
                        </tr>
                        <tr>
                          <td><input type="checkbox" ></td>
                          <td>删除</td>
                        </tr>                                           
                      </tbody>
                    </table>

                  </div>
                  
                </div>




            </form>


          </div>

        </div>



      </div>





      </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <a href="#" class="btn btn-primary">新增</a>
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