package com.lotut.pms.web.util;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class DataTypeConversion {
	public static int changeDoubleToInt(double d) {

        DecimalFormat dfi = new DecimalFormat("#");

        RoundingMode roundingMode = RoundingMode.UP;

        dfi.setRoundingMode(roundingMode);

        int parseInt = Integer.parseInt(dfi.format(d));

        return parseInt;
    }
	
	public static void main(String[] args) {
		double d = 1.35;
		int i=changeDoubleToInt(d);
		System.out.println(i);
	}
}
