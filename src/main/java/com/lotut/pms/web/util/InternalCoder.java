package com.lotut.pms.web.util;

import java.util.Calendar;

public class InternalCoder {
	public String generateInternalCode(long docId) {
		return Calendar.getInstance().get(Calendar.YEAR) + String.format("%08d", docId);
	}
	public static void main(String[] args) {
		long id = 24;
		System.out.println(Calendar.getInstance().get(Calendar.YEAR) + String.format("%08d", id));
	}
}
