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

<title>科目管理</title>

</head>

<body>
	
	<div id = "content">

  	<div id = "content-header">
  		<h1><i class="fa fa-table"></i>
  		科目管理
  		</h1>
    </div>

<!--   <div class="container-fluid">
    <div class="row-fluid">
	</div> -->


        <div class="widget-box">
          <div class="widget-title">
            <h5><i class="fa fa-th"></i>	科目列表</h5>

            <button class="btn btn-primary pull-center" data-toggle= "modal" data-target = "#addkemuModal"><i class="fa fa-plus-circle"></i>	新增</button>

          </div>
          <div class="widget-content nopadding">




			<table id = "kemutable" class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <!-- <th>科目编号</th> -->
                  <th>科目名称</th>
                  <th>满分</th>
                  <th>操作</th>
                </tr>
              </thead>

            </table>


            </div>

	</div>

	</div>






<div class="modal hide fade" id="addkemuModal">

    <div class="modal-body" >


      <div id = "content" style="height: 250px;">
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-list"></i>
          新增考试科目
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content">

            <form action="#" >
              
	              <label class="control-label hlabel" style="width: 60px;">科目编号:</label>
	              <div class="controls"  style="width:80px; margin-bottom: 10px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="kemuid" value="09" disabled="true">
	              </div>


	              <label class="control-label hlabel" style="width: 60px;">科目名称:</label>
	              <div class="controls"  style="width:80px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="kemuname"  title = "请输入科目名称">
	              </div>			              

	              <label class="control-label hlabel" style="width: 60px;">满分成绩:</label>
	              <div class="controls"  style="width:80px; margin-left: 70px;">
	                <input style="width: 80px;" type="text" name="kemuscore"  title = "请输入满分成绩">
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





<div class="modal hide fade" id="editkemuModal">

    <div class="modal-body" >


      <div id = "content" style="height: 250px;">
        <div id = "content-header">
          <h1 style="text-align: center;"><i class="fa fa-edit"></i>
          修改考试科目
          </h1>

        </div>

        <div class="widget-box">
                  
          <div class="widget-content">

            <form action="#" >
              

                <label class="control-label hlabel" style="width: 60px;">科目名称:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name="editsnameinput" style="width: 80px;" type="text" name="kemuname"  title = "请输入科目名称">
                </div>                    

                <label class="control-label hlabel" style="width: 60px;">满分成绩:</label>
                <div class="controls"  style="width:80px; margin-left: 70px;">
                  <input name = "editscoreinput" style="width: 80px;" type="text" name="kemuscore"  title = "请输入满分成绩">
                </div>






            </form>


          </div>

        </div>



      </div>





      </div>

  <div class="modal-footer">
     <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
    <a href="#" class="btn btn-primary">修改</a>
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
       {"checklist":"false","kemu":"语文","maxscore":100,"option":""},
        {"checklist":"false","kemu":"数学", "maxscore":90,  "option":""},
        {"checklist":"false","kemu":"英语","maxscore":80, "option":""},

    ];


  var tables = $("#kemutable").dataTable({

          "bJQueryUI": false,
/*          "sPaginationType": "full_numbers",
          "sDom": '<""l>t<"F"fp>',
            serverSide: true,//分页，取数据等等的都放到服务端去
              processing: true,//载入数据的时候是否显示“载入中”
              pageLength: 10,  //首次加载的数据条数
              ordering: false, //排序操作在服务端进行，所以可以关了。
              pagingType: "full_numbers",
              autoWidth: false,
              stateSave: true,//保持翻页状态，和comTable.fnDraw(false);结合使用
              searching: false,*/

              stateSave: false,
          "data" : data,
          bLengthChange: false,

          bFilter: false,
          bPaginate: false,
          bInfo: false,

            columns: [//对应上面thead里面的序列
                    
                    {"data":"checklist"},
                        {"data": "kemu"},
                        {"data": "maxscore"},
                        {"data": "option"},

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
                    "targets":3
                }
            ]


              });






        $('#kemutable tbody').on( 'click', '#editRow', function () {
          var data = tables.api().row($(this).parents('tr')).data();
          
          $("input[name=editsnameinput]").val(data.kemu);
          $("input[name=editscoreinput]").val(data.maxscore);
 
          
          $("#editkemuModal").modal("show");
          
            });




  
    $("#gradeselect").change(function(e) {
      // option:selected
      // alert(e.target.value)

      if(e.target.value == 48){
        // alert(e.target.value)
        // $.uniform.update($("#yuweninput").attr("checked",false));
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