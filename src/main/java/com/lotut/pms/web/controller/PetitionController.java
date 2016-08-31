package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.lotut.pms.domain.PatentDocInventor;
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
	public void addCommonInventor(@ModelAttribute("commonInventor") CommonInventor commonInventor,@RequestParam("patentDocId") Long patentDocId, HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		commonInventor.setUserId(userId);
		petitionService.addCommonInventor(commonInventor);
		List<CommonInventor> commonInventors =new ArrayList<>();
		commonInventors.add(commonInventor);
		petitionService.addPatentDocInventor(patentDocId, commonInventors, userId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
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
	
	@RequestMapping(path="/addPatentDocInventor",method=RequestMethod.POST)
	public void addPatentDocInventor(@RequestParam("inventorIds") List<Long> inventorIds,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor> commonInventors = petitionService.findInventorNameById(inventorIds, userId);
		petitionService.addPatentDocInventor(patentDocId, commonInventors, userId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/deletePatentDocApperson",method=RequestMethod.POST)
	public void deletePatentDocApperson(@RequestParam("personId") Long personId,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.deletePatentDocApperson(personId);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updatePatentDocApperson",method=RequestMethod.POST)
	public void updatePatentDocApperson(@ModelAttribute("patentDocAppPerson") PatentDocAppPerson patentDocAppPerson,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.updatePatentDocApperson(patentDocAppPerson);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/deletePatentDocInventor",method=RequestMethod.POST)
	public void deletePatentDocInventor(@RequestParam("inventorId") Long inventorId,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.deletePatentDocInventor(inventorId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updatePatentDocInventor",method=RequestMethod.POST)
	public void updatePatentDocInventor(@ModelAttribute("patentDocInventor") PatentDocInventor patentDocInventor,HttpServletResponse response){
		petitionService.updatePatentDocInventor(patentDocInventor);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocInventor.getPatentDocId());
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findAppPersonById",method=RequestMethod.POST)
	public void findAppPersonById(@RequestParam("personId") Long personId,HttpServletResponse response){
		PatentDocAppPerson patentDocAppPerson = petitionService.findAppPersonByAppId(personId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPerson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findInventorById",method=RequestMethod.POST)
	public void findInventorById(@RequestParam("inventorId") Long inventorId,HttpServletResponse response){
		PatentDocInventor patentDocInventor = petitionService.findInventorById(inventorId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventor);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/uploadPatentDocFile",method=RequestMethod.POST)
	public void uploadPatentDocFile(PrintWriter out){
		out.write("kkkk");
	}
}
