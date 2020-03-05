package com.tstar.res.mapper;

import com.tstar.res.model.ResDevice;

import java.util.List;
import java.util.Map;

public interface ResDeviceMapper {

	int deleteByPrimaryKey(Integer var1);

	int insert(ResDevice var1);

	int insertSelective(ResDevice var1);

	ResDevice selectByPrimaryKey(Integer var1);

	int updateByPrimaryKeySelective(ResDevice var1);

	int updateByPrimaryKey(ResDevice var1);

	int countByCriteria(Map<String, Object> var1);

	List<ResDevice> selectByPage(Map<String, Object> var1);

	ResDevice selectByCode(String var1);

}
