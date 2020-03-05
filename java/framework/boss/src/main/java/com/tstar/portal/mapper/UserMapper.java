package com.tstar.portal.mapper;

import com.tstar.portal.model.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {

	int deleteByPrimaryKey(String id);

	int insert(User user);

	int insertSelective(User user);

	User selectByPrimaryKey(String id);

	User selectByUserName(String userName);

	int updateByPrimaryKeySelective(User user);

	int updateByPrimaryKey(User user);

	int countByRoleId(String roleId);

	List<User> selectByRole(String roleName);

	int countByCriteria(Map<String, Object> param);

	List<User> selectByPage(Map<String, Object> param);

	List<String> selectByDeptAndRole(String deptId, String roleId);

}
