package com.lotut.pms.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CommonProposer;
import com.lotut.pms.domain.ProposerType;
import com.lotut.pms.service.ProposerService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

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
	public String contactProposerAddForm(Model model){
		List<ProposerType> proposerTypes=proposerService.getProposerTypes();
		model.addAttribute("proposerTypes",proposerTypes);
		return "proposer_create";
		
	}
	
	@RequestMapping(path="/list" ,method=RequestMethod.GET)
	public String getList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonProposer> proposers=proposerService.getAllProposerByUser(userId);
		model.addAttribute("proposers", proposers);
		
		return "common_proposer";
	}
	
	@RequestMapping(path="/addContactInfo",method=RequestMethod.POST)
	public String addContactInfo(@ModelAttribute CommonProposer proposer,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		proposer.setUseId(userId);
		proposerService.addProposer( proposer);
		return "redirect:/proposer/list.html";
	}
	
	@RequestMapping(path="/findOneProposerInfo")
	public String findOneProposerInfo(@RequestParam("proposerId")int proposerId,Model model ){
		CommonProposer proposer=proposerService.getOneProposerByid(proposerId);
		List<ProposerType> proposerTypes=proposerService.getProposerTypes();
		model.addAttribute("proposerTypes",proposerTypes);
		model.addAttribute("proposer", proposer);
		return "update_proposer_list";
		
	}
	@RequestMapping(path="/updateProposerInfo",method=RequestMethod.POST)
	public String updateProposerInfo(@Valid CommonProposer proposer,Model model ){
		System.out.println(proposer.getProposerType());
		int userId=PrincipalUtils.getCurrentUserId();
		proposer.setUseId(userId);
		proposerService.updateProposer(proposer);
		return "redirect:/proposer/list.html";
		
	}
	
	@RequestMapping(path="/deleteProposerInfo")
	public String deleteProposerInfo(@RequestParam("proposerId")int proposerId){
		proposerService.deleteProposerById(proposerId);
		return "redirect:/proposer/list.html";
	}
}
