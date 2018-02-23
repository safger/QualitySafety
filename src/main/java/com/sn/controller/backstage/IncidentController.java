package com.sn.controller.backstage;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
public class IncidentController  {
	
	@Autowired
	private IncidentService incidentService;
	@Autowired
	private  HttpServletRequest request;
	@Autowired
	private  HttpServletResponse response;
	private ComData com;
	
	
	
	/**
	 */
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true:允许输入空值，false:不能为空值
	}
	
	/**
	 * @author xiao
	 * @param model 
	 * @return
	 */
	@RequestMapping("show")
	public String show(Map<String,Object>model){
		String roleid=(String)request.getSession().getAttribute("roleid");
		com=CompetenceManager.getCom(roleid, "backstage/incident/show.html");
		if(!com.getHisSelect()){
			return "error";
		}
		model.put("active", "incident");
		model.put("com", com);
		return "/backstage/incident";
	}


	 @RequestMapping("showAdd")
	public String showAdd(Map<String,Object>model){
		String roleid=(String)request.getSession().getAttribute("roleid");
		com=CompetenceManager.getCom(roleid, "backstage/incident/show.html");
		if(!com.getHisSelect()){
			return "error";
		}
		model.put("active", "incident");
		model.put("com", com);
		return "/backstage/incidentEdit";
	}

	/**
	 * @author xiao
	 * @param model
	 * @return
	 */
	@RequestMapping("getDate")
	@ResponseBody
	public Map<String,Object> getDate(Integer draw,Map<String,Object> model){
		//每页返回的条数
		int pageSize = 10;
		String length = request.getParameter("length");
		if(!StringUtils.isEmpty(length)){
			pageSize = Integer.parseInt(length);
		}
		int start = Integer.parseInt(request.getParameter("start"));
		int indexPage = start / pageSize + 1;
		Map<String, String[]> params = request.getParameterMap();
		String[] sort = params.get("order[0][column]");
		String[] desc = params.get("order[0][dir]");
		String[] value = params.get("search[value]");
		
		String orderByStr = null;
		switch(sort[0]){
			case "0" : orderByStr = " fuid";break;
			case "1" : orderByStr = " createdate";break;
			case "2" : orderByStr = " hospitalNumber";break;
			case "3" : orderByStr = " patient";break;
			case "4" : orderByStr = " sex";break;
			case "5" : orderByStr = " birthday";break;
			case "6" : orderByStr = " bedNo";break;
			case "7" : orderByStr = " occurrenceDate";break;
			case "8" : orderByStr = " thingsPassed";break;
			case "9" : orderByStr = " eventLevel";break;
			case "10" : orderByStr = " eventAddress";break;
			case "11" : orderByStr = " classification";break;
			case "12" : orderByStr = " supplementary";break;
			case "13" : orderByStr = " reason";break;
			case "14" : orderByStr = " supReason";break;
			case "15" : orderByStr = " consequence";break;
			case "16" : orderByStr = " suggest";break;
			case "17" : orderByStr = " jobNumber";break;
			case "18" : orderByStr = " reporter";break;
			case "19" : orderByStr = " jobCategory";break;
			case "20" : orderByStr = " reporterPhone";break;
			case "21" : orderByStr = " litigant";break;
			case "22" : orderByStr = " expert";break;
			case "23" : orderByStr = " major";break;
			case "24" : orderByStr = " serious";break;
			case "25" : orderByStr = " frequency";break;
			case "26" : orderByStr = " risk";break;
			case "27" : orderByStr = " process";break;
			case "28" : orderByStr = " processReturn";break;
			case "29" : orderByStr = " processAssess";break;
			case "30" : orderByStr = " rectificationAssess";break;
		}
		orderByStr = orderByStr + " " + desc[0];
		Incident incident=new Incident();
		if(value != null && value[0].length() > 0){
			//incident.setName(value[0]);
		}
		PagedResult<Incident>  page_list = incidentService.findByPageCustom(incident, indexPage, pageSize, orderByStr);
		model.put("recordsTotal", page_list.getTotal()); 
		model.put("recordsFiltered", page_list.getTotal()); 
		model.put("draw", draw);  
		model.put("data", page_list.getDataList()); 
		return model;
	}

	/**
	 * @author xiao
	 * @throws IOException 
	 */
	@RequestMapping("getEditData") 
	@ResponseBody
	public Result getEditData(String fuid,Map<String,Object> model) throws IOException{
		Result result = new Result();
		Incident incident = incidentService.findById(fuid);
		model.put("incident", incident);
		result.setData(model);
		return result;
	}
	
	/**
	 * @author xiao
	 * @param incident 实体参数
	 * @param model
	 * @return 列表显示页
	 * @throws IOException 
	 */
	@RequestMapping("edit")
	@ResponseBody
	public Result edit(Incident incident,Map<String,Object>model) throws IOException{
		Result result = new Result();
		String userid = (String)request.getSession().getAttribute("userid");
		String id=incident.getFuid();
		if(id!=null&&id.length()>0){
			incidentService.updateSelective(incident);
		}else{
			incident.setFuid(UUIDCreater.getUUID()); 
			incident.setCreatedate(new Date());
			incidentService.insertSelective(incident);
		}
		return result;
	}
	
	/**
	 * @author xiao
	 * @return 列表显示页
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Result delete(String fuid){
		Result result = new Result();
		if(fuid!=null&&fuid.length()>0){
			incidentService.deleteById(fuid);
		} 
		return result;
	}
	@RequestMapping("assess")
	@ResponseBody
	public String assess(String serious, String frequency) throws IOException {
		PrintWriter out=response.getWriter();
		String re="";
		if(frequency.equals("数周一次")){
            switch (serious){
                case "死亡":re="极高风险";break;
                case "极重度":re="极高风险";break;
                case "重度":re="高风险";break;
                case "中度":re="中度风险";break;
                case "轻度":re="中度风险";break;
                case "无伤害":re="低风险";break;
            }
        }
        if(frequency.equals("一年数次")){
            switch (serious){
                case "死亡":re="极高风险";break;
                case "极重度":re="极高风险";break;
                case "重度":re="高风险";break;
                case "中度":re="中度风险";break;
                case "轻度":re="低风险";break;
                case "无伤害":re="低风险";break;
            }
        }
        if(frequency.equals("1-2年一次")){
            switch (serious){
                case "死亡":re="极高风险";break;
                case "极重度":re="高风险";break;
                case "重度":re="高风险";break;
                case "中度":re="中度风险";break;
                case "轻度":re="低风险";break;
                case "无伤害":re="低风险";break;
            }
        }
        if(frequency.equals("2-5年一次")){
            switch (serious){
                case "死亡":re="极高风险";break;
                case "极重度":re="高风险";break;
                case "重度":re="中度风险";break;
                case "中度":re="低风险";break;
                case "轻度":re="低风险";break;
                case "无伤害":re="低风险";break;
            }
        }
        if(frequency.equals("5年以上一次")){
            switch (serious){
                case "死亡":re="高风险";break;
                case "极重度":re="中度风险";break;
                case "重度":re="中度风险";break;
                case "中度":re="低风险";break;
                case "轻度":re="低风险";break;
                case "无伤害":re="低风险";break;
            }
        }
		out.print(re);
		return null;
	}
}
