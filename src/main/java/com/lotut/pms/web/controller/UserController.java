package com.lotut.pms.web.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.alipay.util.httpClient.HttpResponse;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/user")
public class UserController {
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}	
	
	@RequestMapping(path="/all", method=RequestMethod.GET)
	public String getAllUsers(Page page, Model model) {
		List<User> allUsers = userService.getAllUsers(page);
		model.addAttribute("users", allUsers);
		return "";
	}

	@RequestMapping(path="/registerForm", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "register_form";
	}
	
	@RequestMapping(path="/instructions", method=RequestMethod.GET)
	public String instructions() {
		return "user_instructions";
	}	
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String register(User user,Model model,HttpSession session) {
		boolean success=userService.register(user);
		
		if(success){
			session.invalidate();
			return "register_success";
		}
		
		model.addAttribute("success", success);
		return "register_form";
	}
	
	@RequestMapping(path="/changePasswordForm", method=RequestMethod.GET)
	public String changePasswordForm() {
		return "changePassword_form";
	}
    
	@RequestMapping(path="/changePassword", method=RequestMethod.POST)
	public String changePassword(@RequestParam("lastPassword")String lastPassword, 
			@RequestParam("newPassword")String newPassword, Model model) {
		boolean success = userService.changePassword(lastPassword, newPassword);
		
		if(success){
			return "changePassword_success";
		}
		
		model.addAttribute("success", success);
		return "changePassword_form";
	}
	
	@RequestMapping(path="/detail", method=RequestMethod.GET)
	public String getUserDetail(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = userService.getUserDetail(userId);
		model.addAttribute("user", user);
		
		return "user_detail";
	}
	
	@RequestMapping(path="/updateUserDetail", method=RequestMethod.POST)
	public String updateUserDetail(@ModelAttribute User user,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		user.setUserId(userId);
		boolean success=userService.updateUserDetail(user);
		model.addAttribute("success", success);
		return "user_detail";
	}
	
	@RequestMapping(path="/contactAddressAddForm", method=RequestMethod.GET)
	public String showContactAddressAddForm(Model model) {
		List<Map<String, String>> provinces = userService.getAllProvinces();
		model.addAttribute("provinces", provinces);
		
		return "contact_address_create_form";
	}
	
	@RequestMapping(path="/addContactAddress", method=RequestMethod.POST)
	public String addContactAddress(@Valid ContactAddress contactAddress, 
			Errors errors, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		contactAddress.setUserId(userId);
		userService.saveContactAddress(contactAddress);
		
		// FIXME add success page
		return "addAddresses_success";
	}
	
	@RequestMapping(path="/getContactAddresses", method=RequestMethod.GET)
	public String getUserContactAddresses(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		model.addAttribute("contactAddresses", contactAddresses);
		return "contactAddresses_list";
	}
	
	@RequestMapping(path="/updateUserContactAddressesFrom", method=RequestMethod.GET)
	public String updateUserContactAddressesFrom(@RequestParam("id")int id,Model model) {
		ContactAddress contactAddresses=userService.getContactAddressesById(id);
		List<Map<String, String>> provinces = userService.getAllProvinces();
		model.addAttribute("provinces", provinces);
		model.addAttribute("contactAddresses", contactAddresses);
		return "addresses_list";
	}
	
	@RequestMapping(path="/updateUserContactAddresses", method=RequestMethod.POST)
	public String updateUserContactAddresses(@Valid ContactAddress contactAddress,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		contactAddress.setUserId(userId);
		userService.updateUserContactAddresses(contactAddress);
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		model.addAttribute("contactAddresses", contactAddresses);
		return "contactAddresses_list";
	}
	
	
	@RequestMapping(path="/deleteUserContactAddresses", method=RequestMethod.GET)
	public String deleteUserContactAddresses(@RequestParam("id")int id,Model model) {
		userService.deleteUserContactAddresses(id);
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		model.addAttribute("contactAddresses", contactAddresses);
		return "contactAddresses_list";
	}
	
	@RequestMapping(path="/defaultUserContactAddresses", method=RequestMethod.GET)
	public String defaultUserContactAddresses(@RequestParam("id")int id,Model model) {
		userService.defaulStatus();
		userService.defaultUserContactAddresses(id);
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		model.addAttribute("contactAddresses", contactAddresses);
		return "contactAddresses_list";
	}
	
	@RequestMapping(path="/getCitiesByProvince", method=RequestMethod.GET)
	public void getCitiesByProvince(@RequestParam("province")int provinceId, 
			Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json;charset=UTF-8");
		List<Map<String, String>> cities = userService.getCitiesByProvinceId(provinceId);
		
		WebUtils.writeJsonStrToResponse(response, cities);
	}
	
	@RequestMapping(path="/getDistrictsByCity", method=RequestMethod.GET)
	public void getDistrictsByCity(@RequestParam("city")long cityId, 
			Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("application/json;charset=UTF-8");
		List<Map<String, String>> districts = userService.getDistrictsByCityId(cityId);
		
		WebUtils.writeJsonStrToResponse(response, districts);
	}
	

	@RequestMapping(path="/setPageSize", method=RequestMethod.GET)
	@ResponseBody
	public void setPageSize(@RequestParam("pageSize")int pageSize, HttpSession session, HttpServletResponse response) throws IOException {
		session.setAttribute("pageSize", pageSize);
		//WebUtils.writeJsonStrToResponse(response, "");
		
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public ModelAndView login() {
		return null;
	}
	
    @RequestMapping(path = "/logout",method = RequestMethod.POST)  
    public String logout(HttpSession httpSession){  
        return "login_form";
    }  	
	
    
    @RequestMapping(path="/getContactAddressByReceiver")
    public void getContactAddressByReceiver(@RequestParam("receiver") String receiver,HttpServletResponse response){
    	response.setContentType("application/json;charset=UTF-8");
    	int userId = PrincipalUtils.getCurrentUserId();
    	List<ContactAddress> contactAddresses = userService.getContactAddressesByReceiver(userId, receiver);
    	Map<String,Object> map =new HashMap<>();
    	map.put("contactAddresses", contactAddresses);
    	try{
    		WebUtils.writeJsonStrToResponse(response, map);
    	}catch(IOException e){
    		e.printStackTrace();
    	}
   }
    
    
    
	public UserController() {
	}
	
	@RequestMapping(path="/setPicName", method=RequestMethod.GET)
	@ResponseBody
	public void setPicName(@RequestParam("picName")String picName, HttpSession session, HttpServletResponse response) throws IOException {
		session.setAttribute("picName", picName);
		
	}
}
