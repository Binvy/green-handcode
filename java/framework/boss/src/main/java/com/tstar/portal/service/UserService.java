package com.tstar.portal.service;

import com.tstar.portal.model.User;

import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/23 22:22
 */
public interface UserService {

	int countByCriteria(Map<String, Object> param);

	List<User> findByPage(Map<String, Object> param);

	List<User> selectByRole(String roleName);

	User findByUserName(String userName);

	String[] insert(User user);

	String[] update(User user);

	String[] delete(String id);

	String[] modifPw(String oldPw, String newPw1, String newPw2, String userId);

}
