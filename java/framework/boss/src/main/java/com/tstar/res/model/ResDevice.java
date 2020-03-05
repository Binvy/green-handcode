package com.tstar.res.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:03
 */
@Data
public class ResDevice {

	private Integer id;
	private String deviceCode;
	private String name;
	private String deviceTypeId;
	private String manufacturer;
	private String deviceModel;
	private Date installDate;
	private String address;
	private String startPortCode;
	private String endPortCode;
	private String portDesc;
	private Integer portTotal;
	private String resDept;
	private String ctrlIp;
	private String ctrlProtocol;
	private String ctrlUserName;
	private String ctrlPwd;
	private String ctrlAdvUserName;
	private String ctrlAdvPwd;
	private String dataIp;
	private String remark;
	private String parentDeviceCode;
	private String parentPortCode;
	private String deviceIp;
	private String slaveCtrlIp;
	private String slan;
	private String voipVlan;
	private String voipIpRange;
	private String mgcVlan;
	private String mgcIpRange;
	private String nodeRange;
	private String keyPhyRange;

}
