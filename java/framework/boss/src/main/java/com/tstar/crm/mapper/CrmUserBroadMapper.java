package com.tstar.crm.mapper;

import com.tstar.crm.model.CrmUserBroad;

public interface CrmUserBroadMapper {

	int deleteByPrimaryKey(String var1);

	int insert(CrmUserBroad var1);

	int insertSelective(CrmUserBroad var1);

	CrmUserBroad selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(CrmUserBroad var1);

	int updateByPrimaryKey(CrmUserBroad var1);

}
