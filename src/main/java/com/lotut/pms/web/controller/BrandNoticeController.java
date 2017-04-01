package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.DocumentException;
import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.BrandCategory;
import com.lotut.pms.domain.BrandLegalStatus;
import com.lotut.pms.domain.BrandNotice;
import com.lotut.pms.domain.BrandNoticeRemark;
import com.lotut.pms.domain.BrandNoticeSearchCondition;
import com.lotut.pms.domain.BrandNoticeType;
import com.lotut.pms.domain.BrandNoticeTypeCount;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.BrandManagementService;
import com.lotut.pms.service.BrandNoticeService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.FileOption;
import com.lotut.pms.web.util.WebUtils;

/*
                   _ooOoo_
                  o8888888o
                  88" . "88
                  (| -_- |)
                  O\  =  /O
               ____/`---'\____
             .'  \\|     |//  `.
            /  \\|||  :  |||//  \
           /  _||||| -:- |||||-  \
           |   | \\\  -  /// |   |
           | \_|  ''\---/''  |   |
           \  .-\__  `-`  ___/-. /
         ___`. .'  /--.--\  `. . __
      ."" '<  `.___\_<|>_/___.'  >'"".
     | | :  `- \`.;`\ _ /`;.`/ - ` : | |
     \  \ `-.   \_ __\ /__ _/   .-` /  /
======`-.____`-.___\_____/___.-`____.-'======
                   `=---='
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         佛祖保佑       永无BUG
    @author	CaiWei
*/

@Controller
@RequestMapping(path="/brandNotice")
public class BrandNoticeController {
	private BrandNoticeService brandNoticeService;
	private BrandManagementService brandManagementService;
	private FriendService friendService;
	@Autowired
	public BrandNoticeController(BrandNoticeService brandNoticeService,BrandManagementService brandManagementService,FriendService friendService) {
		this.brandNoticeService = brandNoticeService;
		this.brandManagementService=brandManagementService;
		this.friendService=friendService;
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
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_notice_list";
	}
	
	
	@RequestMapping(path="/downloadUserNotice")
	public void downloadUserNotice(@RequestParam("noticeIds") List<Integer> noticeIds,HttpServletResponse response) throws Exception{
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");
		response.setContentType("application/vnd.ms-excel");
		String excelName = PrincipalUtils.getCurrentPrincipal().getUsername() + System.currentTimeMillis() +".xls";
		String excelNoticePath = brandNoticeService.exportNoticeExcel(noticeIds,excelName);
		response.setHeader("Content-Disposition", "attachment;filename=" + excelName);
		
		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte [BUFFER_SIZE];
		
		try(OutputStream out =response.getOutputStream();
			BufferedInputStream  in = new BufferedInputStream(new FileInputStream(excelNoticePath))	
			){
			int byteRead = -1;
			while((byteRead = in.read(buffer))!=-1){
				out.write(buffer,0,byteRead);
			}
			out.flush();
			out.close();
			in.close();
		}
	}
	
	@RequestMapping(path="/getBrandNoticeRemark")
	public String getBrandNoticeReamrk(long brandNoticeId,Model model){
		List<BrandNoticeRemark> remarks = brandNoticeService.getBrandNoticeListByNoticeId(brandNoticeId);
		model.addAttribute("remarks",remarks);
		model.addAttribute("brandNoticeId",brandNoticeId);
		return "brand_notice_remarks";
	}
	
	@RequestMapping(path="/saveBrandNoticeReamrk")
	public void saveBrandNoticeReamrk(@ModelAttribute BrandNoticeRemark brandNoticeRemark,Model model,PrintWriter pw){
		User user = PrincipalUtils.getCurrentPrincipal();
		brandNoticeRemark.setUser(user);
		brandNoticeService.saveBrandNoticeRemark(brandNoticeRemark);
		pw.write("success");
	}
	
	@RequestMapping(path="/batchChangeBrandNoticeViewStatus", method=RequestMethod.GET)
	public void batchChangeBrandNoticeViewStatus(@RequestParam("notices")List<Long> noticeIdList,PrintWriter pw) {
		int userId = PrincipalUtils.getCurrentUserId();
		brandNoticeService.batchChangeBrandNoticeViewStatus(noticeIdList, userId);
		pw.write("success");
	}
	
	@RequestMapping(path = "/searchBrandNotice", method = RequestMethod.GET)
	public String searchBrandNotice(@ModelAttribute("searchCondition") BrandNoticeSearchCondition searchCondition, HttpSession session,
			Model model) {
		Page page = searchCondition.getPage();
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount = brandNoticeService.searchBrandNoticeCountByPage(searchCondition);
		page.setTotalRecords(totalCount);
		List<BrandNotice> notices = brandNoticeService.searchUserBrandNoticeByPage(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("notices",notices);
		model.addAttribute("page", page);
		addBrandCategoryAndBrandLegalStatusToModel(model);
		return "brand_notice_list";
	}
	

	@RequestMapping(path="/batchAddStarTargetMonitor")
	public void batchAddStarTargetMonitor(@RequestParam("noticeIds") List<Long> noticeIds,PrintWriter pw){
		brandNoticeService.batchUpdateStarTargetStatus(noticeIds);
		String message = "操作成功";
		pw.write(message);
	}
	
	@RequestMapping(path="batchCancelStarTargetMonitor")
	public void batchCancelStarTargetMonitor(@RequestParam("noticeIds") List<Long> noticeIds,PrintWriter pw){
		brandNoticeService.batchCancelStarTargetStatus(noticeIds);
		String message = "操作成功";
		pw.write(message);
	}
	

	private void addBrandCategoryAndBrandLegalStatusToModel(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<BrandCategory> categorys = brandManagementService.getAllBrandCategory();
		List<BrandLegalStatus> allBrandLegalStatus = brandManagementService.getAllBrandLegalStatus();
		List<BrandNoticeType> noticeTypes= brandNoticeService.getBrandNoticeTypes();
		List<BrandNoticeTypeCount> noticeTypeCounts=brandNoticeService.getBrandNoticeCountByNoticeType(userId);
		int allNoticeCount=brandNoticeService.getAllBrandNoticeCountByUserId(userId);
		model.addAttribute("categorys", categorys);
		model.addAttribute("allBrandLegalStatus", allBrandLegalStatus);
		model.addAttribute("noticeTypes", noticeTypes);
		model.addAttribute("noticeTypeCounts", noticeTypeCounts);
		model.addAttribute("allNoticeCount", allNoticeCount);
	}
	
	@RequestMapping(path="/showNoticeUploadForm")
	public String showNoticeUploadForm(int brandId, Model model){
		List<BrandNoticeType> noticeTypes = brandNoticeService.getBrandNoticeTypes();
		model.addAttribute("brandId", brandId);
		model.addAttribute("noticeTypes", noticeTypes);
		return "brand_notice_upload";
    }
	
	@RequestMapping(path="/uploadBrandNoticeFile")
	public void uploadBrandNoticeFile(MultipartFile file,HttpServletResponse response) throws IOException, DocumentException{
    	String fatherPath=Settings.BRAND_MANAGEMENT_NOTICE_PATH;
    	String saveUrl=fatherPath.substring(Settings.BRAND_MANAGEMENT_PATH.length()-1);
    	int userId=PrincipalUtils.getCurrentUserId();
    	FileOption.brandManagementNoticeFileOption(userId, file, fatherPath, response,saveUrl);
    }
	
	@RequestMapping(path="/saveBrandNotice")
	public String saveBrandNotice(@ModelAttribute("brandNotice") BrandNotice brandNotice,Model model,PrintWriter pw){
		brandNoticeService.saveBrandNotice(brandNotice);
		return "redirect:/brandNotice/getBrandNoticeList.html";
	}
	
	@RequestMapping(path="/noticeStarTargetList", method=RequestMethod.GET)
	public String noticeStarTargetList(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		if(page.getCurrentPage()<1){
			page.setCurrentPage(1);
		}
		Map<String,Map<String,String>> remainDayCount=brandNoticeService.getUserStarTargetNoticeCountByRemainDay(userId);
		List<BrandNotice> userNotices = brandNoticeService.getUserStarTargetNoticesByPage(page);
		int totalCount=(int)brandNoticeService.getUserStarTargetNoticesCount(userId);
		page.setTotalRecords(totalCount);
		
		//int unreadNoticeCount=brandNoticeService.unreadNoticeCount(userId);
		User user=PrincipalUtils.getCurrentPrincipal();
		model.addAttribute("notices", userNotices);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		//model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		model.addAttribute("user",user);
		//addSearchTypesDataToModel(model);
		return "brand_notice_star_target";
	}
	
	@RequestMapping(path="/searchStarTarget", method=RequestMethod.GET)
	public String searchStarTarget(@ModelAttribute("searchCondition")NoticeSearchCondition searchCondition, Model model,HttpSession session) throws Exception {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<BrandNotice> resultNotices = brandNoticeService.searchUserStarTargetNoticesByPage(searchCondition);
		Map<String,Map<String,String>> remainDayCount=brandNoticeService.getUserStarTargetNoticeCountByRemainDay(searchCondition.getUserId());
		int totalCount=(int)brandNoticeService.searchUserStarTargetNoticesCount(searchCondition);
		
		//int unreadNoticeCount=brandNoticeService.unreadNoticeCount(searchCondition.getUserId());
		
		page.setTotalRecords(totalCount);
		model.addAttribute("notices", resultNotices);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		//model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		//addSearchTypesDataToModel(model);
		return "brand_notice_star_target";
	}
	
	@RequestMapping(path="/downloadBrandNotice")
	public void downloadBrandNotice(long noticeId,HttpServletResponse response ) throws IOException{
		String noticePDFUrl = brandNoticeService.getzipFileNameById(noticeId);
		noticePDFUrl = noticePDFUrl.substring(0, noticePDFUrl.lastIndexOf("."));
		String filePath = Settings.BRAND_MANAGEMENT_PATH+noticePDFUrl;
		response.setContentType("application/pdf");
		String filename = noticePDFUrl.substring(noticePDFUrl.lastIndexOf("/")+1).toLowerCase();
		response.setHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes("utf-8"),"iso-8859-1"));
		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte [BUFFER_SIZE];
		int byteRead = -1;
		
		try(OutputStream out = response.getOutputStream();
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(filePath))){
			while((byteRead=in.read(buffer))!= -1){
				out.write(buffer,0,byteRead);
			}
			out.flush();
			out.close();
			in.close();
		}
	}
	
	@RequestMapping(path="/previewBrandNotice")
	public void previewBrandNotice(long noticeId,HttpServletResponse response ) throws IOException{
		String noticePDFUrl = brandNoticeService.getzipFileNameById(noticeId);
		noticePDFUrl = noticePDFUrl.substring(0, noticePDFUrl.lastIndexOf("."));
		String filePath = Settings.BRAND_MANAGEMENT_PATH+noticePDFUrl;
		response.setContentType("application/pdf");
		final int BUFFER_SIZE = 8192;
		byte[] buffer = new byte [BUFFER_SIZE];
		int byteRead = -1;
		
		try{
			try(OutputStream out = response.getOutputStream();
					BufferedInputStream in = new BufferedInputStream(new FileInputStream(filePath))){
				while((byteRead=in.read(buffer))!= -1){
					out.write(buffer,0,byteRead);
				}
				out.flush();
				out.close();
				in.close();
			}}
		catch(Exception e){
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.write("<html><head><title>通知书预览</title></head><body><h1>没有可预览的通知书</h1></body></html>");
			out.flush();
			out.close();
 		}
	}
	
	public static void main(String[] args) {
		String noticePDFUrl = "/notice/2/《诛仙》全集.pdf.html";
		noticePDFUrl = noticePDFUrl.substring(0, noticePDFUrl.lastIndexOf("."));
		String filename = noticePDFUrl.substring(noticePDFUrl.lastIndexOf("/")+1).toLowerCase();
		System.out.println(filename);
		
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
		return "brand_select_friends";
	}

	@RequestMapping(path = "/addBrandManagementShares", method = RequestMethod.GET)
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
