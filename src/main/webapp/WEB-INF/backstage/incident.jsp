 
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
	width: 100px;
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
									<div class="col-xs-4" >
										<div class="form-new-input">
											<span >事件分类：</span>
											<div  id="sjlb"></div>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="form-new-input">
											<span>事件级别：</span>
											<div id="eventLevel"></div>
										</div>
									</div>
									<div class="col-xs-4">
										<div class="form-new-input">
											<span>风险评估：</span>
											<select id="risk" class="fis">
												<option value="-1">请选择</option>
												<option>低风险</option>
												<option>中度风险</option>
												<option>高风险</option>
												<option>极高风险</option>
											</select>
										</div>
									</div>
									 
									
								</div>
								<div class="row">
									<div class="col-xs-4">
										<div class="form-new-input">
											<span>患者姓名：</span>
											<input type="text" id="patient" class="fis">
										</div>
									</div> 
									<div class="col-xs-4">
										<div class="form-new-input">
											<span>门诊/住院号：</span>
											<input type="text" id="hospitalNumber" class="fis">
										</div>
									</div> 
									<div class="col-xs-4">
										<div class="form-new-input">
											<span>上报人工号：</span>
											<input type="text" id="jobNumber" class="fis">
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
									 <c:if test="${type!='cl'}">
										 <a href="<%=basePath%>backstage/incident/showAdd.html" class="btn btn-primary btn-xs p310"  ><i class="fa fa-plus"></i> 新增</a>
									 </c:if>

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
						  
						  { "data": "classification",
								"title" : "事件分类" },
						  { "data": "eventLevel",
								"title" : "事件级别" },
						  { "data": "reporter",
								"title" : "报告人" },
						  { "data": "risk",
								"title" : "风险评估" },
						  { "data": "expert",
								"title" : "处理专家" },
						  { "data": "occurrenceDate",
								"title" : "发生时间" },
						  { "data": "createdate",
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
						  targets: 6,
						  render: function(data,type,row,meta){ 
							  return timeForm(data);
						  }
					  },{
						  targets: 4,
						  render: function(data,type,row,meta){
						      if(data!=null&&data.length>0){
                                  switch (data){
                                      case "极高风险":return "<span style='color: red'>极高风险</span>";break;
                                      case "高风险":return "<span style='color: #FFCC00'>高风险</span>";break;
                                      case "中度风险":return "<span style='color: #FFFF00'>中度风险</span>";break;
                                      case "低风险":return "<span style='color: #00FF00'>低风险</span>";break;
                                  }
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
											<c:if test="${type=='add'}">
											 {"name": "修改","fn": "edit(\'" + row.fuid + "\')", "type": "primary"},
											 </c:if>
                                             <c:if test="${type=='cl'}">
                                             {"name": "处理","fn": "edit(\'" + row.fuid + "\')", "type": "primary"},
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
	 

	 
	 
	 $("input[type=search]").css("display","none");

	 $("#sjlb").AutoSelect({
        data: basetemp,
        initCode: "001",
        showNum: 2,
        name: "classification",
        disabled: 1,
        style: "width:110px"
    });
	$("#sjlb_2").attr("class","fis");
	 $("#eventLevel").AutoSelect({
        data: basetemp,
        initCode: "003",
        showNum: 2,
        name: "eventLevel",
        disabled: 1,
        style: "width:110px"
    });
    $("#eventLevel_2").attr("class","fis");


 })

    /**
     *编辑方法
     **/
    function edit(fuid) {
        document.write("<form action='<%=basePath%>backstage/incident/showEdit.html' method='post' name='form1' style='display:none'>");
        document.write("<input type='hidden' name='fuid' value='"+fuid+"'/>");
        document.write("<input type='hidden' name='type' value='${type}'/>");
        document.write("</form>");
        document.form1.submit();
    }

function showEd(fuid){
	 window.location.href="<%=basePath%>backstage/incident/showEdit.html?fuid="+fuid+"&ish=1";
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
            url: "<%=basePath%>backstage/incident/delete.html",
            data: {
                "fuid": fuid
            }, success: function (data) {
            	table.api().ajax.reload(null, false); 
            }
        });
    }
    
    function gsearch() {
		var classification = $("select[name='classification']").val();
		var eventLevel=$("select[name='eventLevel']").val();
		var risk=$("#risk").val();
		var patient=$("#patient").val();
		var hospitalNumber=$("#hospitalNumber").val();
		var jobNumber=$("#jobNumber").val();


		var data = classification + ";" + eventLevel + ";" + risk + ";"
				+ patient + " ;" + hospitalNumber + " ;" + jobNumber+" ";

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
	 
