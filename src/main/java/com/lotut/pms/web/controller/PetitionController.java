package com.lotut.pms.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
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
	
	@RequestMapping(path="/addCommonAppPerson")
	public void addCommonAppPerson(@ModelAttribute("commonAppPerson") CommonAppPerson commonAppPerson,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		commonAppPerson.setUserId(userId);
		petitionService.addCommonAppPerson(commonAppPerson);
		List<CommonAppPerson> commonAppPersons = new ArrayList<>();
		commonAppPersons.add(commonAppPerson);
		petitionService.addPatentDocAppPerson(commonAppPersons, patentDocId,userId);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/addCommonInventor",method=RequestMethod.POST)
	public void addCommonInventor(@ModelAttribute("commonInventor") CommonInventor commonInventor,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		commonInventor.setUserId(userId);
		petitionService.addCommonInventor(commonInventor);
		
		try{
			WebUtils.writeJsonStrToResponse(response, commonInventor);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/findContactNameById",method=RequestMethod.POST)
	public void findContactNameById(@RequestParam("contactIds") List<Integer> contactIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> addresses = petitionService.findContactNameById(contactIds, userId);
		try{
			WebUtils.writeJsonStrToResponse(response, addresses);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/addPatentDocAppPerson",method=RequestMethod.POST)
	public void addPatentDocAppPerson(@RequestParam("appPersonIds") List<Integer> appPersonIds,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson>  appersons = petitionService.findAppPersonNameById(appPersonIds,userId);
		petitionService.addPatentDocAppPerson(appersons, patentDocId,userId);
		
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
}