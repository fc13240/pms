package com.lotut.pms.web.util.weixin;

import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import com.lotut.pms.web.util.weixin.md5.MD5;

public class TestWeixin {
	
}
class TestMD5{
	private static String oringanlSign(){
		SortedMap<Object, Object> paramtersMap = new TreeMap<>();
		String appId = WeixinPayInfo.APP_ID;
		String appSecret = WeixinPayInfo.APP_SECRET;
		String mchId = WeixinPayInfo.MERCHANT_ID;
		String appKey = WeixinPayInfo.APP_KEY;
		String body = WeixinPayInfo.BODY;
		String payMachineId =  WeixinPayInfo.SPBILL_CREATE_IP;
		String tradeType =  WeixinPayInfo.TRADE_TYPE;
		String notifyUrl =  WeixinPayInfo.NOTIFY_URL;
		String tradeNo = "1234567889";
		//String totalFee = String.valueOf(order.getAmount()*100);
		String totalFee = "100";
		String nonceStr = WeixinPayInfo.createRandomStr(30);
		String attach = WeixinPayInfo.ATTACH;
		
		paramtersMap.put("appid",appId );
		paramtersMap.put("body", body);
		paramtersMap.put("mch_id", mchId);
		paramtersMap.put("nonce_str", nonceStr);
		paramtersMap.put("notify_url", notifyUrl);
		paramtersMap.put("out_trade_no", tradeNo);
		paramtersMap.put("spbill_create_ip", payMachineId);
		paramtersMap.put("total_fee",totalFee );
		paramtersMap.put("trade_type", tradeType);
		paramtersMap.put("attach", attach);
		
		
		StringBuffer signStr = new StringBuffer();
		String sign =null;
		Iterator<Map.Entry<Object, Object>> entrys = paramtersMap.entrySet().iterator();
		
		while(entrys.hasNext()){
			Map.Entry<Object, Object> entry = entrys.next();
			String  weixinPayKey = (String) entry.getKey();
			String  weixinPayValue = (String) entry.getValue();
			if(!"".equals(weixinPayKey)){
				signStr.append(weixinPayKey +"=" + weixinPayValue + "&" );
			}
		}
		signStr.append("key=" + "d98935d6a5311e11db60cefa2a91cbf0");	
		return signStr.toString();
		
	}
	
	
	
	public static void main(String[] args) throws Exception {
		System.out.println("0123456789abcdef".length());
		String noencodeSign =  oringanlSign();
		System.out.println(noencodeSign.length());
		System.out.println(MD5.encode(noencodeSign,"utf-8"));

	}
}

class TestWexinResponseXML{
	 public static void main(String[] args) throws Exception {  
	    	SortedMap<Object, Object> paramtersMap = new TreeMap<>();
			String appId = WeixinPayInfo.APP_ID;
			String appSecret = WeixinPayInfo.APP_SECRET;
			String mchId = WeixinPayInfo.MERCHANT_ID;
			String appKey = WeixinPayInfo.APP_KEY;
			String body = WeixinPayInfo.BODY;
			String payMachineId =  WeixinPayInfo.SPBILL_CREATE_IP;
			String tradeType =  WeixinPayInfo.TRADE_TYPE;
			String notifyUrl =  WeixinPayInfo.NOTIFY_URL;
			String tradeNo = "123456";
			//String totalFee = String.valueOf(order.getAmount()*100);
			String totalFee = "100";
			String nonceStr = WeixinPayInfo.createRandomStr(30);
			String attach = WeixinPayInfo.ATTACH;
			
			paramtersMap.put("appid",appId );
			paramtersMap.put("body", body);
			paramtersMap.put("mch_id", mchId);
			paramtersMap.put("nonce_str", nonceStr);
			paramtersMap.put("notify_url", notifyUrl);
			paramtersMap.put("out_trade_no", tradeNo);
			paramtersMap.put("spbill_create_ip", payMachineId);
			paramtersMap.put("total_fee",totalFee );
			paramtersMap.put("trade_type", tradeType);
			paramtersMap.put("attach", attach);
			String sign = WeixinPayInfo.createSign(paramtersMap);
			paramtersMap.put("sign", sign);
			
			System.out.println("sign :");
			System.out.println(sign);
			String xmlStr = WeixinPayInfo.getRequestXml(paramtersMap);
			
			//System.out.println("xml:");
			//System.out.println(xmlStr);
			
			String responseXml = HttpUtil.excutePostRequest(WeixinPayInfo.INTERFACE_URL, xmlStr);
			
			System.out.println("返回xml");
			System.out.println(responseXml);
			/*Map<Object, Object> resultMap = WeixinXmlParse.xmlParse(responseXml);
			
			String codeUrl = (String)resultMap.get("code_url");
			
			
			String imagePath = QRCodeUtil.encode(codeUrl, "D:\\ceshi\\QR\\logo_long.png", "D:\\ceshi\\QR", "1", true);*/
	    } 
}
class testIsTrueSign{
	public static void main(String[] args) throws Exception {
		String returnXml = 
			"<xml>"+
			  "<appid><![CDATA[wx0171fe30df64f653]]></appid>"+
			  "<attach><![CDATA[合肥智慧龙图腾公司专利官费]]></attach>"+
			  "<bank_type><![CDATA[CFT]]></bank_type>"+
			  "<fee_type><![CDATA[CNY]]></fee_type>"+
			  "<is_subscribe><![CDATA[Y]]></is_subscribe>"+
			  "<mch_id><![CDATA[1271722401]]></mch_id>"+
			  "<nonce_str><![CDATA[RVy5FhEbPTBxbTfAoZjU0Y7TI9dOI2]]></nonce_str>"+
			  "<openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>"+
			  "<out_trade_no><![CDATA[123456]]></out_trade_no>"+
			  "<result_code><![CDATA[SUCCESS]]></result_code>"+
			  "<return_code><![CDATA[SUCCESS]]></return_code>"+
			  "<sign><![CDATA[572EA7FB2D49AF91CEE49A5C102EE443]]></sign>"+
			  "<sub_mch_id><![CDATA[1271722401]]></sub_mch_id>"+
			  "<time_end><![CDATA[20140903131540]]></time_end>"+
			  "<total_fee>100</total_fee>"+
			  "<trade_type><![CDATA[NATIVE]]></trade_type>"+
			  "<transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id>"+
			"</xml>";
		
		System.out.println(WeixinPayInfo.isTrueSign(WeixinPayInfo.testweixinNotify(returnXml)));
	}
}
