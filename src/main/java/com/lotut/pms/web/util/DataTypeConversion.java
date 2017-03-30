package com.lotut.pms.web.util;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class DataTypeConversion {
	public  int changeDoubleToInt(double d) {

        DecimalFormat dfi = new DecimalFormat("#");

        RoundingMode roundingMode = RoundingMode.UP;

        dfi.setRoundingMode(roundingMode);

        int parseInt = Integer.parseInt(dfi.format(d));

        return parseInt;
    }
	
	/*public static void main(String[] args) {
		int i=changeDoubleToInt(0.09);
		System.out.println(i);
	}*/
}
