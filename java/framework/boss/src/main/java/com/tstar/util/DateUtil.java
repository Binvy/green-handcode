package com.tstar.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author binvi
 * @version 1.0
 * @Description: 日期工具类
 * @date 2019/12/12 22:05
 */
public class DateUtil {

	private static final SimpleDateFormat sdfMedium = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static final SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
	private static final SimpleDateFormat sdfLong = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
	private static final SimpleDateFormat sdfShort = new SimpleDateFormat("yyyy-MM-dd");
	private static final SimpleDateFormat sdfBillMonth = new SimpleDateFormat("yyyyMM");

	private static final Map mapFormat = new HashMap();

	public DateUtil() {
	}

	public static String format(Date dt) {
		return sdfMedium.format(dt);
	}

	public static String format(Date date, String pattern) {
		return getDateFormat(pattern).format(date);
	}

	private static DateFormat getDateFormat(String key) {
		DateFormat format = (DateFormat)mapFormat.get(key);
		if (format == null) {
			format = new SimpleDateFormat(key);
		}

		return (DateFormat)format;
	}

	public static String formatDate(Date dt) {
		return sdfShort.format(dt);
	}

	public static String formatTime(Date dt) {
		return sdfTime.format(dt);
	}

	public static String formatWhole(Date dt) {
		return sdfLong.format(dt);
	}

	public static Date parse(String str) throws Exception {
		return sdfMedium.parse(str);
	}

	public static String formatBillMonth(Date dt) {
		return sdfBillMonth.format(dt);
	}

	public static Date parseBillMonth(String str) throws Exception {
		return sdfBillMonth.parse(str);
	}

	public static Date parse1(String str) throws Exception {
		String pattern = "";
		int len = str.length();
		if (len == 10) {
			pattern = str + " 00:00:00";
		} else if (len == 16) {
			pattern = str + ":00";
		}

		return sdfMedium.parse(pattern);
	}

	public static Date parse2(String str) throws Exception {
		return sdfLong.parse(str);
	}

	public static Date parseDate(String str) throws Exception {
		return sdfShort.parse(str);
	}

	public static int getDay(Date dt) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dt);
		return calendar.get(5);
	}

	public static Date getDayBegin(Date dt) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dt);
		calendar.set(11, 0);
		calendar.set(12, 0);
		calendar.set(13, 0);
		calendar.set(14, 0);
		return calendar.getTime();
	}

	public static Date getDayEnd(Date dt) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dt);
		calendar.set(11, 23);
		calendar.set(12, 59);
		calendar.set(13, 59);
		calendar.set(14, 999);
		return calendar.getTime();
	}

	public static Date addMonth(Date dt, int count) {
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(dt);
		gc.add(2, count);
		return gc.getTime();
	}

	public static Date addDay(Date dt, int count) {
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(dt);
		gc.add(5, count);
		return gc.getTime();
	}

	public static Date add(Date dt, String term, int count) {
		String t = term.toUpperCase();
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(dt);
		if ("DAY".equals(t)) {
			gc.add(5, count);
		} else if ("WEEK".equals(t)) {
			gc.add(5, 7 * count);
		} else if ("MONTH".equals(t)) {
			gc.add(2, count);
		} else if ("SEASON".equals(t)) {
			gc.add(2, 3 * count);
		} else if ("HALFOFYEAR".equals(t)) {
			gc.add(2, 6 * count);
		} else if ("YEAR".equals(t)) {
			gc.add(1, count);
		} else if ("2YEAR".equals(t)) {
			gc.add(1, 2 * count);
		}

		return gc.getTime();
	}

	public static Date[] getBillingTerm(Date dt, int billingDay) {
		Date[] ds = new Date[2];
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dt);
		calendar.set(11, 0);
		calendar.set(12, 0);
		calendar.set(13, 0);
		calendar.set(14, 0);
		if (billingDay == 0) {
			ds[0] = calendar.getTime();
		} else {
			int currDay = calendar.get(5);
			if (currDay >= billingDay) {
				calendar.set(5, billingDay);
				ds[0] = calendar.getTime();
			} else {
				calendar.add(2, -1);
				calendar.set(5, billingDay);
				ds[0] = calendar.getTime();
			}
		}

		calendar.add(2, 1);
		calendar.add(14, -1);
		ds[1] = calendar.getTime();
		return ds;
	}

	public static Date[] getBillingTerm(Date dt, String term, int termCount, int billingDay) {
		Date[] ds = new Date[2];
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dt);
		calendar.set(11, 0);
		calendar.set(12, 0);
		calendar.set(13, 0);
		calendar.set(14, 0);
		if (billingDay == 0) {
			ds[0] = calendar.getTime();
			ds[1] = add(ds[0], term, termCount);
		} else {
			int currDay = calendar.get(5);
			if (currDay >= billingDay) {
				calendar.set(5, billingDay);
				ds[0] = calendar.getTime();
			} else {
				calendar.add(2, -1);
				calendar.set(5, billingDay);
				ds[0] = calendar.getTime();
			}

			int monthCount = 1;
			if ("SEASON".equals(term)) {
				monthCount = 3;
			} else if ("HALFOFYEAR".equals(term)) {
				monthCount = 6;
			} else if ("YEAR".equals(term)) {
				monthCount = 12;
			}

			calendar.add(2, monthCount * termCount);
			calendar.add(14, -1);
			ds[1] = calendar.getTime();
		}

		return ds;
	}

	public static boolean isFirstMonth(String term, int billingDay, Date startDt, Date dt) {
		Date[] ds = getBillingTerm(startDt, billingDay);
		return dt.getTime() <= ds[1].getTime();
	}

	public static int getTermDays(String t) {
		if ("DAY".equals(t)) {
			return 1;
		} else if ("WEEK".equals(t)) {
			return 7;
		} else if ("MONTH".equals(t)) {
			return 30;
		} else if ("SEASON".equals(t)) {
			return 90;
		} else if ("HALFOFYEAR".equals(t)) {
			return 180;
		} else {
			return "YEAR".equals(t) ? 360 : 1;
		}
	}

	public static Date endOfWorld() {
		Date dt = new Date();

		try {
			dt = sdfLong.parse("2999-12-31 00:00:00 000");
		} catch (Exception var2) {
		}

		return dt;
	}

	public static int getIntervalDays(Date dt1, Date dt2) {
		long interval = dt2.getTime() - dt1.getTime();
		return (int)(interval / 86400000L);
	}

	public static int getDays(Date dt1, Date dt2) throws Exception {
		if (dt1.getTime() > dt2.getTime()) {
			return 0;
		} else {
			Date startDate = getDayBegin(dt1);
			Date[] ds = getBillingTerm(dt1, 1);
			Date endDate = dt2;
			if (ds[1].getTime() < dt2.getTime()) {
				endDate = new Date(ds[1].getTime() + 1L);
			}

			long interval = endDate.getTime() - startDate.getTime();
			long count = interval / 86400000L;
			long m = interval % 86400000L;
			if (m > 0L) {
				++count;
			}

			return (int)count;
		}
	}

	public static Date addDays(Date dt, int count) {
		return addDay(getDayBegin(dt), count);
	}

	public static boolean isFirstMonth(Date dt1, Date dt2) {
		String str1 = sdfBillMonth.format(dt1);
		String str2 = sdfBillMonth.format(dt2);
		return str1.equals(str2);
	}

	public static int monthCount(String term) {
		if ("SEASON".equals(term)) {
			return 3;
		} else if ("YEAR".equals(term)) {
			return 12;
		} else {
			return "2YEAR".equals(term) ? 24 : 1;
		}
	}

	public static void main(String[] args) throws Exception {
		Date dt1 = parse2("2017-01-01 01:00:00 000");
		Date dt2 = parse2("2017-01-01 02:00:00 001");
		System.out.println(getDays(dt1, dt2));
		System.out.println(formatWhole(new Date(addDays(dt1, 31).getTime() - 1L)));
		String str = "201701";
		Date dt = parseBillMonth(str);
		System.out.println(parseBillMonth(str));
		Date[] ds = getBillingTerm(dt, 1);
		System.out.println(ds[0]);
		System.out.println(ds[1]);
		Date billMonth1 = parseBillMonth("201705");
		System.out.println(billMonth1);
		Date month2 = addMonth(billMonth1, 2);
		System.out.println(month2);
		System.out.println(getIntervalDays(month2, new Date()));
		Date now = new Date();
		System.out.println(format(now));
	}

}
