package com.tstar.util;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/16 22:22
 */
public class EncryptUtil {

	public static String key = "LmMGStGtOpF4xNyvYt54EQ==";

	public EncryptUtil() {
	}

	public static String encrypt(String xmlStr) {
		byte[] encrypt = (byte[])null;

		try {
			encrypt = xmlStr.getBytes("utf-8");
		} catch (UnsupportedEncodingException var12) {
			var12.printStackTrace();
		}

		byte[] md5Hasn = (byte[])null;

		try {
			md5Hasn = MD5Hash(encrypt, 0, encrypt.length);
		} catch (Exception var11) {
			var11.printStackTrace();
		}

		byte[] totalByte = addMD5(md5Hasn, encrypt);
		byte[] key = new byte[8];
		byte[] iv = new byte[8];
		getKeyIV(key.toString(), key, iv);
		SecretKeySpec deskey = new SecretKeySpec(key, "DES");
		IvParameterSpec ivParam = new IvParameterSpec(iv);
		byte[] temp = (byte[])null;

		try {
			temp = DES_CBC_Encrypt(totalByte, deskey, ivParam);
		} catch (Exception var10) {
			var10.printStackTrace();
		}

		return (new BASE64Encoder()).encode(temp);
	}

	public static String decrypt(String xmlStr) throws Exception {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] encBuf = (byte[])null;

		try {
			encBuf = decoder.decodeBuffer(xmlStr);
		} catch (IOException var12) {
			var12.printStackTrace();
		}

		byte[] key = new byte[8];
		byte[] iv = new byte[8];
		getKeyIV(key.toString(), key, iv);
		SecretKeySpec deskey = new SecretKeySpec(key, "DES");
		IvParameterSpec ivParam = new IvParameterSpec(iv);
		byte[] temp = (byte[])null;

		try {
			temp = DES_CBC_Decrypt(encBuf, deskey, ivParam);
		} catch (Exception var11) {
			var11.printStackTrace();
		}

		byte[] md5Hash = (byte[])null;

		try {
			md5Hash = MD5Hash(temp, 16, temp.length - 16);
		} catch (Exception var10) {
			var10.printStackTrace();
		}

		for(int i = 0; i < md5Hash.length; ++i) {
			if (md5Hash[i] != temp[i]) {
				throw new Exception("MD5校验错误。");
			}
		}

		return new String(temp, 16, temp.length - 16, "utf-8");
	}

	public static byte[] DES_CBC_Encrypt(byte[] sourceBuf, SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {
		Cipher encrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");
		encrypt.init(1, deskey, ivParam);
		byte[] cipherByte = encrypt.doFinal(sourceBuf, 0, sourceBuf.length);
		return cipherByte;
	}

	public static byte[] DES_CBC_Decrypt(byte[] sourceBuf, SecretKeySpec deskey, IvParameterSpec ivParam) throws Exception {
		Cipher decrypt = Cipher.getInstance("DES/CBC/PKCS5Padding");
		decrypt.init(2, deskey, ivParam);
		byte[] cipherByte = decrypt.doFinal(sourceBuf, 0, sourceBuf.length);
		return cipherByte;
	}

	public static byte[] MD5Hash(byte[] buf, int offset, int length) throws Exception {
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(buf, offset, length);
		return md.digest();
	}

	public static byte[] addMD5(byte[] md5Byte, byte[] bodyByte) {
		int length = bodyByte.length + md5Byte.length;
		byte[] resutlByte = new byte[length];

		for(int i = 0; i < length; ++i) {
			if (i < md5Byte.length) {
				resutlByte[i] = md5Byte[i];
			} else {
				resutlByte[i] = bodyByte[i - md5Byte.length];
			}
		}

		return resutlByte;
	}

	public static void getKeyIV(String encryptKey, byte[] key, byte[] iv) {
		BASE64Decoder decoder = new BASE64Decoder();
		byte[] buf = (byte[])null;

		try {
			buf = decoder.decodeBuffer(encryptKey);
		} catch (IOException var6) {
			var6.printStackTrace();
		}

		int i;
		for(i = 0; i < key.length; ++i) {
			key[i] = buf[i];
		}

		for(i = 0; i < iv.length; ++i) {
			iv[i] = buf[i + 8];
		}

	}

}
