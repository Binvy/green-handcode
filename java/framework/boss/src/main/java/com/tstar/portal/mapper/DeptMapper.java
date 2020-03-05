package com.tstar.portal.mapper;

import com.tstar.portal.model.Dept;
import org.apache.ibatis.mapping.ResultMap;

import java.util.List;

public interface DeptMapper {

	int deleteByPrimaryKey(String var1);

	int insert(Dept var1);

	int insertSelective(Dept var1);

	Dept selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(Dept var1);

	int updateByPrimaryKey(Dept var1);

	List<ResultMap> selectAllDepts();

	int deleteByCode(String var1);

	Dept selectByName(String var1);

	Dept selectByIdAndDeptName(String var1);

	List<ResultMap> findAreaAll();

}
