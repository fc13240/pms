package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.util.PrincipalUtils;


@Controller
@RequestMapping(path="/employee")
public class EmployeeController {
	private EmployeeService employeeService;
	private FriendService friendService;
	
	@Autowired
	public EmployeeController(EmployeeService employeeService, FriendService friendService) {
		this.employeeService = employeeService;
		this.friendService = friendService;
	}	
	
	@RequestMapping(path="/getCustomerSupportList", method=RequestMethod.GET)
	public String getCustomerSupportList(@RequestParam("proxyOrgId")int proxyOrgId, Model model) {
		List<CustomerSupport> customerSupports = employeeService.getCustomerSupportList(proxyOrgId);
		model.addAttribute("customerSupports", customerSupports);
		return "customer_support_list";
	}
	
	
	@RequestMapping(path="/searchCustomerSupport", method=RequestMethod.GET)
	public String searchCustomerSupport(Model model) {
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchUsers", method=RequestMethod.GET)
	public String searchUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}	
	
	
	@RequestMapping(path="/request", method=RequestMethod.GET)
	public String addOrUpdateCustomerSupport(@ModelAttribute("customerSupport")CustomerSupport customerSupport,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		System.out.println("---------1----"+customerSupport);
		customerSupport.setProxyOrgId(proxyOrgId);
		System.out.println("---------2----"+customerSupport);
		employeeService.addOrUpdateCustomerSupport(customerSupport);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/deleteCustomerSupport", method=RequestMethod.GET)
	public String deleteCustomerSupport(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteCustomerSupport(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getCustomerSupportList.html";
	}
	@RequestMapping(path="/changeRemarkName", method=RequestMethod.GET)
	public String changeRemarkName(int id, String remarkName) {
		employeeService.changeRemarkName(id, remarkName);
		return "customer_support_list";
	}
	
}
