package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alipay.config.AlipayConfig;
import com.alipay.util.AlipayNotify;
import com.alipay.util.AlipaySubmit;
import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.PatentDocOrder;
import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.service.FeeService;
import com.lotut.pms.service.OrderService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/patentDocAlipay")
public class PatentDocAlipayController {
	private PatentDocWorkflowService patentDocWorkflowService;
	private PatentDocWorkflowHistoryService patentDocWorkflowHistoryService;
	private static int NEED_PAY_STATUS = 0;
	
	@Autowired
	public PatentDocAlipayController(PatentDocWorkflowService patentDocWorkflowService) {
		this.patentDocWorkflowService = patentDocWorkflowService;
	}
	
	@RequestMapping(path="/index")
	public String index(@RequestParam("orderId")long orderId, Model model) {
		PatentDocOrder order = patentDocWorkflowService.getOrderById(orderId);
		model.addAttribute("order", order);
		
		return "alipay_index";
	}
	
	@RequestMapping(path="/pay")
	public void pay(@RequestParam("orderId")long orderId, Model model, HttpServletResponse response) throws IOException {
		PatentDocOrder order = patentDocWorkflowService.getOrderById(orderId);
		String out_trade_no = String.valueOf(order.getId());
		String subject = "专利官费及服务费";
		String total_fee = String.valueOf(order.getAmount());
		String body = "专利官费及服务费";
		
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("service", AlipayConfig.service);
        paramMap.put("partner", AlipayConfig.partner);
        paramMap.put("seller_id", AlipayConfig.seller_id);
        paramMap.put("_input_charset", AlipayConfig.input_charset);
		paramMap.put("payment_type", AlipayConfig.payment_type);
		paramMap.put("notify_url", AlipayConfig.patent_doc_notify_url);
		paramMap.put("return_url", AlipayConfig.patent_doc_return_url);
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
		final int ORDER_STATUS_PAID = 1;
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
				PatentDocOrder order = patentDocWorkflowService.getOrderById(orderId);
				if (order.getOrderStatus() == NEED_PAY_STATUS) {
					patentDocWorkflowService.processOrderPaidSuccess(orderId);
				}
				out.println("success");
			}
		} else {
			out.println("fail");
		}
		
		out.flush();
		out.close();
	}
		
	@RequestMapping(path="/return")
	public String returnPayResult(@Param("patentDocIds")Long[] patentDocIds,HttpServletRequest request, HttpServletResponse response, Model model) {
		
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
				long orderId =Long.parseLong(orderIdStr);
				
				patentDocWorkflowService.processOrderPaidSuccess(orderId);
		
				
				return "pay_success";
			}
		} else {
			return "pay_failure";
		}
		
		return "pay_failure";
	}
		
}
