package com.tstar.crm.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:25
 */
@Data
public class CrmUserPhone {

	private String id;
	private String phoneNo;
	private String phoneAlias;
	private String deviceCode;
	private String pwd;
	private String phoneLevel;
	private Date convertTime;
	private String callPolicy;
	private String adjustPolicy;
	private String secretLevel;
	private String phoneLevelDesc;
	private String callPolicyDesc;
	private String adjustPolicyDesc;
	private String secretLevelDesc;

}
