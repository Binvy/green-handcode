package com.tstar.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:07
 */
public class SoapUI {

	private static final String CODING = "UTF-8";
	private String url;
	private URL wsURL;
	private boolean connected;

	public SoapUI(String url) {
		this.url = url;
	}

	public boolean getConnected() {
		return this.connected;
	}

	public void connect() throws MalformedURLException, IOException {
		this.wsURL = new URL(this.url);
		this.connected = true;
	}

	public void disconnect() throws IOException {
		this.connected = false;
	}

	public String execute(String cmd) throws IOException {
		HttpURLConnection conn = (HttpURLConnection)this.wsURL.openConnection();
		conn.setDoInput(true);
		conn.setDoOutput(true);
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Length", String.valueOf(cmd.getBytes().length));
		conn.setRequestProperty("Content-Type", "text/xml;charset=UTF-8");
		OutputStream out = conn.getOutputStream();
		out.write(cmd.getBytes());
		out.flush();
		InputStream in = conn.getInputStream();
		String res = this.readUntil(in, (String)null);
		in.close();
		out.close();
		conn.disconnect();
		return res != null ? new String(res.getBytes("iso8859-1"), "UTF-8") : null;
	}

	private String readUntil(InputStream in, String pattern) throws IOException {
		StringBuffer sb = new StringBuffer();
		char lastChar = '\uffff';
		boolean flag = pattern != null && pattern.length() > 0;
		if (flag) {
			lastChar = pattern.charAt(pattern.length() - 1);
		}
		char ch;
		do {
			int code;
			if ((code = in.read()) == -1) {
				return sb.toString();
			}

			ch = (char)code;
			sb.append(ch);
		} while(!flag || ch != lastChar || !sb.toString().endsWith(pattern));

		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println("Default Charset: " + Charset.defaultCharset());
		SoapUI soap = new SoapUI("http://129.30.30.4:8080/spg");
		System.out.println("Connecting http://129.30.30.4:8080/spg ...");

		try {
			soap.connect();
			System.out.println("Connected successfully and execute command:");
			String cmd = FileHelper.readTxtFile("config/ims/LST_SBR.xml");
			System.out.println("Command: " + cmd);
			String result = soap.execute(cmd);
			System.out.println("result:");
			System.out.println(result);
			soap.disconnect();
		} catch (Exception e) {
			System.out.println(ExceptionUtil.getStackTrace(e));
		}

	}

}
