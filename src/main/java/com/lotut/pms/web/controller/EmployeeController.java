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
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.ProcessPerson;
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
	
	@RequestMapping(path="/getTechPersonList", method=RequestMethod.GET)
	public String getTechPersonList(Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		List<TechPerson> techPersons = employeeService.getTechPersonList(proxyOrgId);
		model.addAttribute("techPersons", techPersons);
		return "tech_person_list";
	}
	
	@RequestMapping(path="/getProcessPersonList", method=RequestMethod.GET)
	public String getProcessPersonList(Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		List<ProcessPerson> processPersons = employeeService.getProcessPersonList(proxyOrgId);
		model.addAttribute("processPersons", processPersons);
		return "process_person_list";
	}
	
	
	@RequestMapping(path="/searchCustomerSupport", method=RequestMethod.GET)
	public String searchCustomerSupport(Model model) {
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTechPerson", method=RequestMethod.GET)
	public String searchTechPerson(Model model) {
		return "tech_person_add";
	}
	
	@RequestMapping(path="/searchProcessPerson", method=RequestMethod.GET)
	public String searchProcessPerson(Model model) {
		return "process_person_add";
	}
	
	
	@RequestMapping(path="/searchCustomerSupportUsers", method=RequestMethod.GET)
	public String searchCustomerSupportUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTechPersonUsers", method=RequestMethod.GET)
	public String searchTechPersonUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "tech_person_add";
	}
	
	@RequestMapping(path="/searchProcessPersonUsers", method=RequestMethod.GET)
	public String searchProcessPersonUsers(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultUsers = friendService.searchFriends(keyword);
		model.addAttribute("users", resultUsers);
		return "process_person_add";
	}
	
	
	@RequestMapping(path="/searchCustomerSupportFriends", method=RequestMethod.GET)
	public String searchCustomerSupportFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}	
	
	@RequestMapping(path="/searchTechPersonFriends", method=RequestMethod.GET)
	public String searchTechPersonFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "tech_person_add";
	}	
	
	@RequestMapping(path="/searchProcessPersonFriends", method=RequestMethod.GET)
	public String searchProcessPersonFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "process_person_add";
	}	
	
	
	@RequestMapping(path="/customerSupportRequest", method=RequestMethod.GET)
	public String addOrUpdateCustomerSupport(@ModelAttribute("customerSupport")CustomerSupport customerSupport,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		customerSupport.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateCustomerSupport(customerSupport);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/techPersonRequest", method=RequestMethod.GET)
	public String addOrUpdateTechPerson(@ModelAttribute("techPerson")TechPerson techPerson,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		techPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateTechPerson(techPerson);
		return "tech_person_add";
	}
	
	@RequestMapping(path="/processPersonRequest", method=RequestMethod.GET)
	public String addOrUpdateProcessPerson(@ModelAttribute("processPerson")ProcessPerson processPerson,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		processPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateProcessPerson(processPerson);
		return "process_person_add";
	}
	
	
	@RequestMapping(path="/deleteCustomerSupport", method=RequestMethod.GET)
	public String deleteCustomerSupport(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteCustomerSupport(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getCustomerSupportList.html";
	}
	
	@RequestMapping(path="/deleteTechPerson", method=RequestMethod.GET)
	public String deleteTechPerson(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteTechPerson(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getTechPersonList.html";
	}
	
	@RequestMapping(path="/deleteProcessPerson", method=RequestMethod.GET)
	public String deleteProcessPerson(@RequestParam("id")int id,Model model) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		employeeService.deleteProcessPerson(id);
		model.addAttribute("proxyOrgId",proxyOrgId);
		return "redirect:/employee/getProcessPersonList.html";
	}
	
	
	@RequestMapping(path="/changeCustomerSupportRemarkName", method=RequestMethod.GET)
	public String changeCustomerSupportRemarkName(int id, String remarkName) {
		employeeService.changeCustomerSupportRemarkName(id, remarkName);
		return "customer_support_list";
	}
	
	@RequestMapping(path="/changeTechPersonRemarkName", method=RequestMethod.GET)
	public String changeTechPersonRemarkName(int id, String remarkName) {
		employeeService.changeTechPersonRemarkName(id, remarkName);
		return "tech_person_list";
	}
	
	@RequestMapping(path="/changeProcessPersonRemarkName", method=RequestMethod.GET)
	public String changeProcessPersonRemarkName(int id, String remarkName) {
		employeeService.changeProcessPersonRemarkName(id, remarkName);
		return "process_person_list";
	}
}
