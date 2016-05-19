package com.lotut.pms.web.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
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
import com.lotut.pms.service.PatentService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.service.utils.PatentDownload;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/patentOfficeAccount")
public class PatentOfficeAccountController {
	private PatentService patentService;
	private PatentOfficeAccountService patentOfficeAccountService;	
	
	@Autowired
	public PatentOfficeAccountController(PatentOfficeAccountService patentOfficeAccountService,PatentService patentService) {
		this.patentOfficeAccountService = patentOfficeAccountService;
		this.patentService = patentService;
	}	
	
	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserOffice(Model model) {
			int accountType=0;
		if (PrincipalUtils.isOrderProcessor()) {
			accountType=1;
			List<PatentOfficeAccount> accounts = patentOfficeAccountService.getAllAccount();
			model.addAttribute("accounts", accounts);
			model.addAttribute("accountType", accountType);
			return "patent_office_account_list";
		}else{
			
			int userId = PrincipalUtils.getCurrentUserId();
			
			List<PatentOfficeAccount> accounts = patentOfficeAccountService.getUserAccounts(userId);
			
			model.addAttribute("accounts", accounts);
			model.addAttribute("accountType", accountType);
			return "patent_office_account_list";
		}
		
	}
	
	@RequestMapping(path="/delete", method=RequestMethod.GET)
	public String deleteOfficeAccount(@RequestParam("accountId")long accountId,Model model){
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
		patentOfficeAccountService.updateOfficeAccount(patentOfficeAccount);
		List<PatentOfficeAccount> accounts = patentOfficeAccountService.getUserAccounts(userId);
		model.addAttribute("accounts", accounts);	
		
		return "redirect:/patentOfficeAccount/list.html";
	}

	@RequestMapping(path="/add_form", method=RequestMethod.GET)
	public String addFormOfficeAccount(@ModelAttribute PatentOfficeAccount patentOfficeAccount,Model model) {
		return "patent_office_account_add_form";
	}
	
	@RequestMapping(path="/add", method=RequestMethod.POST)
	public String addOfficeAccount(@ModelAttribute PatentOfficeAccount patentOfficeAccount,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		patentOfficeAccount.setUserId(userId);
		patentOfficeAccountService.addOfficeAccount(patentOfficeAccount);

		//model.addAttribute("success", success);
				
		return "redirect:/patentOfficeAccount/list.html";
	}	
	
	@RequestMapping(path="/autoUpdatePatents", method=RequestMethod.GET)
	public String autoUpdatePatents(@ModelAttribute PatentOfficeAccount account) throws Exception{
		InputStream is=PatentDownload.downloadPatentExcelFile(account.getUsername(),account.getPassword());
		boolean check=patentService.uploadPatents(is,account.getUserId());
		if(check){
			patentOfficeAccountService.updatePatentsTime(account.getAccountId());
		}
		return "add_patent_success";
	}
	
	@RequestMapping(path="/checkLogin", method=RequestMethod.GET)
	public void checkLogin(@ModelAttribute PatentOfficeAccount account,HttpServletResponse response) throws Exception{
		RequestConfig globalConfig = RequestConfig.custom().setCookieSpec(CookieSpecs.DEFAULT).build();
		CloseableHttpClient httpClient = HttpClients.custom().setDefaultRequestConfig(globalConfig).build();
		boolean success=PatentDownload.login(httpClient, account.getUsername(), account.getPassword());
		WebUtils.writeJsonStrToResponse(response, success);
	}
	
	@Scheduled(cron = "0 0 0 * * ?")
	/*cron = "0 0 0 * * ?"*/ //下午1点50
	/*cron = "0 0 0 * * ?"*/ //晚上12点
	/*cron = "0 0 0/1 * * ?"*/ //每隔1小时更新
	/*cron = "0/8 * * * * ?"*/ //每隔8秒更新
    public void autoUpdatePatentOfficeData(){
		List<PatentOfficeAccount> accounts = patentOfficeAccountService.getAllAccount();
		for(int i=0;i<accounts.size();i++){  
				InputStream is;
				try {
					is = PatentDownload.downloadPatentExcelFile(accounts.get(i).getUsername(),accounts.get(i).getPassword());
					boolean check=patentService.uploadPatents(is,accounts.get(i).getUserId());
					if(check){
						patentOfficeAccountService.updatePatentsTime(accounts.get(i).getAccountId());
						System.out.println("自动更新成功");
					}else{
						System.out.println("自动更新失败");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
        }

    }
}
