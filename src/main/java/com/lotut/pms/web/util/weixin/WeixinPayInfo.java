package com.lotut.pms.web.util.weixin;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import com.lotut.pms.web.util.weixin.md5.MD5;
import com.lotut.pms.web.util.weixin.md5.WeixinXmlParse;


public abstract class WeixinPayInfo {
	
	public static final String APP_ID = "wx0171fe30df64f653";
	public static final String  APP_SECRET= "d98935d6a5311e11db60cefa2a91cbf0";
	public static final String  MERCHANT_ID= "1271722401";
	public static final String  APP_KEY= "d98935d6a5311e11db60cefa2a91cbf0";
	public static final String  INTERFACE_URL= "https://api.mch.weixin.qq.com/pay/unifiedorder";
	public static final String SPBILL_CREATE_IP = "127.0.0.1";
	public static final String TRADE_TYPE = "NATIVE";
	public static final String NOTIFY_URL = "http://g.lotut.com/weinxinPay/notify.html";
	public static final String BODY = "专利官费";
	public static final String ATTACH = "合肥智慧龙图腾公司专利官费";
	
	private static final String ALPHANUMERIC ="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	
	
	public static String createSign(Map<Object, Object> weixinMap){
		StringBuffer signStr = new StringBuffer();
		String sign =null;
		Iterator<Map.Entry<Object, Object>> entrys = weixinMap.entrySet().iterator();
		
		while(entrys.hasNext()){
			Map.Entry<Object, Object> entry = entrys.next();
			String  weixinPayKey = (String) entry.getKey();
			String  weixinPayValue = (String) entry.getValue();
			//旧的签名算法
			if(!"".equals(weixinPayKey)){
				signStr.append(weixinPayKey +"=" + weixinPayValue + "&" );
			}

		}
		signStr.append("key=" + APP_KEY);
		
		System.out.println("未加密的签名:" + signStr);
		try{
			sign = MD5.encode(signStr.toString(),"utf-8").toUpperCase();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("加密签名：" + sign);
		return sign;
	}
	
	public static String createRandomStr(int randomLength){
		StringBuffer randomStr = new StringBuffer();
		for(int i = 0; i < randomLength; i++){
			Random random = new Random();
			int index = random.nextInt(ALPHANUMERIC.length());
			randomStr.append(ALPHANUMERIC.charAt(index));
		}
		return randomStr.toString();
		
		
	}
	
	public static String getRequestXml(Map<Object, Object> parameters) {
		 StringBuffer xmlStr = new StringBuffer(); 
		 
		 xmlStr.append("<xml>");

		 Iterator<Map.Entry<Object, Object>> entrys = parameters.entrySet().iterator();
		 while(entrys.hasNext()){
			 Map.Entry<Object, Object> entry = entrys.next();
			 
			 String parameterKey = (String)entry.getKey();
			 String parameterValue = (String)entry.getValue();
			 //CDATA标签用于说明数据不被XML解析器解析。
			 if ("attach".equalsIgnoreCase(parameterKey) || "body".equalsIgnoreCase(parameterKey) || "sign".equalsIgnoreCase(parameterKey)) {  
				 xmlStr.append("<" + parameterKey + ">" + "<![CDATA[" + parameterValue + "]]></" + parameterKey + ">");  
             } else {  
            	 xmlStr.append("<" + parameterKey+ ">" +parameterValue + "</" + parameterKey+ ">");
             }
			 //xmlStr.append("<" + parameterKey+ ">" +parameterValue + "</" + parameterKey+ ">");
		 }
		 
		 xmlStr.append("</xml>");
		
		 return xmlStr.toString();
	}
	
	public static String getIpAddress(HttpServletRequest request) {  
        String ip = request.getHeader("x-forwarded-for");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
        return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;  
    }
	
	public static boolean isTrueSign(Map<Object,Object> map) throws Exception{
		StringBuffer mapStr =new StringBuffer();
		Iterator<Map.Entry<Object, Object>> entrys = map.entrySet().iterator();
		while(entrys.hasNext()){
			Map.Entry<Object, Object> entry = entrys.next();
			String key = (String)entry.getKey();
			String value = (String)entry.getValue();
			 
			 if(!"sign".equals(key) && null != value && !"".equals(value)){
				 mapStr.append(key + "=" + value +"&");
			 }
			
		}
		mapStr.append("key=" + APP_KEY); 
		
		//System.out.println("微信返回xml解析参数字符串：" + mapStr.toString());
		String sign = MD5.encode(mapStr.toString(), "utf-8").toLowerCase();
		System.out.println("微信返回加密签名：" + sign);
		
		System.out.println("签名验证结果：" + ((String)map.get("sign")).equals(sign));
		return ((String)map.get("sign")).equals(sign);
		
	}
	
	
	
	public static Map<Object,Object> testweixinNotify(String xml ){
		BufferedReader in = null ;
		Map<Object,Object> responseParamterMap =null;
		StringBuffer paiedXml = new StringBuffer();
		try{
			ByteArrayInputStream byteIn =new ByteArrayInputStream(xml.getBytes("utf-8"));
			in = new BufferedReader(new InputStreamReader(byteIn, "utf-8"));
			int r;
			while((r = in.read()) != -1){
				paiedXml.append((char)r);
			}
			
			responseParamterMap = WeixinXmlParse.xmlParse(paiedXml.toString());
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(in != null){
				try {
					in.close();
				} catch (IOException e) {
				}
			}
		}
		return responseParamterMap;
	}
}

