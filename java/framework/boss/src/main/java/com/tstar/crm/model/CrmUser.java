package com.tstar.crm.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:23
 */
@Data
public class CrmUser implements Cloneable {

	private String id;
	private String customerId;
	private String businessType;
	private String businessKey;
	private String name;
	private String departmentId;
	private String address;
	private String linkPhone;
	private Integer status;
	private Integer payPolicy;
	private String relTable;
	private String creator;
	private Date createTime;
	private Date updateTime;
	private String remark;
	private Date effectiveTime;
	private Date expiryTime;
	private Integer billingDay;
	private String businessArea;
	private String userArea;
	private String postAddress;
	private String creditorKey;
	private Date convertTime;
	private String businessSta;
	private String centrixid;
	private String centrixname;
	private String linker;
	private Date pauseTime;
	private Integer userType;
	private Integer purpose;
	private String relUserId;
	private String relBusinessKey;
	private String userNum;
	private String fullText;
	private String payPolicyDesc;
	private String departmentName;
	private Integer beginStatus;
	private Integer endStatus;
	private String businessTypeDesc;
	private String statusDesc;
	private String customerDesc;
	private Integer vipDesc;
	private String startTime;
	private String endTime;
	private String exactText;
	private String bankAccDesc;
	private String regDesc;
	private String customerProp;

	public Object clone() {
		CrmUser user = null;

		try {
			user = (CrmUser)super.clone();
		} catch (CloneNotSupportedException var3) {
			var3.printStackTrace();
		}

		return user;
	}

}
