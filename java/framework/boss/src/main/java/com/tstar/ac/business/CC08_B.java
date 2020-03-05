package com.tstar.ac.business;

import com.tstar.util.RegExp;
import com.tstar.util.SocketClient;

/**
 * @author binvi
 * @version 1.0
 * @Description: CC08交换机执行类
 * @date 2019/12/12 21:50
 */
public class CC08_B implements INorth {

	private static final String pattern = "RETCODE = (\\d+) ";
	private static final String UNKNOWN_ERR = "999999";
	private SocketClient socket = null;

	public CC08_B() {
	}

	public void open(String url) throws Exception {
		if (this.socket == null) {
			String[] infos = url.split(":");
			this.socket = new SocketClient(infos[0], Integer.parseInt(infos[1]));
		}

		this.socket.connect();
	}

	public void close() throws Exception {
		this.socket.disconnect();
		this.socket = null;
	}

	public boolean connected() {
		return this.socket == null ? false : this.socket.getConnected();
	}

	public RetMsg execute(String cmd) throws Exception {
		String result = this.socket.execute(cmd).trim();
		String tmp = result.replaceAll("[\\t\\n\\r]", "");
		String[] values = RegExp.getValues("RETCODE = (\\d+) ", tmp);
		return values != null && values.length > 0 ? new RetMsg(values[0], result) : new RetMsg("999999", result);
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
