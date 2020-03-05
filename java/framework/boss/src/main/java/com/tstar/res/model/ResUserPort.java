package com.tstar.res.model;

import lombok.Data;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:18
 */
@Data
public class ResUserPort {

	private Integer id;
	private String userId;
	private String userKey;
	private String businessType;
	private String deviceCode;
	private String portCode;
	private Integer portIndex;
	private String ctrlSetName;
	private String creator;
	private Date createTime;
	private String remark;
	private String deviceName;
	private String reserved;

}
