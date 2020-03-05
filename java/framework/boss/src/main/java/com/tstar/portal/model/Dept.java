package com.tstar.portal.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:10
 */
@Data
public class Dept {

	private String id;
	private String parentId;
	private String deptNo;
	private String deptName;
	private Date createTime;
	private Date updateTime;
	private String remark;
	private String area;
	private String abbr;

}
