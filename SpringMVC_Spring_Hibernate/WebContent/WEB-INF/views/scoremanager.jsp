<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>成绩管理</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/fullcalendar.css" />
<link rel="stylesheet" href="../css/matrix-style2.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />

<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />

<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />


<style>



	.hcontrols,
	.hlabel{
		float: left;
		margin:  1px;
		padding: 1px;
		display:inline-block;
	}


	.high{ color: red; }
    .msg{ font-size: 13px; }
    .onError{ color: red; }
    .onSuccess{ color: green; }

/*#srarch-horizontal{
		float: left;
		margin: 0;
		padding: 0;
		display:inline-block;
}*/


</style>
	<script>
	 function checkData(){ 
         var fileDir = $("#upfile").val();  
         var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
         if("" == fileDir){  
             alert("选择需要导入的Excel文件！");  
             return false;  
         }  
         if(".xls" != suffix && ".xlsx" != suffix ){  
             alert("选择Excel格式的文件导入！");  
             return false;  
         }
         
         //document.forms['form_upload'].action="upload.do";
         document.getElementById("form_upload").submit();
         return true;  
      }  
	 
		function downloadRecords(){

			var em = $("#exportmode").val();
			var url = "";
			if(em == 1){
				url = "exportZip.do";
			}else if(em == 2){
				url = "export.do";
			}

			// var url = "exportZip.do";
			window.open(url);
		}


	</script>
</head>

<body>



<div id = "content">
	<div id = "content-header">
		<h1><i class="fa fa-table"></i>
		成绩管理
		<button class="btn btn-info pull-right" style="margin-top: 10px;"> <i class="fa fa-download"></i> 导入模板下载</button>
		</h1>

	</div>


	<div class="container-fluid" style="margin-top: 8px;">
	    <div class="row-fluid">

	    	<p>              
              <button class="btn btn-primary" onclick="showaddmodal()"> <i class="fa fa-plus"></i> 新增</button>
              <button class="btn btn-success"  data-toggle="modal" data-target="#fileuploadModal"><i class="fa fa-upload"> </i> 导入</button>
              <button class="btn btn-info" data-toggle="modal" data-target="#exportModal"><i class="fa fa-share"> </i> 导出</button>
              <button class="btn btn-danger" onclick="deleterows()"><i class="fa fa-times"> </i> 删除</button>
            </p>

	    </div>
	</div> 


	<form action="#" method="post" class="form-horizontal container-fluid" style="margin-top: 1%;">        
		<div class="row-fluid">
	             <!-- <div class="control-group" > -->

<!-- 	            <table id = "inlinetable">
	            	<tbody>
	            		<tr>
	            			<td> -->
	            				
	            <div class="span3">
	              <label class="control-label hlabel" style="width: 60px; margin-left: 0px">所属考试:</label>
	              <!-- <span class="badge hlabel">所属考试:</span> -->
	              <div class="controls hcontrols" style="width:70%; margin-left: 0px; border-radius: 5px;">
	                <select >
                    <option value="0">请选择考试</option>
                        <option value="48">2016-2017学年度下学期七年级期末质量抽测</option>
                        <option value="49">2016-2017学年度下学期八年级期末质量抽测</option>

	                </select>
	              </div>
	            </div>

	            <div class="span2">
	              <label class="control-label hlabel" style="width: 60px;">所属县区:</label>
	              <div class="controls hcontrols"  style="width:60%; margin-left: 0px;">
	                <select>
                   		<option value="0">请选择县区</option>
                        <option value="2">城中区</option>
                        <option value="18">鱼峰区</option>
                        <option value="40">柳南区</option>
                        <option value="82">柳北区</option>
                        <option value="114">柳江县</option>
                        <option value="156">三江县</option>
                        <option value="186">融安县</option>
                        <option value="218">融水县</option>
                        <option value="266">柳城县</option>
                        <option value="302">鹿寨县</option>
	                </select>
	              </div>
	            </div>

	            <div class="span2">
	              <label class="control-label hlabel" style="width: 60px;">所属学校:</label>
	              <div class="controls hcontrols"  style="width:60%; margin-left: 0px;">
	                <select id="selectschool">
                   		<option value="0">请选择学校</option>
                        <option value="2">十二中</option>
                        <option value="18">四十五中</option>
                        <option value="40">铁一中</option>
                        <option value="82">二中</option>
                        <option value="114">四十二中</option>
                        <option value="156">三十中</option>
                        <option value="186">融安县</option>
	                </select>
	              </div>
	             </div>

	            <div class="span2">
	              <label class="control-label hlabel" style="width: 60px;">学生姓名:</label>
	              <div class="controls hcontrols"  style="width:60%; margin-left: 0px;">
	                <input style="width: 80px;" type="Text" name="studentname" placeholder="请输入姓名">
	              </div>
	            </div>

	            <div class="span2">
	              <label class="control-label hlabel" style="width: 60px;">学生编号:</label>
	              <div class="controls hcontrols"  style="width:60%; margin-left: 0px;">
	                <input style="width: 80px;" type="Text" name="studentid"  title = "请输入编号" placeholder="请输入编号">
	              </div>
	            </div>

				<div class="span1">
			      <div id="search" class="controls hcontrols" style="margin-left: 0px;">
			        <button  type="button" style="float: left;width: 80px;" class="btn btn-info" title="查询" onclick="search()"><i class="fa fa-search fa-white"></i>查询</button>
			      </div>
			    </div>

	</form> 





<div class="widget-box">
          <div class="widget-title">

          </div>



          <div class="widget-content">

            <table class="table table-bordered table-striped table-hover" id="mydatatable">
              <thead>
                <tr>
                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <th>学号</th>
                  <th>姓名</th>
                  <th>学校</th>
                  <th>语文</th>
                  <th>数学</th>
                  <th>英语</th>
                  <th>物理</th>
                  <th>化学</th>
                  <th>思想品德</th>
                  <th>历史</th>
                  <th>地理</th>
                  <th>生物</th>
                  <th>操作</th>
                </tr>
              </thead>

            </table>
          </div>
        </div>





</div>














<div class="modal hide fade" id="fileuploadModal">

  <div class="modal-body" >


	<div id = "content">
		<div id = "content-header">
			<h1 style="text-align: center;"><i class="fa fa-table"></i>
			成绩录入
			</h1>

		</div>

	<div class="widget-box">
	          
		<div class="widget-content">
			<form method="POST"  enctype="multipart/form-data" id="form_upload" action="#"> 
				<label class="control-label" style="width: 60px;">所属考试:</label>
		      <div class="controls" style="width:300px; margin-bottom: 10px;">
		        <select>
		        <option value="0">请选择考试</option>
		            <option value="48">2016-2017学年度下学期七年级期末质量抽测</option>
		            <option value="49">2016-2017学年度下学期八年级期末质量抽测</option>

		        </select>
		      </div>
	    	<input id="upfile" type="file" name="upfile">
			</form>


		</div>

	</div>



	</div>

    </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
     <input type="button" class="btn btn-primary" value="提交" name="btn" id="btn">
  </div>
</div>










<div class="modal hide fade" id="addModal"">

	  <div class="modal-body" style="max-height: 380px;">


			<div id = "content">
				<div id = "content-header">
					<h1 style="text-align: center;"><i class="fa fa-list"></i>
					新增学生成绩
					</h1>

				</div>

				<div class="widget-box">
				          
					<div class="widget-content">

						
							
								<label class="control-label hlabel" style="width: 60px;">所属考试:</label>
							    <div class="controls" style="width:300px; margin-bottom: 10px; margin-left: 70px;">
							      
							        <select>
							        <option value="0">请选择考试</option>
							            <option value="48">2016-2017学年度下学期七年级期末质量抽测</option>
							            <option value="49">2016-2017学年度下学期八年级期末质量抽测</option>

							        </select>

								</div>
							

							
								<label class="control-label hlabel" style="width: 60px;">所属县区:</label>
					            <div class="controls"  style="width:180px; margin-bottom: 10px; margin-left: 70px;">
					              
					                <select>
					               		<option value="0">请选择县区</option>
					                    <option value="2">城中区</option>
					                    <option value="18">鱼峰区</option>
					                    <option value="40">柳南区</option>
					                    <option value="82">柳北区</option>
					                    <option value="114">柳江县</option>
					                    <option value="156">三江县</option>
					                    <option value="186">融安县</option>
					                    <option value="218">融水县</option>
					                    <option value="266">柳城县</option>
					                    <option value="302">鹿寨县</option>
					                </select>
					             </div>
							

								<label class="control-label hlabel" style="width: 60px;">所属学校:</label>
						      <div class="controls" style="width:180px; margin-bottom: 10px; margin-left: 70px;">
						        <select>
							        <option value="0">请选择学校</option>
			                   		<option value="0">请选择县区</option>
			                        <option value="2">十二中</option>
			                        <option value="18">四十五中</option>
			                        <option value="40">铁一中</option>
			                        <option value="82">二中</option>
			                        <option value="114">四十二中</option>
			                        <option value="156">三十中</option>
			                        <option value="186">融安县</option>

						        </select>

						      </div>


					<form id="addform">

				              <label class="control-label hlabel" style="width: 60px;">学生编号:</label>
				              <div class="controls"  style="width:400px; margin-bottom: 10px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="id" id="id" title = "请输入编号" placeholder="请输入编号">
				              </div>

				              <label class="control-label hlabel" style="width: 60px;">学生姓名:</label>
				              <div class="controls"  style="width:400px; margin-bottom: 10px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="name" id="name" title = "请输入姓名" placeholder="请输入姓名">
				              </div>

				              <label class="control-label hlabel" style="width: 60px;">学校:</label>
				              <div class="controls"  style="width:400px; margin-bottom: 10px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="school" id="school" title = "请输入学校" placeholder="请输入学校">
				              </div>

				              <label class="control-label hlabel" style="width: 60px;">语  文:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="chinese" id="chinese" title = "请输入语文成绩" value="0">
				              </div>			              

				              <label class="control-label hlabel" style="width: 60px;">数学:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="math" id="math" title = "请输入数学成绩" value="0">
				              </div>	

				            	<label class="control-label hlabel" style="width: 60px;">英语:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="english" id="english" title = "请输入英语成绩" value="0">
				              </div>	  

				            	<label class="control-label hlabel" style="width: 60px;">物理:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="physics" id="physics" title = "请输入物理成绩" value="0">
				              </div>	

				            	<label class="control-label hlabel" style="width: 60px;">化学:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="chemistry" id="chemistry" title = "请输入化学成绩" value="0">
				              </div>	

				            	<label class="control-label hlabel" style="width: 60px;">思想品德:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="sxpd" id="sxpd" title = "请输入思想品德成绩" value="0">
				              </div>	

				            	<label class="control-label hlabel" style="width: 60px;">历史:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="history" id="history" title = "请输入历史成绩" value="0">
				              </div>	

				            	<label class="control-label hlabel" style="width: 60px;">地理:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="geography" id="geography" title = "请输入地理成绩" value="0">
				              </div>	


				            	<label class="control-label hlabel" style="width: 60px;">生物:</label>
				              <div class="controls"  style="width:400px; margin-left: 70px;">
				                <input class="required" style="width: 80px;" type="Text" name="biology" id="biology" title = "请输入生物成绩" value="0">
				              </div>	


						</form>


					</div>

				</div>



			</div>


	    </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <a href="#" class="btn btn-primary" onclick="add()">新增</a>
  </div>
</div>






<div class="modal hide fade" id="editModal">

    <div class="modal-body" style="max-height: 380px;">


      <div id = "content">
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-edit"></i>
          修改成绩
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content">

            <form id = "editform">
              
                <label class="control-label hlabel" style="width: 60px;">学号:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name="id"  type="text"  value="">
                </div>                    

                <label class="control-label hlabel" style="width: 60px;">姓名:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "name"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">学校:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "school"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">语文:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "chinese"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">数学:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "math"  type="text"  value="">
                </div>                

                <label class="control-label hlabel" style="width: 60px;">英语:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "english"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">物理:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "physics"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">化学:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "chemistry"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">思想品德:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "sxpd"  type="text"  value="">
                </div>

                <label class="control-label hlabel" style="width: 60px;">历史:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "history"  type="text"  value="">
                </div>         

                <label class="control-label hlabel" style="width: 60px;">地理:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "geography"  type="text"  value="">
                </div>     

                <label class="control-label hlabel" style="width: 60px;">生物:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "biology"  type="text"  value="">
                </div>   






            </form>


          </div>

        </div>



      </div>





      </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <a href="#" class="btn btn-primary" onclick= "edit()">修改</a>
  </div>
</div>





<div class="modal hide fade" id="exportModal">

    <div class="modal-body" style="max-height: 380px;">


      <div id = "content">
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-edit"></i>
          导出成绩
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content" style = "height: 50px;">
			
					<label class="control-label hlabel" style="width: 60px;">导出模式:</label>
	              <div class="controls hcontrols"  style="width:180px; margin-left: 10px;">
	                <select id="exportmode">
                        <option value="1">导出压缩文件</option>
                        <option value="2">导出excel</option>
	                </select>
			




	              </div>



                

          </div>

        </div>



      </div>





      </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <a href="#" class="btn btn-primary" onclick= "downloadRecords()">导出</a>
  </div>
</div>









<script src="../js/jquery-1.7.2.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/jquery.uniform.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/jquery.dataTables.min.js"></script> 
<script src="../js/matrix.js"></script> 
<!-- <script src="../js/matrix.tables.js"></script> -->
<script src="../js/matrix.tables.js"></script>



<script src="../js/bootstrap-colorpicker.js"></script> 
<script src="../js/bootstrap-datepicker.js"></script> 
<script src="../js/masked.js"></script> 
<script src="../js/matrix.form_common.js"></script> 
<script src="../js/jquery.peity.min.js"></script> 
<script src="../js/jquery.form.js"></script>

<script type="text/javascript">
    var school = "请选择学校";
	var tables = $("#mydatatable").dataTable({

					"bJQueryUI": true,
					"sPaginationType": "full_numbers",
					"sDom": '<""l>t<"F"fp>',
			    	serverSide: true,//分页，取数据等等的都放到服务端去
			        processing: true,//载入数据的时候是否显示“载入中”
			        pageLength: 10,  //首次加载的数据条数
			        ordering: false, //排序操作在服务端进行，所以可以关了。
			        pagingType: "full_numbers",
			        autoWidth: false,
			        stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
			        searching: false,
			        ajax: {   
			        	type: "post",
			            url: "<%=basePath%>person/details",
			            dataSrc: "data",
	                    data: function (d) {
	                        var param = {};
	                        param.draw = d.draw;
	                        param.start = d.start;
	                        param.length = d.length;
	                        param.school = school;
                        	return param;//自定义需要传递的参数。
			       		},
			    	},


			    	columns: [//对应上面thead里面的序列
			    		{"data": null},
	               		{"data": 'id' }, 
	               		{"data": 'name' },
	               		{"data": 'school' },
  	                    {"data": 'chinese'},
  	                    {"data": 'math'},
  	                  	{"data": 'english'},
  	                	{"data": 'physics'},
  	             	 	{"data": 'chemistry'},
  	           			{"data": 'sxpd'},
  	          			{"data": 'history'},
  	        			{"data": 'geography'},
  	        			{"data": 'biology'},
  	        			{"data": null}
	                ],



                 	"columnDefs":[
	                {
	                    "render":function(data,type,row){
	                        if(row.checklist=="true"){
	                            return "<input type='checkbox' checked/>"
	                        }else{
	                            return "<input type='checkbox'/>"
	                        }
	                },
	                    "targets":0
	                },
	                {
	                    "render":function(data,type,row){
	                        return " <div class='btn-group'>"+
	                              //"<button id='infoRow' class='btn btn-primary btn-sm' type='button'><i class='fa fa-search'></i> </button>"+
	                                "<button id='editRow' class='btn btn-default btn-sm' type='button'><i class='fa fa-edit'></i></button>"+
	                                "<button id='delRow' class='btn btn-default btn-sm' type='button'><i class='fa fa-trash-o'></i></button></div>"

	                },
	                    "targets":-1
	                }
	            	],


				    language: {
				        "sProcessing": "处理中...",
				        "sLengthMenu": "显示 _MENU_ 项结果",
				        "sZeroRecords": "没有匹配结果",
				        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
				        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				        "sInfoPostFix": "",
				        // "sSearch": "搜索:",
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

	            });


			        $('#mydatatable tbody').on( 'click', '#editRow', function () {
		          var data = tables.api().row($(this).parents('tr')).data();
		          
		          // $("input[name=id]").val(data.id)
		          $("#editform input[name=id]").attr("value", data.id);
		          $("#editform input[name=name]").attr("value", data.name);
		          $("#editform input[name=school]").attr("value", data.school);
		          $("#editform input[name=chinese]").attr("value", data.chinese);
		          $("#editform input[name=math]").attr("value", data.math);
		          $("#editform input[name=english]").attr("value", data.english);
		          
		          $("#editform input[name=physics]").attr("value", data.physics);
		          $("#editform input[name=chemistry]").attr("value", data.chemistry);
		          $("#editform input[name=sxpd]").attr("value", data.sxpd);
		          $("#editform input[name=history]").attr("value", data.history);
		          $("#editform input[name=geography]").attr("value", data.geography);
		          $("#editform input[name=biology]").attr("value", data.biology);
		 
		          
		          $("#editModal").modal("show");
		          
		            });



		        //删除单行
				
				$('#mydatatable tbody').on( 'click', '#delRow', function () {
					var data = tables.api().row($(this).parents('tr')).data();
		            if(confirm("是否确认删除" + data.id + "这条信息?")){
		                $.ajax({
		                    url:"<%=basePath%>person/delete/" + data.id,
		                    type:'delete',
		                    dataType: "json",
		                    //timeout:"3000",
		                    cache:"false",
		                    success:function(res){
		                        if(res.status == 1){
		                        	//var $toast = toastr['info']('<sp:message code='sys.oper.success'/>');
		                        	// toastr.success("<sp:message code='sys.oper.success'/>");
		                        	alert("删除成功");
		                        	tables.api().row().remove().draw(false);//删除这行的数据
		                        	//tables.fnDraw();
		                            //window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
		                        }else{
		                        	// toastr.error("<sp:message code='sys.oper.success'/>");
		                        	alert("删除失败");
		                        }
		                    },
		                    error:function(err){
		                    	// toastr.error("Server Connection Error...");
		                    	alert("服务器连接失败");
		                    }
		                });
		            }
		        });


				//删除多行
				function deleterows(){
					if(confirm("确认删除所勾选项?")){
						var rows = [];
						$('#mydatatable tbody tr').each(function(){
/*							if($(this).find("checkbox").attr("checked") == true){
								alert("in");*/
								// rows.add($(this));

								var tds = $(this).find("td");
								if(tds.find("input").attr("checked") == "checked"){
									rows.push(tds[1].outerText);
								}
								
								// console.log($(this).find("input").attr("checked"));

							
						});
						if(rows.length != 0){
							$.ajax({
		                    url:"<%=basePath%>person/deleterows",
		                    data: {
		                    	"ids": rows
		                    },
		                    traditional: true,
		                    type:'post',
		                    dataType: "json",
		                    //timeout:"3000",
		                    cache:"false",
		                    // contentType: "application/json; charset=utf-8",
		                    success:function(res){
		                        if(res.status == 1){
		                        	//var $toast = toastr['info']('<sp:message code='sys.oper.success'/>');
		                        	// toastr.success("<sp:message code='sys.oper.success'/>");
		                        	alert("删除成功");
		                        	tables.api().row().remove().draw(false);//删除这行的数据
		                        	//tables.fnDraw();
		                            //window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
		                        }else{
		                        	// toastr.error("<sp:message code='sys.oper.success'/>");
		                        	alert("删除失败");
		                        }
		                    },
		                    error:function(err){
		                    	// toastr.error("Server Connection Error...");
		                    	alert("服务器出错");
		                    }
		                });
						}
					}
				}


				function edit(){
							$.ajax({
		                    url:"<%=basePath%>person/updateperson",
		                    data: $('#editform').serialize(),
		                    // traditional: true,
		                    type:'post',
		                    dataType: "json",
		                    //timeout:"3000",
		                    cache:"false",
		                    // contentType: "application/json; charset=utf-8",
		                    success:function(res){
		                        if(res.status == 1){
		                        	//var $toast = toastr['info']('<sp:message code='sys.oper.success'/>');
		                        	// toastr.success("<sp:message code='sys.oper.success'/>");
		                        	alert("修改成功");
		                        	tables.api().row().remove().draw(false);//删除这行的数据
		                        	//tables.fnDraw();
		                            //window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
		                        }else{
		                        	// toastr.error("<sp:message code='sys.oper.success'/>");
		                        	alert("修改失败");
		                        }
		                    },
		                    error:function(err){
		                    	// toastr.error("Server Connection Error...");
		                    	alert("服务器出错");
		                    }
		                });
				}




				function showaddmodal(){
					$("#addModal").modal("show");
				}

				function add(){

							// var id = $("#addform input[name=id]").attr("value");

				            $("addform .required:input").trigger("blur"); 
				            var numError = $("form .onError").length;
				            if(numError){
				                return false;
				            }							


							$.ajax({
		                    url:"<%=basePath%>person/saveperson",
		                    data: $('#addform').serialize(),
		                    // traditional: true,
		                    type:'post',
		                    dataType: "json",
		                    //timeout:"3000",
		                    cache:"false",
		                    // contentType: "application/json; charset=utf-8",
		                    success:function(res){
		                        if(res.status == 1){
		                        	//var $toast = toastr['info']('<sp:message code='sys.oper.success'/>');
		                        	// toastr.success("<sp:message code='sys.oper.success'/>");
		                        	alert("新增成功");
		                        	tables.api().row().remove().draw(false);//删除这行的数据
		                        	//tables.fnDraw();
		                            //window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
		                        }else{
		                        	// toastr.error("<sp:message code='sys.oper.success'/>");
		                        	alert("新增失败");
		                        }
		                    },
		                    error:function(err){
		                    	// toastr.error("Server Connection Error...");
		                    	alert("服务器出错");
		                    }
		                });
				}	
				
				function search(){
					school = $('#selectschool option:selected').text();
					$("#mydatatable").DataTable().ajax.reload();
				}
				
						




		        $("form :input.required").each(function(){ 
		            //创建元素
		            var $required = $("<strong  class='high'>*</strong>");
		            //将它追加到文档中
		            $(this).parent().append($required);
		        });	



		        //为表单的必填文本框添加相关事件（blur、focus、keyup）
		        $("form :input").blur(function(){
		            //注意：这里的this是DOM对象，$(this)才是jQuery对象
		            var $parent = $(this).parent();
		            //删除之前的错误提醒信息
		            $parent.find(".msg").remove();
		            //验证“id”
		            if($(this).is("#id")){
		                //运用jQuery中的$.trim()方法，去掉首位空格
		                if($.trim(this.value) == "" || $.trim(this.value).length < 6){
		                    var errorMsg = " 请输入至少6位的名称！";
		                    //class='msg onError' 中间的空格是层叠样式的格式
		                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
		                }
		                else{
		                    var okMsg="  √";
		                    $parent.find(".high").remove();
		                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
		                }                
		            }

		            if($(this).is("#name")){
		                //运用jQuery中的$.trim()方法，去掉首位空格
		                if($.trim(this.value) == "" || $.trim(this.value).length == 0){
		                    var errorMsg = " 姓名不能为空！";
		                    //class='msg onError' 中间的空格是层叠样式的格式
		                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
		                }
		                else{
		                    var okMsg="  √";
		                    $parent.find(".high").remove();
		                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
		                }                
		            }


		            if($(this).is("#chinese")){
		                //运用jQuery中的$.trim()方法，去掉首位空格
		                if($.trim(this.value) == ""){
		                    var errorMsg = " 姓名不能为空！";
		                    //class='msg onError' 中间的空格是层叠样式的格式
		                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
		                }else if(isNaN(this.value)){
		                	var errorMsg = " 请输入0~100内的数字!";
		                	$parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
		                }else if(+this.value < 0 || +this.value > 100){
		                	var errorMsg = " 请输入0~100内的数字!";
		                	$parent.append("<span class='msg onError'>" + errorMsg + "</span>"); 
		                }
		                else{
		                    var okMsg="  √";
		                    $parent.find(".high").remove();
		                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
		                }                
		            }

		            
		        }).keyup(function(){
		            //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
		            $(this).triggerHandler("blur");
		        }).focus(function(){
		            $(this).triggerHandler("blur");
		        });	



				$('#btn').click(function() {

			         var fileDir = $("#upfile").val();  
			         var suffix = fileDir.substr(fileDir.lastIndexOf("."));  
			         if("" == fileDir){  
			             alert("选择需要导入的Excel文件！");  
			             return false;  
			         }  
			         if(".xls" != suffix && ".xlsx" != suffix ){  
			             alert("选择Excel格式的文件导入！");  
			             return false;  
			         }		
			         


					if (true) {
						$('#form_upload').ajaxSubmit({
							url : "<%=basePath%>person/ajaxUpload.action",
							dataType : 'json',

		                    success:function(res){
		                        if(res.status == 1){
		                        	//var $toast = toastr['info']('<sp:message code='sys.oper.success'/>');
		                        	// toastr.success("<sp:message code='sys.oper.success'/>");
		                        	alert("上传成功:" + res.msg);
		                        	tables.api().row().remove().draw(false);//删除这行的数据
		                        	//tables.fnDraw();
		                            //window.location.reload();//重新刷新页面，还有一种方式：tables.draw(false);(这是不刷新，重新初始化插件，但是做删除时候，老有问题)
		                        }else{
		                        	// toastr.error("<sp:message code='sys.oper.success'/>");
		                        	alert("上传失败:" + res.msg);
		                        }
		                    },
		                    error:function(err){
		                    	// toastr.error("Server Connection Error...");
		                    	alert("服务器出错");
		                    }							

						});

					}
				});		        	        			



</script>




</body>
</html>