package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/user")
public class UserController {
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}	
	
	@RequestMapping(path="/all", method=RequestMethod.GET)
	public ModelAndView getAllUsers() {
		List<User> allUsers = userService.getAllUsers();
		return new ModelAndView();
	}	

	@RequestMapping(path="/registerForm", method=RequestMethod.GET)
	public String showRegisterForm() {
		return "register_form";
	}
	
	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String register(User user) {
		userService.register(user);
		
		return "register_success";
	}
	
	@RequestMapping(path="/changePasswordForm", method=RequestMethod.GET)
	public String changePasswordForm() {
		return "changePassword_form";
	}
    
	@RequestMapping(path="/changePassword", method=RequestMethod.POST)
	public String changePassword(@RequestParam("lastPassword")String lastPassword,@RequestParam("newPassword")String newPassword) {
		boolean success = userService.changePassword(lastPassword, newPassword);
		
		if(success){
			return "changePassword_success";
		}
		
		return "changePassword_form";
	}
	
	@RequestMapping(path="/detail", method=RequestMethod.GET)
	public String getUserDetail(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		User user = userService.getUserDetail(userId);
		model.addAttribute("user", user);
		
		return "user_detail";
	}
	
	@RequestMapping(path="/contactAddressAddForm", method=RequestMethod.GET)
	public String showContactAddressAddForm(Model model) {
		List<Map<String, String>> provinces = userService.getAllProvinces();
		model.addAttribute("provinces", provinces);
		return "contact_address_create_form";
	}
	
	@RequestMapping(path="/getCitiesByProvince", method=RequestMethod.GET)
	public void getCitiesByProvince(@RequestParam("province")int provinceId, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		List<Map<String, String>> cities = userService.getCitiesByProvinceId(provinceId);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValueAsString(cities);
		PrintWriter out = response.getWriter();
		out.write(mapper.writeValueAsString(cities));
		out.flush();
		out.close();
	}
	
	@RequestMapping(path="/getDistrictsByCity", method=RequestMethod.GET)
	public void getDistrictsByCity(@RequestParam("city")long cityId, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		List<Map<String, String>> districts = userService.getDistrictsByCityId(cityId);
		
		ObjectMapper mapper = new ObjectMapper();
		PrintWriter out = response.getWriter();
		out.write(mapper.writeValueAsString(districts));
		out.flush();
		out.close();
	}
	
	@RequestMapping(path="/getStreetsByDistrict", method=RequestMethod.GET)
	public void getStreetsByDistrict(@RequestParam("district")long districtId, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=UTF-8");
		List<Map<String, String>> streets = userService.getStreetsByDistrictId(districtId);
		
		ObjectMapper mapper = new ObjectMapper();
		PrintWriter out = response.getWriter();
		out.write(mapper.writeValueAsString(streets));
		out.flush();
		out.close();
	}

	@RequestMapping(path="/login", method=RequestMethod.POST)
	public ModelAndView login() {
		return null;
	}
	
    @RequestMapping(path = "/logout",method = RequestMethod.POST)  
    public String logout(HttpSession httpSession){  
    //	httpSession.invalidate();
        return "login_form";
    }  	


	
	public UserController() {
	}
	

}
