package com.tstar.activiti.service.impl;

import com.tstar.activiti.service.AssignmentHandlerService;
import com.tstar.portal.mapper.DeptMapper;
import com.tstar.portal.mapper.RoleMapper;
import com.tstar.portal.mapper.UserMapper;
import com.tstar.portal.model.Dept;
import com.tstar.portal.model.Role;
import com.tstar.portal.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:08
 */
@Service
public class AssignmentHandlerServiceImpl implements AssignmentHandlerService {

	@Resource
	private UserMapper daoSysUser;
	@Resource
	private RoleMapper daoRole;
	@Resource
	private DeptMapper daoDept;

	public AssignmentHandlerServiceImpl() {
	}

	public List<String> findUsers(String originator, String roleName) throws Exception {
		System.out.println("originator: " + originator + "\t" + "roleName: " + roleName);
		User sysUser = this.daoSysUser.selectByUserName(originator);
		if (sysUser == null) {
			throw new Exception("用户不存在：" + originator);
		} else {
			Role role = this.daoRole.selectByName(roleName);
			if (role == null) {
				throw new Exception("角色不存在：" + roleName);
			} else {
				List<String> users = this.daoSysUser.selectByDeptAndRole(sysUser.getDeptId(), role.getId());
				if (users != null && users.size() != 0) {
					return users;
				} else {
					throw new Exception("没有匹配的系统用户可以签收任务。");
				}
			}
		}
	}

	public List<String> findUsersBySta(String businessSta, String roleName) throws Exception {
		Dept dept = this.daoDept.selectByName(businessSta);
		if (dept == null) {
			throw new Exception("通信站不存在：" + businessSta);
		} else {
			String parentId = dept.getParentId();
			Dept parentDept = this.daoDept.selectByPrimaryKey(parentId);
			if (parentDept == null) {
				throw new Exception("总站不存在:" + businessSta);
			} else {
				Role role = this.daoRole.selectByName(roleName);
				if (role == null) {
					throw new Exception("角色不存在：" + roleName);
				} else {
					List<String> users = this.daoSysUser.selectByDeptAndRole(parentDept.getId(), role.getId());
					if (users != null && users.size() != 0) {
						return users;
					} else {
						throw new Exception("没有匹配的系统用户可以签收任务。");
					}
				}
			}
		}
	}

}
