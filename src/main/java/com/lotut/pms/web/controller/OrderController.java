package com.lotut.pms.web.controller;

import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
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
	public String createOrder(@RequestParam("feeIds")Long[] feeIds, @ModelAttribute @Valid Order order, Model model) {
		final int ALIPAY = 1;
		User user = PrincipalUtils.getCurrentPrincipal();
		order.setOwner(user);
		
		List<Fee> fees = feeService.getFeesByIds(Arrays.asList(feeIds));
		orderService.createOrder(order, fees);
		
		model.addAttribute("orderId", order.getId());
		
		if (order.getPaymentMethod().getPaymentMethodId() == ALIPAY) {
			return "redirect:/alipay/index.html";
		}
		
		// FIXME change success page
		return "upload_success";
	}
	
	@RequestMapping(path="/list")
	public String getUserOrders(Model model,Page page) {
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		
		if (PrincipalUtils.isOrderProcessor()) {
			int totalCount=(int)orderService.getAllUnCacelledOrderCount();
			page.setTotalRecords(totalCount);
			List<Order> orders = orderService.getAllUnCacelledOrders(page);
			model.addAttribute("orders", orders);
			model.addAttribute("page",page);
			return "all_order_list";
		} else {
			int totalCount=(int)orderService.getUserOrdersCount(userId);
			page.setTotalRecords(totalCount);
			List<Order> orders = orderService.getUserOrders(page);
			model.addAttribute("orders", orders);
			model.addAttribute("page",page);
			return "order_list";
		}
	}
	
	@RequestMapping(path="/delete", method=RequestMethod.GET)
	public String deleteUserOrders(@RequestParam("orderId")long orderId,Model model,Page page){
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		orderService.deleteUserOrders(orderId);
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		int totalCount=(int)orderService.getUserOrdersCount(userId);
		page.setTotalRecords(totalCount);
		List<Order> orders = orderService.getUserOrders(page);
		model.addAttribute("orders", orders);
		model.addAttribute("page",page);
		return "order_list";
	}
}
