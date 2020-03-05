package com.tstar.util;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:42
 */
public class ExceptionUtil {
	public ExceptionUtil() {
	}

	public static String getStackTrace(Exception e) {
		String val = null;
		StringWriter sw = null;
		PrintWriter pw = null;

		try {
			sw = new StringWriter();
			pw = new PrintWriter(sw);
			e.printStackTrace(pw);
			pw.flush();
			sw.flush();
			val = sw.toString();
		} finally {
			if (pw != null) {
				pw.close();
			}

			if (sw != null) {
				try {
					sw.close();
				} catch (Exception var9) {
				}
			}

		}

		return val;
	}

	public static void main(String[] args) {
		try {
			throw new Exception("Hello");
		} catch (Exception var2) {
			System.out.println(getStackTrace(var2));
		}
	}
}
