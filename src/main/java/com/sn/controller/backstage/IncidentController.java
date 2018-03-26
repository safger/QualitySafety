package com.sn.controller.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sn.common.UUIDCreater;
import com.sn.type.Result;
import com.sn.util.PagedResult;


import com.sn.entity.*;
import com.sn.service.*;

import com.sn.controller.system.CompetenceManager;

import javax.servlet.http.HttpServletRequest;

import com.sn.controller.system.ComData;


/**
 * @author xiaofeng
 * @version 1.0
 * @since 1.0
 */


@Controller
@RequestMapping("/backstage/incident")
public class IncidentController {

    @Autowired
    private IncidentService incidentService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
   private ZyBrryService zyBrryService;
    @Autowired
    private HttpServletResponse response;
    private ComData com;


    /**
     */

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false:不能为空值
    }

    /**
     * @param model
     * @return
     * @author xiao
     */
    @RequestMapping("show")
    public String show(Map<String, Object> model) {
        String roleid = (String) request.getSession().getAttribute("roleid");
        com = CompetenceManager.getCom(roleid, "backstage/incident/show.html");
        if (!com.getHisSelect()) {
            return "error";
        }
        model.put("type", "add");
        model.put("active", "incident");
        model.put("com", com);
        return "/backstage/incident";
    }

    @RequestMapping("showCl")
    public String showCl(Map<String, Object> model) {
        String roleid = (String) request.getSession().getAttribute("roleid");
        com = CompetenceManager.getCom(roleid, "backstage/incident/show.html");
        if (!com.getHisSelect()) {
            return "error";
        }
        model.put("type", "cl");
        model.put("active", "incident");
        model.put("com", com);
        return "/backstage/incident";
    }


    @RequestMapping("showAdd")
    public String showAdd(Map<String, Object> model) {
        String roleid = (String) request.getSession().getAttribute("roleid");
        com = CompetenceManager.getCom(roleid, "backstage/incident/show.html");
        if (!com.getHisSelect()) {
            return "error";
        }
        model.put("active", "incident");
        model.put("com", com);
        return "/backstage/incidentEdit";
    }

    @RequestMapping("showEdit")
    public String showEdit(String fuid,String type, Map<String, Object> model) {
        String roleid = (String) request.getSession().getAttribute("roleid");
        com = CompetenceManager.getCom(roleid, "backstage/incident/show.html");
        if (!com.getHisUpdate()) {
            return "error";
        }
        Incident incident = incidentService.findById(fuid);
        model.put("incident", incident);
        model.put("type", type);
        return "/backstage/incidentEdit";
    }

    /**
     * @param model
     * @return
     * @author xiao
     */
    @RequestMapping("getDate")
    @ResponseBody
    public Map<String, Object> getDate(Integer draw, Map<String, Object> model) {
        //每页返回的条数
        int pageSize = 10;
        String length = request.getParameter("length");
        if (!StringUtils.isEmpty(length)) {
            pageSize = Integer.parseInt(length);
        }
        int start = Integer.parseInt(request.getParameter("start"));
        int indexPage = start / pageSize + 1;
        Map<String, String[]> params = request.getParameterMap();
        String[] sort = params.get("order[0][column]");
        String[] desc = params.get("order[0][dir]");
        String[] value = params.get("search[value]");

        String orderByStr = null;
        switch (sort[0]) {
            case "1":
                orderByStr = " classification";
                break;
            case "2":
                orderByStr = " eventLevel";
                break;
            case "3":
                orderByStr = " reporter";
                break;
            case "4":
                orderByStr = " risk";
                break;
            case "5":
                orderByStr = " expert";
                break;
            case "6":
                orderByStr = " occurrenceDate";
                break;
            case "7":
                orderByStr = " createdate";
                break;
        }
        orderByStr = orderByStr + " " + desc[0];
        Incident incident = new Incident();
        if (value != null && value[0].length() > 0) {

            String data[]=value[0].split(";");
           if(!data[0].equals("-1")){
               incident.setClassification(data[0]);
           }
            if(!data[1].equals("-1")){
                incident.setEventLevel(data[1]);
            }
            if(!data[2].equals("-1")){
                incident.setRisk(data[2]);
            }
            if(data[3]!=null&&data[3].trim().length()>0){
                incident.setPatient(data[3]);
            }
            if(data[4]!=null&&data[4].trim().length()>0){
                incident.setHospitalNumber(data[4]);
            }
            if(data[5]!=null&&data[5].trim().length()>0){
                incident.setJobNumber(data[5]);
            }
        }
        String userid=(String)request.getSession().getAttribute("userid");
        String description=(String)request.getSession().getAttribute("description");
        String admin=(String)request.getSession().getAttribute("superAdmin");
        if(admin==null){
            incident.setReporterId(userid);
            incident.setExpert(description);
        }
        PagedResult<Incident> page_list = incidentService.findByPageCustom(incident, indexPage, pageSize, orderByStr);
        List<Incident> list = page_list.getDataList();
        Map<String, String> DatadictionaryMap = (Map<String, String>) request.getSession().getServletContext().getAttribute("DatadictionaryMap");
        for (Incident in : list) {
            in.setClassification(DatadictionaryMap.get(in.getClassification()));
            in.setEventLevel(DatadictionaryMap.get(in.getEventLevel()));
            in.setExpert(DatadictionaryMap.get(in.getExpert()));
        }
        model.put("recordsTotal", page_list.getTotal());
        model.put("recordsFiltered", page_list.getTotal());
        model.put("draw", draw);
        model.put("data", list);
        return model;
    }

    /**
     * @throws IOException
     * @author xiao
     */
    @RequestMapping("getEditData")
    @ResponseBody
    public Result getEditData(String fuid, Map<String, Object> model) throws IOException {
        Result result = new Result();
        Incident incident = incidentService.findById(fuid);
        model.put("incident", incident);
        result.setData(model);
        return result;
    }

    /**
     * @param incident 实体参数
     * @param model
     * @return 列表显示页
     * @throws IOException
     * @author xiao
     */
    @RequestMapping("edit")
    public String edit(Incident incident,String type, Map<String, Object> model) throws IOException {
        String roleid = (String) request.getSession().getAttribute("roleid");
        String userid = (String) request.getSession().getAttribute("userid");
        com = CompetenceManager.getCom(roleid, "backstage/incident/show.html");
        if (!com.getHisUpdate()) {
            return "error";
        }
        String id = incident.getFuid();
        if (id != null && id.length() > 0) {
            incidentService.updateSelective(incident);
        } else {
            incident.setFuid(UUIDCreater.getUUID());
            incident.setCreatedate(new Date());
            incident.setReporterId(userid);
            incidentService.insertSelective(incident);
        }
        if(type!=null&&type.equals("cl")){
            return "redirect:/backstage/incident/showCl.html";
        }else{
            return "redirect:/backstage/incident/show.html";
        }

    }

    /**
     * @return 列表显示页
     * @author xiao
     */
    @RequestMapping("delete")
    @ResponseBody
    public Result delete(String fuid) {
        Result result = new Result();
        if (fuid != null && fuid.length() > 0) {
            incidentService.deleteById(fuid);
        }
        return result;
    }

    @RequestMapping("assess")
    @ResponseBody
    public String assess(String serious, String frequency) throws IOException {
        PrintWriter out = response.getWriter();
        String re = "";
        if (frequency.equals("数周一次")) {
            switch (serious) {
                case "死亡":
                    re = "极高风险";
                    break;
                case "极重度":
                    re = "极高风险";
                    break;
                case "重度":
                    re = "高风险";
                    break;
                case "中度":
                    re = "中度风险";
                    break;
                case "轻度":
                    re = "中度风险";
                    break;
                case "无伤害":
                    re = "低风险";
                    break;
            }
        }
        if (frequency.equals("一年数次")) {
            switch (serious) {
                case "死亡":
                    re = "极高风险";
                    break;
                case "极重度":
                    re = "极高风险";
                    break;
                case "重度":
                    re = "高风险";
                    break;
                case "中度":
                    re = "中度风险";
                    break;
                case "轻度":
                    re = "低风险";
                    break;
                case "无伤害":
                    re = "低风险";
                    break;
            }
        }
        if (frequency.equals("1-2年一次")) {
            switch (serious) {
                case "死亡":
                    re = "极高风险";
                    break;
                case "极重度":
                    re = "高风险";
                    break;
                case "重度":
                    re = "高风险";
                    break;
                case "中度":
                    re = "中度风险";
                    break;
                case "轻度":
                    re = "低风险";
                    break;
                case "无伤害":
                    re = "低风险";
                    break;
            }
        }
        if (frequency.equals("2-5年一次")) {
            switch (serious) {
                case "死亡":
                    re = "极高风险";
                    break;
                case "极重度":
                    re = "高风险";
                    break;
                case "重度":
                    re = "中度风险";
                    break;
                case "中度":
                    re = "低风险";
                    break;
                case "轻度":
                    re = "低风险";
                    break;
                case "无伤害":
                    re = "低风险";
                    break;
            }
        }
        if (frequency.equals("5年以上一次")) {
            switch (serious) {
                case "死亡":
                    re = "高风险";
                    break;
                case "极重度":
                    re = "中度风险";
                    break;
                case "重度":
                    re = "中度风险";
                    break;
                case "中度":
                    re = "低风险";
                    break;
                case "轻度":
                    re = "低风险";
                    break;
                case "无伤害":
                    re = "低风险";
                    break;
            }
        }
        out.print(re);
        return null;
    }

   @RequestMapping("searchBr")
    @ResponseBody
    public String searchBr(String zyh) throws IOException {
        PrintWriter out=response.getWriter();
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        if (zyh != null && zyh.length() > 0) {
            ZyBrry z=new ZyBrry();
            z.setZyhm(zyh);
            List<ZyBrry> z_list=zyBrryService.selectByColum(z, null);
            if(z_list!=null&&z_list.size()>0){
                z_list.get(0).setAge(dateFormat.format(z_list.get(0).getCsny()));
                out.print(JSONArray.toJSONString(z_list.get(0)));
            }
        }
        return null;
    }
}
