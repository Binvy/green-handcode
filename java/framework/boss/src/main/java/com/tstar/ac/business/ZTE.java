package com.tstar.ac.business;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:14
 */
public class ZTE implements INorth {

	private static final String pattern = "RETCODE = (\\d+) ";
	private static final String UNKNOWN_ERR = "999999";
	private Socket socket;
	private DataInputStream bio;
	private DataOutputStream bout;
	private boolean isError = false;

	public ZTE() {
	}

	public boolean buildLink(String url) {
		try {
			String[] infos = url.split(":");
			InetSocketAddress oRemortAddress = new InetSocketAddress(infos[0], Integer.parseInt(infos[1]));
			this.socket = new Socket();
			this.socket.connect(oRemortAddress);
			this.bio = new DataInputStream(this.socket.getInputStream());
			this.bout = new DataOutputStream(this.socket.getOutputStream());
			return true;
		} catch (Exception var4) {
			this.doException("连接接口机失败,请确认填写了正确的IP地址和端口号");
			return false;
		}
	}

	public void sendMsg(byte[] msg) {
		try {
			this.bout.write(msg);
			this.bout.flush();
		} catch (Exception var3) {
			if (!this.isError) {
				this.doException("发送消息失败，原因：" + var3.getMessage());
			}
		}

	}

	public void readMsg() {
		byte[] head = new byte[5];
		byte[] lengthBytes = new byte[4];
		MsgHead msgHead = new MsgHead();

		try {
			if (!this.isError) {
				this.bio.readFully(head);
				msgHead.setByte(head);
				if (msgHead.m_ibeginID != -1437226411) {
					this.bio.skip((long)this.bio.available());
					System.out.println("Error beginID beginID=" + msgHead.m_ibeginID + " type=" + msgHead.m_bType);
				} else if (msgHead.m_bType == 3) {
					System.out.println("Receive shake hand message");
				} else if (msgHead.m_bType != 2) {
					this.bio.skip((long)this.bio.available());
					System.out.println("Error msg type, beginID=" + msgHead.m_ibeginID + " type=" + msgHead.m_bType);
				} else {
					this.bio.readFully(lengthBytes);
					int length = MsgHead.getLength(lengthBytes);
					if (length <= 0) {
						System.out.println("msg length is invalid.len=" + length);
					} else {
						byte[] body = new byte[length];
						this.bio.readFully(body);
						System.out.println("输出信息" + new String(body, 39, body.length - 39));
					}
				}
			}
		} catch (Exception var6) {
			if (!this.isError) {
				this.doException("接收消息失败，原因：" + var6.getMessage());
			}
		}

	}

	public void doException(String msg) {
		System.out.println(msg + "错误" + 0);
		this.isError = true;
		this.closeSocekt();
	}

	public void closeSocekt() {
		try {
			if (this.bio != null) {
				this.bio.close();
			}

			if (this.bout != null) {
				this.bout.close();
			}

			if (this.socket != null) {
				this.socket.close();
			}
		} catch (Exception var2) {
		}

	}

	private static byte[] getShakemessage() {
		byte[] baShake = new byte[]{-86, 85, -86, 85, 3};
		return baShake;
	}

	public void close() throws Exception {
	}

	public boolean connected() {
		return false;
	}

	public RetMsg execute(String cmd) throws Exception {
		return null;
	}

	public RetMsg execute(String cmd, String prompt) throws Exception {
		return null;
	}

	public void open(String url) throws Exception {
	}

}
