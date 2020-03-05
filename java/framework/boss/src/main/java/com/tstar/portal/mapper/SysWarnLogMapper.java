package com.tstar.portal.mapper;

import com.tstar.portal.model.SysWarnLog;

import java.util.List;
import java.util.Map;

public interface SysWarnLogMapper {

	int countByCriteria(Map<String, Object> var1);

	List<SysWarnLog> selectByPage(Map<String, Object> var1);

	List<SysWarnLog> selectTop10();

	int deleteByPrimaryKey(String var1);

	int insert(SysWarnLog var1);

	int insertSelective(SysWarnLog var1);

	SysWarnLog selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(SysWarnLog var1);

	int updateByPrimaryKey(SysWarnLog var1);

}
