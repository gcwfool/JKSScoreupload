<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Matrix Admin</title>
<meta charset="UTF-8" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="../css/uniform.css" />
<link rel="stylesheet" href="../css/select2.css" />
<link rel="stylesheet" href="../css/matrix-style2.css" />
<link rel="stylesheet" href="../css/matrix-media.css" />
<link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/treestyle.css" />
<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'> -->


<style>



/*  .control-group,
  .controls,
  .control-label,
  label{
    float: left;
    margin:  1px;
    padding: 1px;
    display:inline-block;
  }*/

  .hcontrols,
  .hlabel{
    float: left;
    margin:  1px;
    padding: 1px;
    display:inline-block;
  }


/*#srarch-horizontal{
    float: left;
    margin: 0;
    padding: 0;
    display:inline-block;
}*/


</style>


</head>
<body>

<!--main-container-part-->
<div id="content">
  <div id="content-header">
      <h1><i class="fa fa-user-o"></i>  用户管理</h1>
  </div>
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span3">



            <div class="tree" style="overflow:scroll; background-color:#f0f0f0; margin-bottom: 0px; height:500px;">
                <ul>

                  <li>

                     <i class="fa fa-minus-circle fa-lg"></i> <span><i class="fa fa-users fa-lg"></i> 柳州市教科所</span>

                    <ul>

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#"><i class="fa fa-user fa-lg"></i> 鱼峰区</a></span> 



                      </li>

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#"><i class="fa fa-user fa-lg"></i> 城中区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>


                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>

                       <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>                     

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>

                      <li>

                        <i class="fa fa-minus-circle fa-lg"></i> <span> <a href="#">柳南区</a></span> 

                        <ul>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span>

                            

                          </li>

                          <li>

                            <span><i class="fa fa-user-o fa-lg"></i> 铁一中</span> 

                          </li>

                        </ul>

                      </li>



                                            

                    </ul>

                  </li>

                  

                </ul>

                </div>



<!-- 
          </div>
        </div> -->

        <!-- span2 -->
      </div>




<div class="span9">

<!--   <div class="container-fluid" style="margin-top: 8px;">
      <div class="row-fluid"> -->

          <form action="#" method="post" class="form-horizontal nopadding" style="margin-top: 20px; margin-left: 1px; float: left;">        

                     <!-- <div class="control-group" > -->

      <!--              <table id = "inlinetable">
                      <tbody>
                        <tr>
                          <td> -->
                            

                      <label class="control-label hlabel" style="width: 60px; ">用户姓名:</label>
                      <div class="controls hcontrols" style="width:200px; margin-left:10px;">
                        <select>
                          <option value="0">请输入用户名</option>
                              <option value="48">鱼峰区</option>
                              <option value="49">十二中</option>

                        </select>
                      </div>

                      <label class="control-label hlabel" style="width: 80px;">账号:</label>
                      <div class="controls hcontrols"  style="width:80px; margin-left: 10px;">
                        <input style="width: 80px;" type="Text" name="studentname" placeholder="请输入账号">
                      </div>

<!--                       <label class="control-label hlabel" style="width: 60px;">所属县区:</label>
                      <div class="controls hcontrols"  style="width:180px; margin-left: 10px;">
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
                      <div class="controls hcontrols"  style="width:180px; margin-left: 10px;">
                        <select>
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




                      <label class="control-label hlabel" style="width: 80px;margin-left: 20px;">学生编号:</label>
                      <div class="controls hcontrols"  style="width:80px; margin-left: 10px;">
                        <input style="width: 80px;" type="Text" name="studentid"  title = "请输入编号" placeholder="请输入编号">
                      </div> -->


                  <div id="search" class="controls hcontrols" style="margin-left: 30px;">
                    <button type="submit" class="btn btn-info" title="查询"><i class="fa fa-search"></i>查询</button>
                  </div>



      <!--                    </td>
                        </tr>
                      </tbody>
                    </table>
       -->






                    <!-- </div> -->

        </form>       

<!--       </div>
  </div>  -->
  
            <table class="table table-bordered table-striped table-hover with-check" style="height: %100;">
              <thead>
                <tr>
                  <th><input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" /></th>
                  <th>登录账号</th>
                  <th>用户部门</th>
                  <th>所属部门</th>
                  <th>角色</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
                <tr>
                  <td><input type="checkbox" /></td>
                  <td>czq</td>
                  <td>城中区</td>
                  <td>城中区</td>
                  <td>默认角色，县区教研室，学校上传员</td>
                </tr>
              </tbody>
            </table>


</div>



    </div>
    <hr>

  </div>
</div>
<!--main-container-part-->

<script src="../js/jquery.min.js"></script> 
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/jquery.ui.custom.js"></script> 
<script src="../js/matrix.js"></script>
<script src="../js/jquery.dataTables.min.js"></script> 
<script src="../js/select2.min.js"></script> 
<script src="../js/matrix.tables.js"></script>


<script src="../js/jquery.uniform.js"></script> 

<script src= "../js/jquery.pseudo.js"></script>


<script type="text/javascript">

$(function(){

    $('.tree li:has(ul)').addClass('parent_li').find(' > i').attr('title', 'Collapse this branch');




    $('.tree li.parent_li > i').on('click', function (e) {

        var 柳南区ren = $(this).parent('li.parent_li').find(' > ul > li');

        if (柳南区ren.is(":visible")) {

            柳南区ren.hide('fast');

            $(this).attr('title', 'Expand this branch').addClass('fa-plus-circle').removeClass('fa-minus-circle');

        } else {

            柳南区ren.show('fast');

            $(this).attr('title', 'Collapse this branch').addClass('fa-minus-circle').removeClass('fa-plus-circle');

        }

        e.stopPropagation();

    });

});

</script>
</body>
</html>
