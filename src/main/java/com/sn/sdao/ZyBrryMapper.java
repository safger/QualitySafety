package com.sn.sdao;

import java.util.List;

import com.sn.entity.ZyBrry;
import com.sn.entity.ZyBrry;
/**
 * @author xiaofeng
 * @version 1.0
 * @since 1.0
 */



public interface ZyBrryMapper {
	
	 int deleteByPrimaryKey(String fuid);

	    int insert(ZyBrry record);

	    int insertSelective(ZyBrry record);

	    ZyBrry selectByPrimaryKey(String fuid);

	    int updateByPrimaryKeySelective(ZyBrry record);

	    int updateByPrimaryKey(ZyBrry record);
	    
	    List<ZyBrry> selectByColum(ZyBrry record);
	    
	    int deleteByColum(ZyBrry record);
	 
	    int deleteByByPrimaryKeys(List<String> ids);
	    
	    List<ZyBrry>  selectLikeColum(String columName, String value);
	    
	    List<ZyBrry>  selectByCustom(ZyBrry record);
	    
	    int countByColum(ZyBrry record);
	    
	    List<ZyBrry> selectAll();

}
