package com.lotut.pms.web.util.weixin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.util.SortedMap;
import java.util.TreeMap;

public class HttpUtil {
	private final static int CONNECT_TIMEOUT = 5000;
	private final static String DEFAULT_ENCODING = "UTF-8";
	
	
	
	public static String excutePostRequest(String requestUrl, String data){  
        return excutePostRequest(requestUrl, data, null);  
    }
	
	public static String excutePostRequest(String requestUrl, String data,String contentType){ 
		 BufferedReader in =null;
        try{
        	URL url = new URL(requestUrl);
        	URLConnection conn = url.openConnection();
        	conn.setDoOutput(true);
        	 conn.setConnectTimeout(CONNECT_TIMEOUT);  
            conn.setReadTimeout(CONNECT_TIMEOUT);  
            if(contentType != null){
            	conn.setRequestProperty("content-type", contentType);  
            }

            
            BufferedWriter out =new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(),DEFAULT_ENCODING));
            if(data == null){
            	data = "";  	
            }
            out.write(data);   
            out.flush();  
            out.close();
            
            in = new BufferedReader(new InputStreamReader(conn.getInputStream(), DEFAULT_ENCODING));
            StringBuilder sb = new StringBuilder();
            String line = null;  
            while ((line = in.readLine()) != null) {  
                sb.append(line);  
                sb.append("\r\n");  
            } 
            
            in.close();
            return sb.toString();  
        }catch(IOException e){
        	e.printStackTrace();
        }finally{
        	if(in!=null){
        		try {
					in.close();
				} catch (IOException e) {
				}
        	}
        }
		
		return null;  
    }
	public static void main(String[] args) {

	}
}
