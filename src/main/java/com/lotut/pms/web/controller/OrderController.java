package com.lotut.pms.web.controller;

import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.AdminOrderSearchCondition;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.OrderSearchCondition;
import com.lotut.pms.domain.OrderStatus;
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
			int totalCount=(int)orderService.getAllNeedProcessOrderCount();
			page.setTotalRecords(totalCount);
			List<Order> orders = orderService.getAllNeedProcessOrders(page);
			model.addAttribute("orders", orders);
			statusDataToModel(model);
			model.addAttribute("page",page);
			statusDataToModel(model);
			return "all_order_list";
		} else {
			int totalCount=(int)orderService.getUserOrdersCount(userId);
			page.setTotalRecords(totalCount);
			List<Order> orders = orderService.getUserOrders(page);
			model.addAttribute("orders", orders);
			statusDataToModel(model);
			model.addAttribute("page",page);
			statusDataToModel(model);
			return "order_list";
		}
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserOrders(@ModelAttribute("searchCondition")OrderSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		//page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Order> resultOrders = orderService.searchUserOrdersByPage(searchCondition);
		int totalCount=(int)orderService.searchUserOrdersCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("orders", resultOrders);
		model.addAttribute("page", page);
		statusDataToModel(model);
		return "order_list";
	}
	
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="orderStatus")
	public String getOrdersByStatus(@RequestParam("orderStatus") int orderStatus, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Order> orders = orderService.getUserOrdersByStatus(userId, orderStatus);
		model.addAttribute("orders", orders);
		statusDataToModel(model);
		return "order_list";
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
	
	private void statusDataToModel(Model model) {
		List<User> allUser=userService.getAllUser();
		model.addAttribute("allUser", allUser);
		List<OrderStatus> allOrderStatus = orderService.getAllOrderStatus();
		model.addAttribute("allOrderStatus", allOrderStatus);
	}
	
	@RequestMapping(path="/detail/{orderId}", method=RequestMethod.GET)
	public String getOrderDetail(@PathVariable long orderId,Model model){
		
		if (PrincipalUtils.isOrderProcessor()) {
			Order order = orderService.getOrderById(orderId);
			List<Map<String, String>> provinces = userService.getAllProvinces();
			model.addAttribute("provinces", provinces);
			model.addAttribute("order", order);
			
			return "order_detail_editable";
		}else{
			Order order = orderService.getOrderById(orderId);
			model.addAttribute("order", order);
			
			return "order_detail";
		}
		
	}
	
	@RequestMapping(path="/updateUserOrderStatus", method=RequestMethod.GET)
	public String updateUserOrderStatus(@RequestParam("orderId")long orderId,Model model,Page page){
			if (page.getCurrentPage() < 1) {
				page.setCurrentPage(1);
			}
				int userId = PrincipalUtils.getCurrentUserId();
				page.setUserId(userId);
			if (PrincipalUtils.isOrderProcessor()) {
				orderService.updateUserOrderStatus(orderId);
				int totalCount=(int)orderService.getAllNeedProcessOrderCount();
				page.setTotalRecords(totalCount);
				List<Order> orders = orderService.getAllNeedProcessOrders(page);
				model.addAttribute("orders", orders);
				model.addAttribute("page",page);
				return "all_order_list";
			}else{
				//增加修改权限提示
				return "";
			}
	}
	
	//增加用户订单快递信息
	@RequestMapping(path="/updateUserOrderContactAddresses", method=RequestMethod.POST)
	public String updateUserOrderExpress(HttpServletRequest request,Model model){
			Enumeration<String> paramNames =  request.getParameterNames();
			Map<String, String> paramMap = new HashMap<>();
			while (paramNames.hasMoreElements()) {
				String paramName = paramNames.nextElement();
				paramMap.put(paramName, request.getParameter(paramName));
			}
			orderService.updateUserOrderExpress(paramMap);
			long orderId=Long.parseLong(paramMap.get("orderId"));
			Order order = orderService.getOrderById(orderId);
			List<Map<String, String>> provinces = userService.getAllProvinces();
			model.addAttribute("provinces", provinces);
			model.addAttribute("order", order);
			return "order_detail_editable";
	}
	
	@RequestMapping(path="/adminSearch", method=RequestMethod.GET)
	public String adminSearchUserOrders(@ModelAttribute("searchCondition")AdminOrderSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		//page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Order> resultOrders = orderService.getAllNeedProcessOrdersBySearch(searchCondition);
		int totalCount=(int)orderService.getAllNeedProcessOrdersBySearchCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("orders", resultOrders);
		model.addAttribute("page", page);
		statusDataToModel(model);
		return "all_order_list";
	}
}
