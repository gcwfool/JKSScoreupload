<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>柳州市教科所期末成绩抽测上传系统</title>
    <meta charset="UTF-8" />
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="../css/matrix-style.css" />
    <link rel="stylesheet" href="../css/matrix-media.css" />
    <link href="../font-awesome/css/font-awesome.css" rel="stylesheet" />
</head>
<body>
    <!--Header-part-->
    <div id="header">
      <h1><a href="#">柳州市教科所期末成绩抽测上传系统</a></h1>
    </div>
    <!--close-Header-part--> 

    <!--top-Header-menu-->
    <div id="user-nav" class="navbar navbar-inverse">
        <ul class="nav">
            <li  class="dropdown" id="profile-messages" >
                <a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle">
                    <i class="fa fa-user"></i>&nbsp;
                    <span class="text">欢迎你，admin</span>&nbsp;
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#"><i class="fa fa-user"></i> 个人资料</a></li>
                    <li class="divider"></li>
                    <li><a link="changepassword" target="#iframe-main" ><i class="fa fa-key"></i> 修改密码</a></li>
                    <li class="divider"></li>
                    <li><a href="../index.jsp"><i class="fa fa-share"></i> 退出系统</a></li>
                </ul>
            </li>
            <li class="dropdown" id="menu-messages">
                <a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle">
                    <i class="fa fa-envelope"></i>&nbsp;
                    <span class="text">我的消息</span>&nbsp;
                    <span class="label label-important">4</span>&nbsp; 
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a class="sAdd" title="" href="#"><i class="fa fa-plus"></i> 新消息</a></li>
                    <li class="divider"></li>
                    <li><a class="sInbox" title="" href="#"><i class="fa fa-envelope"></i> 收件箱</a></li>
                    <li class="divider"></li>
                    <li><a class="sOutbox" title="" href="#"><i class="fa fa-arrow-up"></i> 发件箱</a></li>
                    <li class="divider"></li>
                    <li><a class="sTrash" title="" href="#"><i class="fa fa-trash"></i> 回收站</a></li>
                </ul>
            </li>
            <li class=""><a title="" href="#"><i class="fa fa-cog"></i> <span class="text">&nbsp;设置</span></a></li>
            <li class=""><a title="" href="../index.jsp"><i class="fa fa-share"></i> <span class="text">&nbsp;退出系统</span></a></li>
        </ul>
    </div>
    <!--close-top-Header-menu-->



    <!--sidebar-menu-->
    <div id="sidebar" style="OVERFLOW-Y: auto; OVERFLOW-X:hidden;">
        <ul>
            <li class="submenu active">
                <a class="menu_a" link="scoremanager" target="#iframe-main" ><i class="fa fa-table"></i> <span>成绩管理</span></a> 
            </li>
            <li class="submenu"> 
                <a href="#">
                    <i class="fa fa-book"></i> 
                    <span>资料管理</span> 
                    <span class="label label-important">2</span>
                </a>
                <ul>
                    <li><a class="menu_a" link="kaoshiinfo" target= "#iframe-main"><i class="fa fa-caret-right"></i>考试信息</a></li>
                    <li><a class="menu_a" link="kemumanager" target = "#iframe-main"><i class="fa fa-caret-right"></i>科目管理</a></li>
                </ul>
            </li>
            <li class="submenu">
				<a href="#">
                    <i class="fa fa-cog"></i> 
                    <span>系统管理</span> 
                    <span class="label label-important">4</span>
                </a>
				<ul>
                    <li><a class="menu_a" link="usermanager" target = "#iframe-main"><i class="fa fa-caret-right"></i> 用户管理</a></li>
                    <li><a class="menu_a" link="authoritymanager" target = "#iframe-main"><i class="fa fa-caret-right"></i>角色管理</a></li>
                    <li><a class="menu_a" link="logmanager" target = "#iframe-main"><i class="fa fa-caret-right"></i>日志管理</a></li>
					<li><a class="menu_a" link="personalmanager" target = "#iframe-main"><i class="fa fa-caret-right"></i>个人管理</a></li>
					
                </ul>
            </li>
        </ul>
    </div>
    <!--sidebar-menu-->

    <!--main-container-part-->
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
          <div id="breadcrumb"> <a href="<%=basePath%>person/main" title="返回主页" class="tip-bottom"><i class="fa fa-home"></i> Home</a></div>
        </div>
        <!--End-breadcrumbs-->
        <iframe src="<%=basePath%>person/scoremanager" id="iframe-main" frameborder='0' style="width:100%;"></iframe>
    </div>
    <!--end-main-container-part-->

    <script src="../js/excanvas.min.js"></script> 
    <script src="../js/jquery.min.js"></script> 
    <script src="../js/jquery.ui.custom.js"></script> 
    <script src="../js/bootstrap.min.js"></script> 
    <script src="../js/nicescroll/jquery.nicescroll.min.js"></script> 
    <script src="../js/matrix.js"></script> 


    <script type="text/javascript">

    //初始化相关元素高度
    function init(){
        $("body").height($(window).height()-80);
        $("#iframe-main").height($(window).height()-90);
        $("#sidebar").height($(window).height()-50);
    }

    $(function(){
        init();
        $(window).resize(function(){
            init();
        });
    });

    // This function is called from the pop-up menus to transfer to
    // a different page. Ignore if the value returned is a null string:


    // resets the menu selection upon entry to this page:
    function resetMenu() {
        document.gomenu.selector.selectedIndex = 2;
    }

    // uniform使用示例：
    // $.uniform.update($(this).attr("checked", true));
    </script>
</body>
</html>
