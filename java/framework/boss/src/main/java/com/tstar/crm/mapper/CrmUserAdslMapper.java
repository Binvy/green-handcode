package com.tstar.crm.mapper;

import com.tstar.crm.model.CrmUserAdsl;

public interface CrmUserAdslMapper {

	int deleteByPrimaryKey(String id);

	int insert(CrmUserAdsl var1);

	int insertSelective(CrmUserAdsl var1);

	CrmUserAdsl selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(CrmUserAdsl var1);

	int updateByPrimaryKey(CrmUserAdsl var1);

}
