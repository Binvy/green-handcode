package com.tstar.callcenter.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:05
 */
@Data
public class UserInfo {

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
	private String s4;
	private String s5;
	private long num1;
	private long num2;
	private long num3;

}
