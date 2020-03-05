package com.tstar.portal.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:46
 */
@Data
public class SysWarnLog {

	private String id;
	private String warnModule;
	private String warnLevel;
	private String warnMsg;
	private Date warnTime;
	private Integer status;
	private String handler;
	private Date handleTime;

}
