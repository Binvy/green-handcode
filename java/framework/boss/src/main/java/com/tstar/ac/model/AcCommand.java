package com.tstar.ac.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description: 业务指令
 * @date 2019/12/11 22:13
 */
@Data
public class AcCommand {

	private String id;
	private String actionId;
	private String deviceCode;
	private String ctrlSetName;
	private String cmd;
	private Integer cmdOrder;
	private Integer keyFlag;
	private Integer retCode;
	private String retDesc;
	private Date exeTime;
	private String cmdPrompt;

}
