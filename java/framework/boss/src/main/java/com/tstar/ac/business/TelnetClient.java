package com.tstar.ac.business;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:11
 */
public class TelnetClient {

	private static final Logger logger = LogManager.getLogger(TelnetClient.class);

	private String host = "172.16.240.26";
	private String port = "5321";

	public TelnetClient() {
		System.out.println("Host " + this.host + "; port " + this.port);

		try {
			InetSocketAddress oRemortAddress = new InetSocketAddress(this.host, Integer.parseInt(this.port));
			Socket socket = new Socket();
			socket.connect(oRemortAddress);
			(new TelnetClient.Listener(socket.getInputStream(), System.out)).start();
			(new TelnetClient.Listener(System.in, socket.getOutputStream())).start();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return;
		}

		System.out.println("Connected Success");
	}

	public static void main(String[] args) {
		new TelnetClient();
	}

	/**
	 * TODO
	 * @param host
	 * @param port
	 */
	public void connect(String host, int port) {
		try {
			InetSocketAddress oRemortAddress = new InetSocketAddress(this.host, Integer.parseInt(this.port));
			Socket socket = new Socket();
			socket.connect(oRemortAddress);
			(new TelnetClient.Listener(socket.getInputStream(), System.out)).start();
			(new TelnetClient.Listener(System.in, socket.getOutputStream())).start();
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
			return;
		}
	}
	/**
	 * TODO
	 */
	public String getOutputStream() {
		return null;
	}
	/**
	 * TODO
	 */
	public InputStream getInputStream() {
		return null;
	}
	/**
	 * TODO
	 */
	public void disconnect() {

	}

	class Listener extends Thread {
		BufferedReader reader;
		PrintStream ps;

		Listener(InputStream is, OutputStream os) {
			this.reader = new BufferedReader(new InputStreamReader(is));
			this.ps = new PrintStream(os);
		}

		public void run() {
			while(true) {
				try {
					String line;
					if ((line = this.reader.readLine()) != null) {
						this.ps.print(line);
						this.ps.print("\r\n");
						this.ps.flush();
						continue;
					}
				} catch (IOException e) {
					logger.error(e.getMessage(), e);
				}

				return;
			}
		}
	}

}
