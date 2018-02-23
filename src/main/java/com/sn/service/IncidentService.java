package com.sn.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sn.entity.User;
import com.sn.util.PagedResult;



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

public interface  IncidentService{ 
	
	public int deleteById(String id);

	public int insert(Incident record);

	public int insertSelective(Incident record);

	public Incident findById(String fuid);

	public int updateSelective(Incident record);

	public int update(Incident record);
    
	public List<Incident> selectByColum(Incident record, String orderBy);
	
	public  int deleteByColum(Incident record);
	
	public int deleteByByPrimaryKeys(List<String> ids);
	
	public List<Incident>  selectLikeColum(Incident record, String orderBy);
	
	public PagedResult<Incident> findByPage(Incident record, Integer indexPage, Integer pageSize, String orderBy);
	
	public PagedResult<Incident> findByPageCustom(Incident record, Integer indexPage, Integer pageSize, String orderBy);
	
	public int countByColum(Incident record);
	
	public List<Incident> selectAll(String order);
	
}
