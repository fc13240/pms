package com.lotut.pms.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lotut.pms.service.ShareInventorService;


@Controller
@RequestMapping(path="/shareInventor")
public class ShareInventorController {
	private ShareInventorService shareInventorService;
	
	@Autowired
	public ShareInventorController(ShareInventorService shareInventorService) {
		this.shareInventorService = shareInventorService;
	}
	
	@RequestMapping(path="/addShares", method=RequestMethod.GET)
	public String shareInventors(@RequestParam("inventors")List<Integer> inventorIds, @RequestParam("friends")List<Integer> friendIds) {
		
		List<Map<String, Integer>> userInventorRecords = new ArrayList<>();
		for (int inventorId: inventorIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> userInventorRecord =  new HashMap<String, Integer>();
				userInventorRecord.put("user", friendId);
				userInventorRecord.put("inventor", inventorId);
				userInventorRecords.add(userInventorRecord);
			}
		}
		
		shareInventorService.insertUserInventors(userInventorRecords);
		return "app_person_list";
	}


//	@RequestMapping(path="/list", method=RequestMethod.GET)
//	public String getshareInventors(Model model) {
//		int userId = PrincipalUtils.getCurrentUserId();
//		List<shareInventor> shareInventors = shareInventorService.getUserSharedinventors(userId);
//		model.addAttribute("shareInventors", shareInventors);
//		return "share_inventor_list";
//	}
//	
//	@RequestMapping(path="/friendShareList", method=RequestMethod.GET)
//	public String getFriendsSharedinventors(Model model) {
//		int userId = PrincipalUtils.getCurrentUserId();
//		List<shareInventor> shareInventors = shareInventorService.getFriendsSharedinventors(userId);
//		model.addAttribute("shareInventors", shareInventors);
//		return "share_inventor_list";
//	}
}
