package com.lotut.pms.web.util;

public class Test {
	public static String leftPading(String strSrc,String flag,int strSrcLength) {
        String strReturn = "";
        String strtemp = "";
            int curLength = strSrc.trim().length();
        if (strSrc != null && curLength > strSrcLength) {
            strReturn = strSrc.trim().substring(0, strSrcLength);
        } else if (strSrc != null && curLength == strSrcLength) {
            strReturn = strSrc.trim();
        } else {
          
                for (int i = 0; i < (strSrcLength - curLength); i++) {
                    strtemp = strtemp + flag;
                }
            
            strReturn = strtemp +strSrc.trim();                
        }
        return strReturn;        
    } 
	public static void main(String[] args) {
		String s = "abc";
	    int size = 8;
	    String flag="0";
	    String s1=leftPading(s, flag, size);
	    System.out.println(s1);
	}
}
