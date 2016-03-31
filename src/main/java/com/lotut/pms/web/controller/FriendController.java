package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/friend")
public class FriendController {
	private FriendService friendService;
	private UserService userSerivce;
	
	public FriendController() {
	}
	
	@Autowired
	public FriendController(FriendService friendService, UserService userSerivce) {
		this.friendService = friendService;
		this.userSerivce = userSerivce;
	}

	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getUserFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> userFriends = friendService.getUserFriends(userId);
		model.addAttribute("friends", userFriends);
		return "friend_list";
	}
	
	@RequestMapping(path="/delete/{friendId:\\d+}", method=RequestMethod.GET)
	public String deleteFriend(@PathVariable int friendId) {
		int userId = PrincipalUtils.getCurrentUserId();
		friendService.deleteFriend(userId, friendId);
		return "redirect:/friend/list.html";
	}	
	
	@RequestMapping(path="/searchForm", method=RequestMethod.GET)
	public String showSearchForm(Model model) {
		List<User> users = userSerivce.getAllUsers();
		model.addAttribute("friends", users);
		return "friend_search_from";
	}
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchFriends(@RequestParam(name="keyword") String keyword, Model model) {
		List<User> resultFriends = friendService.searchFriends(keyword);
		model.addAttribute("friends", resultFriends);
		return "friend_search_from";
	}	
	
	@RequestMapping(path="/request", method=RequestMethod.GET)
	public String sendFriendRequst(@RequestParam(name="toUser") int toUserId, Model model) {
		int fromUserId = PrincipalUtils.getCurrentUserId();
		friendService.sendFriendRequst(fromUserId, toUserId);
		return "friend_search_from";
	}	
	
	@RequestMapping(path="/request/list", method=RequestMethod.GET)
	public String getFriendRequests(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friendRequests = friendService.getFriendRequests(userId);
		model.addAttribute("friendRequests", friendRequests);
		return "friend_request_list";
	}		
	
	@RequestMapping(path="/request/process", method=RequestMethod.GET)
	public String processFriendRequest(@RequestParam(name="requestUser") int requestUserId, @RequestParam(name="processStatus") int processStatus, Model model) {
		int processUserId = PrincipalUtils.getCurrentUserId();
		friendService.processFriendRequest(processUserId, requestUserId, processStatus);
		return "friend_request_list";
	}	

}
