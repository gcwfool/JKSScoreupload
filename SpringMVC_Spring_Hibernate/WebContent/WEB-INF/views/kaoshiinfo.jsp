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

<title>考试管理</title>

</head>

<body>
	
	<div id = "content">

	<div id = "content-header">
		<h1><i class="fa fa-table"></i>
		考试管理
		</h1>


  <div class="container-fluid">
    <div class="row-fluid">
	</div>


        <div class="widget-box">
          <div class="widget-title">
            <h5><i class="fa fa-th"></i>	考试列表</h5>

            <button class="btn btn-primary pull-center" data-toggle="modal" data-target="#addkaoshiModal"><i class="fa fa-plus"></i>	新增</button>

          </div>
          <div class="widget-content nopadding">




			<table class="table table-bordered table-striped with-check">
              <thead>
                <tr>
                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <th>考试编号</th>
                  <th>考试名称</th>
                  <th>开始时间</th>
                  <th>结束时间</th>
                  <th>入学年份</th>
                  <th>考试科目</th>

                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>201808</td>
                  <td>2017-2018学年度上学期八年级期末质量抽测</td>
                  <td>2018-1-1</td>
                  <td>2018-3-1</td>
                  <td>16</td>
                  <td>语文,数学,英语</td>
                </tr>
                  <td><input type="checkbox" /></td>
                  <td>201807</td>
                  <td>2017-2018学年度上学期七年级期末质量抽测</td>
                  <td>2018-1-1</td>
                  <td>2018-3-1</td>
                  <td>17</td>
                  <td>语文,数学,英语,生物</td>
                </tr>
              </tbody>
            </table>


            </div>

	</div>

	</div>
	</div>




<div class="modal hide fade" id="addkaoshiModal">

    <div class="modal-body" style="max-height: 380px;">


      <div id = "content" >
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-list"></i>
          新增考试
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content">

            <form action="#" >
              
                <label class="control-label hlabel" style="width: 60px;">所属考试:</label>
                  <div class="controls" style="width:100px; margin-bottom: 10px; margin-left: 70px;">
                    
                      <select id = "gradeselect">
                      <option value="0">请选择年级</option>
                          <option value="48">七年级</option>
                          <option value="49">八年级</option>
<!--                       <option >请选择年级</option>
                          <option >七年级</option>
                          <option>八年级</option> -->
                      </select>

                </div>


                <label class="control-label hlabel">考试名称:</label>
                <div class="controls" style="width: 350px;  margin-bottom: 10px; margin-left: 70px;">
                  <input id = "kaoshinametext" type="text" value = "">
                </div>

                <table id="kemutable" class="table table-striped table-bordered" style="width: 200px; text-align: center;">

                	<thead>
                		<tr>
                			<th><input type="checkbox" name=""></th>
                			<th>科目</th>
                		</tr>
                			                <tbody>
	                  <tr>
	                    <td><input id = "yuwencb" type="checkbox"></td>
	                    <td>语文</td>
	                  </tr>

	                  <tr>
	                    <td><input id = "shuxuecb" type="checkbox" ></td>
	                    <td>数学</td>
	                  </tr>

	                  <tr>
	                    <td><input id = "yingyucb" type="checkbox" ></td>
	                    <td>英语</td>
	                  </tr>

	                  <tr>
	                    <td><input id="wulicb" type="checkbox" ></td>
	                    <td>物理</td>
	                  </tr>

	                  <tr>
	                    <td><input id="huaxuecb" type="checkbox"></td>
	                    <td>化学</td>
	                  </tr>

	                  <tr>
	                    <td><input id="sixiangpindecb" type="checkbox" ></td>
	                    <td>思想品德</td>
	                  </tr>

	                  <tr>
	                    <td><input id="lishicb" type="checkbox" ></td>
	                    <td>历史</td>
	                  </tr>

	                  <tr>
	                    <td><input id="dilicb" type="checkbox" ></td>
	                    <td>地理</td>
	                  </tr>

	                  <tr>
	                    <td><input id="shengwucb" type="checkbox" ></td>
	                    <td>生物</td>
	                  </tr>
	        
	                  </tbody>
                	</thead>







                  
                </table>




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



<script type="text/javascript">


    var data=[
        {"checklist":"true","kemu":"语文"},
        {"checklist":"false","kemu":"数学"},
        {"checklist":"false","kemu":"英语"},
        {"checklist":"false","kemu":"物理"},
        {"checklist":"false","kemu":"化学"},
        {"checklist":"false","kemu":"地理"},
        {"checklist":"true","kemu":"生物"},
        {"checklist":"false","kemu":"思想品德"},
    ];










	
    $("#gradeselect").change(function(e) {
    	// option:selected
    	// alert(e.target.value)

    	if(e.target.value == 48){
    		// alert(e.target.value)
    		// $.uniform.update($("#yuweninput").attr("checked",false));
    		// $("#kaoshinametext").attr("value", "2017-2018学年度上学期七年级期末质量抽测")
    		$.uniform.update($("#kaoshinametext").attr("value", "2017-2018学年度上学期七年级期末质量抽测"));

    		$('#kemutable tr td input').each(function(){
    			// console.log($(this).attr("id"));
    			if($(this).attr("id") == "wulicb" || $(this).attr("id") == "huaxuecb"){
    				$.uniform.update($(this).attr("checked",false));
    			}else{
    				$.uniform.update($(this).attr("checked",true));
    			}
    		});

    		
    	}

    	if(e.target.value == 49){
    		// alert(e.target.value)
    		// $.uniform.update($("#yuweninput").attr("checked",true));
    		// $("#kaoshinametext").attr("value", "2017-2018学年度上学期七年级期末质量抽测");
    		$.uniform.update($("#kaoshinametext").attr("value", "2017-2018学年度上学期八年级期末质量抽测"));

    		$('#kemutable tr td input').each(function(){
    			if($(this).attr("id") == "dilicb" || $(this).attr("id") == "huaxuecb" || $(this).attr("id") == "shengwucb"){
    				$.uniform.update($(this).attr("checked",false));
    			}else{
    				$.uniform.update($(this).attr("checked",true));
    			}
    		});

    	}

    });

</script>



</body>

</html>