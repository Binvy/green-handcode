package com.tstar.ac.business;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/12 22:03
 */
public class MsgHead {

	public static final int length = 9;
	public int m_ibeginID = -1437226411;
	public byte m_bType = 1;
	public int m_iLength = 0;
	public int m_iVersion = 1;
	public byte[] m_baNEID = new byte[8];
	public int m_iFlowCode = 100;
	public int m_iResult = 0;
	public byte m_bLastPackage = 0;
	public short m_sSequence = 0;
	public byte[] m_baReserved = new byte[16];
	public byte[] mml;

	public MsgHead() {
		for(int i = 0; i < this.m_baNEID.length; ++i) {
			this.m_baNEID[i] = 32;
		}

	}

	public void setByte(byte[] bytes) {
		ByteArrayInputStream bi = new ByteArrayInputStream(bytes);
		DataInputStream is = new DataInputStream(bi);

		try {
			this.m_ibeginID = is.readInt();
			this.m_bType = is.readByte();
		} catch (Exception var5) {
		}

	}

	public static int getLength(byte[] bytes) {
		ByteArrayInputStream bi = new ByteArrayInputStream(bytes);
		DataInputStream is = new DataInputStream(bi);
		int length = -1;

		try {
			length = is.readInt();
		} catch (Exception var5) {
		}

		return length;
	}

	public byte[] toArray() {
		ByteArrayOutputStream oOut = new ByteArrayOutputStream();
		DataOutputStream oDataOut = new DataOutputStream(oOut);

		try {
			this.m_iLength = 39 + this.mml.length;
			oDataOut.writeInt(this.m_ibeginID);
			oDataOut.writeByte(this.m_bType);
			oDataOut.writeInt(this.m_iLength);
			oDataOut.writeInt(this.m_iVersion);
			oDataOut.write(this.m_baNEID);
			oDataOut.writeInt(this.m_iFlowCode);
			oDataOut.writeInt(this.m_iResult);
			oDataOut.writeByte(this.m_bLastPackage);
			oDataOut.writeShort(this.m_sSequence);
			oDataOut.write(this.m_baReserved, 0, this.m_baReserved.length);
			oDataOut.write(this.mml);
			return oOut.toByteArray();
		} catch (Exception var4) {
			var4.printStackTrace();
			return null;
		}
	}

}
