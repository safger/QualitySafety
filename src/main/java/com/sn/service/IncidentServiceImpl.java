package com.sn.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sn.entity.User;
import com.sn.util.BeanUtil;
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


@Service("incidentService")
public class IncidentServiceImpl implements IncidentService{
	
	@Autowired
	private IncidentMapper incidentMapper;

	public IncidentMapper getIncidentMapper() {
		return incidentMapper;
	}

	public void setUserMapper(UserMapper userMapper) {
		this.incidentMapper = incidentMapper;
	} 

	 

	@Override
	public int deleteById(String fuid) {
		// TODO Auto-generated method stub
		return incidentMapper.deleteByPrimaryKey(fuid);
	}

	@Override
	public int insert(Incident record) {
		// TODO Auto-generated method stub
		return incidentMapper.insert(record);
	}

	@Override
	public int insertSelective(Incident record) {
		// TODO Auto-generated method stub
		return incidentMapper.insertSelective(record);
	}

	@Override
	public Incident findById(String fuid) {
		// TODO Auto-generated method stub
		return incidentMapper.selectByPrimaryKey(fuid);
	}

	@Override
	public int updateSelective(Incident record) {
		// TODO Auto-generated method stub
		return incidentMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int update(Incident record) {
		// TODO Auto-generated method stub
		return incidentMapper.updateByPrimaryKey(record);
	}
	
	@Override
	public  int deleteByColum(Incident record){
		// TODO Auto-generated method stub
		return incidentMapper.deleteByColum(record);
	}
	
	@Override
	public List<Incident> selectByColum(Incident record,String orderBy) {
		// TODO Auto-generated method stub
		PageHelper.orderBy(orderBy);
		return incidentMapper.selectByColum(record);
	}
	
	@Override
	public int deleteByByPrimaryKeys(List<String> ids){
		// TODO Auto-generated method stub
		return incidentMapper.deleteByByPrimaryKeys(ids);
	}
	
	@Override
	public List<Incident>  selectLikeColum (Incident record,String orderBy){
		// TODO Auto-generated method stub
		PageHelper.orderBy(orderBy);
		return incidentMapper.selectLikeColum(record);
	}
	
	@Override
	public PagedResult<Incident> findByPage(Incident record, Integer pageNo,
			Integer pageSize,String orderBy) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.orderBy(orderBy);
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(incidentMapper.selectByColum(record));
	}

	@Override
	public PagedResult<Incident> findByPageCustom(Incident record, Integer pageNo,Integer pageSize,String orderBy) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.orderBy(orderBy);
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(incidentMapper.selectByCustom(record));
	}
	@Override
	public int countByColum(Incident record) {
		// TODO Auto-generated method stub
		return incidentMapper.countByColum(record);
	}
	@Override
	public List<Incident> selectAll(String order){
		PageHelper.orderBy(order);
		return incidentMapper.selectAll();
	}
}
