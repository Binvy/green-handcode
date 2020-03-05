package com.tstar.callcenter.service.impl;

import com.tstar.callcenter.mapper.AdminConfMapper;
import com.tstar.callcenter.mapper.TroubleAcceptMapper;
import com.tstar.callcenter.mapper.UserEmplInfoMapper;
import com.tstar.callcenter.model.UserEmplInfo;
import com.tstar.callcenter.model.UserEmplInfoExample;
import com.tstar.callcenter.model.UserSession;
import com.tstar.callcenter.service.LoginService;
import com.tstar.component.SessionUserListener;
import com.tstar.portal.mapper.SysUserMapper;
import com.tstar.portal.model.ResultMap;
import com.tstar.portal.model.SysUser;
import com.tstar.portal.model.SysUserExample;
import com.tstar.portal.service.UserService;
import com.tstar.util.EncryptUtil;
import org.apache.commons.collections.CollectionUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:02
 */
@Service
public class LoginServiceImpl implements LoginService {

	private static final Logger logger = LogManager.getLogger(LoginServiceImpl.class);

	private static HttpSession session;
	@Resource
	private UserEmplInfoMapper userEmplInfoMapper;
	@Resource
	private TroubleAcceptMapper troubleAcceptMapper;
	@Resource
	private AdminConfMapper adminConfMapper;
	@Resource
	private SysUserMapper sysUserMapper;

	@Override
	public String[] login2(String userName, String password, String phone, String ip, String gwIp, long admin) {
		String[] res = new String[]{"", ""};
		SysUserExample example = new SysUserExample();
		example.createCriteria()
				.andUserNameEqualTo(userName)
				.andPasswordEqualTo(password);
		List<SysUser> sysUserList = sysUserMapper.selectByExample(example);
		if (CollectionUtils.isNotEmpty(sysUserList)) {
			SysUser user = sysUserList.get(0);
			boolean hasLogin = SessionUserListener.checkIfHasLogin(user);
			if (hasLogin) {
				res[0] = "0";
				res[1] = "用户已登录，请勿重复登录";
			} else {
				res[0] = "1";
				res[1] = "登录成功!";
				this.setSession(user, phone, ip, gwIp);
			}
		} else {
			res[0] = "-1";
			res[1] = "用户不存在!";
		}
		return res;
	}

	@Override
	public String[] login(String userName, String password, String phone, String ip, String gwIp, long admin) {
		String[] res = new String[]{"", ""};
		UserEmplInfoExample example = new UserEmplInfoExample();
		UserEmplInfoExample.Criteria criteria = example.createCriteria();
		criteria.andUserNameEqualTo(userName);
		criteria.andIsAdminEqualTo(admin);
		List<UserEmplInfo> list = this.userEmplInfoMapper.selectByExample(example);
		password = EncryptUtil.encrypt(password);
		if (list != null && list.size() != 0) {
			Boolean hasLogin = SessionUserListener.checkIfHasLogin((UserEmplInfo)list.get(0));
			if (hasLogin) {
				res[0] = "0";
				res[1] = "用户已登录，请勿重复登录!";
			} else if (password.equals(((UserEmplInfo)list.get(0)).getPassword())) {
				res[0] = "1";
				res[1] = "登录成功!";
				if (!userName.endsWith("admin")) {
					ResultMap map = new ResultMap();
					map.put("login_time", new Date());
					map.put("phone", phone);
					map.put("empl_no", userName);
					List<ResultMap> ss = this.adminConfMapper.selectEmplNameByEmplNo(map);
					String emplName = ((ResultMap)ss.get(0)).getAttribute("name");
					map.put("empl_name", emplName);
					this.adminConfMapper.insertLoginLog(map);
				}

				// this.setSession((UserEmplInfo)list.get(0), phone, ip, gwIp);
			} else {
				res[0] = "0";
				res[1] = "密码不正确!";
			}
		} else {
			res[0] = "-1";
			res[1] = "用户不存在!";
		}

		return res;
	}

	public void logout() {
		session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("userInfo");
		SessionUserListener.removeSession(session.getId());
	}

	private void setSession(SysUser user, String phone, String ip, String gwIp) {
		UserSession userSession = new UserSession();
		userSession.setId(user.getId());
		userSession.setIp(ip);
		userSession.setGwIp(gwIp);
		userSession.setPhone(phone);
		userSession.setRoleId(String.valueOf(user.getRoleId()));
		userSession.setUserId(String.valueOf(user.getId()));
		userSession.setUserName(user.getUserName());
		userSession.setDeptId(user.getDeptId());
		userSession.setIsAdmin("admin".equals(user.getUserName()) ? 1L : 0L);
		session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userInfo", userSession);
		if (SessionUserListener.containsKey(session.getId())) {
			SessionUserListener.removeSession(session.getId());
		}
		SessionUserListener.addUserSession(session);
	}

	@Override
	public int isLogin() {
		return 0;
	}

	@Override
	public String getLoginUserName() {
		return null;
	}
}
