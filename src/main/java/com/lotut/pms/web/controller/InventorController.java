package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/inventor")
public class InventorController {
	InventorService inventorService;
	@Autowired
	public InventorController(InventorService inventorService){
		this.inventorService=inventorService;
	}
	
	@RequestMapping(path="/contactInventorAddForm")
	public String contactInventorAddForm(){
		return "inventor_create";
		
	}
	
	@RequestMapping(path="/list")
	public String getList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonInventor> inventors=inventorService.getAllInventorsByUser(userId);
		model.addAttribute("inventors", inventors);
		return "inventor_list";
		
	}
	
	@RequestMapping(path="/addContactInfo")
	public String addContactInfo(@ModelAttribute CommonInventor inventor,Model model ){
		int userId=PrincipalUtils.getCurrentUserId();
		inventor.setUserId(userId);
		inventorService.addInventor(inventor);
		return "redirect:/inventor/list.html";
		
	}
}
