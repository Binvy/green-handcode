package com.tstar.res.mapper;

import com.tstar.res.model.ResUserPort;

import java.util.List;

public interface ResUserPortMapper {

	int deleteByPrimaryKey(Integer var1);

	int insert(ResUserPort var1);

	int insertSelective(ResUserPort var1);

	ResUserPort selectByPrimaryKey(Integer var1);

	int updateByPrimaryKeySelective(ResUserPort var1);

	int updateByPrimaryKey(ResUserPort var1);

	int countByUserId(String var1);

	List<ResUserPort> selectByUserId(String var1);

	Integer selectMaxPortIndex(String var1);

	int deleteByUserIdAndPort(String var1, String var2, String var3);

}
