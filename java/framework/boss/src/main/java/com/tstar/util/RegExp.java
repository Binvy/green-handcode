package com.tstar.util;

import org.apache.oro.text.perl.Perl5Util;
import org.apache.oro.text.regex.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/12/11 23:29
 */
public class RegExp {

	public static final String PATTERN_EMAIL = "([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)";
	public static final String PATTERN_VAIRALBE = "/#\\{[_a-z0-9A-Z]+\\}/";
	private static PatternCompiler compiler = new Perl5Compiler();
	private static PatternMatcher matcher = new Perl5Matcher();
	private static Map<String, Pattern> patterns = new HashMap();

	public RegExp() {
	}

	public static String getValue(String regexp, String source, int index) {
		try {
			Pattern pattern = (Pattern)patterns.get(regexp);
			if (pattern == null) {
				pattern = compiler.compile(regexp);
				patterns.put(regexp, pattern);
			}

			if (matcher.contains(source, pattern)) {
				MatchResult result = matcher.getMatch();
				if (result == null) {
					return null;
				} else {
					int len = result.groups();
					if (len > 0) {
						return index > 0 && index <= len ? result.group(index) : result.group(len - 1);
					} else {
						return null;
					}
				}
			} else {
				return null;
			}
		} catch (Exception var6) {
			return null;
		}
	}

	public static String[] getValues(String regexp, String source) {
		try {
			Pattern pattern = (Pattern)patterns.get(regexp);
			if (pattern == null) {
				pattern = compiler.compile(regexp);
				patterns.put(regexp, pattern);
			}

			if (!matcher.contains(source, pattern)) {
				return null;
			} else {
				MatchResult result = matcher.getMatch();
				if (result == null) {
					return null;
				} else {
					int count = result.groups();
					if (count <= 0) {
						return null;
					} else {
						String[] groups = new String[count - 1];

						for(int i = 0; i < count - 1; ++i) {
							groups[i] = result.group(i + 1);
						}

						return groups;
					}
				}
			}
		} catch (Exception var7) {
			return null;
		}
	}

	public static boolean matches(String regexp, String source) {
		if (regexp != null && !regexp.equals("") && !regexp.equals("*")) {
			try {
				Pattern pattern = (Pattern)patterns.get(regexp);
				if (pattern == null) {
					pattern = compiler.compile(regexp);
					patterns.put(regexp, pattern);
				}

				return matcher.matches(source, pattern);
			} catch (Exception var3) {
				return false;
			}
		} else {
			return true;
		}
	}

	public static String[] findVariables(String source) {
		Perl5Util p = new Perl5Util();
		PatternMatcherInput mi = new PatternMatcherInput(source);
		ArrayList rs = new ArrayList();

		while(p.match("/#\\{[_a-z0-9A-Z]+\\}/", mi)) {
			MatchResult ms = p.getMatch();
			String res = ms.toString();
			rs.add(res.substring(2, res.length() - 1));
		}

		return (String[])rs.toArray(new String[rs.size()]);
	}

	public static void main(String[] args) throws Exception {
		String address = "向阳2-1-3";
		//int pos = true;

		for(int k = 0; k < address.length(); ++k) {
			if (Character.isDigit(address.charAt(k))) {
				break;
			}
		}

		String g1 = address.substring(0, 2);
		String g2 = address.substring(2);
		System.out.println("g1=" + g1);
		System.out.println("g2=" + g2);
	}

}
