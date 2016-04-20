package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipaySubmit;
import com.lotut.pms.domain.Order;
import com.lotut.pms.service.OrderService;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/alipay")
public class AlipayController {
	private OrderService orderService;
	
	@Autowired
	public AlipayController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@RequestMapping(path="/index")
	public String index(@RequestParam("orderId")long orderId, Model model) {
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("order", order);
		
		return "alipay_index";
	}
	
	@RequestMapping(path="/pay")
	public void pay(@RequestParam("orderId")long orderId, Model model, HttpServletResponse response) throws IOException {
		Order order = orderService.getOrderById(orderId);
		String out_trade_no = String.valueOf(order.getId());
		String subject = "专利费用";
		String total_fee = "0.01";
		String body = "专利费用描述";
		
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("service", AlipayConfig.service);
        paramMap.put("partner", AlipayConfig.partner);
        paramMap.put("seller_id", AlipayConfig.seller_id);
        paramMap.put("_input_charset", AlipayConfig.input_charset);
		paramMap.put("payment_type", AlipayConfig.payment_type);
		paramMap.put("notify_url", AlipayConfig.notify_url);
		paramMap.put("return_url", AlipayConfig.return_url);
		paramMap.put("anti_phishing_key", AlipayConfig.anti_phishing_key);
		paramMap.put("exter_invoke_ip", AlipayConfig.exter_invoke_ip);
		paramMap.put("out_trade_no", out_trade_no);
		paramMap.put("subject", subject);
		paramMap.put("total_fee", total_fee);
		paramMap.put("body", body);
		
		String sHtmlText = AlipaySubmit.buildRequest(paramMap,"get","确认");
		response.setContentType("text/html");
		try (PrintWriter out = response.getWriter();) {
			out.write("<!DOCTYPE html>\n");
			out.write("<html>\n");
			out.write("<head>\n");
			out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
			out.write("<title>支付宝即时到账交易接口</title>\n");
			out.write("</head>\n");
			out.write("<body>\n");
			out.write(sHtmlText);
			out.write("</body>\n");
			out.write("</html>\n");
			out.flush();
		}
	}	
	
	@RequestMapping(path="/notify")
	public void procesNotify(Model model) {
		
	}	
	
	@RequestMapping(path="/return")
	public void returnPayResult(Model model) {
		
	}		
}
