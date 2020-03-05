package com.tstar.portal.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:22
 */
@Data
public class User {

	private String id;
	private String userName;
	private String password;
	private String userAlias;
	private String deptId;
	private String roleId;
	private Integer status;
	private String acl;
	private Date loginTime;
	private String userLang;
	private Integer failCount;
	private Date createTime;
	private Date updateTime;
	private String remark;
	private String deptAbbr;
	private String roleName;
	private String deptName;

}
