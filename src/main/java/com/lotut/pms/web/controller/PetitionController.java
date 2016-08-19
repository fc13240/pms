package com.lotut.pms.web.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/petition")
public class PetitionController {
	
	private PetitionService petitionService;
	private AppPersonService appPersonService;
	
	@Autowired
	public PetitionController(PetitionService petitionService,AppPersonService appPersonService) {
		this.petitionService = petitionService;
		this.appPersonService = appPersonService;
	}
	
	
}
