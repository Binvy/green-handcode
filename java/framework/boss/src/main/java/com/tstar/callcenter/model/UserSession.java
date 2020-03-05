package com.tstar.callcenter.model;

import lombok.Data;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:26
 */
@Data
public class UserSession {

	private String id;
	public String userId;
	private String userName;
	public String roleId;
	public String phone;
	public String ip;
	public String name;
	public String deptId;
	public String userarea;
	public String bmid;
	public String bossuser;
	public String gwIp;
	public String bossPwd;
	public long isAdmin;

}
