package com.lotut.pms.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lotut.pms.service.ShareAppPersonService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/shareAppPerson")
public class ShareAppPersonController {
	private ShareAppPersonService shareAppPersonService;
	
	@Autowired
	public ShareAppPersonController(ShareAppPersonService shareAppPersonService) {
		this.shareAppPersonService = shareAppPersonService;
	}
	
	@RequestMapping(path="/addShares", method=RequestMethod.GET)
	public String shareAppPersons(@RequestParam("appPersons")List<Integer> appPersonIds, @RequestParam("friends")List<Integer> friendIds) {
		List<Map<String, Integer>> shareAppPersonRecords = new ArrayList<>();
		List<Map<String, Integer>> userAppPersonRecords = new ArrayList<>();
		int userId = PrincipalUtils.getCurrentUserId();
		
		for (int appPersonId: appPersonIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> shareAppPersonRecord =  new HashMap<String, Integer>();
				shareAppPersonRecord.put("appPerson", appPersonId);
				shareAppPersonRecord.put("shareBy", userId);
				shareAppPersonRecord.put("shareTo", friendId);
				shareAppPersonRecords.add(shareAppPersonRecord);
				
				Map<String, Integer> userAppPersonRecord =  new HashMap<String, Integer>();
				userAppPersonRecord.put("user", friendId);
				userAppPersonRecord.put("appPerson", appPersonId);
				userAppPersonRecords.add(userAppPersonRecord);
			}
		}
		
		shareAppPersonService.shareAppPersons(shareAppPersonRecords, userAppPersonRecords);
		return "app_person_list";
	}


//	@RequestMapping(path="/list", method=RequestMethod.GET)
//	public String getShareAppPersons(Model model) {
//		int userId = PrincipalUtils.getCurrentUserId();
//		List<ShareAppPerson> shareAppPersons = shareAppPersonService.getUserSharedAppPersons(userId);
//		model.addAttribute("shareAppPersons", shareAppPersons);
//		return "share_AppPerson_list";
//	}
//	
//	@RequestMapping(path="/friendShareList", method=RequestMethod.GET)
//	public String getFriendsSharedAppPersons(Model model) {
//		int userId = PrincipalUtils.getCurrentUserId();
//		List<ShareAppPerson> shareAppPersons = shareAppPersonService.getFriendsSharedAppPersons(userId);
//		model.addAttribute("shareAppPersons", shareAppPersons);
//		return "share_AppPerson_list";
//	}
}
