package com.tstar.callcenter.mapper;

import com.tstar.callcenter.model.UserEmplInfo;
import com.tstar.callcenter.model.UserEmplInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserEmplInfoMapper {

	int countByExample(UserEmplInfoExample example);

	int deleteByExample(UserEmplInfoExample example);

	int insert(UserEmplInfo record);

	int insertSelective(UserEmplInfo record);

	List<UserEmplInfo> selectByExample(UserEmplInfoExample example);

	int updateByExampleSelective(@Param("record") UserEmplInfo record, @Param("example") UserEmplInfoExample example);

	int updateByExample(@Param("record") UserEmplInfo record, @Param("example") UserEmplInfoExample example);

}
