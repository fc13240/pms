package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.service.FeeService;
import com.lotut.pms.service.OrderService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/order")
public class OrderController {
	private UserService userService;
	private FeeService feeService;
	private OrderService orderService;
	
	@Autowired
	public OrderController(UserService userService, FeeService feeService, OrderService orderService) {
		this.userService = userService;
		this.feeService = feeService;
		this.orderService = orderService;
	}
	
	@RequestMapping(path="/orderCreateForm")
	public String showOrderCreateForm(@RequestParam("fees")List<Long> feeIds, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		List<Fee> fees = feeService.getFeesByIds(feeIds);
		
		model.addAttribute("contactAddresses", contactAddresses);
		model.addAttribute("fees", fees);
		
		return "order_create_form";
	}
	
	@RequestMapping(path="/createOrder")
	public String createOrder(@RequestParam("fees")List<Long> feeIds, Order order, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		order.setUser(userId);
		
		List<Fee> fees = feeService.getFeesByIds(feeIds);
		orderService.createOrder(order, fees);
		
		// FIXME change success page
		return "upload_success";
	}
}
