package com.tstar.callcenter.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:08
 */
@Data
public class UserEmplInfo {

	private long userId;
	private String userName;
	private String password;
	private long roleId;
	private Date createTime;
	private Date updateTime;
	private String remark;
	private String s1;
	private String s2;
	private String s3;
	private long num1;
	private long num2;
	private long num3;
	private long isAdmin;
	private String type;
	private String bossPwd;
	private long deptId;
	private String name;
	private String gender;
	private long age;
	private Date birthday;
	private Date joinDate;
	private String tel;
	private String mobile;
	private String email;
	private String certificateId;
	private long isAgent;
	private String monitorDept;
	private String deptName;

}
