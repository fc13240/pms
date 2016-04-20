package com.lotut.pms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.Order;
import com.lotut.pms.service.OrderService;

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
	public void pay(@RequestParam("orderId")long orderId, Model model) {
		Order order = orderService.getOrderById(orderId);
		model.addAttribute("order", order);
		
	}	
}
