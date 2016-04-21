package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.lotut.pms.domain.Order;
import com.lotut.pms.service.FeeService;
import com.lotut.pms.service.OrderService;

@Controller
@RequestMapping(path="/alipay")
public class AlipayController {
	private OrderService orderService;
	private FeeService feeService;
	
	@Autowired
	public AlipayController(OrderService orderService, FeeService feeService) {
		this.orderService = orderService;
		this.feeService = feeService;
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
			out.write(sHtmlText);
			out.flush();
		}
	}	
	
	@RequestMapping(path="/notify")
	public void procesNotify(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		final int ORDER_STATUS_PAID = 2;
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			
			params.put(name, valueStr);
		}

		String orderIdStr = request.getParameter("out_trade_no");
		String trade_no = request.getParameter("trade_no");
		String trade_status = request.getParameter("trade_status");
				
		boolean verify_result = AlipayNotify.verify(params);
		PrintWriter out = response.getWriter();
		
		if (verify_result) {
			boolean success = trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS");
			if(success){
				long orderId = Long.parseLong(orderIdStr);
				Order order = orderService.getOrderById(orderId);
				if (order.getOrderStatus().getStatusId() == ORDER_STATUS_PAID) {
					out.println("success");
					return;
				}
				orderService.processOrderPaidSuccess(orderId);
				out.println("success");
			}
		} else {
			out.println("fail");
		}
		
		out.flush();
		out.close();
	}
		
	@RequestMapping(path="/return")
	public String returnPayResult(HttpServletRequest request, HttpServletResponse response, Model model) {
		Map<String,String> params = new HashMap<String,String>();
		Map requestParams = request.getParameterMap();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			
			params.put(name, valueStr);
		}

		String orderIdStr = request.getParameter("out_trade_no");
		String trade_status = request.getParameter("trade_status");
				
		boolean verify_result = AlipayNotify.verify(params);
		
		if (verify_result) {
			boolean success = trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS");
			if(success){
				long orderId = Long.parseLong(orderIdStr);
				orderService.processOrderPaidSuccess(orderId);
				return "pay_success";
			}
		} else {
			return "pay_failure";
		}
		
		return "pay_failure";
	}
		
}
