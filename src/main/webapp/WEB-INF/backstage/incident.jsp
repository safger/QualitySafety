 
<%@ page import="java.util.*" contentType="text/html;charset=UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>医疗安全事件 | 管理</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/dataTables.bootstrap.css">
  <link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/iCheck/all.css">
<style>
.ibox-tools {
	display: inline-block;
	float: right;
	margin-top: 0;
	position: relative;
	padding: 0;
}

.ibox-tools a {
	cursor: pointer;
	margin-left: 5px;
}

.btn-primary {
	background-color: #1ab394;
	border-color: #1ab394;
	color: #FFFFFF;
}

input.form-control {
	height: 28px;
	width: 100px;
	display: inline; 
}

.head-find {
	padding: 0 20px;
}

.head-find .row {
	margin-bottom: 15px;
}

.head-find .form-new-input {
	position: relative;
	font-family: "Microsoft YaHei";
}

.head-find .form-new-input span { /*position: absolute;*/
	width: 107px; 
	height: 32px;
	background: #ecf0f5;
	font-size: 14px;
	color: #000;
	line-height: 32px; /* left: 1px; top: 1px; */
	padding-left: 5px;
	float: left;
	border: 1px solid #d2d6de;
	border-right: none;
}

.head-find .form-new-input .fis {
	float: left;
	width: 110px;
	border: 1px solid #d2d6de;
	font-size: 14px;
	color: #000;
	height: 32px;
	line-height: 30px;
	padding-left: 5px;
	padding-right: 5px;
	padding-top: 0;
	padding-bottom: 0;
}

.head-find .form-new-input.form-new-input-date .fis {
	width: 110px;
}

.head-find .form-new-input.form-new-input-date b {
	display: block;
	float: left;
	padding: 0 5px;
	height: 32px;
	line-height: 32px;
}

.head-find .form-new-input-date .fis.fis2 {
	padding-left: 5px;
	width: 110px;
}

.select-type{
	height: 32px;
}
</style>
</head>
<!-- <body class="hold-transition skin-blue sidebar-mini">  -->
<body class="skin-blue layout-top-nav">
	<div class="wrapper">
		<c:import url="/system/menuDataTop.html"></c:import>
		<%-- <jsp:include page="../system/head.jsp" />
		<c:import url="/system/menuData.html"></c:import>  --%>
		<div class="content-wrapper">
		<div class="container">
			<section class="content-header">
				<h1>
					医疗安全事件 <small>管理</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="<%=basePath%>backstage/index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="<%=basePath%>backstage/piccComplication/show.html">管理</a></li>
					<li class="active">列表</li>
				</ol>
			</section>

			<!-- content --> 
			<section class="content">
			<div class="box box-default collapsed-box">
						<div class="box-header with-border">
							<h3 class="box-title">高级搜索</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div class="head-find">
								<div class="row">
									<div class="col-xs-3">
										<div class="form-new-input">
											<span>患者姓名：</span> <input type="text" id="patient" class="fis">
										</div>
									</div>
									<div class="col-xs-3">
										<div class="form-new-input">
											<span>病人类别：</span> 
											<div id="spatienttype"></div>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-new-input">
											<span>用药错误分级：</span>  
											<select id="cwfj" style="height: 32px;width: 220px;">
												<option value="-1">请选择</option>
												<option value="002004001">A 级：客观环境或条件可能引发错误（错误隐患）</option>
												<option value="002005001">B 级：发生错误但未发给患者，或已发给患者但患者未使用</option>
												<option value="002005002">C 级：患者已使用，但未造成伤害</option>
												<option value="002005003">D 级：患者已使用，需要监测错误对患者造成的后果，并根据后果判断是否需要采取措施预防和减少伤害</option>
												<option value="002006001">E 级：错误造成患者暂时性伤害，需要采取预防措施</option>
												<option value="002006002">F 级：错误对患者的伤害可导致住院或延长住院时间</option>
												<option value="002006003">G 级：错误导致患者永久性伤害</option>
												<option value="002006004">H 级：错误导致患者生命垂危，需采取维持生命的措施（如心肺复苏、除颤、插管等）</option>
												<option value="002007001">I 级：错误导致患者死亡</option>
											</select>
										</div>
									</div>
									 
									
								</div>
								<div class="row">
									<div class="col-xs-3">
										<div class="form-new-input">
											<span>上报人：</span>  
											<input type="text" id="reporter" class="fis">
										</div>
									</div> 
									<div class="col-xs-3">
										<div class="form-new-input">
											<span>上报人岗位：</span>  
											<div id="sreportertype"></div>
										</div>
									</div> 
									<div class="col-xs-3">  
										<div class="form-new-input">
											<span>事件伤害程度：</span>  
											<div id="sdegree"></div>
										</div>
									</div>
									<div class="col-xs-3">
										<div class="form-new-input form-new-input-date">
											<span>医嘱输入错误：</span> 
											 <div id="sinputerror"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>医嘱开立错误：</span>   
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002010')}">
															   <input name="yerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div> 
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>   
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div> 
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div><div class="row">
									<div class="col-xs-12">
										<div class="form-new-input">
											<span>药房调剂错误：</span>
											<div style="margin-left: 15px;float: left;width:calc(100% - 140px)">
												<c:forEach items="${datadictionary_list }" var="list">
														<c:if test="${fn:length(list.code)==9}">
															<c:if test="${fn:startsWith(list.code, '002012')}">
															   <input name="pharmacyerror" value="${list.code }"   type="checkbox" class="minimal" > &nbsp;${list.fullname } &nbsp;
															</c:if>
														</c:if>
													</c:forEach>
											</div>
										</div>
									</div>
								</div>


								 <div class="row" > 
					              <div style="width: 90%;text-align: center;">
					                 	<button type="button" style="width: 100px;display: inline;" onclick="gsearch()"  class="btn btn-block btn-primary">查询</button>
					                 </div>
					              </div>
							</div>

							<!--修改区域end-->
						</div>
						<!-- /.box-body -->
					</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">列表</h3>
								 <div class="ibox-tools rboor">
			                        <a href="<%=basePath%>backstage/incident/showAdd.html" class="btn btn-primary btn-xs p310"  ><i class="fa fa-plus"></i> 新增</a>
			                    </div>
							</div>
							<!-- /.box-header -->
							<div class="box-body" style="border-style: solid solid none;border-color: #e7eaec;border-width: 1px 0px;">
								<table id="newAttributeTable" class="table table-bordered table-hover" style="width: 100%">
									<thead>
										<tr> 
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
											<th></th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</section>
			</div>
		</div>
		<jsp:include page="../system/foot.jsp" />
	</div>
	 

	<!-- DataTable插件 -->
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- js分页模板 --> 
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/handlebars-v3.0.1.js"></script>
	<!--定义操作列按钮模板-->
	<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/dist/js/demo.js"></script> 
	<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/iCheck/icheck.min.js"></script>
	<script src="<%=basePath%>js/layer/layer.js"></script>
	 <script type="text/javascript" language="javascript" src="<%=basePath%>system/JsContext/DictionaryData.html"></script>
	 <script src="<%=basePath%>js/common/AutoSelect.js"></script> 
	<script id="tpl" type="text/x-handlebars-template">
    <div class="btn-group">
  		<button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
   		 操作 <span class="caret"></span>
  		</button>
  		<ul class="dropdown-menu"> 
		{{#each func}}
		<li><a href="#" onclick="{{this.fn}}">{{this.name}}</a></li>
    	{{/each}}
  		</ul>
	</div>
	</script>

	<script>
 var test;
 var table;
 var editFlag = false;
 
$(function() {
	 $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
		      checkboxClass: 'icheckbox_minimal-blue',
		      radioClass: 'iradio_minimal-blue'
		    });
	 var tpl = $("#tpl").html();
    //预编译模板
    var template = Handlebars.compile(tpl);
	 
	 table = $('#newAttributeTable').dataTable( { 
		 "processing": true, 
		 "serverSide": true,
		 "searchable": true,
		 "searching": true,
		 "bAutoWidth" : true, //是否自适应宽度
		 "bFilter" : false,
		 "drawCallback": function( settings ) {
			  
	     },
		 "aaSorting" : [[7, "desc"]],    //默认按此列排序
        "ajax": "<%=basePath%>backstage/incident/getDate.html",
        "columns": [{ "data": null, 
       	  			"title" : "<input id='changeAll'  onclick='changeAll()' type='checkbox'/>",
       	  			"createdCell" : function(nTd, sData, oData,
								iRow, iCol) {
							var startnum = this.api().page()
									* (this.api().page.info().length);   
							$(nTd).html("<input name='_change' value='"+oData.fuid+"'  type='checkbox'/>"); // 分页行号累加：$(nTd).html(iRow+1);
						}},
						  
						  { "data": "patient",
								"title" : "患者姓名" },
						  { "data": "patienttype",
								"title" : "病人类别" },
						  { "data": "ename",
								"title" : "错误用药" },
						  { "data": "yname",
								"title" : "医嘱用药" },
						  { "data": "reporter",
								"title" : "报告人" },
						  { "data": "department",
								"title" : "报告人科室" },
						  { "data": "reportdate",
								"title" : "报告时间" },
					  { "data" : null,
						"title" : "操作"
						}],
		"columnDefs": [ 
					{ "bSortable": false, "aTargets": [ 0 ] },   //不排序的列
					{ 
					    "targets": [1],  
					    "render": function (data,type, row,   meta) { 
					    	 if(row.hardwareInfo!=null){
						         return '<a href=javascript:showDetail("'+row.fuid+'")>'+data+'</a>';
					    	 }else{
					    		 return data;  
					    	 }	 
					    }  
					},
					  { 
						  targets: 7,
						  render: function(data,type,row,meta){ 
							  return timeForm(data);
						  }
					  }, 
					  {
	                        targets:8, 
	                        render: function (data, type, row,   meta) {
	                            var context =
	                            {
	                            		 func: [
											{"name": "查看","fn": "showEd(\'" + row.fuid + "\')", "type": "primary"},
											<c:if test="${com.hisUpdate}">  
											 {"name": "修改","fn": "edit(\'" + row.fuid + "\')", "type": "primary"},
												  </c:if>
											<c:if test="${com.hisDelete}">  
											 {"name": "删除", "fn": "del(\'" + row.fuid + "\')", "type": "danger"}
											</c:if>
											
	   	                                   
	   	                                ]
	                            };
	                            
	                            var html = template(context);
	                            return html;
	                        }
	                    },
                ],
                "language": {
                    "lengthMenu": "_MENU_ 条记录每页",
                    "zeroRecords": "没有找到记录",
                    "info": "第 _PAGE_ 页 ( 总共 _PAGES_ 页 ,共 _MAX_ 条)",
                    "infoEmpty": "无记录",
                    "infoFiltered": "(从 _MAX_ 条记录过滤)",
                    "paginate": {
                        "previous": "上一页", 
                        "next": "下一页"
                    },
                    "search": " _INPUT_"
                },
                initComplete: function () {     
                }   
     } );
	 

	 $("#spatienttype").AutoSelect({ 
			data : basetemp,   
			initCode : "002001",  
			showNum : 3,  
			name : "s_patienttype",  
			disabled : 0,      
			style:"width:90%"
		}); 
	 $("#sreportertype").AutoSelect({ 
			data : basetemp,   
			initCode : "002002", 
			showNum : 3,   
			name : "s_reportertype",  
			disabled : 0,      
			style:"width:90%"
		}); 
	 $("#sdegree").AutoSelect({ 
			data : basetemp,   
			initCode : "002008", 
			showNum : 3,   
			name : "s_degree",  
			disabled : 0,      
			style:"width:90%"
		}); 
	 $("#sinputerror").AutoSelect({ 
			data : basetemp,   
			initCode : "002011", 
			showNum : 3,   
			name : "s_inputerror",  
			disabled : 0,      
			style:"width:90%"
		}); 
	 
	 
	 $("input[type=search]").css("display","none");
 })

    /**
     *编辑方法
     **/
    function edit(fuid) {
    	 window.location.href="<%=basePath%>medication/medicationReported/showEdit.html?fuid="+fuid;
    } 

function showEd(fuid){
	 window.location.href="<%=basePath%>medication/medicationReported/showEdit.html?fuid="+fuid+"&ish=1";
}
   
    /**
     * 清除
     */ 
    function clear() {
    	$(".modal-content").find("input").each(function (){
    		$(this).val("");
    	}) 
    	$(".modal-content").find("textarea").each(function (){
    		$(this).val("");
    	})
    	
        editFlag = false;
    }

    /**
     * 删除数据
     * @param name
     */
    function del(fuid) {
    	if (!confirm("确认要删除？")) {
            return;
        }
    	
        $.ajax({
            url: "<%=basePath%>medication/medicationReported/delete.html",
            data: {
                "fuid": fuid
            }, success: function (data) {
            	table.api().ajax.reload(null, false); 
            }
        });
    }
    
    function gsearch() {
		var patient = $("#patient").val();
		var patienttype = $("#spatienttype_3 option:selected").val();
		var cwfj = $("#cwfj option:selected").val();
		var reporter = $("#reporter").val();
		var reportertype = $("#sreportertype_3 option:selected").val();
		var degree = $("#sdegree_3 option:selected").val();
		var inputerror = $("#sinputerror_3 option:selected").val();
		var yerror="";
		$("input[name='yerror']:checked").each(function (){
			yerror+=$(this).val()+",";
		})
		yerror=yerror.length>0?yerror.substring(0,yerror.length-1):"";
		var pharmacyerror="";
		$("input[name='pharmacyerror']:checked").each(function (){
			pharmacyerror+=$(this).val()+",";
		})
		pharmacyerror=pharmacyerror.length>0?pharmacyerror.substring(0,pharmacyerror.length-1):"";
		var transfererror="";
		$("input[name='transfererror']:checked").each(function (){
			transfererror+=$(this).val()+",";
		})
		transfererror=transfererror.length>0?transfererror.substring(0,transfererror.length-1):"";
		var medicineerror="";
		$("input[name='medicineerror']:checked").each(function (){
			medicineerror+=$(this).val()+",";
		})
		medicineerror=medicineerror.length>0?medicineerror.substring(0,medicineerror.length-1):"";
		var data = patient + ";" + patienttype + ";" + cwfj + ";"
				+ reporter + ";" + reportertype + ";" + degree + ";"
				+ inputerror+";"+yerror+";"+transfererror+";"+pharmacyerror+";"+medicineerror;
		table.fnFilter(data); 
	}
    
    function changeAll(){     
    	if($("#changeAll").is(':checked')){ 
    		$("input[name='_change']").each(function (){
    			$(this).prop("checked","checked");
    		})   
    	}else{  
    		$("input[name='_change']").each(function (){
    			$(this).removeAttr("checked");   
    		}) 
    	}
    }
    
    
    
    function showDetail(fuid){
		$.ajax({
	 		url:"<%=basePath%>medication/medicationReported/getEditData.html",
	 		type: 'post',
	 		data:{"fuid":fuid},
	 		dataType:"json",
	 		success:function(res){
	 			var s = res.data.medicationReported;
	 				$("#d_fuid").html(s.fuid);  
	 				$("#d_reportdate").html(s.reportdate);  
	 				$("#d_createdate").html(s.createdate);  
	 				$("#d_reporterid").html(s.reporterid);  
	 				$("#d_reporter").html(s.reporter);  
	 				$("#d_department").html(s.department);  
	 				$("#d_phone").html(s.phone);  
	 				$("#d_patient").html(s.patient);  
	 				$("#d_clinicId").html(s.clinicId);  
	 				$("#d_old").html(s.old);  
	 				$("#d_sex").html(s.sex);  
	 				$("#d_patienttyoe").html(s.patienttyoe);  
	 				$("#d_diagnosis").html(s.diagnosis);  
	 				$("#d_reportertype").html(s.reportertype);  
	 				$("#d_dresults").html(s.dresults);  
	 				$("#d_errorlevel").html(s.errorlevel);  
	 				$("#d_degree").html(s.degree);  
	 				$("#d_restore").html(s.restore);  
	 				$("#d_occurtime").html(s.occurtime);  
	 				$("#d_occuraddress").html(s.occuraddress);  
	 				$("#d_errorper").html(s.errorper);  
	 				$("#d_relatedper").html(s.relatedper);  
	 				$("#d_yerror").html(s.yerror);  
	 				$("#d_inputerror").html(s.inputerror);  
	 				$("#d_pharmacyerror").html(s.pharmacyerror);  
	 				$("#d_transfererror").html(s.transfererror);  
	 				$("#d_medicineerror").html(s.medicineerror);  
	 				$("#d_yname").html(s.yname);  
	 				$("#d_ycommonname").html(s.ycommonname);  
	 				$("#d_ydose").html(s.ydose);  
	 				$("#d_yspecification").html(s.yspecification);  
	 				$("#d_ename").html(s.ename);  
	 				$("#d_ecommonname").html(s.ecommonname);  
	 				$("#d_edose").html(s.edose);  
	 				$("#d_especification").html(s.especification);  
	 				$("#d_communicationRelated").html(s.communicationRelated);  
	 				$("#d_deviceRelated").html(s.deviceRelated);  
	 				$("#d_personalRelated").html(s.personalRelated);  
	 				$("#d_workRelated").html(s.workRelated);  
	 				$("#d_happen").html(s.happen);  
	 				$("#d_possibleCauses").html(s.possibleCauses);  
	 				$("#d_jafter").html(s.jafter);  
	        	//var cdate = new Date(s.createTime);
	        	//$("#d_createTime").html(cdate.getFullYear()+"-"+(cdate.getMonth()+1)+"-"+cdate.getDate());
	 	        $("#Modal_detail").modal("show");  
	 		}
	 	}); 
	} 
    
    //时间格式化
    function timeForm(date){ 
    	 var bdate = new Date(date);  
    	 var m=bdate.getMinutes().toString(); 
    	 m=m.length==1?"0"+m.toString() :m; 
    	 var h=bdate.getHours().toString(); 
    	 h=h.length==1?"0"+h.toString() :h; 
    	 var s=bdate.getSeconds().toString();  
    	 s=s.length==1?"0"+s.toString() :s;      
    	 var d=bdate.getDate().toString();  
    	 d=d.length==1?"0"+d.toString() :d;    
    	 var mm= (bdate.getMonth()  + 1).toString();  
    	 mm=mm.length==1?"0"+mm.toString() :mm;     
	     bdate = bdate.getFullYear() + "-" + mm + "-" + d+ " " +h + ":" + m + ":" + s;
    	return bdate;
    }
	</script>

</body>
</html>
	 
