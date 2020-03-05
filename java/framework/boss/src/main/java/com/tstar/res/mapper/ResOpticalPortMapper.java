package com.tstar.res.mapper;

import com.tstar.res.model.ResOpticalPort;

public interface ResOpticalPortMapper {

	int deleteByPrimaryKey(Integer var1);

	int insert(ResOpticalPort var1);

	int insertSelective(ResOpticalPort var1);

	ResOpticalPort selectByPrimaryKey(Integer var1);

	int updateByPrimaryKeySelective(ResOpticalPort var1);

	int updateByPrimaryKey(ResOpticalPort var1);

	ResOpticalPort selectByKey(String var1);

	ResOpticalPort selectTopFreeByAddress(String var1);

}
