package com.tstar.crm.model;

import lombok.Data;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:13
 */
@Data
public class CrmUserAdsl {

	private String id;
	private String acc;
	private String pwd;
	private String phoneNo;
	private String speed;
	private String ipAddress;
	private String macAddress;
	private String notifyPolicy;
	private String serviceOper;
	private String innerVlan;
	private String outerVlan;
	private String speedDesc;
	private String serviceOperDesc;
	private String notifyPolicyDesc;

}
