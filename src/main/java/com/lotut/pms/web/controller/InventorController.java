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

import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/inventor")
public class InventorController {
	private InventorService inventorService;
	private FriendService friendService;
	@Autowired
	public InventorController(InventorService inventorService,FriendService friendService){
		this.inventorService=inventorService;
		this.friendService=friendService;
	}
	
	@RequestMapping(path="/contactInventorAddForm")
	public String contactInventorAddForm(){
		return "inventor_create";
		
	}
	
	@RequestMapping(path="/list")
	public String getList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonInventor> inventors=inventorService.getUserInventors(userId);
		model.addAttribute("inventors", inventors);
		return "inventor_list";
		
	}
	
	@RequestMapping(path="/addContactInfo",method=RequestMethod.POST)
	public String addContactInfo(@ModelAttribute CommonInventor inventor,Model model ){
		int userId=PrincipalUtils.getCurrentUserId();
		inventor.setUserId(userId);
		inventorService.addInventor(inventor);
		return "redirect:/inventor/list.html";
		
	}
	
	@RequestMapping(path="/findOneInventorInfo")
	public String findOneInventorInfo(@RequestParam("inventorId")int id,Model model){
		CommonInventor inventor = inventorService.getInventorById(id);
		model.addAttribute("inventor",inventor);
		return "inventor_update";
		
		
	}
	
	@RequestMapping(path="/updContactInfo",method=RequestMethod.POST)
	public String updContactInfo(@Valid CommonInventor inventor,Model model){
		inventorService.updateById(inventor);
		return "redirect:/inventor/list.html";
		
	}
	
	@RequestMapping(path="/deleteInventorrInfo")
	public String deleteInventorrInfo(@RequestParam("inventorId")int id,Model model){
		inventorService.deleteById(id);
		return "redirect:/inventor/list.html";
		
	}
	
	@RequestMapping(path="/loadInventor")
	public void loadInventor(@RequestParam("inventor") String inventor, HttpServletResponse response){
		response.setContentType("application/json;charset=UTF-8");
		List<CommonInventor> inventors=inventorService.getInventor(inventor);
		try{
			Map<String, Object> map = new HashMap<>();
			map.put("inventors", inventors);
			WebUtils.writeJsonStrToResponse(response, map);
			//WebUtils.writeJsonStrToResponse(response, inventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	

	@RequestMapping(path="/showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "inventor_select_friends";
	}
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "inventor_select_friends";
	}	
	
	
}
