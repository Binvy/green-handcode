package com.tstar.portal.service.impl;

import com.tstar.portal.mapper.UserMapper;
import com.tstar.portal.model.User;
import com.tstar.portal.service.UserService;
import com.tstar.util.UUID;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/23 22:23
 */
@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper dao;

	public UserServiceImpl() {
	}

	public int countByCriteria(Map<String, Object> map) {
		return this.dao.countByCriteria(map);
	}

	public List<User> findByPage(Map<String, Object> map) {
		return this.dao.selectByPage(map);
	}

	public User findByUserName(String userName) {
		return this.dao.selectByUserName(userName);
	}

	public List<User> selectByRole(String roleName) {
		return this.dao.selectByRole(roleName);
	}

	public String[] insert(User obj) {
		obj.setId(UUID.get());
		obj.setCreateTime(new Date());
		int result = this.dao.insert(obj);
		return result > 0 ? new String[]{"0", "添加成功!"} : new String[]{"1", "添加失败!"};
	}

	public String[] update(User obj) {
		obj.setUpdateTime(new Date());
		int result = this.dao.updateByPrimaryKeySelective(obj);
		return result > 0 ? new String[]{"0", "修改成功!"} : new String[]{"1", "修改失败!"};
	}

	public String[] delete(String id) {
		int result = this.dao.deleteByPrimaryKey(id);
		return result > 0 ? new String[]{"0", "删除成功!"} : new String[]{"1", "删除失败!"};
	}

	public String[] modifPw(String oldPw, String newPw1, String newPw2, String userId) {
		String[] res = new String[]{"", ""};
		User user = this.dao.selectByPrimaryKey(userId);
		if (!user.getPassword().equals(oldPw)) {
			res[1] = "原密码不正确！";
			res[0] = "0";
		} else {
			user.setUpdateTime(new Date());
			user.setPassword(newPw1);
			int result = this.dao.updateByPrimaryKeySelective(user);
			if (result > 0) {
				res[1] = "更改成功!";
				res[0] = "1";
			} else {
				res[1] = "更改失败!";
				res[0] = "0";
			}
		}

		return res;
	}

}
