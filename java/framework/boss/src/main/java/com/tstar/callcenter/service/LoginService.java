package com.tstar.callcenter.service;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:02
 */
public interface LoginService {

	String[] login2(String userName, String password, String phone, String ip, String gwIp, long admin);

	String[] login(String userName, String password, String phone, String ip, String gwIp, long admin);

	void logout();

	int isLogin();

	String getLoginUserName();

}
