package com.tstar.ac.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description: 业务发放
 * @date 2019/12/11 22:12
 */
@Data
public class AcAction {

	public static final int STATUS_NORMAL = 1;
	public static final int STATUS_INIT = 0;
	public static final int STATUS_EXE = 2;
	public static final int STATUS_SUCCESS = 9;
	public static final int STATUS_NO_COMMANDS = 91;
	public static final int STATUS_RETRY = 98;
	public static final int STATUS_FAIL = 99;
	private String id;
	private String userId;
	private String businessKey;
	private String businessType;
	private String jobId;
	private String ossKey;
	private String parms;
	private Integer status;
	private Integer retry;
	private Date createTime;
	private Date updateTime;
	private String ossKeyName;

	public String getStatusDesc() {
		if (this.status == null) {
			return "";
		} else if (this.status == 0) {
			return "确认";
		} else if (1 == this.status) {
			return "生成指令";
		} else if (2 == this.status) {
			return "执行";
		} else if (9 == this.status) {
			return "完成";
		} else if (91 == this.status) {
			return "空指令";
		} else if (98 == this.status) {
			return "失败重试";
		} else {
			return 99 == this.status ? "失败" : "";
		}
	}

}
