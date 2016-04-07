package com.lotut.pms.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lotut.pms.domain.User;
import com.lotut.pms.service.UserService;

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
	public String changePassword(String lastPassword,String newPassword) {
		userService.changePassword(lastPassword, newPassword);
		return "changePassword_success";
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
