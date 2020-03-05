package com.tstar.ac.business;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 22:53
 */
public class RetMsg {

	private String retCode;
	private String retDesc;

	public RetMsg() {
	}

	public RetMsg(String retCode, String retDesc) {
		this.retCode = retCode;
		this.retDesc = retDesc;
	}

	public String getRetCode() {
		return this.retCode;
	}

	public void setRetCode(String retCode) {
		this.retCode = retCode;
	}

	public String getRetDesc() {
		return this.retDesc;
	}

	public void setRetDesc(String retDesc) {
		this.retDesc = retDesc;
	}

}
