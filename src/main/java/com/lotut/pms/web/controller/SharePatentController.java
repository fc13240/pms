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

import com.lotut.pms.domain.SharePatent;
import com.lotut.pms.service.SharePatentService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/sharePatent")
public class SharePatentController {
	private SharePatentService sharePatentService;
	
	@Autowired
	public SharePatentController(SharePatentService sharePatentService) {
		this.sharePatentService = sharePatentService;
	}
	
	@RequestMapping(path="/addShares", method=RequestMethod.GET)
	public String sharePatents(@RequestParam("patents")List<Integer> patentIds, @RequestParam("friends")List<Integer> friendIds) {
		List<Map<String, Integer>> sharePatentRecords = new ArrayList<>();
		List<Map<String, Integer>> userPatentRecords = new ArrayList<>();
		int userId = PrincipalUtils.getCurrentUserId();
		
		for (int patentId: patentIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> sharePatentRecord =  new HashMap<String, Integer>();
				sharePatentRecord.put("patent", patentId);
				sharePatentRecord.put("shareBy", userId);
				sharePatentRecord.put("shareTo", friendId);
				sharePatentRecords.add(sharePatentRecord);
				
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("user", friendId);
				userPatentRecord.put("patent", patentId);
				userPatentRecords.add(userPatentRecord);
			}
		}
		
		sharePatentService.sharePatents(sharePatentRecords, userPatentRecords);
		return "patent_list";
	}


	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getSharePatents(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<SharePatent> sharePatents = sharePatentService.getUserSharedPatents(userId);
		model.addAttribute("sharePatents", sharePatents);
		return "share_patent_list";
	}
	
	@RequestMapping(path="/friendShareList", method=RequestMethod.GET)
	public String getFriendsSharedPatents(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<SharePatent> sharePatents = sharePatentService.getFriendsSharedPatents(userId);
		model.addAttribute("sharePatents", sharePatents);
		return "share_patent_list";
	}
}
