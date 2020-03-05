package com.tstar.ac.business;

import com.tstar.util.RegExp;
import com.tstar.util.Telnet;

/**
 * @author binvi
 * @version 1.0
 * @Description: OLT：optical line terminal(光线路终端），用于连接光纤干线的终端设备。
 * @date 2019/12/12 22:09
 */
public class OLT implements INorth {

	private static final String pattern = "EN=(\\d+) ";
	private static final String UNKNOWN_ERR = "999999";
	private Telnet telnet = null;

	public OLT() {
	}

	public void close() throws Exception {
		this.telnet.disconnect();
		this.telnet = null;
	}

	public boolean connected() {
		return this.telnet == null ? false : this.telnet.getConnected();
	}

	public RetMsg execute(String cmd) throws Exception {
		String result = this.telnet.execute(cmd).trim();
		String tmp = result.replaceAll("[\\t\\n\\r]", result);
		String[] values = RegExp.getValues("EN=(\\d+) ", tmp);
		return values != null && values.length > 0 ? new RetMsg(values[0], result) : new RetMsg("999999", result);
	}

	public RetMsg execute(String cmd, String prompt) throws Exception {
		String result = new String(this.telnet.execute(cmd, prompt).trim().getBytes("iso8859-1"), "GBK");
		String tmp = result.replaceAll("[\\t\\n\\r]", result);
		String[] values = RegExp.getValues("EN=(\\d+) ", tmp);
		return values != null && values.length > 0 ? new RetMsg(values[0], result) : new RetMsg("999999", result);
	}

	public void open(String url) throws Exception {
		if (this.telnet == null) {
			String[] infos = url.split(":");
			this.telnet = new Telnet(infos[0], Integer.parseInt(infos[1]));
		}

		this.telnet.connect();
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
