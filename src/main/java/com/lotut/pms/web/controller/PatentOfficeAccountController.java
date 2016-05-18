package com.lotut.pms.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Order;
import com.lotut.pms.domain.PatentOfficeAccount;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.PatentOfficeAccountService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/patentOfficeAccount")
public class PatentOfficeAccountController {
	
	private PatentOfficeAccountService patentOfficeAccountService;	
	
	@Autowired
	public PatentOfficeAccountController(PatentOfficeAccountService patentOfficeAccountService) {
		this.patentOfficeAccountService = patentOfficeAccountService;
	}	
	
	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserOffice(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		
		List<PatentOfficeAccount> accounts = patentOfficeAccountService.getUserAccounts(userId);
		
		model.addAttribute("accounts", accounts);
		
		return "patent_office_account_list";
	}
	
	@RequestMapping(path="/delete", method=RequestMethod.GET)
	public String deleteOfficeAccount(@RequestParam("accountId")long accountId,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		patentOfficeAccountService.deleteOfficeAccount(accountId);
		return "patent_office_account_list";
	}
	
	@RequestMapping(path="/detail", method=RequestMethod.GET)
	public String getOfficeAccountDetail(@RequestParam("accountId")long accountId,Model model) {
		
		PatentOfficeAccount patentOfficeAccount = patentOfficeAccountService.getOfficeAccountDetail(accountId);
		model.addAttribute("patentOfficeAccount", patentOfficeAccount);
		return "patent_office_account_detail";
	}
	
	@RequestMapping(path="/update", method=RequestMethod.POST)
	public String updateOfficeAccount(@ModelAttribute PatentOfficeAccount patentOfficeAccount,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		boolean success=patentOfficeAccountService.updateOfficeAccount(patentOfficeAccount);
		model.addAttribute("success", success);
		return "patent_office_account_detail";
	}
	
	
}
