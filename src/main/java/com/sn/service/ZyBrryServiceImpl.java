package com.sn.service;

import java.util.List;

import com.sn.entity.ZyBrry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.sn.entity.ZyBrry;
import com.sn.sdao.ZyBrryMapper;
import com.sn.util.BeanUtil;
import com.sn.util.PagedResult;


/**
 * @author xiaofeng
 * @version 1.0
 * @since 1.0
 */


@Service("zyBrryService")
public class ZyBrryServiceImpl implements ZyBrryService{
	
	@Autowired
	private ZyBrryMapper zyBrryMapper;

	 

	@Override
	public int deleteById(String fuid) {
		// TODO Auto-generated method stub
		return zyBrryMapper.deleteByPrimaryKey(fuid);
	}

	@Override
	public int insert(ZyBrry record) {
		// TODO Auto-generated method stub
		return zyBrryMapper.insert(record);
	}

	@Override
	public int insertSelective(ZyBrry record) {
		// TODO Auto-generated method stub
		return zyBrryMapper.insertSelective(record);
	}

	@Override
	public ZyBrry findById(String fuid) {
		// TODO Auto-generated method stub
		return zyBrryMapper.selectByPrimaryKey(fuid);
	}

	@Override
	public int updateSelective(ZyBrry record) {
		// TODO Auto-generated method stub
		return zyBrryMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int update(ZyBrry record) {
		// TODO Auto-generated method stub
		return zyBrryMapper.updateByPrimaryKey(record);
	}
	
	@Override
	public  int deleteByColum(ZyBrry record){
		// TODO Auto-generated method stub
		return zyBrryMapper.deleteByColum(record);
	}
	
	@Override
	public List<ZyBrry> selectByColum(ZyBrry record,String orderBy) {
		// TODO Auto-generated method stub
		PageHelper.orderBy(orderBy);
		return zyBrryMapper.selectByColum(record);
	}
	
	@Override
	public int deleteByByPrimaryKeys(List<String> ids){
		// TODO Auto-generated method stub
		return zyBrryMapper.deleteByByPrimaryKeys(ids);
	}
	
	@Override
	public List<ZyBrry>  selectLikeColum (String columName,String value){
		// TODO Auto-generated method stub
		return zyBrryMapper.selectLikeColum(columName,value);
	}
	
	@Override
	public PagedResult<ZyBrry> findByPage(ZyBrry record, Integer pageNo,
			Integer pageSize,String orderBy) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.orderBy(orderBy);
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(zyBrryMapper.selectByColum(record));
	}

	@Override
	public PagedResult<ZyBrry> findByPageCustom(ZyBrry record, Integer pageNo,Integer pageSize,String orderBy) {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.orderBy(orderBy);
		PageHelper.startPage(pageNo, pageSize);
		return BeanUtil.toPagedResult(zyBrryMapper.selectByCustom(record));
	}
	@Override
	public int countByColum(ZyBrry record) {
		// TODO Auto-generated method stub
		return zyBrryMapper.countByColum(record);
	}
	@Override
	public List<ZyBrry> selectAll(String order){
		PageHelper.orderBy(order);
		return zyBrryMapper.selectAll();
	}
}
