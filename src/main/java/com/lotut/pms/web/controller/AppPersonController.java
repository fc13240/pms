package com.lotut.pms.web.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.AppPersonSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.UserAppPerson;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/appPerson")
public class AppPersonController {
	private FriendService friendService;
	private AppPersonService appPersonService;
	
	public AppPersonController() {
	}
	
	@Autowired
	public AppPersonController(AppPersonService appPersonService, FriendService friendService) {
		this.appPersonService = appPersonService;
		this.friendService = friendService;
	}
	
	@RequestMapping(path="/appPersonAddForm")
	public String contactAppPersonAddForm(Model model){
		
		return "app_person_add";
		
	}
	
	@RequestMapping(path="/list" ,method=RequestMethod.GET)
	public String getList(Page page, HttpSession session,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=appPersonService.getUserAppPersonCount(userId);
		page.setTotalRecords(totalCount);
		List<CommonAppPerson> appPersons=appPersonService.getUserAppPersons(page);

		model.addAttribute("appPersons", appPersons);
		model.addAttribute("page", page);
		return "app_person_list";
	}
	
	@RequestMapping(path="/addAppPersonInfo",method=RequestMethod.POST)
	public String addContactInfo(@ModelAttribute CommonAppPerson appPerson,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		appPerson.setUserId(userId);
		appPersonService.addAppPerson( appPerson);
		UserAppPerson userAppPerson=new UserAppPerson();
		userAppPerson.setUserId(userId);
		List<Integer> appPersonIds=appPersonService.getIdbyAppPerson(appPerson);
		int lenth=appPersonIds.size();
		Integer appPersonId=0;
		if(lenth==0){
			appPersonId=appPersonIds.get(0);
		}else{
			appPersonId=appPersonIds.get(lenth-1);
		}
		userAppPerson.setAppPersonId(appPersonId);
		appPersonService.addUserAppPerson(userAppPerson);
		return "redirect:/appPerson/list.html";
	}
	
	@RequestMapping(path="/findOneAppPersonInfo")
	public String findOneAppPersonInfo(@RequestParam("appPersonId")int AppPersonId,Model model ){
		CommonAppPerson appPerson=appPersonService.getOneAppPersonById(AppPersonId);
		model.addAttribute("appPerson", appPerson);
		return "app_person_update";
		
	}
	@RequestMapping(path="/updateAppPersonInfo",method=RequestMethod.POST)
	public String updateAppPersonInfo(@Valid CommonAppPerson AppPerson,Model model ){
		int userId=PrincipalUtils.getCurrentUserId();
		AppPerson.setUserId(userId);
		appPersonService.updateAppPerson(AppPerson);
		return "redirect:/appPerson/list.html";
		
	}
	
	@RequestMapping(path="/deleteAppPersonInfo")
	public String deleteAppPersonInfo(@RequestParam("appPersonId")int appPersonId){
		int userId=PrincipalUtils.getCurrentUserId();
		UserAppPerson userAppPerson=new UserAppPerson();
		userAppPerson.setUserId(userId);
		userAppPerson.setAppPersonId(appPersonId);
		appPersonService.deleteUserAppPersonbyId(userAppPerson);
		return "redirect:/appPerson/list.html";
	}
	

	@RequestMapping(path="/showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "app_person_select_friends";
	}
	
	@RequestMapping(path="/searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "app_person_select_friends";
	}	
	
	@RequestMapping(path="/showAttachmentUploadForm",method=RequestMethod.GET)
	public String showAttachmentUploadForm(@RequestParam("appPersonId") long appPersonId,Model model){
		model.addAttribute("appPersonId", appPersonId);
		return "app_person_upload_form";
		
		
	}
	
	@RequestMapping(path="/showProxyUploadForm",method=RequestMethod.GET)
	public String showProxyUploadForm(@RequestParam("appPersonId") long appPersonId,Model model){
		model.addAttribute("appPersonId", appPersonId);
		return "proxy_upload_form";
		
		
	}
	@RequestMapping(path="/uploadAttachmentFile",method=RequestMethod.POST)
	public void uploadAttachmentFile(@RequestParam("appPersonId") int appPersonId,  HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		int userId = PrincipalUtils.getCurrentUserId();
		String relativeUrl = appPersonService.getAppPersonUrlById(appPersonId);
		if(relativeUrl==null){
		try{
			String savePath=Settings.APP_PERSON_ATTACHMENT_FILE_PATH;
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file1 = multipartRequest.getFile("file");
			String fileName = file1.getOriginalFilename();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			String newFileName = userId + "_" + appPersonId + "_" + fileName;
			InputStream is = file1.getInputStream();
			int BUFFER_SIZE = 8 * 1024;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
				int bytesRead = -1;
				while ((bytesRead = is.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				out.close();
			}
			WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
		}catch(Exception e){
			e.printStackTrace();
		}}else{
			try{
				String filePath = Settings.APP_PERSON_ATTACHMENT_FILE_PATH + relativeUrl;
				File targetFile=new File(filePath);
				targetFile.delete();
				String[] s=relativeUrl.split("/");
				String DateFilePath=Settings.APP_PERSON_ATTACHMENT_FILE_PATH+s[0];
				File DateFile=new File(DateFilePath);
				if(DateFile.isDirectory()){
					String[] files=DateFile.list();
					if(files.length==0){
						DateFile.delete();
					}
				}
				String savePath=Settings.APP_PERSON_ATTACHMENT_FILE_PATH;
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile file1 = multipartRequest.getFile("file");
				String fileName = file1.getOriginalFilename();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String ymd = sdf.format(new Date());
				savePath += ymd + "/";
				File dirFile = new File(savePath);
				if (!dirFile.exists()) {
					dirFile.mkdirs();
				}
				String newFileName = userId + "_" + appPersonId + "_" + fileName;
				InputStream is = file1.getInputStream();
				int BUFFER_SIZE = 8 * 1024;
				byte[] buffer = new byte[BUFFER_SIZE];
				try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
					int bytesRead = -1;
					while ((bytesRead = is.read(buffer)) != -1) {
						out.write(buffer, 0, bytesRead);
					}
					out.flush();
					out.close();
				}
				WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
				}catch(Exception e){
					e.printStackTrace();
			}
		}
	}	
	

	@RequestMapping(path="/saveAppPersonFile",method=RequestMethod.POST)
	public void saveAttachmentFile(CommonAppPerson appPerson,PrintWriter writer){
		appPersonService.saveAttachmentFile(appPerson);
		writer.write(1);
	}
	
	@RequestMapping(path="/downloadAttachmentFile", method=RequestMethod.GET)
	public void downloadPatentFile(@RequestParam("appPersonId")int appPersonId, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("application/octet-stream ");
		String relativeUrl = appPersonService.getAppPersonUrlById(appPersonId);
		String downloadFileName = URLEncoder.encode(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1), "UTF8");
		String filePath = relativeUrl;
		File appPersonFile = new File(filePath);
		if("FF".equals(getBrowser(request))){
		    //针对火狐浏览器处理
			downloadFileName =new String(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1).getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int)appPersonFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(appPersonFile));
	}
	
	private String getBrowser(HttpServletRequest request){
	    String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
	    if(UserAgent!=null){
	        if (UserAgent.indexOf("msie") >=0 ) return "IE";
	        if (UserAgent.indexOf("firefox") >= 0) return "FF";
	    }
	    return null;
	}


	@RequestMapping(path="/uploadProxyFile",method=RequestMethod.POST)
	public void uploadProxyFile(@RequestParam("appPersonId") int appPersonId,HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		int userId = PrincipalUtils.getCurrentUserId();
		String relativeUrl = appPersonService.getProxyUrlById(appPersonId);
		if(relativeUrl==null){
		try{
			String savePath=Settings.PROXY_FILE_PATH;
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file1 = multipartRequest.getFile("file");
			String fileName = file1.getOriginalFilename();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String ymd = sdf.format(new Date());
			savePath += ymd + "/";
			File dirFile = new File(savePath);
			if (!dirFile.exists()) {
				dirFile.mkdirs();
			}
			String newFileName = userId + "_" + appPersonId + "_" + fileName;
			InputStream is = file1.getInputStream();
			int BUFFER_SIZE = 8 * 1024;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
				int bytesRead = -1;
				while ((bytesRead = is.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				out.close();
			}
			WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
		}catch(Exception e){
			e.printStackTrace();
		}}else{
			try{
				String filePath = Settings.PROXY_FILE_PATH + relativeUrl;
				File targetFile=new File(filePath);
				targetFile.delete();
				String[] s=relativeUrl.split("/");
				String DateFilePath=Settings.APP_PERSON_ATTACHMENT_FILE_PATH+s[0];
				File DateFile=new File(DateFilePath);
				if(DateFile.isDirectory()){
					String[] files=DateFile.list();
					if(files.length==0){
						DateFile.delete();
					}
				}
				String savePath=Settings.PROXY_FILE_PATH;
				MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
				MultipartFile file1 = multipartRequest.getFile("file");
				String fileName = file1.getOriginalFilename();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				String ymd = sdf.format(new Date());
				savePath += ymd + "/";
				File dirFile = new File(savePath);
				if (!dirFile.exists()) {
					dirFile.mkdirs();
				}
				String newFileName = userId + "_" + appPersonId + "_" + fileName;
				InputStream is = file1.getInputStream();
				int BUFFER_SIZE = 8 * 1024;
				byte[] buffer = new byte[BUFFER_SIZE];
				try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
					int bytesRead = -1;
					while ((bytesRead = is.read(buffer)) != -1) {
						out.write(buffer, 0, bytesRead);
					}
					out.flush();
					out.close();
				}
				WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
				}catch(Exception e){
					e.printStackTrace();
			}
		}
	}	
	

	@RequestMapping(path="/saveProxyFile",method=RequestMethod.POST)
	public void saveProxyFile(CommonAppPerson appPerson,PrintWriter writer){
		appPersonService.saveProxyFile(appPerson);
		writer.write(1);
	}
	
	@RequestMapping(path="/downloadProxyFile", method=RequestMethod.GET)
	public void downloadProxyFile(@RequestParam("appPersonId")int appPersonId, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("application/octet-stream ");
		String relativeUrl = appPersonService.getProxyUrlById(appPersonId);
		String downloadFileName = URLEncoder.encode(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1), "UTF8");
		String filePath =relativeUrl;
		File appPersonFile = new File(filePath);
		if("FF".equals(getBrowser(request))){
		    //针对火狐浏览器处理
			downloadFileName =new String(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1).getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "proxy;filename=" + downloadFileName);
		response.setContentLength((int)appPersonFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(appPersonFile));
	}
	
	
	@RequestMapping(path="/downloadProxyTemplate")
	public void downloadProxyTemplate(HttpServletResponse response,HttpServletRequest request)throws IOException{
		response.setContentType("application/zip");
		
		String relativeUrl=Settings.PROXY_TEMPLATE_NMAE;
		String filePath=Settings.PROXY_TEMPLATE_FILE_PATH+relativeUrl;
		File appPersonFile = new File(filePath);
		String downloadFileName = URLEncoder.encode(relativeUrl, "UTF8");
		if("FF".equals(getBrowser(request))){
		    //针对火狐浏览器处理
			downloadFileName =new String(relativeUrl.getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "proxyTemplate;filename=" + downloadFileName);
		response.setContentLength((int)appPersonFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(appPersonFile));
	}
	
	@RequestMapping(path="/addShares", method=RequestMethod.GET)
	public String shareAppPersons(@RequestParam("appPersons")List<Integer> appPersonIds, @RequestParam("friends")List<Integer> friendIds) {
		List<Map<String, Integer>> userAppPersonRecords = new ArrayList<>();
		
		for (int appPersonId: appPersonIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> userAppPersonRecord =  new HashMap<String, Integer>();
				userAppPersonRecord.put("user", friendId);
				userAppPersonRecord.put("appPerson", appPersonId);
				userAppPersonRecords.add(userAppPersonRecord);
			}
		}
		
		appPersonService.insertUserAppPersons(userAppPersonRecords);
		return "app_person_list";
	}
	
	@RequestMapping(path="/searchAppPerson", method=RequestMethod.GET)
	public String searchUserPatents(@ModelAttribute("searchCondition")AppPersonSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<CommonAppPerson> appPersons = appPersonService.searchAppPersonByPage(searchCondition);
		int totalCount=(int)appPersonService.searchAppPersonCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("appPersons", appPersons);
		model.addAttribute("page", page);
		return "app_person_list";
	}
	
	
/* ---------费减备案---------start-------------费减备案---------*/
	
	
	@RequestMapping(path="/feeReduceTransactAppPersonForm")
	public String feeReduceTransactInventorForm(){
		return "fee_reduce_transact_app_person_add";
		
	}
	@RequestMapping(path="/addfeeRedurceAppPerson")
	public String addfeeRedurceInventor(@ModelAttribute CommonAppPerson appPerson){
		appPersonService.addFeeRedurceAppPerson(appPerson);
		return "fee_reduce_transact_app_person_add";
		
	}
	
	@RequestMapping(path="/searchFeeRedurceAppPerson ", method=RequestMethod.GET)
	public String searchFeeRedurceAppPerson(@ModelAttribute("searchCondition")AppPersonSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		if (PrincipalUtils.isPlatform()) {
			List<CommonAppPerson> appPersons = appPersonService.searchFeeRedurceAppPersonForPlat(searchCondition);
			int totalCount=(int)appPersonService.searchFeeRedurceAppPersonForPlatCount(searchCondition);
			page.setTotalRecords(totalCount);
			model.addAttribute("appPersons", appPersons);
			model.addAttribute("page", page);
		}else{
			List<CommonAppPerson> appPersons = appPersonService.searchFeeRedurceAppPersonByPage(searchCondition);
			int totalCount=(int)appPersonService.searchFeeRedurceAppPersonCount(searchCondition);
			page.setTotalRecords(totalCount);
			model.addAttribute("appPersons", appPersons);
			model.addAttribute("page", page);
		}
		return "";
	}
}
