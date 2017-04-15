package com.lotut.pms.web.util.weixin.md5;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class WeixinXmlParse {
	
	@SuppressWarnings({"rawtypes","unchecked"})
	public static Map<Object,Object> xmlParse(String xmlStr) throws IOException, DocumentException {
		xmlStr =xmlStr.replace("encoding=\".*\"", "encoding=\"UTF-8\"");
		
		if(null == xmlStr || "".equals(xmlStr)) {  
            return null;  
        }
		
		Map<Object,Object> map = new HashMap<>(); 
		
		ByteArrayInputStream in = new ByteArrayInputStream(xmlStr.getBytes("utf-8"));
		SAXReader builder = new SAXReader();
		Document  doc = builder.read(in);
		Element  root = doc.getRootElement();
		List elements = root.elements();
		
		Iterator<Element> entrys = elements.iterator();
		while(entrys.hasNext()){
			Element entry = entrys.next();
			
			String key = entry.getName();
			System.out.println("key = "  +key);
			String value = "";
			if(entry.elements().isEmpty()){
				value = entry.getTextTrim();
				System.out.println("value = "  +value);
			}else{
				value = getChildrenText(entry.elements());  
				System.out.println("value = "  +value);
			}
			map.put(key, value);
		}
		
		in.close();
		return map;
		
	}
	
	 @SuppressWarnings({"rawtypes","unchecked"})
	 public static String getChildrenText(List children) {  
	        StringBuffer sb = new StringBuffer();  
	        if(!children.isEmpty()) {  
				Iterator<Element> it = children.iterator();  
	            while(it.hasNext()) {  
	                Element e = it.next();  
	                String name = e.getName();  
	                String value = e.getTextTrim();  
	                List list = e.elements();  
	                sb.append("<" + name + ">");  
	                if(!list.isEmpty()) {  
	                    sb.append(getChildrenText(list));  
	                }  
	                sb.append(value);  
	                sb.append("</" + name + ">");  
	            }  
	        }  
	          
	        return sb.toString();  
	  }
	 
	 
	 
	 
	 
	 
	public static void main(String[] args) throws IOException, DocumentException {
		String xml = "<xml>" +
					   "<return_code><![CDATA[SUCCESS]]></return_code>" +
					   "<return_msg><![CDATA[OK]]></return_msg>" +
					   "<appid><![CDATA[wx2421b1c4370ec43b]]></appid>" +
					   "<mch_id><![CDATA[10000100]]></mch_id>" +
					   "<nonce_str><![CDATA[IITRi8Iabbblz1Jc]]></nonce_str>" +
					   "<openid><![CDATA[oUpF8uMuAJO_M2pxb1Q9zNjWeS6o]]></openid>" +
					   "<sign><![CDATA[7921E432F65EB8ED0CE9755F0E86D72F]]></sign>" +
					   "<result_code><![CDATA[SUCCESS]]></result_code>" +
					   "<prepay_id><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></prepay_id>" +
					   "<code_url><![CDATA[wx201411101639507cbf6ffd8b0779950874]]></code_url>" +
					   "<trade_type><![CDATA[JSAPI]]></trade_type>" +
					 "</xml>";
		Map<Object, Object> map = xmlParse(xml);
	}
	

}
