package com.lotut.pms.web.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

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
import com.lotut.pms.domain.NoticeSearchCondition;
import com.lotut.pms.domain.NoticeType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentType;
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
	
	@Autowired
	public NoticeController(NoticeService noticeService, PatentService patentService) {
		this.noticeService = noticeService;
		this.patentService = patentService;
	}

	@RequestMapping(path="/list", method=RequestMethod.GET)
	public String getNoticeList(Model model,Page page,HttpSession session) {
		page.setPageSize(WebUtils.getPageSize(session));
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		Map<String,Map<String,String>> patentTypeCount=noticeService.getUserNoticeCountByType(userId);
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(userId);
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(userId);
		Map<String,Map<String,String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(userId);
		List<Notice> userNotices = noticeService.getUserNoticesByPage(page);
		int totalCount=(int)noticeService.getUserNoticesCount(userId);
		page.setTotalRecords(totalCount);
		model.addAttribute("notices", userNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("page", page);
		addSearchTypesDataToModel(model);
		return "notice_list";
	}

	
	
	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String searchUserNotices(@ModelAttribute("searchCondition")NoticeSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<Notice> resultNotices = noticeService.searchUserNoticesWithPage(searchCondition);
		Map<String,Map<String,String>> patentTypeCount=noticeService.getUserNoticeCountByType(searchCondition.getUserId());
		Map<String,Map<String,String>> noticeTypeCount=noticeService.getUserNoticeCountByNoticeType(searchCondition.getUserId());
		Map<String,Map<String,String>> processStatusCount=noticeService.getUserNoticeCountByProcessStatus(searchCondition.getUserId());
		Map<String,Map<String,String>> paperApplyTypeCount=noticeService.getUserNoticeCountByPaperApplyType(searchCondition.getUserId());
		int totalCount=(int)noticeService.searchUserNoticesCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("notices", resultNotices);
		model.addAttribute("patentTypeCount",patentTypeCount);
		model.addAttribute("noticeTypeCount",noticeTypeCount);
		model.addAttribute("processStatusCount",processStatusCount);
		model.addAttribute("paperApplyTypeCount",paperApplyTypeCount);
		model.addAttribute("page", page);
		addSearchTypesDataToModel(model);
		return "notice_list";
	}	
	
	
	@RequestMapping(path="/preview", method=RequestMethod.GET)
	public void previewNotice(@RequestParam("notice")int noticeId, HttpServletResponse response) throws IOException {
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
	}
	
	@RequestMapping(path="/download", method=RequestMethod.GET)
	public void downloadNotice(@RequestParam("notice")int noticeId, HttpServletResponse response) throws IOException {
		response.setContentType("application/zip");
		
		Notice notice = noticeService.getNoticeById(noticeId);
		ZipFile noticeZipFile = noticeService.createNoticeZipFile(notice);
		String dispatchDate = new SimpleDateFormat("yyyy-MM-dd").format(notice.getDispatchDate());
		String downloadFileName = dispatchDate + URLEncoder.encode(notice.getName(), "UTF8") + 
				notice.getPatent().getAppNo() + URLEncoder.encode(notice.getPatent().getName(), "UTF8");
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
	public String uploadNotices(@RequestParam("noticeFile")Part noticeFile) throws IOException, ZipException {
		String zipFileName = noticeFile.getSubmittedFileName();
		noticeFile.write(zipFileName);
		String zipFilePath = Settings.TEMP_DIR + zipFileName;
		noticeService.uploadNotices(zipFilePath);
		return "upload_success";
	}	
	
	private void addSearchTypesDataToModel(Model model) {
		List<PatentType> patentTypes = patentService.getAllPatentTypes();
		List<NoticeProcessStatus> noticeProcessStatus = noticeService.getAllNoticeProcessStatus();
		List<NoticeType> noticeTypes = noticeService.getAllNoticeType();
		List<NoticePaperApplyType> paperApplyTypes = noticeService.getAllNoticePaperApplyType();
		model.addAttribute("patentTypes", patentTypes);
		model.addAttribute("noticeProcessStatus", noticeProcessStatus);
		model.addAttribute("noticeTypes", noticeTypes);
		model.addAttribute("paperApplyTypes", paperApplyTypes);
	}
	
	@RequestMapping(path="/batchChangePaperType", method=RequestMethod.GET)
	public String batchChangeNoticePaperType(@RequestParam("notices")List<Integer> noticeIdList, @RequestParam("paperApplyType")int paperApplyType) {
		noticeService.batchUpdateNoticesNoticePaperType(noticeIdList, paperApplyType);
		return "notice_list";
	}
}
