package com.lotut.pms.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class SearchFieldUtils {
	private static Pattern appNoPattern = Pattern.compile("^\\d{12}\\.?[\\d|X]$", Pattern.CASE_INSENSITIVE);
	private static Pattern publishNoPattern = Pattern.compile("^CN\\d{5}.*", Pattern.CASE_INSENSITIVE);
	private static Pattern datePattern = Pattern.compile("^\\d{4}[-/.]?\\d{2}[-/.]?\\d{2}$", Pattern.CASE_INSENSITIVE);
	private static int APPNO_NO_DOT_LENGTH = 13;
	
	public static boolean isAppNo(String str) {
		return isExactMatch(appNoPattern, str);
	}
	
	public static boolean isPublishNo(String str) {
		return isExactMatch(publishNoPattern, str);
	}
	
	public static boolean isDate(String str) {
		return isExactMatch(datePattern, str);
	}
	
	private static boolean isExactMatch(Pattern pattern, String str) {
		if (pattern.matcher(str).matches()) {
			return true;
		}
		
		return false;
	}
	
	public static String getAppNo(String str) {
		if (str.length() == APPNO_NO_DOT_LENGTH) {
			return str.substring(0, 12) + "." + str.substring(12).toUpperCase();
		} 
		
		return str.toUpperCase();
	}
	
	public static String getPublishNo(String str) {
		return str.toUpperCase();
	}
	
	public static Date getDate(String str) {
		String dateStr = str.replaceAll("[./]", "-");
		if (!dateStr.contains("-")) {
			dateStr = dateStr.substring(0, 4) + "-" + dateStr.substring(4, 6) + "-" + dateStr.substring(6);
		}
		DateFormat df = new SimpleDateFormat("yy-MM-dd");
		try {
			return df.parse(dateStr);
		} catch (ParseException e) {
			throw new RuntimeException("Bad date format");
		}
	}
	
	public static void main(String[] args) {
		String str = "CN201482771U";
		System.out.println(isPublishNo(str));
	}
}
