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
import com.lotut.pms.domain.Tech;
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
	public String getCustomerSupportList(Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId(); 
		List<CustomerSupport> customerSupports = employeeService.getCustomerSupportList(proxyOrgId);
		model.addAttribute("customerSupports", customerSupports);
		return "customer_support_list";
	}
	
	@RequestMapping(path="/getTechList", method=RequestMethod.GET)
	public String getTechList(Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		List<Tech> techs = employeeService.getTechList(proxyOrgId);
		model.addAttribute("techs", techs);
		return "tech_list";
	}
	
	
	@RequestMapping(path="/searchCustomerSupport", method=RequestMethod.GET)
	public String searchCustomerSupport(Model model) {
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTech", method=RequestMethod.GET)
	public String searchTech(Model model) {
		return "tech_add";
	}
	
	@RequestMapping(path="/searchCustomerSupportUsers", method=RequestMethod.GET)
	public String searchCustomerSupportUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTechUsers", method=RequestMethod.GET)
	public String searchTechUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "tech_add";
	}
	
	@RequestMapping(path="/searchCustomerSupportFriends", method=RequestMethod.GET)
	public String searchCustomerSupportFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}	
	
	@RequestMapping(path="/searchTechFriends", method=RequestMethod.GET)
	public String searchTechFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "tech_add";
	}	
	
	
	@RequestMapping(path="/customerSupportRequest", method=RequestMethod.GET)
	public String addOrUpdateCustomerSupport(@ModelAttribute("customerSupport")CustomerSupport customerSupport,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		customerSupport.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateCustomerSupport(customerSupport);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/techRequest", method=RequestMethod.GET)
	public String addOrUpdateTech(@ModelAttribute("tech")Tech tech,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		tech.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateTech(tech);
		return "tech_add";
	}
	
	@RequestMapping(path="/deleteCustomerSupport", method=RequestMethod.GET)
	public String deleteCustomerSupport(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteCustomerSupport(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getCustomerSupportList.html";
	}
	
	@RequestMapping(path="/deleteTech", method=RequestMethod.GET)
	public String deleteTech(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteTech(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getTechList.html";
	}
	
	@RequestMapping(path="/changeCustomerSupportRemarkName", method=RequestMethod.GET)
	public String changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeService.changeCustomerSupportRemarkName(id, remarkName);
		return "customer_support_list";
	}
	
	@RequestMapping(path="/changeTechRemarkName", method=RequestMethod.GET)
	public String changeTechRemarkName(int id, String remarkName) {
		employeeService.changeTechRemarkName(id, remarkName);
		return "tech_list";
	}
	
	
	
}
