package com.tstar.portal.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:20
 */
@Data
public class Role {

	private String id;
	private String roleName;
	private String roleDesc;
	private Integer adminFlag;
	private Date createTime;
	private Date updateTime;
	private String remark;

}
