package com.lotut.pms.web.controller;

import java.util.List;

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
	
	@RequestMapping(path="/all", method=RequestMethod.GET)
	public ModelAndView getAllUsers() {
		List<User> allUsers = userService.getAllUsers();
		return new ModelAndView();
	}	

	@RequestMapping(path="/register", method=RequestMethod.POST)
	public String register(User user) {
		 userService.register(user);
		return "login_form";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public ModelAndView login() {
		return null;
	}
	
	@RequestMapping(path="/logout", method=RequestMethod.GET)
	public ModelAndView logout() {
		return null;
	}	
	
	@RequestMapping(path="/changePassword", method=RequestMethod.POST)
	public ModelAndView changePassword() {
		return null;
	}
	
	public UserController() {
	}
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
}
