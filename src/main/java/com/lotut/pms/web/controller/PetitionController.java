package com.lotut.pms.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/petition")
public class PetitionController {
	
	private PetitionService petitionService;
	
	@Autowired
	public PetitionController(PetitionService petitionService) {
		this.petitionService = petitionService;
	}
	
	@RequestMapping(path="/findAppPersonNameById")
	public void findAppPersonNameById(@RequestParam("appPersonIds") List<Integer> appPersonIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson>  appersons = petitionService.findAppPersonNameById(appPersonIds,userId);
		try{
			WebUtils.writeJsonStrToResponse(response, appersons);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findInventorNameById")
	public void findInventorNameById(@RequestParam("inventorIds") List<Long> inventorIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor>  inventors = petitionService.findInventorNameById(inventorIds,userId);
		try{
			WebUtils.writeJsonStrToResponse(response, inventors);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
}
