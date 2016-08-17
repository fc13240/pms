package com.lotut.pms.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.AppPersonType;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/appPerson")
public class AppPersonController {
	private AppPersonService AppPersonService;
	private UserService userSerivce;
	private AppPersonService appPersonService;
	
	public AppPersonController() {
	}
	@Autowired
	public AppPersonController(AppPersonService AppPersonService, UserService userSerivce,AppPersonService appPersonService) {
		this.AppPersonService = AppPersonService;
		this.userSerivce = userSerivce;
		this.appPersonService = appPersonService;
	}
	
	@RequestMapping(path="/contactAppPersonAddForm")
	public String contactAppPersonAddForm(Model model){
		List<AppPersonType> appPersonTypes=AppPersonService.getAppPersonTypes();
		model.addAttribute("appPersonTypes",appPersonTypes);
		return "appPerson_add";
		
	}
	
	@RequestMapping(path="/list" ,method=RequestMethod.GET)
	public String getList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson> appPersons=AppPersonService.getAllAppPersonByUser(userId);
		List<AppPersonType> appPersonTypes=AppPersonService.getAppPersonTypes();
		model.addAttribute("appPersonTypes",appPersonTypes);
		model.addAttribute("appPersons", appPersons);
		
		return "appPerson_list";
	}
	
	@RequestMapping(path="/addContactInfo",method=RequestMethod.POST)
	public String addContactInfo(@ModelAttribute CommonAppPerson AppPerson,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		AppPerson.setUserId(userId);
		AppPersonService.addAppPerson( AppPerson);
		return "redirect:/appPerson/list.html";
	}
	
	@RequestMapping(path="/findOneAppPersonInfo")
	public String findOneAppPersonInfo(@RequestParam("appPersonId")int AppPersonId,Model model ){
		CommonAppPerson appPerson=AppPersonService.getOneAppPersonById(AppPersonId);
		List<AppPersonType> appPersonTypes=AppPersonService.getAppPersonTypes();
		model.addAttribute("appPersonTypes",appPersonTypes);
		model.addAttribute("appPerson", appPerson);
		return "appPerson_update";
		
	}
	@RequestMapping(path="/updateAppPersonInfo",method=RequestMethod.POST)
	public String updateAppPersonInfo(@Valid CommonAppPerson AppPerson,Model model ){
		int userId=PrincipalUtils.getCurrentUserId();
		AppPerson.setUserId(userId);
		AppPersonService.updateAppPerson(AppPerson);
		return "redirect:/appPerson/list.html";
		
	}
	
	@RequestMapping(path="/deleteAppPersonInfo")
	public String deleteAppPersonInfo(@RequestParam("AppPersonId")int AppPersonId){
		AppPersonService.deleteAppPersonById(AppPersonId);
		return "redirect:/appPerson/list.html";
	}
	
	@RequestMapping(path="/loadAppPersoner")
	public void loadInventor(@RequestParam("appPersoner") String appPersoner, HttpServletResponse response){
		response.setContentType("application/json;charset=UTF-8");
		List<CommonAppPerson> appPersoners=appPersonService.getAppPersonByName(appPersoner);
		try{
			Map<String, Object> map = new HashMap<>();
			map.put("appPersoners", appPersoners);
			WebUtils.writeJsonStrToResponse(response, map);
			//WebUtils.writeJsonStrToResponse(response, inventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}
