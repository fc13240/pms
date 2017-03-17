package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Notice;
import com.lotut.pms.domain.NoticePaperApplyType;
import com.lotut.pms.domain.NoticeProcessStatus;
import com.lotut.pms.domain.NoticeRemark;
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.NoticeService;
import com.lotut.pms.service.PatentService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;

@Controller
@RequestMapping(path="/notice")
public class NoticeController {
	private NoticeService noticeService;
	private PatentService patentService;
	private FriendService friendService;
	
	@Autowired
	public NoticeController(NoticeService noticeService, PatentService patentService,FriendService friendService) {
		this.noticeService = noticeService;
		this.patentService = patentService;
		this.friendService = friendService;
	}

	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getNoticeList(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<Integer,Map<String,Long>> patentTypeCount=noticeService.getUserNoticeCountByType(userId);
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(userId);
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(userId);
		Map<String, Map<String, String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(userId);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserNoticeCountByRemainDay(userId);
		List<Notice> userNotices = noticeService.getUserNoticesByPage(page);
		int totalCount=(int)noticeService.getUserNoticesCount(userId);
		page.setTotalRecords(totalCount);
		int unreadNoticeCount=noticeService.unreadNoticeCount(userId);
		User user=PrincipalUtils.getCurrentPrincipal();
		model.addAttribute("notices", userNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		model.addAttribute("user",user);
		addSearchTypesDataToModel(model);
		return "notice_list";
	}

	
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserNotices(@ModelAttribute("searchCondition")NoticeSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Notice> resultNotices = noticeService.searchUserNoticesWithPage(searchCondition);
		Map<Integer,Map<String,Long>> patentTypeCount=noticeService.getUserNoticeCountByType(searchCondition.getUserId());
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(searchCondition.getUserId());
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(searchCondition.getUserId());
		Map<String,Map<String,String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(searchCondition.getUserId());
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserNoticeCountByRemainDay(searchCondition.getUserId());
		int totalCount=(int)noticeService.searchUserNoticesCount(searchCondition);
		int unreadNoticeCount=noticeService.unreadNoticeCount(searchCondition.getUserId());
		page.setTotalRecords(totalCount);
		model.addAttribute("notices", resultNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		addSearchTypesDataToModel(model);
		return "notice_list";
	}	
	
	
	@RequestMapping(path="/preview", method=RequestMethod.GET)
	public void previewNotice(@RequestParam("notice")int noticeId, HttpServletResponse response) throws IOException {
		List<Long> noticeIdList=new ArrayList<Long>();
		noticeIdList.add(new Long(noticeId));
		int userId=PrincipalUtils.getCurrentUserId();
		noticeService.batchChangeNoticeViewStatus(noticeIdList,userId);
		try {
			response.setContentType("application/pdf");
			Path pdfPath = noticeService.createPdfIfNeeded(noticeId);
			response.setContentLength((int)pdfPath.toFile().length());
			int BUFFER_SIZE = 8192;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = response.getOutputStream(); 
					FileInputStream fis = new FileInputStream(pdfPath.toFile())) {
				int bytesRead = -1;
				while ((bytesRead = fis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
			}
		} catch (Exception e) {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.write("<html><head><title>通知书预览</title></head><body><h1>没有可预览的通知书</h1></body></html>");
			out.flush();
		}
		
	}
	
	@RequestMapping(path="/download", method=RequestMethod.GET)
	public void downloadNotice(@RequestParam("notice")int noticeId, HttpServletResponse response,HttpServletRequest request) throws IOException {
		List<Long> noticeIdList=new ArrayList<Long>();
		noticeIdList.add(new Long(noticeId));
		int userId=PrincipalUtils.getCurrentUserId();
		noticeService.batchChangeNoticeViewStatus(noticeIdList,userId);
		
		response.setContentType("application/zip");
		
		Notice notice = noticeService.getNoticeById(noticeId);
		ZipFile noticeZipFile = noticeService.createNoticeZipFile(notice);
		String dispatchDate = new SimpleDateFormat("yyyy-MM-dd").format(notice.getDispatchDate());
		String downloadFileName = dispatchDate + URLEncoder.encode(notice.getName(), "UTF8") + 
				notice.getPatent().getAppNo() + URLEncoder.encode(notice.getPatent().getName(), "UTF8");
		
		
		if("FF".equals(getBrowser(request))){
		    //针对火狐浏览器处理
			downloadFileName =dispatchDate+ new String(notice.getName().getBytes("UTF-8"),"iso-8859-1")+
					notice.getPatent().getAppNo()+new String(notice.getPatent().getName().getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName + ".zip");
		response.setContentLength((int)noticeZipFile.getFile().length());
		int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream(); 
				FileInputStream fis = new FileInputStream(noticeZipFile.getFile())) {
			int bytesRead = -1;
			while ((bytesRead = fis.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
		}
	}		
	//通知书处理状态
	@RequestMapping(path="/processNotices", method=RequestMethod.GET)
	public String processNotice(@RequestParam("notices")List<Integer> noticeIdList, @RequestParam("processStatus")int processStatus) {
		noticeService.updateNoticesProcessStatus(noticeIdList, processStatus);
		return "notice_list";
	}		
	
	@RequestMapping(path="/changePaperType", method=RequestMethod.GET)
	public String changeNoticePaperType(@RequestParam("notice")int noticeId, @RequestParam("paperApplyType")int paperApplyType) {
		noticeService.changeNoticePaperApplyType(noticeId, paperApplyType);
		return "notice_list";
	}		
	
	@RequestMapping(path="/showUploadForm", method=RequestMethod.GET)
	public String showUploadForm() {
		return "notice_upload_form";
	}	
	
	@RequestMapping(path="/upload", method=RequestMethod.POST)
	public String uploadNotices(@RequestParam("noticeFile")Part noticeFile, Model model) throws ZipException {
		int userId = PrincipalUtils.getCurrentUserId();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String nowDate = sdf.format(new Date());
		String submmitedName = noticeFile.getSubmittedFileName();
		if (!submmitedName.endsWith(".zip")) {
			throw new ZipException("上传的不是zip压缩包");
		}
		
		String zipFileName = nowDate + userId + ".zip";
		try {
			noticeFile.write(zipFileName);
			String zipFilePath = Settings.TEMP_DIR + zipFileName;
			noticeService.uploadNotices(zipFilePath);
			return "upload_success";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "上传失败，请检查压缩包格式稍后再试!");
			return "common_message";
		}
	}	
	
	private void addSearchTypesDataToModel(Model model) {
		List<PatentType> patentTypes = patentService.getAllPatentTypes();
		List<NoticeProcessStatus> noticeProcessStatus = noticeService.getAllNoticeProcessStatus();
		List<NoticeType> noticeTypes = noticeService.getAllNoticeType();
		List<NoticePaperApplyType> paperApplyTypes = noticeService.getAllNoticePaperApplyType();
		
		int userId = PrincipalUtils.getCurrentUserId();
		Map<String, Integer> noticeDateType = noticeService.getNoticesDateType(userId);
		
		model.addAttribute("patentTypes", patentTypes);
		model.addAttribute("noticeProcessStatus", noticeProcessStatus);
		model.addAttribute("noticeTypes", noticeTypes);
		model.addAttribute("paperApplyTypes", paperApplyTypes);
		model.addAttribute("noticeDateType", noticeDateType);
		System.out.println(noticeDateType);
	}
	
	@RequestMapping(path="/batchChangePaperType", method=RequestMethod.GET)
	public String batchChangeNoticePaperType(@RequestParam("notices")List<Integer> noticeIdList, @RequestParam("paperApplyType")int paperApplyType) {
		noticeService.batchUpdateNoticesNoticePaperType(noticeIdList, paperApplyType);
		return "notice_list";
	}

	private String getBrowser(HttpServletRequest request){
	    String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
	    if(UserAgent!=null){
	        if (UserAgent.indexOf("msie") >=0 ) return "IE";
	        if (UserAgent.indexOf("firefox") >= 0) return "FF";
	    }
	    return null;
	}
	
	
	@RequestMapping(path="/showRemarks", method=RequestMethod.GET)
	public String showRemarks(@RequestParam("noticeId") String noticeId, Model model) {
		List<NoticeRemark> remarks = noticeService.getNoticeRemarks(noticeId);
		model.addAttribute("remarks", remarks);
		model.addAttribute("addNoticeId", noticeId);
		return "notice_remarks";
	}	
	
	@RequestMapping(path="addNoticeRemark", method=RequestMethod.POST)
	public String addNoticeRemark(@RequestParam("noticeId") String noticeId, @RequestParam("content") String content,Model model) {		
		int userId = PrincipalUtils.getCurrentUserId();
		noticeService.addNoticeRemark(noticeId,content,userId);		
		return "notice_remarks";
	}	
	
	@RequestMapping(path="/exportNotices",method=RequestMethod.GET)
	public void exportPatents(@RequestParam("noticeIds") List<Long> noticeIds,HttpServletResponse response) throws IOException{
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

		User user = PrincipalUtils.getCurrentPrincipal();
		String exportExcelName = user.getUsername() + System.currentTimeMillis() + ".xls";
		String exportExcelPath = noticeService.noticeExportExcel(noticeIds, exportExcelName);
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
	
	
	@RequestMapping(path="/batchChangeNoticeViewStatus", method=RequestMethod.GET)
	public String batchChangeNoticeViewStatus(@RequestParam("notices")List<Long> noticeIdList) {
		int userId = PrincipalUtils.getCurrentUserId();
		noticeService.batchChangeNoticeViewStatus(noticeIdList,userId);
		return "notice_list";
	}
	
	
	@RequestMapping(path="/unreadNotice", method=RequestMethod.GET)
	public String unreadNotice(Model model,Page page,HttpSession session) {
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<Integer,Map<String,Long>> patentTypeCount=noticeService.getUserNoticeCountByType(userId);
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(userId);
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(userId);
		Map<String, Map<String, String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(userId);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserNoticeCountByRemainDay(userId);
		List<Notice> userNotices = noticeService.unreadNoticeList(page);
		int totalCount=(int)noticeService.unreadNoticeCount(userId);
		page.setTotalRecords(totalCount);
		int unreadNoticeCount=noticeService.unreadNoticeCount(userId);
		model.addAttribute("notices", userNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","unreadNotice");
		addSearchTypesDataToModel(model);
		return "notice_unread_list";
	}
	
	
	@RequestMapping(path="/changeNoticeReadStatus", method=RequestMethod.GET)
	public void changeNoticeReadStatus(@RequestParam("notices")int noticeId,PrintWriter out) throws IOException{
		List<Long> noticeIdList=new ArrayList<Long>();
		noticeIdList.add(new Long(noticeId));
		int userId=PrincipalUtils.getCurrentUserId();
		noticeService.batchChangeNoticeViewStatus(noticeIdList,userId);
		int totalCount=(int)noticeService.unreadNoticeCount(userId);
		out.write(totalCount+"");
	}
	
	
	@RequestMapping(path="showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "notice_select_friends";
	}
	
	
	@RequestMapping(path="/noticeStarTargetList", method=RequestMethod.GET)
	public String noticeStarTargetList(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserStarTargetNoticeCountByRemainDay(userId);
		List<Notice> userNotices = noticeService.getUserStarTargetNoticesByPage(page);
		int totalCount=(int)noticeService.getUserStarTargetNoticesCount(userId);
		page.setTotalRecords(totalCount);
		int unreadNoticeCount=noticeService.unreadNoticeCount(userId);
		User user=PrincipalUtils.getCurrentPrincipal();
		model.addAttribute("notices", userNotices);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		model.addAttribute("user",user);
		addSearchTypesDataToModel(model);
		return "notice_star_target";
	}
	
	
	@RequestMapping(path="/searchStarTarget", method=RequestMethod.GET)
	public String searchStarTarget(@ModelAttribute("searchCondition")NoticeSearchCondition searchCondition, Model model,HttpSession session) throws Exception {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Notice> resultNotices = noticeService.searchUserStarTargetNoticesByPage(searchCondition);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserStarTargetNoticeCountByRemainDay(searchCondition.getUserId());
		int totalCount=(int)noticeService.searchUserStarTargetNoticesCount(searchCondition);
		int unreadNoticeCount=noticeService.unreadNoticeCount(searchCondition.getUserId());
		page.setTotalRecords(totalCount);
		model.addAttribute("notices", resultNotices);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		addSearchTypesDataToModel(model);
		return "notice_star_target";
	}
	
	
	@RequestMapping(path="batchAddStarTargetMonitor")
	public void batchAddAnnualFeeMonitor(@RequestParam("noticeIds") List<Long> noticeIds,PrintWriter pw){
		noticeService.batchUpdateStarTargetStatus(noticeIds);
		String message = "操作成功";
		pw.write(message);
	}
	
	@RequestMapping(path="batchCancelStarTargetMonitor")
	public void batchCancelStarTargetMonitor(@RequestParam("noticeIds") List<Long> noticeIds,PrintWriter pw){
		noticeService.batchCancelStarTargetStatus(noticeIds);
		String message = "操作成功";
		pw.write(message);
	}
	
	@RequestMapping(path="/getTodayNotices", method=RequestMethod.GET)
	public String getTodayNotices(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<Integer,Map<String,Long>> patentTypeCount=noticeService.getUserNoticeCountByType(userId);
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(userId);
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(userId);
		Map<String, Map<String, String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(userId);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserNoticeCountByRemainDay(userId);
		List<Notice> userNotices = noticeService.getTodayNotices(page);
		int totalCount=(int)noticeService.getTodayNoticesCount(userId);
		page.setTotalRecords(totalCount);
		int unreadNoticeCount=noticeService.unreadNoticeCount(userId);
		User user=PrincipalUtils.getCurrentPrincipal();
		model.addAttribute("notices", userNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		model.addAttribute("user",user);
		addSearchTypesDataToModel(model);
		return "notice_today_list";
	}
	
	@RequestMapping(path="/getWillOverdeadLine", method=RequestMethod.GET)
	public String getWillOverdeadLine(Model model,Page page,HttpSession session) {
		if(page==null){
			page = new Page();
		}
		if (page.getCurrentPage() < 1) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<Integer,Map<String,Long>> patentTypeCount=noticeService.getUserNoticeCountByType(userId);
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(userId);
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(userId);
		Map<String, Map<String, String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(userId);
		Map<String,Map<String,String>> remainDayCount=noticeService.getUserNoticeCountByRemainDay(userId);
		List<Notice> userNotices = noticeService.getWillOverdeadLine(page);
		int totalCount=(int)noticeService.getWillOverdeadLineCount(userId);
		page.setTotalRecords(totalCount);
		int unreadNoticeCount=noticeService.unreadNoticeCount(userId);
		User user=PrincipalUtils.getCurrentPrincipal();
		model.addAttribute("notices", userNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("remainDayCount",remainDayCount);
		model.addAttribute("page", page);
		model.addAttribute("unreadNoticeCount", unreadNoticeCount);
		model.addAttribute("wayOfPaging","normal");
		model.addAttribute("user",user);
		addSearchTypesDataToModel(model);
		return "notice_will_over_list";
	}
}
