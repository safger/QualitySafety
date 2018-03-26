<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String ish = request.getParameter("ish");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>市一医院 | 医疗质量监管网络平台</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
            name="viewport">
    <link rel="stylesheet" href="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/iCheck/all.css">

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

        .panel-title {
            display: inline-block;
        }

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

        input {
            width: 90%;
        }

        td {
            border: 1px solid #7A7A7A !important;
        }

        th {
            border: 1px solid #7A7A7A !important;
        }

        table {
            font-size: 12px
        }

        .btn.btn-default.btn-sm.active {
            color: #436EEE;
        }

        .table th {
            font-size: 14px;
            color: #0d6aad;
        }
    </style>

</head>
<body class="skin-blue layout-top-nav">
<div class="wrapper">
    <c:import url="/system/menuDataTop.html"></c:import>
    <%--
    <jsp:include page="head.jsp" />
    <c:import url="/system/menuData.html"></c:import> --%>
    <div class="content-wrapper">
        <div class="container">
            <section class="content">
                <div class="row">
                    <div class=col-xs-12>
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">医疗质量安全事件上报</h3>
                            </div>
                            <div class="box-body">
                                <form action="" method="post" id="myform">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th colspan="10">一、患者基本信息（不涉及患者不填）</th>
                                            <input type="hidden" value="${incident.fuid }" name="fuid"/>
                                            <input type="hidden" value="${type}" name="type"/>

                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td class="active">患者姓名</td>
                                            <td><input name="patient" type="text" value="${incident.patient }"/></td>
                                            <td class="active">门诊号/住院号</td>
                                            <td><input name="hospitalNumber" type="text" value="${incident.hospitalNumber }"/></td>
                                            <td class="active">出生日期</td>
                                            <td><input name="birthday" type="text"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" value="<fmt:formatDate value="${incident.birthday }" pattern="yyyy-MM-dd HH:mm"/>"/></td>
                                            <td class="active">性别</td>
                                            <td colspan="3">
                                                <input name="sex" value="0" checked="checked" type="radio"
                                                       class="minimal"> 男
                                                <input name="sex" value="1" type="radio" class="minimal"> 女
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active">床号</td>
                                            <td colspan="1">
                                                <input name="bedNo" type="text" value="${incident.bedNo }"/>
                                            </td>
                                            <td class="active">临床诊断</td>
                                            <td colspan="7"><input name="diagnosis" type="text"  value="${incident.diagnosis }"  />
                                            </td>
                                        </tr>

                                        <tr>
                                            <th colspan="10">二、事件发生日期</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>发生时间</td>
                                            <td colspan="2"><input name="occurrenceDate"
                                                                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})"
                                                                   type="text" value="<fmt:formatDate value="${incident.occurrenceDate }" pattern="yyyy-MM-dd HH:mm"/>"/></td>
                                            <td colspan="7"></td>

                                        </tr>
                                        <tr>
                                            <th colspan="10">三、事件经过</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>事情经过</td>
                                            <td colspan="9">
                                                <textarea rows="3" name="thingsPassed"
                                                          style="width: 90%">${incident.thingsPassed }</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="10">四、事件级别</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>事件级别</td>
                                            <td colspan="10">
                                                <div id="eventLevel"></div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th colspan="10">五、事件类别</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>1.事件发生场所</td>
                                            <td colspan="10">
                                                <input type="text" value="${incident.eventAddress }"
                                                       name="eventAddress"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>2.事件分类</td>
                                            <td colspan="1">
                                                <div id="classification"></div>
                                            </td>
                                            <td class="active">其他分类补充</td>
                                            <td colspan="5">
                                                <input type="text" name="supplementary"
                                                       value="${incident.supplementary}">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>3.事件原因</td>
                                            <td colspan="3">
                                                <input type="text" value="${incident.reason }" name="reason"/>
                                            </td>
                                            <td class="active">事件有无产生后果</td>
                                            <td colspan="5">
                                                <input name="consequence" value="0" checked="checked" type="radio"
                                                       class="minimal">有
                                                <input name="consequence" value="1" type="radio" class="minimal"> 无
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active">4.需要医院协助解决<br>的问题或者建议</td>
                                            <td colspan="9">
                                                <textarea rows="3" name="suggest"
                                                          style="width: 90%">${incident.suggest }</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="10">六.报告人情况</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>工号</td>
                                            <td><input name="jobNumber" type="text" value="${incident.jobNumber }"/>
                                            </td>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>报告人</td>
                                            <td><input name="reporter" type="text" value="${incident.reporter }"/></td>
                                            <td class="active">岗位类别</td>
                                            <td colspan="3"><input name="jobCategory" type="text"
                                                                   value="${incident.jobCategory }"/></td>
                                        </tr>
                                        <tr>
                                          <%--  <td class="active">科室</td>
                                            <td><input name="jobNumber" type="text" value="${incident.jobNumber }"/>
                                            </td>--%>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>联系电话</td>
                                            <td><input name="reporterPhone" type="text"
                                                       value="${incident.reporterPhone }"/></td>
                                            <td class="active">是否当事人</td>
                                            <td colspan="5">
                                                <input name="litigant" value="0" checked="checked" type="radio"
                                                       class="minimal"> 是
                                                <input name="litigant" value="1" type="radio" class="minimal"> 否
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>选择处理此事的专家组</td>
                                            <td>
                                                <div id="expert"></div>
                                            </td>
                                            <td class="active">报告是否紧急重大事件</td>
                                            <td colspan="5">
                                                <input name="major" value="0" checked="checked" type="radio"
                                                       class="minimal"> 是
                                                <input name="major" value="1" type="radio" class="minimal"> 否
                                            </td>
                                        </tr>
                                        <c:if test="${type=='cl'}" >
                                        <tr>
                                            <th colspan="10">七.不良事件严重分级（SAC分级）</th>
                                        </tr>
                                        <tr>
                                            <td class="active">1、严重程度</td>
                                            <td colspan="9">
                                                <input name="serious" value="死亡" type="radio" class="minimal"> 死亡 &nbsp;
                                                <input name="serious" value="极重度" type="radio" class="minimal"> 极重度&nbsp;
                                                <input name="serious" value="重度" type="radio" class="minimal"> 重度&nbsp;
                                                <input name="serious" value="中度" type="radio" class="minimal"> 中度&nbsp;
                                                <input name="serious" value="轻度" checked type="radio" class="minimal"> 轻度&nbsp;
                                                <input name="serious" value="无伤害" type="radio" class="minimal"> 无伤害&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active">2、发生频率</td>
                                            <td colspan="9">
                                                <input name="frequency" value="数周一次" type="radio" class="minimal"> 数周一次
                                                &nbsp;
                                                <input name="frequency" value="一年数次" type="radio" class="minimal"> 一年数次&nbsp;
                                                <input name="frequency" value="1-2年一次" type="radio" class="minimal"> 1-2年一次&nbsp;
                                                <input name="frequency" value="2-5年一次" checked type="radio" class="minimal">
                                                2-5年一次&nbsp;
                                                <input name="frequency" value="5年以上一次" type="radio" class="minimal"> 5年以上一次&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>3、风险评估</td>
                                            <td colspan="9">
                                                <input  type="hidden" readonly name="risk"
                                                       value=""/>
                                                <span id="fx" style="margin-left: 30px; display: block;float: left;width: 100px;font-weight: bold;font-size: 14px">未评估</span>
                                                <button onclick="pg()"
                                                        style="width: 100px;float: left;margin-left: 20px" type="button"
                                                        class="btn btn-block btn-primary btn-sm">风险评估
                                                </button>
                                            </td>
                                        </tr>
                                       <%-- <tr>
                                            <td class="active">4、干预措施</td>
                                            <td colspan="9">

                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <th colspan="10">八、处理小组意见</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>小组意见</td>
                                            <td colspan="9">
                                                <textarea rows="3" name="process"
                                                          style="width: 90%">${incident.process }</textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th colspan="10">九、事件处理结果</th>
                                        </tr>
                                        <tr>
                                            <td class="active"><span style="color: red;font-weight: bold">*</span>处理结果</td>
                                            <td colspan="9">
                                                <textarea rows="3" name="processReturn"
                                                          style="width: 90%">${incident.processReturn }</textarea>
                                            </td>
                                        </tr>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div id="cs" class="box-footer" style="text-align: center;">
                                <button type="button" onclick="ysub()" class="btn btn-primary">完成提交</button>
                            </div>
                        </div>
                    </div>
            </section>
        </div>
    </div>

    <!-- /.content-wrapper -->
    <jsp:include page="../system/foot.jsp"/>
</div>
<script src="<%=basePath%>js/layer/layer.js"></script>
<script src="<%=basePath%>Bootstrap_AdminLTE_2.3.6/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" language="javascript" src="<%=basePath%>system/JsContext/DictionaryData.html"></script>
<script type="text/javascript" src="<%=basePath%>js/common/AutoSelect.js"></script>
<!-- js分页模板 -->
<script type="text/javascript">
    $(function () {
       $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        });
        var classification='${incident.classification}';
        classification=classification=='-1'||classification.length==0?'001':classification;
        $("#classification").AutoSelect({
            data: basetemp,
            initCode: classification,
            showNum: 2,
            name: "classification",
            disabled: 1,
            style: "width:90%"
        });
        var expert='${incident.expert}';
        expert=expert=='-1'||expert.length==0?'002':expert;
        $("#expert").AutoSelect({
            data: basetemp,
            initCode: expert,
            showNum: 2,
            name: "expert",
            disabled: 1,
            style: "width:90%"
        });
        var eventLevel='${incident.eventLevel}';
        eventLevel=eventLevel=='-1'||eventLevel.length==0?'003':eventLevel;
     $("#eventLevel").AutoSelect({
                data: basetemp,
                initCode: eventLevel,
                showNum: 2,
                name: "eventLevel",
                disabled: 1,
                style: "width:90%"
            });


        var litigant = '${incident.litigant}';
        $("input[name='litigant'][value='" + litigant + "']").iCheck('check');
        var major = '${incident.major}';
        $("input[name='major'][value='" + major + "']").iCheck('check');
        var serious = '${incident.serious}';
        $("input[name='serious'][value='" + serious + "']").iCheck('check');
        var frequency = '${incident.frequency}';
        $("input[name='frequency'][value='" + frequency + "']").iCheck('check');
        var consequence = '${incident.consequence}';
        $("input[name='consequence'][value='" + consequence + "']").iCheck('check');
        var sex = '${incident.sex}';
        $("input[name='sex'][value='" + sex + "']").iCheck('check');

        var risk='${incident.risk}';
        $("#fx").html(risk);
        $("input[name='risk']").val(risk);
        switch (risk){
            case "极高风险":$("#fx").css("color","red");break;
            case "高风险":$("#fx").css("color","#FFCC00");break;
            case "中度风险":$("#fx").css("color","#FFFF00");break;
            case "低风险":$("#fx").css("color","#00FF00");break;

        }



        $("input[name='hospitalNumber']").blur(function(){

            var zyh=$(this).val();
            $.ajax({
                url:"<%=basePath%>backstage/incident/searchBr.html?date="+new Date(),
                type: 'post',
                data:{"zyh":zyh},
                dataType:"json",
                success:function(res){
                    if(res!=null){
                        $("input[name='patient']").val(res.brxm);
                        $("input[name='bedNo']").val(res.brch);
                        $("input[name='birthday']").val(res.age);
                        var sex=res.brxb==1?"男":"女";
                        $("input[name='sex'][value='" + sex + "']").iCheck('check');
                    }
                }
            });
        });
    })


    function ysub() {
        if(!vi()){
            return;
        }
        $("#myform").attr("action", "<%=basePath%>backstage/incident/edit.html");
        $("#myform").submit();

    }

    function vi(){
        var t=true;
        if($("input[name='occurrenceDate']").val().length == 0){
            layer.msg("请输入发生时间");
            t=false;
            return;
        }
        if($("textarea[name='thingsPassed']").val().length == 0){
            layer.msg("请输入事情经过");
            t=false;
            return;
        }
        if($("select[name='eventLevel']").val() == '-1'){
            layer.msg("请选择事件级别");
            t=false;
            return;
        }
        if($("input[name='eventAddress']").val().length == 0){
            layer.msg("请输入事件发生场所");
            t=false;
            return;
        }
        if($("select[name='classification']").val() == '-1'){
            layer.msg("请选择事件分类");
            t=false;
            return;
        }
        if($("select[name='expert']").val() == '-1'){
            layer.msg("请选择处理的专家组");
            t=false;
            return;
        }
        if($("input[name='reason']").val().length == 0){
            layer.msg("请输入事件原因");
            t=false;
            return;
        }
        if($("input[name='jobNumber']").val().length == 0){
            layer.msg("请输入工号");
            t=false;
            return;
        }
        if($("input[name='reporter']").val().length == 0){
            layer.msg("请输入上报人");
            t=false;
            return;
        }
        if($("input[name='reporterPhone']").val().length == 0){
            layer.msg("请输入联系电话");
            t=false;
            return;
        }
        <c:if test="${type=='cl'}" >
        if($("input[name='risk']").val().length == 0){
            layer.msg("请进行风险评估");
            t=false;
            return;
        }
        if($("textarea[name='process']").val().length == 0){
            layer.msg("请输入处理意见");
            t=false;
            return;
        }
        if($("textarea[name='processReturn']").val().length == 0){
            layer.msg("请输入处理结果");
            t=false;
            return;
        }
        </c:if>
        return t;
    }

    //时间格式化
    function timeForm(date) {
        if (date != null && date.length > 0) {
            var bdate = new Date(date);
            var m = bdate.getMinutes().toString();
            m = m.length == 1 ? "0" + m.toString() : m;
            var h = bdate.getHours().toString();
            h = h.length == 1 ? "0" + h.toString() : h;
            var s = bdate.getSeconds().toString();
            s = s.length == 1 ? "0" + s.toString() : s;
            var d = bdate.getDate().toString();
            d = d.length == 1 ? "0" + d.toString() : d;
            var mm = (bdate.getMonth() + 1).toString();
            mm = mm.length == 1 ? "0" + mm.toString() : mm;
            bdate = bdate.getFullYear() + "-" + mm + "-" + d + " " + h + ":" + m ;
            return bdate;
        }

    }

    function pg() {
        var serious=$("input[name='serious']:checked").val();
        var frequency=$("input[name='frequency']:checked").val();
            $.ajax({
                url: "<%=basePath%>backstage/incident/assess.html?time=" + new Date(),
                async: false,
                method:"post",
                data:"frequency="+frequency+"&serious="+serious,
                dataType:"text",
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                success: function (data) {
                    $("#fx").html(data);
                    $("input[name='risk']").val(data);
                    switch (data){
                        case "极高风险":$("#fx").css("color","red");break;
                        case "高风险":$("#fx").css("color","#FFCC00");break;
                        case "中度风险":$("#fx").css("color","#FFFF00");break;
                        case "低风险":$("#fx").css("color","#00FF00");break;

                    }
                }
            });

    }
</script>
</body>
</html>
