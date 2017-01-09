package com.lotut.pms.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.BrandManagementService;
import com.lotut.pms.service.BrandNoticeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/brandNotice")
public class BrandNoticeController {
	private BrandNoticeService brandNoticeService;
	private FriendService friendService;
	private BrandManagementService brandManagementService;
	
	@Autowired
	public BrandNoticeController(BrandNoticeService brandNoticeService,FriendService friendService,BrandManagementService brandManagementService) {
		this.brandNoticeService = brandNoticeService;
		this.friendService=friendService;
		this.brandManagementService=brandManagementService;
	}
	
	@RequestMapping(path="getBrandNoticeList")
	public String getBrandNoticeList(HttpSession session,Page page,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		int totalCount = brandNoticeService.getUserBrandNoticeCount(userId);
		List<BrandNotice> notices = brandNoticeService.getUserBrandNoticeList(page);
		page.setTotalRecords(totalCount);
		model.addAttribute("notices",notices);
		model.addAttribute("page",page);
		return "brand_notice_list";
	}
	
	@RequestMapping(path = "showFriends", method = RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "brand_select_friends";
	}
	
	@RequestMapping(path = "searchFriends", method = RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword") String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "brand_notice_select_friends";
	}
	
	@RequestMapping(path = "/addBrandNoticeShares", method = RequestMethod.GET)
	public String shareBrandManagements(@RequestParam("brands") List<Integer> brandManagementIds,
			@RequestParam("friends") List<Integer> friendIds) {
		List<Map<String, Integer>> userBrandManagementRecords = new ArrayList<>();
		for (int brandManagementId : brandManagementIds) {
			for (int friendId : friendIds) {
				Map<String, Integer> userBrandManagementRecord = new HashMap<String, Integer>();
				userBrandManagementRecord.put("user", friendId);
				userBrandManagementRecord.put("brand", brandManagementId);
				userBrandManagementRecords.add(userBrandManagementRecord);
			}
		}
		brandManagementService.insertUserBrandManagements(userBrandManagementRecords);
		return "brand_notice_list";
	}
}
