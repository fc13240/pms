package com.lotut.pms.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotut.pms.domain.CustomerSupport;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.ProcessPerson;
import com.lotut.pms.domain.ProxyOrg;
import com.lotut.pms.domain.TechPerson;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.EmployeeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;


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
	
	
	@RequestMapping(path="/getCustomerSupportList", method=RequestMethod.GET)//客服
	public String getCustomerSupportList(Model model,HttpSession session,Page page) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		page.setProxyOrgId(proxyOrgId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=employeeService.getCustomerSupportCount(proxyOrgId);
		page.setTotalRecords(totalCount);
		List<CustomerSupport> customerSupports = employeeService.getCustomerSupportListByPage(page);
		model.addAttribute("customerSupports", customerSupports);
		return "customer_support_list";
	}
	
	@RequestMapping(path="/getTechPersonList", method=RequestMethod.GET)//技术员
	public String getTechPersonList(Model model,HttpSession session,Page page) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		page.setProxyOrgId(proxyOrgId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=employeeService.getTechPersonCount(proxyOrgId);
		page.setTotalRecords(totalCount);
		List<TechPerson> techPersons = employeeService.getTechPersonListByPage(page);
		model.addAttribute("techPersons", techPersons);
		return "tech_person_list";
	}
	
	@RequestMapping(path="/getProcessPersonList", method=RequestMethod.GET)//流程
	public String getProcessPersonList(Model model,HttpSession session,Page page) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		page.setProxyOrgId(proxyOrgId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=employeeService.getProcessPersonCount(proxyOrgId);
		page.setTotalRecords(totalCount);
		List<ProcessPerson> processPersons = employeeService.getProcessPersonListByPage(page);
		model.addAttribute("processPersons", processPersons);
		return "process_person_list";
	}
	
	
	@RequestMapping(path="/getProxyOrgList", method=RequestMethod.GET)//代理机构
	public String getProxyOrgList(Model model,Page page, HttpSession session) {
		int parentOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		page.setParentOrgId(parentOrgId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=(int)employeeService.getProxyOrgCount(parentOrgId);
		page.setTotalRecords(totalCount);
		List<ProxyOrg> proxyOrgs = employeeService.getProxyOrgListByPage(page);
		model.addAttribute("proxyOrgs", proxyOrgs);
		model.addAttribute("isTopProxyOrg",0);
		return "proxy_org_list";
	}
	
	@RequestMapping(path="/getTopProxyOrgList", method=RequestMethod.GET)//顶级代理机构
	public String getTopProxyOrgList(Model model,Page page, HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=(int)employeeService.getTopProxyOrgListCount();
		page.setTotalRecords(totalCount);
		List<ProxyOrg> proxyOrgs = employeeService.getTopProxyOrgListByPage(page);
		model.addAttribute("proxyOrgs", proxyOrgs);
		model.addAttribute("isTopProxyOrg",1);
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
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		customerSupport.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateCustomerSupport(customerSupport);
		return "customer_support_add";
	}
	
	@RequestMapping(path="/addOrUpdateTechPerson", method=RequestMethod.GET)
	public String addOrUpdateTechPerson(TechPerson techPerson) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		techPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateTechPerson(techPerson);
		return "tech_person_add";
	}
	
	@RequestMapping(path="/addOrUpdateProcessPerson", method=RequestMethod.GET)
	public String addOrUpdateProcessPerson(ProcessPerson processPerson) {
		int proxyOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		processPerson.setProxyOrgId(proxyOrgId);
		employeeService.addOrUpdateProcessPerson(processPerson);
		return "process_person_add";
	}
	
	@RequestMapping(path="/addOrUpdateProxyOrg", method=RequestMethod.GET)
	public String addOrUpdateProxyOrg(ProxyOrg proxyOrg) {
		int parentOrgId = employeeService.getOrgIdByUserId(PrincipalUtils.getCurrentUserId());
		proxyOrg.setParentOrgId(parentOrgId);
		employeeService.addOrUpdateProxyOrg(proxyOrg);
		return "proxy_org_add";
	}
	
	@RequestMapping(path="/addOrUpdateTopProxyOrg", method=RequestMethod.GET)
	public String addOrUpdateTopProxyOrg(ProxyOrg proxyOrg) {
		employeeService.addOrUpdateTopProxyOrg(proxyOrg);
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
		if(PrincipalUtils.isPlatform()) {
			return "redirect:/employee/getTopProxyOrgList.html";
		}
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
