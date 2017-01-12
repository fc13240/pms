package com.lotut.pms.util;

import java.util.regex.Pattern;

public class IdCardUtils {
	private static Pattern idCardNoPattern = Pattern.compile("^\\d{15}$|^\\d{17}([0-9]|X)$", Pattern.CASE_INSENSITIVE);
	public static boolean isIdCard(String str) {
		return isExactMatch(idCardNoPattern, str);
	}
	
	
	private static boolean isExactMatch(Pattern pattern, String str) {
		if (pattern.matcher(str).matches()) {
			return true;
		}
		return false;
	}
	
	public static void main(String[] args) {
		String str = "32441414414141";
		System.out.println(str.length());
		System.out.println(isIdCard(str));
	}
}
