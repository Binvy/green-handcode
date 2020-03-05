package com.tstar.ac.business;

import com.tstar.util.RegExp;
import com.tstar.util.SoapUI;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:06
 */
public class IMS_V9 implements INorth {

	private static final String codePattern = "ResultCode>(\\d+)<";
	private static final String descPattern = "ResultDesc>(.*)<";
	private static final String faultCodePattern = "faultcode>(\\d+)<";
	private static final String faultDescPattern = "faultstring>(\\d+)<";
	private static final String UNKNOWN_ERR = "999999";
	private SoapUI soap = null;

	public IMS_V9() {
	}

	public void open(String url) throws Exception {
		if (this.soap == null) {
			this.soap = new SoapUI(url);
		}

		this.soap.connect();
	}

	public void close() throws Exception {
		this.soap.disconnect();
		this.soap = null;
	}

	public boolean connected() {
		return this.soap == null ? false : this.soap.getConnected();
	}

	public RetMsg execute(String cmd) throws Exception {
		String result = this.soap.execute(cmd).trim();
		String tmp = result.replaceAll("[\\t\\n\\r]", "");
		String[] values = RegExp.getValues("ResultCode>(\\d+)<", tmp);
		String[] descValues = RegExp.getValues("ResultDesc>(.*)<", tmp);
		if (values != null && values.length > 0) {
			return new RetMsg(values[0], descValues[0]);
		} else {
			String[] faultValues = RegExp.getValues("faultcode>(\\d+)<", tmp);
			String[] faultDescValues = RegExp.getValues("faultstring>(\\d+)<", tmp);
			return faultValues != null && faultValues.length > 0 ? new RetMsg(faultValues[0], faultDescValues[0]) : new RetMsg("999999", result);
		}
	}

	public RetMsg execute(String cmd, String prompt) throws Exception {
		return this.execute(cmd);
	}

	public boolean buildLink(String url) {
		return false;
	}

	public void sendMsg(byte[] msg) {
	}

	public void readMsg() {
	}

	public void doException(String msg) {
	}

	public void closeSocekt() {
	}

}
