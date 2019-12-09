package com.demo.service;

import com.demo.model.User;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/11/30 11:28
 */
public interface UserService {

	void add(User user);

	void delete(User user);

	void deleteByPrimaryKey(String id);

	void update(User user);

	User select(String id);

}
