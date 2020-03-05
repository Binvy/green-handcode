package com.tstar.portal.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tstar.callcenter.service.LoginService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;

/**
 * @author binvi
 * @version 1.0
 * @Description: 登录
 * @date 2019/12/16 22:01
 */
public class LoginAction extends ActionSupport {

	private static final Logger logger = LogManager.getLogger(LoginAction.class);

	private static final long serialVersionUID = 1L;
	private String userName;
	private String password;
	private String phone;
	private String ip;
	private String gwIp;
	private String res;
	private String resNum;
	private long isAdmin;
	private String userId;
	@Resource
	private LoginService loginService;

	public LoginAction() {
	}

	public String loginPage() {
		return "loginPage";
	}

	public String login() {
		logger.info("LoginAction login start");
		String[] r = this.loginService.login2(this.userName, this.password, this.phone, this.ip, this.gwIp, this.isAdmin);
		this.resNum = r[0];
		this.res = r[1];
		return "login";
	}

	public String logout() {
		this.loginService.logout();
		return "loginPage";
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRes() {
		return this.res;
	}

	public void setRes(String res) {
		this.res = res;
	}

	public String getResNum() {
		return this.resNum;
	}

	public void setResNum(String resNum) {
		this.resNum = resNum;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public long getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(long isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGwIp() {
		return this.gwIp;
	}

	public void setGwIp(String gwIp) {
		this.gwIp = gwIp;
	}

}
