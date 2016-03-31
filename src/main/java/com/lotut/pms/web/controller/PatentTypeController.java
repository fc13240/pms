package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.PatentType;
import com.lotut.pms.service.PatentService;


public class PatentTypeController {
	private PatentService patentService;
	

	@RequestMapping(path="patentType")
	public String getAllPatentTypes(Model model) {
		List<PatentType> patentTypes = patentService.getAllPatentTypes();
		model.addAttribute("patentTypes", patentTypes);
		return "";
	}
	
	public PatentService getPatentService() {
		return patentService;
	}

	public void setPatentService(PatentService patentService) {
		this.patentService = patentService;
	}
}
