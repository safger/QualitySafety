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
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<title>市一医院 | 医疗质量监管网络平台</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>js/jsTree/themes/default/style.min.css" />
 <link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/bootstrap-validator/css/formValidation.min.css">
 
<style type="text/css">
.panel {
	display: inline-block;
	width: 30%;
	vertical-align: top;
}

.panel.pa {
	display: inline-block;
	width: 65%;
	margin-left: 2%;
}

.panel-title{
    display: inline-block; 
}
.ibox-tools {
    display: inline-block;
    float: right;
    margin-top: 0; 
    position: relative;
    padding: 0;
}
.ibox-tools a{
    cursor: pointer;
    margin-left: 5px;
} 

.btn-primary {
    background-color: #1ab394;
    border-color: #1ab394;
    color: #FFFFFF;
}
</style>

</head>
<body class="skin-blue layout-top-nav">	
	<div class="wrapper">
	<c:import url="/system/menuDataTop.html"></c:import>
	<%-- 	<jsp:include page="head.jsp" />
		<c:import url="/system/menuData.html"></c:import> --%>
		<div class="content-wrapper">
		<div class="container"> 
			<section class="content-header">
				<h1>
					系统管理<small>病区权限管理</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> 系统管理</a></li>
					<li class="active">病区权限管理</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<div class="row"> 
					<div class=col-xs-12>
						<div class="box">
							<!-- <div class="box-header">
								<h3 class="box-title">用户管理</h3>
							</div>  -->
							<div class="box-body">
								<div class="row-fluid">
									<div class="panel panel-info">
										<div class="panel-heading">
											<h3 class="panel-title">用户列表</h3>
										</div>
										<div class="panel-body">
											<div id="jstree_demo_div"></div>
										</div>
									</div>  
									<div class="panel panel-info pa">
										<div class="panel-heading">
											<h3 class="panel-title">用户信息</h3>
											<div class="ibox-tools rboor" style="display: none;"> 
						                        <a href="javascript:showBq()" class="btn btn-primary btn-xs p310" ><i class="fa fa-calendar-check-o"></i> 分配病区</a>
						                    </div> 
										</div> 
										<div class="panel-body">
										  <table id="newAttributeTable" class="table table-bordered table-hover" style="width: 100%">
							                <thead> 
							                <tr>
							                  <th>序号</th>
							                  <th>用户名</th>
							                  <th>姓名</th>
							                  <th>手机</th>
							                  <th>操作</th>
							                </tr>
							                </thead>
							              </table>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			</div>
		</div>
		<!-- /.content-wrapper -->
		<jsp:include page="foot.jsp" />
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改</h4>
				</div>
					<div class="modal-body">
						<div class="box-body">
							 <a href="javascript:changeAllBq()" class="btn btn-primary btn-xs p310">全选</a>&nbsp;&nbsp; 
							 <a href="javascript:unchangeAllBq()" class="btn btn-primary btn-xs p310">取消</a>
							 <div class="row invoice-info" id="up">
							 	<input type="hidden" id="userid" value="" />
							 	<input type="hidden" id="usercode" value="" />
							 	<input type="hidden"  name="fuid" value="">
								<input type="hidden"  name="OrganizeId" value="">  
				                   <div class="col-sm-4 invoice-col" id="up1"></div>	
									<div class="col-sm-4 invoice-col" id="up2"></div>	
									<div class="col-sm-4 invoice-col" id="up3"></div>	
				              </div>
						</div> 
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateBq()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="roleModal" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">选择病区</h4>
				</div>
					<div class="modal-body">
						<div class="box-body">
							 <a href="javascript:changeAllBq()" class="btn btn-primary btn-xs p310">全选</a>&nbsp;&nbsp; 
							 <a href="javascript:unchangeAllBq()" class="btn btn-primary btn-xs p310">取消</a>
							 <div class="row invoice-info" id="ch">
				                   <div class="col-sm-4 invoice-col" id="ch1"></div>	
									<div class="col-sm-4 invoice-col" id="ch2"></div>	
									<div class="col-sm-4 invoice-col" id="ch3"></div>	
				              </div>
						</div>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="saveBq()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ./wrapper -->
		<!-- DataTable插件 -->
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/jquery.dataTables.min.js"></script>
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/datatables/dataTables.bootstrap.min.js"></script>
		<script src="<%=basePath%>js/jsTree/jstree.min.js"></script>
		<!-- js分页模板 -->
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/handlebars-v3.0.1.js"></script> 
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/bootstrap-validator/js/formValidation.min.js"></script> 
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/bootstrap-validator/js/framework/bootstrap.min.js"></script>
		<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/bootstrap-validator/js/language/zh_CN.js"></script>
		<script type="text/javascript" src="<%=basePath%>js/jquery.form.js"></script>
		  
		<!--定义操作列按钮模板--> 
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
		
	<script type="text/javascript">
	 var table;
	 var editFlag = false;
	 var tpl = $("#tpl").html();
	 var template = Handlebars.compile(tpl);
		$(function() {
			//树形插件------------------------------
			$("#jstree_demo_div").jstree({
				'core' : {
					"multiple" : false,
					 "themes" : { "stripes" : true },
					"data":{  
			            "url":"<%=basePath%>system/organize/tree.html",
						"dataType" : "json",
						"cache" : false
					}
				}, 
				"types" : {
				    "#" : {  
				      "valid_children" : ["root"]
				    }, 
				    "root" : { 
				      "icon" : "/images/user.png",
				      "valid_children" : ["default"]
				    },
				    "default" : {
				      "valid_children" : ["default","file"]
				    },
				    "file" : {
				      "icon" : "glyphicon glyphicon-file",
				      "valid_children" : []
				    }
				  }, 
				"plugins" : [  "dnd",  "state", "types", "wholerow","types" ]
			});
			$('#jstree_demo_div').on("changed.jstree", function(e, data) {
				var OrganizeId=data.node.id;
				$("input[name='OrganizeId']").val(OrganizeId);
				$(".ibox-tools").css("display","block");
				showUser(OrganizeId); 
			});  
			
			 
		});
		
		
		
		function showUser(OrganizeId){
			if(table==null){
				table = $('#newAttributeTable').dataTable( {
					 "processing": true, 
					 "serverSide": true,
					 "searchable": true,
					 "searching": true,  
					 "aaSorting" : [[3, "desc"]], 
			         "ajax": "<%=basePath %>system/usershowBq.html?OrganizeId="+OrganizeId,
			         "columns": [{ "data": null, 
			       	  			"title" : "<input id='changeAll'  onclick='changeAll()' type='checkbox'/>", 
			       	  			"createdCell" : function(nTd, sData, oData,
											iRow, iCol) {
										var ht='<div class="checkbox">';  
										    ht+='<label>';  
									      	ht+='<input  name="_change" type="checkbox" ucode='+oData.code+' value='+oData.fuid+'  /> <br/>';
									      	ht+='</label> </div>';		  
										$(nTd).html(ht); // 分页行号累加：$(nTd).html(iRow+1);
									}},
									
								  { "data": "username",
									"title" : "用户名" },
								  { "data": "realname",
									"title" : "姓名" },
								  { "data": "title", 
									"title" : "病区权限"},  
								  { "data" : null,
									"title" : "操作"
									}],
					"columnDefs": [ 
								{ "bSortable": false, "aTargets": [ 0, 4 ] },
								  {
								    "targets": [3],
								    "type" : "date",
								    "render": function (data) {
								        if(data.length>25){
								        	data=data.substring(0,25)+"...";
								        }
								        return data;
								    } 
								},   
			                    {
			                        targets: 4,
			                        render: function (data, type, row,   meta) {
			                            var context =
			                            {
			                                func: [
			                                    {"name": "修改","fn": "edit(\'" + row.fuid + "\',\'" + row.code + "\')", "type": "primary"}
			                                ]
			                            };
			                            
			                            var html = template(context);
			                            return html;
			                        } 
			                    } 
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
				 
				 
				 $("input[type=search]").attr("placeholder","请输入名称");
			}else{ 
				 table.api().ajax.url('<%=basePath %>system/usershowBq.html?OrganizeId='+OrganizeId).load();
			}
			
		}

	 
		    /** 
		     *编辑方法
		     **/
		    function edit(fuid,usercode) {
		    	$("#userid").val(fuid); 
    			$("#usercode").val(usercode);  
		    	$.ajax({
		    		url:"<%=basePath%>system/showUpNurseBq.html",
		    		data:{"userid":fuid,"usercode":usercode},
		    		dataType:"json",
		    		success:function(re){ 
		    			var ht="";
		    			var data=re['org_list'];
		    			var tdata=re['t_list'];
		            	if(data!=null&&data.length>0){
		            		var num=parseInt(data.length/3)+1;
		            		for(var a=0;a<data.length;a++){
		            			ht+='<div class="checkbox">';
				            	ht+='<label>';
				            	var ischeck=0;
				            	if(tdata!=null&&tdata.length>0){
				            		for(var b=0;b<tdata.length;b++){
				            			if(tdata[b].wardId==data[a].fuid){
				            				ischeck=1;
				            				break;
				            			}
				            		} 
				            	}
				            	if(ischeck==1){
				            		ht+=' <input name="uro" checked="checked" type="checkbox" ocode="'+data[a].code+'" oname="'+data[a].fullname+'" value="'+data[a].fuid+'">';
				            	}else{
				            		ht+=' <input name="uro"   type="checkbox" ocode="'+data[a].code+'" oname="'+data[a].fullname+'" value="'+data[a].fuid+'">';
				            	}
				            	
				            	ht+=data[a].fullname;
				            	ht+=' </label>';
				            	ht+=' </div>';
				            	if(a==num-1){
				            		$("#up1").html(ht); 
				            		ht="";
				            	}
				            	if(a==num*2-1){
				            		$("#up2").html(ht); 
				            		ht="";
				            	}
				            	if(a==data.length-1){
				            		$("#up3").html(ht); 
				            		ht="";
				            	}
		            		}
		            	}
		    	        $("#myModal").modal("show"); 
		    		}
		    	});
		    }
 
		    /**
		     * 清除
		     */ 
		    function clear() {
		    	$(".modal-content").find("input").each(function (){
		    		if($(this).attr("name")!='OrganizeId'){
			    		$(this).val("");
		    		}
		    	}) 
		    	$(".modal-content").find("textarea").each(function (){
		    		$(this).val("");
		    	})
		        editFlag = false; 
		    	$('#editForm').data('formValidation').resetForm();
		    }

		  
		    function showBq(){
		    	var OrganizeId=$("input[name='OrganizeId']").val();
				if(OrganizeId==null||OrganizeId.length==0){
					alert("请先选择组织!");
					return;  
				}
				var uu=$("input[name='_change']:checked");
				if(uu.length==0){
					alert("请先选择人员!");
					return;  					
				}
				 $.ajax({
			            url: "<%=basePath%>system/showNurseBq.html",
			            dataType:"json",
			            type: "post",
			            data: {
			                
			            }, success: function (data) { 
			            	var ht="";
			            	if(data!=null&&data.length>0){
			            		var num=parseInt(data.length/3)+1;
			            		for(var a=0;a<data.length;a++){
			            			ht+='<div class="checkbox">';
					            	ht+='<label>';
					            	ht+=' <input name="ro" type="checkbox" ocode="'+data[a].code+'" oname="'+data[a].fullname+'" value="'+data[a].fuid+'">';
					            	ht+=data[a].fullname;
					            	ht+=' </label>';
					            	ht+=' </div>';
					            	if(a==num-1){
					            		$("#ch1").html(ht); 
					            		ht="";
					            	}
					            	if(a==num*2-1){
					            		$("#ch2").html(ht); 
					            		ht="";
					            	}
					            	if(a==data.length-1){
					            		$("#ch3").html(ht); 
					            		ht="";
					            	}
			            		}
			            	}
		                //	$("#ch").html(ht); 
			            	$("#roleModal").modal('toggle');
			            }
			        });
				
		    }
		    
		    function saveBq(){
		    	var val=$("input[name=_change]:checked");
			 	 if(val.length==0){
			 	 	alert("请先选择人员");
			 	 	return;
			 	 }else{
			 		var userid=""; 
			 		var usercode="";
			 		val.each(function (){
			 			userid+=$(this).val()+',';
			 			usercode+=$(this).attr("ucode")+",";
			 		})
			 		usercode=usercode.substring(0,usercode.length-1);
			 		var bqid=""; 
			 		var bqcode="";
			 		var bqname="";
			 		$("input[name=ro]:checked").each(function (){
			 			bqid+=$(this).val()+',';
			 			bqcode+=$(this).attr("ocode")+',';
			 			bqname+=$(this).attr("oname")+',';
			 		}) 
			 		bqid=bqid.substring(0,bqid.length-1);
			 		bqcode=bqcode.substring(0,bqcode.length-1);
			 		bqname=bqname.substring(0,bqname.length-1);
			 		 $.ajax({ 
				            url: "<%=basePath %>system/AssignBq.html", 
				            dataType:"json",
				            type: "post",
				            data: {
				                "userid": userid,
				                "bqid":bqid,
				                bqcode:bqcode,
				                bqname:bqname,
				                usercode:usercode
				            }, success: function (data) { 
				            	$("#roleModal").modal('hide'); 
				            	table.api().ajax.url('<%=basePath %>system/usershowBq.html?OrganizeId='+$("input[name=OrganizeId]").val()).load();
				            }
				        });
				 }
		    }
		    function updateBq(){
			 		var userid=$("#userid").val(); 
			 		var usercode=$("#usercode").val();
			 		var bqid="";
			 		var bqcode="";
			 		var bqname="";
			 		$("input[name=uro]:checked").each(function (){
			 			bqid+=$(this).val()+',';
			 			bqcode+=$(this).attr("ocode")+',';
			 			bqname+=$(this).attr("oname")+',';
			 		}) 
			 		bqid=bqid.substring(0,bqid.length-1);
			 		bqcode=bqcode.substring(0,bqcode.length-1);
			 		bqname=bqname.substring(0,bqname.length-1);
			 		 $.ajax({ 
				            url: "<%=basePath %>system/AssignBq.html", 
				            dataType:"json",
				            type: "post",
				            data: {
				                "userid": userid,
				                "bqid":bqid,
				                bqcode:bqcode,
				                bqname:bqname,
				                usercode:usercode
				            }, success: function (data) { 
				            	$("#myModal").modal('hide'); 
				            	table.api().ajax.url('<%=basePath %>system/usershowBq.html?OrganizeId='+$("input[name=OrganizeId]").val()).load();
				            }
				        });
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
		    
		    function changeAllBq(){     
		    		$("input[name='ro']").each(function (){
		    			$(this).prop("checked","checked");
		    		}) 
		    		$("input[name='uro']").each(function (){
		    			$(this).prop("checked","checked");
		    		}) 
		    }
		    function unchangeAllBq(){     
		    		$("input[name='ro']").each(function (){
		    			$(this).removeAttr("checked");   
		    		}) 
		    		$("input[name='uro']").each(function (){
		    			$(this).removeAttr("checked");   
		    		}) 
		    }
	</script>
</body>
</html>
