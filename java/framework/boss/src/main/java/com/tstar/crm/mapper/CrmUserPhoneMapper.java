package com.tstar.crm.mapper;

import com.tstar.crm.model.CrmUserPhone;

import java.util.List;

public interface CrmUserPhoneMapper {

	int deleteByPrimaryKey(String var1);

	int insert(CrmUserPhone var1);

	int insertSelective(CrmUserPhone var1);

	CrmUserPhone selectByPrimaryKey(String var1);

	int updateByPrimaryKeySelective(CrmUserPhone var1);

	int updateByPrimaryKey(CrmUserPhone var1);

	List<CrmUserPhone> selectAll();

}
