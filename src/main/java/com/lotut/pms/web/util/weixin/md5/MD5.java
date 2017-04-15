package com.lotut.pms.web.util.weixin.md5;

import java.security.MessageDigest;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import com.lotut.pms.web.util.weixin.WeixinPayInfo;

public class MD5 {
	private static final String NUMBER_LETTER_CHAR ="0123456789abcdef";
	public static String encode(String originalString,String charsetName) throws Exception{
		String encode = null;
		
		try{
			MessageDigest md5 = MessageDigest.getInstance("md5"); 
			byte[] digest = null;
			if(charsetName == ""||charsetName == null){
				digest = md5.digest(originalString.getBytes());
				
			}else{
				digest = md5.digest(originalString.getBytes(charsetName));
			}
			
			encode = byteArrayToHexString(digest);
		}catch(Exception e){
			e.printStackTrace();
		}
		if(encode == null || "".equals(encode)){
			throw new Exception("md5 encod exception");
		}
		System.out.println("sign:" +encode);
		return encode;
	}
	
	public static String encode(String originalString) throws Exception{
		return encode(originalString,null);
	}
	
	public static String byteArrayToHexString(byte[] byteArrays){
		//System.out.println( "byteArrays length : " +byteArrays.length);
		StringBuffer hexString = new StringBuffer();
		for(byte b:byteArrays){
			hexString.append(byteToHexString(b));
		}
		
		return hexString.toString();
	}
	public static String byteToHexString(byte b){
		int n = b;  
        if (n < 0)  
            n += 256;  
        int quotient = n / 16;  
        int remainder = n % 16;  
        return String.valueOf(NUMBER_LETTER_CHAR.charAt(quotient)) + String.valueOf(NUMBER_LETTER_CHAR.charAt(remainder));
	}
}
