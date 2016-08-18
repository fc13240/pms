package com.lotut.pms.web.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.service.PetitionService;

@Controller
@RequestMapping(path="/petition")
public class PetitionController {
	
	private PetitionService petitionService;
	
	@Autowired
	public PetitionController(PetitionService petitionService) {
		this.petitionService = petitionService;
	}
	
	@RequestMapping(path="/addAppPerson")
	public void addAppPerson(@RequestParam("patentDocId") long patentDocId,@RequestParam("appPersonId") long appPersonId,PrintWriter out){
		petitionService.addAppPerson(patentDocId, appPersonId);
		out.write("添加成功");
	}
	
	@RequestMapping(path="/checkAppPerson")
	public void checkAppPerson(@RequestParam("patentDocId") long patentDocId,@RequestParam("appPersonId") long appPersonId,PrintWriter out){
		int exitPetition= petitionService.checkAppPerson(patentDocId, appPersonId);
		System.out.println(exitPetition);
		out.write(String.valueOf(exitPetition));
	}
	
}
