package com.sn.service;

import java.util.List;

import com.sn.entity.ZyBrry;
import com.sn.entity.ZyBrry;
import com.sn.util.PagedResult;


/**
 * @author xiaofeng
 * @version 1.0
 * @since 1.0
 */

public interface  ZyBrryService{ 
	
	public int deleteById(String id);

	public int insert(ZyBrry record);

	public int insertSelective(ZyBrry record);

	public ZyBrry findById(String fuid);

	public int updateSelective(ZyBrry record);

	public int update(ZyBrry record);
    
	public List<ZyBrry> selectByColum(ZyBrry record, String orderBy);
	
	public  int deleteByColum(ZyBrry record);
	
	public int deleteByByPrimaryKeys(List<String> ids);
	
	public List<ZyBrry>  selectLikeColum(String columName, String value);
	
	public PagedResult<ZyBrry> findByPage(ZyBrry record, Integer indexPage, Integer pageSize, String orderBy);
	
	public PagedResult<ZyBrry> findByPageCustom(ZyBrry record, Integer indexPage, Integer pageSize, String orderBy);
	
	public int countByColum(ZyBrry record);
	
	public List<ZyBrry> selectAll(String order);
	
}
