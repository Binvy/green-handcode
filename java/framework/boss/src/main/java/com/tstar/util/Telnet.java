package com.tstar.util;

import com.tstar.ac.business.TelnetClient;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.net.SocketException;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:10
 */
public class Telnet {

	private static final char PROMPT_CHAR_1 = '>';
	private TelnetClient telnet = new TelnetClient();
	private PrintStream out;
	private InputStream in;
	private String host;
	private int port;
	private boolean connected;

	public Telnet(String host, int port) {
		this.host = host;
		this.port = port;
	}

	public boolean getConnected() {
		return this.connected;
	}

	public void connect() throws SocketException, IOException {
		this.telnet.connect(this.host, this.port);
		this.out = new PrintStream(this.telnet.getOutputStream());
		this.in = this.telnet.getInputStream();
		this.connected = true;
	}

	public void disconnect() throws IOException {
		this.telnet.disconnect();
		this.connected = false;
	}

	public String readUntil(String pattern) throws IOException {
		String p = null;
		if (pattern == null) {
			p = ";";
		} else {
			p = pattern;
		}

		StringBuffer sb = new StringBuffer();
		char lastChar = '\uffff';
		boolean flag = p != null && p.length() > 0;
		if (flag) {
			lastChar = p.charAt(p.length() - 1);
		}

		boolean var7 = true;

		do {
			int code;
			if ((code = this.in.read()) == -1) {
				return sb.toString();
			}

			char ch = (char)code;
			sb.append(ch);
			if (flag) {
				if (ch == lastChar && sb.toString().endsWith(p)) {
					return sb.toString();
				}
			} else if (ch == '>') {
				return sb.toString();
			}
		} while(!sb.toString().contains("Login Failed"));

		return sb.toString();
	}

	public String execute(String cmd) throws IOException {
		this.out.println(cmd);
		this.out.flush();
		return this.readUntil((String)null);
	}

	public String execute(String cmd, String prompt) throws IOException {
		this.out.println(cmd);
		this.out.flush();
		return this.readUntil(prompt);
	}

	public static void main(String[] args) throws Exception {
		Telnet telnet = new Telnet("172.22.61.14", 9819);
		telnet.connect();
		String cmd = "LOGIN:::CTAG::UN=beixiangjiekou,PWD=N2000N2000;";
		System.out.println(cmd);
		String res = telnet.execute(cmd, ";");
		System.out.println(new String(res.getBytes("iso8859-1"), "GBK"));
		cmd = "DEL-ONT::DEV=172.22.70.182,FN=0,SN=16,PN=7,ONTID=19:6::;";
		System.out.println(cmd);
		res = telnet.execute(cmd, ";");
		System.out.println(new String(res.getBytes("iso8859-1"), "GBK"));
		cmd = "ADD-ONT::DEV=172.22.70.182,FN=0,SN=16,PN=7,ONTID=19:6::NAME=松江区5001,LINEPROF=HG8120_line,SRVPROF=HG8120_yewu,SERIALNUM=4857544341124623,AUTH=SN,VENDORID=HWTC,EQUIPMENTID=313230,MAINSOFTVERSION=V1R003C01S108,VAPROFILE=HG8120_VOIP,BUILDTOPO=TRUE;";
		System.out.println(cmd);
		res = telnet.execute(cmd, ";");
		System.out.println(new String(res.getBytes("iso8859-1"), "GBK"));
		cmd = "LOGOUT:::CTAG::;";
		System.out.println(cmd);
		res = telnet.execute(cmd, ";");
		System.out.println(new String(res.getBytes("iso8859-1"), "GBK"));
		telnet.disconnect();
	}

}
