package com.tstar.res.model;

import lombok.Data;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:21
 */
@Data
public class ResOpticalPort {

	private Integer id;
	private String deviceCode;
	private String portCode;
	private String ponCode;
	private String subPortCode;
	private String address;
	private String snCode;
	private String macCode;
	private String keyLogic;
	private String keyPhy;
	private String odf;
	private String voipMg;
	private String mgMask;
	private String nodeId;
	private String mgcIp;
	private String cvlan;

}
