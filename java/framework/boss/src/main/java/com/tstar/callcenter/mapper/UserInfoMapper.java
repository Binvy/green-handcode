package com.tstar.callcenter.mapper;

import com.tstar.callcenter.model.UserInfo;
import com.tstar.callcenter.model.UserInfoExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:06
 */
public interface UserInfoMapper {

	int countByExample(UserInfoExample example);

	int deleteByExample(UserInfoExample example);

	int deleteByPrimaryKey(long id);

	int insert(UserInfo userInfo);

	int insertSelective(UserInfo userInfo);

	List<UserInfo> selectByExample(UserInfoExample example);

	UserInfo selectByPrimaryKey(long id);

	int updateByExampleSelective(@Param("record") UserInfo userInfo, @Param("example") UserInfoExample example);

	int updateByExample(@Param("record") UserInfo userInfo, @Param("example") UserInfoExample example);

	int updateByPrimaryKeySelective(UserInfo userInfo);

	int updateByPrimaryKey(UserInfo userInfo);

}
