package com.tstar.crm.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 23:04
 */
@Data
public class JobOpInstance {

	private String id;
	private String parentId;
	private String businessOpKey;
	private String businessOpName;
	private String businessOpParms;
	private String customerId;
	private String customerName;
	private String userId;
	private String userKey;
	private String orderId;
	private String originator;
	private Date originateTime;
	private String processDefinitionKey;
	private String processDefinitionName;
	private String processInstanceId;
	private Integer status;
	private String remark;
	private String businessChName;
	private Date finishTime;
	private String checker;
	private String customerNo;
	private String businessSta;
	private String deptDesc;
	private String startTime;
	private String endTime;

}
