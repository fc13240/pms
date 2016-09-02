package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;


@Controller
@RequestMapping(path="/employee")
public class EmployeeController {
	private EmployeeService employeeService;
	private FriendService friendService;
	private UserService userService;
	
	@Autowired
	public EmployeeController(EmployeeService employeeService, FriendService friendService,UserService userService) {
		this.employeeService = employeeService;
		this.friendService = friendService;
		this.userService = userService;
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
	
	@RequestMapping(path="/getProxyOrgList", method=RequestMethod.GET)
	public String getProxyOrgList(Model model) {
		int parentOrgId = employeeService.getParentOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		List<ProxyOrg> proxyOrgs = employeeService.getProxyOrgList(parentOrgId);
		model.addAttribute("proxyOrgs", proxyOrgs);
		return "proxy_org_list";
	}
	
	
	@RequestMapping(path="/searchCustomerSupport", method=RequestMethod.GET)
	public String searchCustomerSupport() {
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTechPerson", method=RequestMethod.GET)
	public String searchTechPerson() {
		return "tech_person_add";
	}
	
	@RequestMapping(path="/searchProcessPerson", method=RequestMethod.GET)
	public String searchProcessPerson() {
		return "process_person_add";
	}
	
	@RequestMapping(path="/searchProxyOrg", method=RequestMethod.GET)
	public String searchProxyOrg() {
		return "proxy_org_add";
	}
	
	
	@RequestMapping(path="/searchCustomerSupportUsers", method=RequestMethod.GET)
	public String searchCustomerSupportUsers(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = userService.searchUsers(keyword,userId);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/searchTechPersonUsers", method=RequestMethod.GET)
	public String searchTechPersonUsers(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = userService.searchUsers(keyword,userId);
		model.addAttribute("users", resultUsers);
		return "tech_person_add";
	}
	
	@RequestMapping(path="/searchProcessPersonUsers", method=RequestMethod.GET)
	public String searchProcessPersonUsers(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = userService.searchUsers(keyword,userId);
		model.addAttribute("users", resultUsers);
		return "process_person_add";
	}
	
	@RequestMapping(path="/searchProxyOrgUsers", method=RequestMethod.GET)
	public String searchProxyOrgUsers(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = userService.searchUsers(keyword,userId);
		model.addAttribute("users", resultUsers);
		return "proxy_org_add";
	}
	
	@RequestMapping(path="/searchCustomerSupportFriends", method=RequestMethod.GET)
	public String searchCustomerSupportFriends(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "customer_support_add";
	}	
	
	@RequestMapping(path="/searchTechPersonFriends", method=RequestMethod.GET)
	public String searchTechPersonFriends(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "tech_person_add";
	}	
	
	@RequestMapping(path="/searchProcessPersonFriends", method=RequestMethod.GET)
	public String searchProcessPersonFriends(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "process_person_add";
	}	
	
	@RequestMapping(path="/searchProxyOrgFriends", method=RequestMethod.GET)
	public String searchProxyOrgFriends(String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> resultUsers = friendService.findFriendsByUserId(userId,keyword);
		model.addAttribute("users", resultUsers);
		return "proxy_org_add";
	}
	
	
	@RequestMapping(path="/addOrUpdateCustomerSupport", method=RequestMethod.GET)
	public String addOrUpdateCustomerSupport(CustomerSupport customerSupport) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		customerSupport.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateCustomerSupport(customerSupport);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/addOrUpdateTechPerson", method=RequestMethod.GET)
	public String addOrUpdateTechPerson(TechPerson techPerson) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		techPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateTechPerson(techPerson);
		return "tech_person_add";
	}
	
	@RequestMapping(path="/addOrUpdateProcessPerson", method=RequestMethod.GET)
	public String addOrUpdateProcessPerson(ProcessPerson processPerson) {
		int proxyOrgId = PrincipalUtils.getCurrentUserId();
		processPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateProcessPerson(processPerson);
		return "process_person_add";
	}
	
	@RequestMapping(path="/addOrUpdateProxyOrg", method=RequestMethod.GET)
	public String addOrUpdateProxyOrg(ProxyOrg proxyOrg) {
		int parentOrgId = employeeService.getParentOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		proxyOrg.setParentOrgId(parentOrgId);
		employeeService.addOrUpdateProxyOrg(proxyOrg);
		return "proxy_org_add";
	}
	
	@RequestMapping(path="/deleteCustomerSupport", method=RequestMethod.GET)
	public String deleteCustomerSupport(int id) {
		employeeService.deleteCustomerSupport(id);
		return "redirect:/employee/getCustomerSupportList.html";
	}
	
	@RequestMapping(path="/deleteTechPerson", method=RequestMethod.GET)
	public String deleteTechPerson(int id) {
		employeeService.deleteTechPerson(id);
		return "redirect:/employee/getTechPersonList.html";
	}
	
	@RequestMapping(path="/deleteProcessPerson", method=RequestMethod.GET)
	public String deleteProcessPerson(int id) {
		employeeService.deleteProcessPerson(id);
		return "redirect:/employee/getProcessPersonList.html";
	}
	
	@RequestMapping(path="/deleteProxyOrg", method=RequestMethod.GET)
	public String deleteProxyOrg(int orgId) {
		employeeService.deleteProxyOrg(orgId);
		return "redirect:/employee/getProxyOrgList.html";
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
	
	@RequestMapping(path="/changeProxyOrgRemarkName", method=RequestMethod.GET)
	public String changeProxyOrgRemarkName(int orgId, String remarkName) {
		employeeService.changeProxyOrgRemarkName(orgId, remarkName);
		return "proxy_org_list";
	}
}
