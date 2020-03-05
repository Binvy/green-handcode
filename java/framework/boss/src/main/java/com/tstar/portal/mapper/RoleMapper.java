package com.tstar.portal.mapper;

import com.tstar.portal.model.ResultMap;
import com.tstar.portal.model.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {

	int deleteByPrimaryKey(String var1);

	int insert(Role var1);

	int insertSelective(Role var1);

	Role selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(Role var1);

	int updateByPrimaryKey(Role var1);

	int countAll();

	List<ResultMap> selectAllRole();

	int countByCriteria(Map<String, Object> var1);

	List<ResultMap> selectByPage(Map<String, Object> var1);

	List<Role> selectAll();

	Role selectByName(String var1);

}
