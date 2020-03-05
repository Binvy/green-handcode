package com.tstar.portal.action;

import com.opensymphony.xwork2.ActionSupport;
import com.tstar.util.DateUtil;

import java.util.Date;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:29
 */
public class SystemAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private String parm;

	public SystemAction() {
	}

	public String getParm() {
		return this.parm;
	}

	public void setParm(String parm) {
		this.parm = parm;
	}

	public String gotoPortal() {
		return "portalPage";
	}

	public String goToDashboardPage() {
		return "dashboardPage";
	}

	public String nextDay() {
		try {
			Date dt = DateUtil.parse1(this.parm);
			dt = DateUtil.add(dt, "DAY", 1);
			this.parm = DateUtil.formatDate(dt);
		} catch (Exception var2) {
			this.parm = "";
		}

		return "getRecords";
	}

}
