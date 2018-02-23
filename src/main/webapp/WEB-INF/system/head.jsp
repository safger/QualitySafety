<%@ page language="java"
	import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/bootstrap/css/bootstrap.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/font-awesome-4.6.3/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/ionicons-master/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/dist/css/AdminLTE.min.css">
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/dist/css/skins/_all-skins.min.css">
<!-- iCheck -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/iCheck/flat/blue.css">
<!-- Morris chart -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/morris/morris.css">
<!-- jvectormap -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

 
<header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container"> 
        <div class="navbar-header">
          <a href="javascript:hsub()" class="navbar-brand"><b>市一医院</b> | 医疗质量监管网络平台</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
          <ul class="nav navbar-nav">
          	<c:forEach items="${parentList }" var="list">
          	<li class="dropdown">
              <a href="<%=basePath%>${list.menuUrl }" class="dropdown-toggle" data-toggle="dropdown">${list.menuName }<span class="caret"></span></a>
             	<c:if test="${list.children!=null }">
             	  <ul class="dropdown-menu" role="menu">
             	  	<c:forEach items="${list.children }" var="clist">
							 <li ><a href="<%=basePath%>${clist.menuUrl }">${clist.menuName}</a></li>
							 <li style="margin: 5px 0" class="divider"></li>
						</c:forEach>
	              </ul>
             	</c:if>
            </li>
            </c:forEach> 
          </ul>
        </div>
        <!-- /.navbar-collapse -->
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">

            <!-- Notifications Menu -->
            <!-- <li class="dropdown notifications-menu">
              Menu toggle button
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o"></i>
                <span class="label label-warning">10</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">You have 10 notifications</li>
                <li>
                  Inner Menu: contains the notifications
                  <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;"><ul class="menu" style="overflow: hidden; width: 100%; height: 200px;">
                    <li>start notification
                      <a href="#">
                        <i class="fa fa-users text-aqua"></i> 5 new members joined today
                      </a>
                    </li>
                    end notification
                  </ul><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 3px; position: absolute; top: 0px; opacity: 0.4; display: block; border-radius: 7px; z-index: 99; right: 1px;"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                </li>
                <li class="footer"><a href="#">View all</a></li>
              </ul>
            </li> -->
            <!-- User Account Menu -->
            <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="<%=basePath%><c:choose><c:when test="${empty sessionScope.headImg}">/images/user.png</c:when><c:otherwise>/upload/L_${sessionScope.headImg }</c:otherwise></c:choose>" class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.realname }</span> 
            </a>  
            <ul class="dropdown-menu"> 
              <!-- User image -->    
              <li class="user-header">
                <img src="<%=basePath%><c:choose><c:when test="${empty sessionScope.headImg}">/images/user.png</c:when><c:otherwise>/upload/L_${sessionScope.headImg }</c:otherwise></c:choose>" class="img-circle" alt="User Image">

                <p> 
                  ${sessionScope.userName }    
                  <small>  
                  	账号 ：${sessionScope.username }<br/>
                  	姓名 ：${sessionScope.realname }  
                  </small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer"> 
                <div class="pull-left">  
                  <a href="zz" class="btn btn-primary btn-flat">修改密码</a>
                </div>
                <div class="pull-right">  
                  <a href="<%=basePath %>system/logout.html" class="btn btn-primary btn-flat">登出</a>
                </div>
              </li> 
            </ul> 
          </li>
          </ul>
        </div> 
        <!-- /.navbar-custom-menu -->
      </div>
      <!-- /.container-fluid -->
    </nav>
  </header>
  
  <script>
  function hsub(){
	  var sysname='${sessionScope.sysname }';
	  switch(sysname)
		{  
		case "医疗质量监管网络平台":
			window.location.href="<%=basePath%>system/index.html";
		case "用药错误系统":
			window.location.href="<%=basePath%>medication/medicationReported/show.html";
		default:
			window.location.href="<%=basePath%>system/index.html";
		}
	 
  }
  </script>