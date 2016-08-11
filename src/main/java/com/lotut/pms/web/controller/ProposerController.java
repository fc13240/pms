package com.lotut.pms.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lotut.pms.service.ProposerService;
import com.lotut.pms.service.UserService;

@Controller
@RequestMapping(path="/proposer")
public class ProposerController {
	private ProposerService proposerService;
	private UserService userSerivce;
	
	public ProposerController() {
	}
	@Autowired
	public ProposerController(ProposerService proposerService, UserService userSerivce) {
		this.proposerService = proposerService;
		this.userSerivce = userSerivce;
	}
	
	@RequestMapping(path="/contactProposerAddForm")
	public String contactProposerAddForm(){

		return "proposer_create";
		
	}
	
	@RequestMapping(path="/list" ,method=RequestMethod.GET)
	public String getList(){
		System.out.println("=============================");
		return "common_proposer";
	}
}
