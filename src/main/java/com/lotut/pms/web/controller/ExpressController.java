package com.lotut.pms.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Express;
import com.lotut.pms.domain.ExpressSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.ExpressService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/express")
public class ExpressController {
	private ExpressService expressService;
	private FriendService friendService;
	private UserService userService;
	
	@Autowired
	public ExpressController(ExpressService expressService, FriendService friendService,UserService userService) {
		this.expressService = expressService;
		this.friendService = friendService;
		this.userService = userService;
	}	
	
	@RequestMapping(path="/addExpressForm", method=RequestMethod.GET)
	public String addExpressForm(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<Map<String, String>> provinces = userService.getAllProvinces();
		List<User> userFriends = friendService.getUserFriends(userId);
		model.addAttribute("provinces", provinces);
		model.addAttribute("userFriends", userFriends);
		return "express_add";
	}
	
	@RequestMapping(path="/addExpress", method=RequestMethod.POST)
	public String addExpress(@ModelAttribute Express express,Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		User sender = new User();
		sender.setUserId(userId);
		express.setSender(sender);
		expressService.addExpress(express);
		
		List<Map<String, String>> provinces = userService.getAllProvinces();
		List<User> userFriends = friendService.getUserFriends(userId);
		model.addAttribute("provinces", provinces);
		model.addAttribute("userFriends", userFriends);
		return "express_add";
		
	}
	
	@RequestMapping(path="/confirmSendOff", method=RequestMethod.GET)
	public void confirmSendOff(Express express,Model model) {
		expressService.confirmSendOff(express);
	}
	
	
	@RequestMapping(path="/getUserSenderExpressList", method=RequestMethod.GET)
	public String getUserSenderExpressList(Model model,HttpSession session ,Page page) {
		
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=expressService.getUserSenderExpressCount(userId);
		page.setTotalRecords(totalCount);
		List<Express> expressResult = expressService.getUserSenderExpressListByPage(page);
		model.addAttribute("express", expressResult);
		return "express_sender_list";
	}
	
	@RequestMapping(path="/getUserReceiverExpressList", method=RequestMethod.GET)
	public String getUserReceiverExpressList(Model model,HttpSession session ,Page page) {
		
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=expressService.getUserReceiverExpressCount(userId);
		page.setTotalRecords(totalCount);
		List<Express> expressResult = expressService.getUserReceiverExpressListByPage(page);
		model.addAttribute("express", expressResult);
		return "express_receiver_list";
	}
	@RequestMapping(path="/getContactAddress")
	public void getContactAddress(Model model,int userId,HttpServletResponse response) throws IOException{
		List<ContactAddress> contactAddresses = userService.getUserContactAddresses(userId);
		WebUtils.writeJsonStrToResponse(response, contactAddresses);
	}
	@RequestMapping(path="/loadContact")
	public void loadContact(Model model,int receiverId,HttpServletResponse response) throws IOException{
		ContactAddress contactAddresses = expressService.getUserContactAddressById(receiverId);
		WebUtils.writeJsonStrToResponse(response, contactAddresses);
	}
	
	@RequestMapping(path="/changeExpressStatus", method=RequestMethod.POST)
	public void changeExpressStatus(@RequestParam("expressId")long expressId,@RequestParam("expressStatus")int expressStatus,PrintWriter out) {
		expressService.changeExpressStatus(expressId, expressStatus);
		out.write(1);
	}
	
	@RequestMapping(path="/searchSenderExpress", method=RequestMethod.GET)
	public String searchSenderExpress(@ModelAttribute("searchCondition")ExpressSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Express> expressResult = expressService.searchUserSenderExpressByPage(searchCondition);
		int totalCount=(int)expressService.searchUserSenderExpressCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("express", expressResult);
		model.addAttribute("page", page);
		return "express_sender_list";
	}
	
	@RequestMapping(path="/searchReceiverExpress", method=RequestMethod.GET)
	public String searchReceiverExpress(@ModelAttribute("searchCondition")ExpressSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Express> expressResult = expressService.searchUserReceiverExpressByPage(searchCondition);
		int totalCount=(int)expressService.searchUserReceiverExpressCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("express", expressResult);
		model.addAttribute("page", page);
		return "express_receiver_list";
	}
	
}
