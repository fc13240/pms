package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentSearchCondition;
import com.lotut.pms.domain.PatentStatus;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/patent")
public class PatentController {
	private PatentService patentService;
	private FriendService friendService;
	
	@Autowired
	public PatentController(PatentService patentService, FriendService friendService) {
		this.patentService = patentService;
		this.friendService = friendService;
	}

	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserPatents(Model model, Page page) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		//分页相关
		int totalCount=(int)patentService.getPatentsCount(userId);
		page.setTotalRecords(totalCount);
		List<Patent> patents = patentService.getUserPatents(page);
		model.addAttribute("patents", patents);
		model.addAttribute("page", page);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="patentType")
	public String getPatentsByType(@RequestParam("patentType") int patentType, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Patent> patents = patentService.getUserPatentsByType(userId, patentType);
		model.addAttribute("patents", patents);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="patentStatus")
	public String getPatentsByStatus(@RequestParam("patentStatus") int patentStatus, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Patent> patents = patentService.getUserPatentsByStatus(userId, patentStatus);
		model.addAttribute("patents", patents);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}	
	
	@RequestMapping(path="list", method=RequestMethod.GET, params="user")
	public String getShareUserPatents(@RequestParam("user") int userId, Model model) {
		return null;
	}	
	
	
	@RequestMapping(path="showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "patent_select_friends";
	}	
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "patent_select_friends";
	}	
	
	@RequestMapping(path="/detail/{patentId:\\d+}", method=RequestMethod.GET)
	public String showDetail(@PathVariable long patentId, Model model) {
		Patent patent = patentService.getPatentDetail(patentId);
		model.addAttribute("patent", patent);
		return "patent_detail";
	}	
	
	
	@RequestMapping(path="/changeInternalCode", method=RequestMethod.GET)
	public String changeInternalCode(@RequestParam("patentId")int patentId, @RequestParam("internalCode")String internalCode) {
		patentService.changeInternalCode(patentId, internalCode);
		return "patent_list";
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserPatents(@ModelAttribute("searchCondition")PatentSearchCondition searchCondition, Model model) {
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Patent> resultPatents = patentService.searchUserPatentsWithPage(searchCondition);
		model.addAttribute("patents", resultPatents);
		addPatentTypeAndStatusDataToModel(model);
		return "patent_list";
	}
	
	@RequestMapping(path="/showUploadForm", method=RequestMethod.GET)
	public String showUploadForm() throws IOException {
		return "patent_upload_form";
	}	
	
	@RequestMapping(path="/upload", method=RequestMethod.POST)
	public String uploadPatents(@RequestParam("patentFile")Part patentFile) throws IOException {
		InputStream is = patentFile.getInputStream();
		patentService.uploadPatents(is);
		return "upload_success";
	}	
	
	private void addPatentTypeAndStatusDataToModel(Model model) {
		List<PatentType> allPatentTypes = patentService.getAllPatentTypes();
		List<PatentStatus> allPatentStatus = patentService.getAllPatentStatus();
		model.addAttribute("allPatentTypes", allPatentTypes);
		model.addAttribute("allPatentStatus", allPatentStatus);
	}
}
