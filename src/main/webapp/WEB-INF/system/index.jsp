<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">   
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>市一医院 | 医疗质量监管网络平台</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<style>
    .color-palette {
      height: 35px;
      line-height: 35px;
      text-align: center;
    }

    .color-palette-set {
      margin-bottom: 15px;
    }

    .color-palette span {
      display: block;
      font-size: 12px;
    }

    .color-palette:hover span {
      display: block;
    }

    .color-palette-box h4 {
      position: absolute;
      top: 100%;
      left: 25px;
      margin-top: -40px;
      color: rgba(255, 255, 255, 0.8);
      font-size: 12px;
      display: block;
      z-index: 7;
    }
  </style>
   <link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/select2/select2.min.css">
</head> 
<body class="skin-blue layout-top-nav">	
	<div class="wrapper"> 

		<c:import url="/system/menuDataTop.html"></c:import>
		<!-- Content Wrapper. Contains page content -->	 
		<div class="content-wrapper">
		<div class="container"> 
			<section class="content">
      <!-- COLOR PALETTE -->
      <div class="box box-default color-palette-box">
        <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-tag"></i>病区病人</h3> 
                
            <span style="font-size: 12px;font-weight: bold;color: red;">友情提示：绿色的为一级护理，蓝色的为二级护理，红色的为特级护理</span>   
        </div>
        
        <div class="box-body">
        
        <div class="row" style="margin-left: 5px;margin-bottom: 15px;width: 40%;float: left;">
                <select id="bq" class="form-control select2" style="width: 100%;">
                <c:forEach items="${tyy_list }" var="list">
              	  <option value="${list.code }"  >${list.fullname }</option>
                </c:forEach> 
                </select>   
       	 </div> 
       	  <div class="row" style="margin-left: 15%;margin-bottom: 15px;width: 40%;float: left;">
                <input style="float: left;" id="clinicnumber" name="clinicnumber" type="text" placeholder="请输入市民卡号或健康卡号" value=""   />
                <button onclick="getHisp()" type="button" style="float: left;width: 150px;margin-left: 20px" class="btn btn-block btn-primary btn-sm">历史门诊病人</button>
       	 </div>
          <div class="row" style="clear: both;"  id="con"> 
          	<c:forEach items="${pat_list }" var="list">
          		<c:choose>
					<c:when test="${list.careLevel=='一级护理'}">
						<div class="col-sm-4 col-md-2" onclick="showPatient('${list.fuid}','${list.wardCode}')">
			              <div class="color-palette-set">
			                <div class="bg-green disabled color-palette"><span>病床号：${list.bedNo }</span></div>
			                <div class="bg-green color-palette"><span>姓名：${list.patient }&nbsp;${list.sex}</span></div>
			                <div class="bg-green-active color-palette"><span>${list.healthType }</span></div>
			              </div>
			            </div>
					</c:when>
					<c:when test="${list.careLevel=='二级护理'}"> 
							<div class="col-sm-4 col-md-2" onclick="showPatient('${list.fuid}','${list.wardCode}')">
				              <div class="color-palette-set">
				                <div class="bg-light-blue disabled color-palette"><span>病床号：${list.bedNo }</span></div>
				                <div class="bg-light-blue color-palette"><span>姓名：${list.patient }&nbsp;${list.sex}</span></div>
				                <div class="bg-light-blue-active color-palette"><span>${list.healthType }</span></div>
				              </div>
				            </div>
					</c:when>
					<c:when test="${list.careLevel=='特级护理'}">
							<div class="col-sm-4 col-md-2" onclick="showPatient('${list.fuid}','${list.wardCode}')">
				              <div class="color-palette-set">
				                <div class="bg-red disabled color-palette"><span>病床号：${list.bedNo }</span></div>
				                <div class="bg-red color-palette"><span>姓名：${list.patient }&nbsp;${list.sex}</span></div>
				                <div class="bg-red-active color-palette"><span>${list.healthType }</span></div>
				              </div>
				            </div> 
					</c:when>
					<c:otherwise>
						<div class="col-sm-4 col-md-2" onclick="showPatient('${list.fuid}','${list.wardCode}')"> 
				              <div class="color-palette-set">
				                <div class="bg-gray disabled color-palette"><span>病床号：${list.bedNo }</span></div>
				                <div class="bg-gray color-palette"><span>姓名：${list.patient }&nbsp;${list.sex}</span></div>
				                <div class="bg-gray-active color-palette"><span>${list.healthType }</span></div>
				              </div>
				            </div>
					</c:otherwise>
				</c:choose>
          	</c:forEach>
            
          </div>
        </div>
        <!-- /.box-body -->
      </div> 
      <form id="mform" action="<%=basePath%>backstage/piccMaintenanceregistration/showEdit.html" method="post">
      	<input type="hidden" id="patientId" name="patientId" value="" /> 
      	<input type="hidden" id="wardcode" name="wardcode" value="" /> 
      </form>

    </section>
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="foot.jsp" />
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/select2/select2.full.min.js"></script>
	<script type="text/javascript">
	
	$(function() { 
		$("#bq").find("option").each(function (){
			if($(this).val()=='${wardcode}'){
				$(this).attr("selected","selected");
			}
		}) 
		 $(".select2").select2();  
		 $("#bq").change(function (){
			window.location.href="<%=basePath%>system/index.html?wardcode="+$(this).val();
		 }) 
	})
	function showPatient(patid,wardcode){
		$("#patientId").val(patid);
		$("#wardcode").val(wardcode);
		$("#mform").submit();
	}
	
	

	$(function() { 
		document.getElementById("clinicnumber").focus();
	 	/* $("#clinicnumber").keydown(function(){
	 		console.log($(this).length);
	 		if($(this).length==11){ 
	 			alert($(this).val());
	 		}
	 	}); */
	 	
		$("#clinicnumber").on('input propertychange',function(){
             var result = $(this).val();
             if(result.length==9){ 
            	 getPatient(result);
 	 		} 
         }); 
		 
		  
	})
	 
	function getPatient(mznum){
		$.ajax({
    		url:"<%=basePath%>/backstage/piccMaintenanceregistration/getPatient.html",
    		data:{"mznum":mznum},
    		method:"post",
    		dataType:"json", 
    		success:function(res){
    			var ht="";
    			ht+="<div class='col-sm-4 col-md-2' onclick=showPatient('"+res.fuid+"','"+res.wardCode+"')>";
    			ht+='<div class="color-palette-set">';
    			ht+='<div class="bg-green disabled color-palette"><span>门诊号：'+res.clinicnumber+'</span></div>';
    			ht+='<div class="bg-green color-palette"><span>姓名：'+res.patient+'&nbsp;'+res.sex+'</span></div>';
    			var phone=res.phone;
    			phone=phone!=null?phone:"";
    			ht+=' <div class="bg-green-active color-palette"><span>'+phone+'</span></div>';
    			ht+='</div>';
    			ht+='</div>';
    			$("#con").html(ht);
    		}
		})	
	}
	  
	function getHisp(){
		
		$.ajax({
    		url:"<%=basePath%>/backstage/piccMaintenanceregistration/historyPatient.html",
    		data:{},
    		method:"post",
    		dataType:"json", 
    		success:function(res){
    			var ht="";
    			for(var a=0;a<res.length;a++){
    				ht+="<div class='col-sm-4 col-md-2' onclick=showPatient('"+res[a].fuid+"','"+res[a].wardCode+"')>";
        			ht+='<div class="color-palette-set">';
        			ht+='<div class="bg-green disabled color-palette"><span>门诊号：'+res[a].clinicnumber+'</span></div>';
        			ht+='<div class="bg-green color-palette"><span>姓名：'+res[a].patient+'&nbsp;'+res[a].sex+'</span></div>';
        			var phone=res[a].phone; 
        			phone=phone!=null?phone:"";
        			ht+=' <div class="bg-green-active color-palette"><span>'+phone+'</span></div>';
        			ht+='</div>';
        			ht+='</div>';
    			}
    			$("#con").html(ht);
    		}
		})	
	}
	</script> 
</body>
</html>
