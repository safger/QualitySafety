package com.sn.dao;

import java.util.*;
import java.io.IOException;  
 

import com.sn.entity.*;
import com.sn.dao.*;
import com.sn.service.*;  
import com.sn.util.PagedResult;
import com.sn.common.*;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sn.controller.system.CompetenceManager;
import javax.servlet.http.HttpServletRequest;
import com.sn.controller.system.ComData;


/**
 * @author xiaofeng
 * @version 1.0
 * @since 1.0
 */


import java.util.List; 



public interface IncidentMapper {
	
	 int deleteByPrimaryKey(String fuid);

	    int insert(Incident record);

	    int insertSelective(Incident record);

	    Incident selectByPrimaryKey(String fuid);

	    int updateByPrimaryKeySelective(Incident record);

	    int updateByPrimaryKey(Incident record);
	    
	    List<Incident> selectByColum(Incident record);
	    
	    int deleteByColum(Incident record);
	 
	    int deleteByByPrimaryKeys(List<String> ids);
	    
	    List<Incident>  selectLikeColum(Incident record);
	    
	    List<Incident>  selectByCustom(Incident record);
	    
	    int countByColum(Incident record);
	    
	    List<Incident> selectAll();

}
