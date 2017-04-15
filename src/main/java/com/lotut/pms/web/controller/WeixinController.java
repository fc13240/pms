package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.Order;
import com.lotut.pms.service.OrderService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;
import com.lotut.pms.web.util.weixin.HttpUtil;
import com.lotut.pms.web.util.weixin.QRCodeUtil;
import com.lotut.pms.web.util.weixin.WeixinPayInfo;
import com.lotut.pms.web.util.weixin.md5.WeixinXmlParse;

@Controller
@RequestMapping(path="/weixinPay")
public class WeixinController {
	private OrderService orderService;
	
	@Autowired
	public WeixinController(OrderService orderService){
		this.orderService = orderService;
	}
	
	
	public String payCodeUrl(){
		return null;
	}
	
	@RequestMapping(path="/pay")
	public String pay(@RequestParam(name="orderId") long orderId,Model model) throws Exception{
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("order",order);
		return "weixin_advance payment";
	}
	
	
	
	@RequestMapping(path="/testpay")
	public String testpay(HttpServletResponse response,HttpServletRequest request,Model model) throws Exception{
		//Order order = orderService.getOrderById(orderId);
		Order order  = new Order();
		order.setAmount(120);
		order.setId(Long.valueOf("123456789"));
		model.addAttribute("order", order);
		return "weixin_advance_payment";
	}
	
	
	@RequestMapping(path="/payImage")
	public void getPayImage(@RequestParam long orderId,HttpServletResponse response,HttpServletRequest request){
		Order order = orderService.getOrderById(orderId);
		
		try{

			SortedMap<Object, Object> paramtersMap = new TreeMap<>();
			String appId = WeixinPayInfo.APP_ID;
			String mchId = WeixinPayInfo.MERCHANT_ID;
			String body = WeixinPayInfo.BODY;
			String payMachineId =  WeixinPayInfo.getIpAddress(request);
			String tradeType =  WeixinPayInfo.TRADE_TYPE;
			String notifyUrl =  WeixinPayInfo.NOTIFY_URL;
			String tradeNo = String.valueOf(orderId);
			String totalFee = String.valueOf(order.getAmount()*100);
			//String totalFee = "100";
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
			
			String xmlStr = WeixinPayInfo.getRequestXml(paramtersMap);
			
			String responseXml = HttpUtil.excutePostRequest(WeixinPayInfo.INTERFACE_URL, xmlStr);
			Map<Object, Object> resultMap = WeixinXmlParse.xmlParse(responseXml);
			
			String codeUrl = (String)resultMap.get("code_url");
			System.out.println( "生成的付款地址：" + codeUrl);
			String filname = PrincipalUtils.getCurrentUserId()+"_" + System.currentTimeMillis();
			
			String os = System.getProperty("os.name").trim();
			String logoPath = null;
			String qcImgPathDir = null;
			if(os.toLowerCase().indexOf("windows") > -1){
				System.out.println("---------------调试平台为windows平台-----------");
				logoPath = "F:\\logo\\logo_long.png";
				qcImgPathDir = "F:\\logo\\";
				
				
			}else{
				logoPath = "";
				qcImgPathDir = "";
			}
				
			
			
			String imagePath = QRCodeUtil.encode(codeUrl, logoPath, qcImgPathDir, filname, true);
			
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(imagePath));
			
			response.setContentType("image/jpeg");
			
			WebUtils.writeStreamToResponse(response, in);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/notify")
	public void weixinNotify(HttpServletRequest request,HttpServletResponse response){
		BufferedReader in ;
		
		try{
			in = new BufferedReader(new InputStreamReader(request.getInputStream(), "utf-8"));
			StringBuffer paiedXml = new StringBuffer();
			
			final char[] buffer_size = new char[8*1024];
			int r;
			while((r = in.read(buffer_size)) != -1){
				paiedXml.append((char)r);
			}
			
			in.close();
			
			Map<Object,Object> responseParamterMap = WeixinXmlParse.xmlParse(paiedXml.toString());
			
			boolean resultverifySign =  WeixinPayInfo.isTrueSign(responseParamterMap);
			
			if(resultverifySign){
				String responseXml = null;
				if("SUCCESS".equals((String)responseParamterMap.get("result_code"))){
					long orderId = Long.valueOf(((String)responseParamterMap.get("out_trade_no")).trim());
					Order order = orderService.getOrderById(orderId);
					int userPayfee = Integer.valueOf((String)responseParamterMap.get("total_fee"));
					int orderFee = order.getAmount()*100;
					
					if(userPayfee == orderFee){
						orderService.processOrderPaidSuccess(orderId);
						responseXml = "<xml>" + 
											"<return_code><![CDATA[SUCCESS]]></return_code>"+   
											"<return_msg><![CDATA[OK]]></return_msg>" + 
									   "</xml> ";
					}else{
						responseXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"  
		                        + "<return_msg><![CDATA[订单金额与支付金额不一致]]></return_msg>" + "</xml> ";
					}
				}else{
					responseXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"  
	                        + "<return_msg><![CDATA[返回结果为false]]></return_msg>" + "</xml> ";  
				}
				
				BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
		        out.write(responseXml.getBytes("utf-8"));  
		        out.flush();  
		        out.close();
				
			}else{
				throw new Exception("签名验证错误！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	public static String testweixinNotify(){
		BufferedReader in = null ;
		StringBuffer paiedXml = new StringBuffer();
		String xml =
				"<xml>"+
				  "<appid><![CDATA[wx2421b1c4370ec43b]]></appid>"+
				  "<attach><![CDATA[支付测试]]></attach>"+
				  "<bank_type><![CDATA[CFT]]></bank_type>"+
				  "<fee_type><![CDATA[CNY]]></fee_type>"+
				  "<is_subscribe><![CDATA[Y]]></is_subscribe>"+
				  "<mch_id><![CDATA[10000100]]></mch_id>"+
				  "<nonce_str><![CDATA[5d2b6c2a8db53831f7eda20af46e531c]]></nonce_str>"+
				  "<openid><![CDATA[oUpF8uMEb4qRXf22hE3X68TekukE]]></openid>"+
				  "<out_trade_no><![CDATA[1409811653]]></out_trade_no>"+
				  "<result_code><![CDATA[SUCCESS]]></result_code>"+
				  "<return_code><![CDATA[SUCCESS]]></return_code>"+
				  "<sign><![CDATA[B552ED6B279343CB493C5DD0D78AB241]]></sign>"+
				  "<sub_mch_id><![CDATA[10000100]]></sub_mch_id>"+
				  "<time_end><![CDATA[20140903131540]]></time_end>"+
				  "<total_fee>1</total_fee>"+
				  "<trade_type><![CDATA[JSAPI]]></trade_type>"+
				  "<transaction_id><![CDATA[1004400740201409030005092168]]></transaction_id>"+
				"</xml>";
		
		
		try{
			ByteArrayInputStream byteIn =new ByteArrayInputStream(xml.getBytes("utf-8"));
			in = new BufferedReader(new InputStreamReader(byteIn, "utf-8"));
			int r;
			while((r = in.read()) != -1){
				paiedXml.append((char)r);
			}
			
			
			Map<Object,Object> responseParamterMap = WeixinXmlParse.xmlParse(paiedXml.toString());
			
			boolean resultverifySign =  WeixinPayInfo.isTrueSign(responseParamterMap);
			
			
			if(resultverifySign){
				
			}
			
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
		return paiedXml.toString();
	}
	
	public static void main(String[] args) throws Exception {
		//String xml = testweixinNotify();
		String os = System.getProperty("os.name").trim();
		String logoPath = null;
		String qcImgPathDir = null;
		if(os.toLowerCase().indexOf("windows") > -1){
			System.out.println("---------------调试平台为windows平台-----------");
			logoPath = "F:\\logo\\logo_long.png";
			qcImgPathDir = "F:\\logo\\";
			
			
		}else{
			logoPath = "";
			qcImgPathDir = "";
		}
		String filname = "1";
		
		String imagePath = QRCodeUtil.encode("www.baidu.com", logoPath, qcImgPathDir, filname, true);
	}
}
