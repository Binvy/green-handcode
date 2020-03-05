package com.tstar.util;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:44
 */
public class UUID {

	private static String oldValue = "";
	private static String newValue = "";

	public UUID() {
	}

	public static synchronized String get() {
		do {
			newValue = java.util.UUID.randomUUID().toString();
		} while(newValue.equals(oldValue));

		oldValue = newValue;
		return newValue;
	}

	public static void main(String[] args) throws Exception {
		System.out.println(get());
	}

}
