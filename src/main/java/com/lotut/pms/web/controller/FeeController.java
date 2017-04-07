package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import com.lotut.pms.domain.Fee;
import com.lotut.pms.domain.FeeSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FeeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/fee")
public class FeeController {
	private FeeService feeService;
	private PatentService patentService;
	private FriendService friendService;
	
	@Autowired
	public FeeController(FeeService feeService,PatentService patentService,FriendService friendService) {
		this.feeService = feeService;
		this.patentService=patentService;
		this.friendService=friendService;
	}

	/*
	 * 批量缴费
	 */	
	@RequestMapping(path="/batchGrabFees", method=RequestMethod.GET)
	public String batchGrabFees(int hostPort,@RequestParam("patents")List<Long> patentIds, Model model) {
		Map<String, List<?>> grabResultMap = feeService.batchGrabFees(hostPort,patentIds);
		model.addAllAttributes(grabResultMap);
		return "batch_fee_list";
	}	
	
	/*
	 * 单个缴费
	 */		
	@RequestMapping(path="/grabFees", method=RequestMethod.GET)
	public String grabFees(int hostPort,@RequestParam("patent")long patentId, Model model) {
		Map<String, Object> grabResultMap = feeService.grabFees(hostPort,patentId);
		model.addAllAttributes(grabResultMap);
		return "fee_list";
	}	

	/*
	 * 单个修改监控
	 */
	@RequestMapping(path="/changeMonitorStatus", method=RequestMethod.GET)
	public String changeMonitorStatus(@RequestParam("fees")List<Long> feeIds, @RequestParam("monitorStatus")int monitorStatus,Model model) {
		List<Fee> fees=feeService.changeMonitorStatus(feeIds, monitorStatus);
			model.addAttribute("fees", fees);
			return "fee_list_without_grab";
	}
	
	/*
	 * 批量修改监控
	 */
	@RequestMapping(path="/batchChangeMonitorStatus", method=RequestMethod.GET)
	public String batchChangeMonitorStatus(@RequestParam("fees")List<Long> feeIds,@RequestParam("patents")List<Long> patents, @RequestParam("monitorStatus")int monitorStatus,Model model) {
		List<Fee> fees=feeService.batchChangeMonitorStatus(feeIds, patents,monitorStatus);
		model.addAttribute("fees", fees);
		return "batch_fee_list_withou_grap";
	}
	
	@RequestMapping(path="/list", method=RequestMethod.GET)
	public ModelAndView getFeeList() {
		return null;
	}
	//CS:分页
	@RequestMapping(path="/monitoredFeeList", method=RequestMethod.GET)
	public String getMonitoredFees(Model model, Page page,HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setPageSize(WebUtils.getPageSize(session));
		page.setUserId(userId);
		int totalCount=(int)feeService.getUserMonitoredFeesCounts(userId);
		page.setTotalRecords(totalCount);
		List<Fee> fees = feeService.getUserMonitoredFeesByPage(page);
		Map<String,Map<String,String>> patentTypeCount=feeService.getMonitoredFeesByType(userId);
		Map<String,Map<String,String>> feePaymentStatusCount=feeService.getMonitoredFeesByStatus(userId);
		Map<String,Map<String,String>> patentStatusCount=feeService.getMonitoredFeesByFeeType(userId);
		Map<String,Long> deadlineMonitor=feeService.getCountByDeadlinePayment(userId);
		long totalFeeCount=feeService.getFeeAllCountByUser(userId);
		long unpaidFeeCount=feeService.getUnPaidCountByUser(userId);
		model.addAttribute("patentTypeCount", patentTypeCount);
		model.addAttribute("feePaymentStatusCount", feePaymentStatusCount);
		model.addAttribute("patentStatusCount", patentStatusCount);
		model.addAttribute("page", page);
		model.addAttribute("fees", fees);
		model.addAttribute("totalFeeCount",totalFeeCount);
		model.addAttribute("unpaidFeeCount",unpaidFeeCount);
		model.addAttribute("deadlineMonitor",deadlineMonitor);
		return "monitored_fee_list";
	}	
	
	//CS:搜索分页
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserMonitoredFees(@ModelAttribute("searchCondition")FeeSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		if(page.getCurrentPage()==0){
			page.setCurrentPage(1);
		}
		List<Fee> fees = feeService.searchUserMonitoredFeesByPage(searchCondition);
		int totalCount=(int)feeService.searchUserMonitoredFeesCount(searchCondition);
		page.setTotalRecords(totalCount);
		Map<String,Map<String,String>> patentTypeCount=feeService.getMonitoredFeesByType(searchCondition.getUserId());
		Map<String,Map<String,String>> feePaymentStatusCount=feeService.getMonitoredFeesByStatus(searchCondition.getUserId());
		Map<String,Map<String,String>> patentStatusCount=feeService.getMonitoredFeesByFeeType(searchCondition.getUserId());
		Map<String,Long> deadlineMonitor=feeService.getCountByDeadlinePayment(PrincipalUtils.getCurrentUserId());
		long totalFeeCount=feeService.getFeeAllCountByUser(PrincipalUtils.getCurrentUserId());
		long unpaidFeeCount=feeService.getUnPaidCountByUser(PrincipalUtils.getCurrentUserId());
		model.addAttribute("patentTypeCount", patentTypeCount);
		model.addAttribute("feePaymentStatusCount", feePaymentStatusCount);
		model.addAttribute("patentStatusCount", patentStatusCount);
		model.addAttribute("fees", fees);
		model.addAttribute("page", page);
		model.addAttribute("totalFeeCount",totalFeeCount);
		model.addAttribute("unpaidFeeCount",unpaidFeeCount);
		model.addAttribute("deadlineMonitor",deadlineMonitor);
		return "monitored_fee_list";	
	}
	
	
	
	@RequestMapping(path="/changeInvoiceTitle", method=RequestMethod.GET)
	public String changeInvoiceTitle(@RequestParam("fees")List<Long> feeIds, @RequestParam("invoiceTitle")String invoiceTitle) {
		feeService.changeFeesInvoiceTitle(feeIds, invoiceTitle);
		return "monitored_fee_list";
	}
	
	@RequestMapping(path="/exportFees", method=RequestMethod.GET)
	public void exportFees(@RequestParam("fees")List<Long> feeIds, HttpServletResponse response) throws IOException {
		User user = PrincipalUtils.getCurrentPrincipal();
		String exportExcelName = user.getUsername() + System.currentTimeMillis() + ".xls";
		exportFeeExcelFile(feeIds, response, exportExcelName);
	}
	
	@RequestMapping(path="/exportOrderFees", method=RequestMethod.GET)
	public void exportFees(@RequestParam("fees")List<Long> feeIds, @RequestParam("orderId")long orderId, HttpServletResponse response) throws IOException {
		User user = PrincipalUtils.getCurrentPrincipal();
		String exportExcelName = user.getUsername() + orderId + ".xls";
		exportFeeExcelFile(feeIds, response, exportExcelName);
	}
	
	private void exportFeeExcelFile(List<Long> feeIds, HttpServletResponse response, String exportExcelName) throws IOException {
		response.setContentType("application/vnd.ms-excel");
		
		String exportExcelPath = feeService.generateFeeExportExcel(feeIds, exportExcelName);
		
		File excelFile = new File(exportExcelPath);
		response.setContentLength((int)excelFile.length());
		response.setHeader("Content-Disposition", "attachment;filename=" + exportExcelName);
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

		int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream(); 
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(excelFile))) {
			int bytesRead = -1;
			while ((bytesRead = bis.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
		}
	}
	
	@RequestMapping(path="/exportFeesAllMessage", method=RequestMethod.GET)
	public void exportFeesAllMessage(@RequestParam("fees")List<Long> feeIds, HttpServletResponse response) throws IOException {
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

		User user = PrincipalUtils.getCurrentPrincipal();
		String exportExcelName = user.getUsername() + System.currentTimeMillis() + ".xls";
		String exportExcelPath = feeService.FeeExportExcel(feeIds, exportExcelName);
		File excelFile = new File(exportExcelPath);
		response.setContentLength((int)excelFile.length());
		response.setHeader("Content-Disposition", "attachment;filename=" + exportExcelName);
		
		int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream(); 
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(excelFile))) {
			int bytesRead = -1;
			while ((bytesRead = bis.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
		}
	}
	@RequestMapping(path="/delete", method=RequestMethod.GET)
	public ModelAndView deleteFee() {
		return null;
	}		
	
	/*
	 * deleteFees
	 */
		@RequestMapping(path="/deleteFees", method=RequestMethod.GET)
		public String deleteFees(@RequestParam("fees")List<Long> feeIds,Page page,HttpSession session,Model model) {
			int userId = PrincipalUtils.getCurrentUserId();
			feeService.deleteFees(feeIds, userId);
			return "redirect:/fee/monitoredFeeList.html?currentPage=1";
		}
		
		@RequestMapping(path="/addFeeFrom", method=RequestMethod.GET)
		public String addFeeFrom(Model model){
			int userId = PrincipalUtils.getCurrentUserId();
			List<Patent> patents=patentService.getUserPatentsWithFee(userId);
			List<PatentType> allPatentTypes = patentService.getAllPatentTypes();
			model.addAttribute("patents",patents);
			model.addAttribute("allPatentTypes",allPatentTypes);
			return "addFeeFrom";
		}
		
		@RequestMapping(path="/getPatentByPatentId", method=RequestMethod.GET)
		public void getPatentByPatentId(@RequestParam("appNo")String appNo, 
				Model model, HttpServletResponse response) throws IOException {
			response.setContentType("application/json;charset=UTF-8");
			int userId=PrincipalUtils.getCurrentUserId();
			Patent patent=patentService.getPatentsByAppNo(userId,appNo);
			List<String> feeTypes=feeService.getFeeTypes(appNo); 
			Map<String, Object> map = new HashMap<>();
			map.put("patent", patent);
			map.put("feeTypes", feeTypes);
			WebUtils.writeJsonStrToResponse(response, map);
		}
		
		@RequestMapping(path="/addFee", method=RequestMethod.POST)
		public String addFee(String appNo,int patentType,String name,String appPerson,@ModelAttribute("fee")Fee fee,Model model){
			User user = PrincipalUtils.getCurrentPrincipal();			
			Long patentId=patentService.getPatentIdByAppNo(user.getUserId(),appNo);
			if(patentId == null){
				Patent patent = new Patent(appNo,name,appPerson,patentType);
				patent.setOwnerId(user.getUserId());
				patentService.addPatent(patent);
				patentId = patent.getPatentId();
			}
			fee.setOwner(user);
			fee.setPatent(new Patent(patentId));
			feeService.saveFee(fee);						
			return "add_fee_success";
		}
		
		
		@RequestMapping(path="/getFeeTypesByPatentType", method=RequestMethod.GET)
		public void getFeeTypesByPatentType(int patentTypeId, 
				Model model, HttpServletResponse response) throws IOException {
			response.setContentType("application/json;charset=UTF-8");
			List<String> feeTypes=feeService.getFeeTypesByPatentType(patentTypeId); 
			Map<String, Object> map = new HashMap<>();
			map.put("feeTypes", feeTypes);
			WebUtils.writeJsonStrToResponse(response, map);
		}
		
		@RequestMapping(path="showFriends", method=RequestMethod.GET)
		public String showFriends(Model model) {
			int userId = PrincipalUtils.getCurrentUserId();
			List<User> friends = friendService.getUserFriends(userId);
			model.addAttribute("friends", friends);
			return "fee_select_friends";
		}
		
		@RequestMapping(path="searchFriends", method=RequestMethod.GET)
		public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
			int userId = PrincipalUtils.getCurrentUserId();
			List<User> friends = friendService.searchUserFriends(userId, keyword);
			model.addAttribute("friends", friends);
			return "fee_select_friends";
		}	
		
		@RequestMapping(path="/addShares", method=RequestMethod.GET)
		public String sharePatents(@RequestParam("fees")List<Long> fees, @RequestParam("friends")List<Long> friendIds) {
			feeService.insertUserFees(fees,friendIds);
			return "fee_list";
		}

}
