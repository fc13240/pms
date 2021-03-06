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
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.InventorSearchCondition;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.User;
import com.lotut.pms.domain.UserInventor;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/inventor")
public class InventorController {
	private InventorService inventorService;
	private FriendService friendService;
	@Autowired
	public InventorController(InventorService inventorService,FriendService friendService){
		this.inventorService=inventorService;
		this.friendService=friendService;
	}
	
	@RequestMapping(path="/inventorAddForm")
	public String contactInventorAddForm(){
		return "inventor_create";
		
	}
	
	@RequestMapping(path="/list")
	public String getList(Page page, HttpSession session,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=inventorService.getUserInventorCount(userId);
		List<CommonInventor> inventors=inventorService.getUserInventors(page);
		page.setTotalRecords(totalCount);
		model.addAttribute("inventors", inventors);
		model.addAttribute("page", page);
		return "inventor_list";
		
		
	}
	
	@RequestMapping(path="/addInventorInfo",method=RequestMethod.POST)
	public String addContactInfo(@ModelAttribute CommonInventor inventor,Model model ){
		int userId=PrincipalUtils.getCurrentUserId();
		inventor.setUserId(userId);
		inventorService.addInventor(inventor);
		UserInventor userInventor=new UserInventor();
		userInventor.setUserId(userId);
		List<Integer> inventorIds=inventorService.getIdByInventor(inventor);
		int length=inventorIds.size();
		Integer inventorId=0;
		if(length==1){
		 inventorId=inventorIds.get(0);
		
		}else{
			inventorId=inventorIds.get(length-1);
			
		}
		userInventor.setInventorId(inventorId);
		inventorService.addUserInventor(userInventor);
		return "redirect:/inventor/list.html";
		
	}
	
	@RequestMapping(path="/findOneInventorInfo")
	public String findOneInventorInfo(@RequestParam("inventorId")int id,Model model){
		CommonInventor inventor = inventorService.getInventorById(id);
		model.addAttribute("inventor",inventor);
		return "inventor_update";
		
		
	}
	
	@RequestMapping(path="/updInventorInfo",method=RequestMethod.POST)
	public String updContactInfo(@Valid CommonInventor inventor,Model model){
		inventorService.updateById(inventor);
		return "redirect:/inventor/list.html";
		
	}
	
	@RequestMapping(path="/deleteInventorInfo",method=RequestMethod.GET)
	public String deleteInventorInfo(@RequestParam("inventorId")int inventorId){
		System.out.println(inventorId);
		int userId=PrincipalUtils.getCurrentUserId();
		UserInventor userInventor = new UserInventor();
		userInventor.setUserId(userId);
		userInventor.setInventorId(inventorId);
		System.out.println(userInventor.getInventorId()+"==================="+userInventor.getUserId());
		inventorService.deleteUserInventorById(userInventor);
		return "redirect:/inventor/list.html";
	
		
	}
	
	@RequestMapping(path="/loadInventor")
	public void loadInventor(@RequestParam("inventor") String inventor, HttpServletResponse response){
		response.setContentType("application/json;charset=UTF-8");
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor> inventors=inventorService.getInventor(inventor,userId);
		try{
			Map<String, Object> map = new HashMap<>();
			map.put("inventors", inventors);
			WebUtils.writeJsonStrToResponse(response, map);
			//WebUtils.writeJsonStrToResponse(response, inventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	

	@RequestMapping(path="/showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "inventor_select_friends";
	}
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "inventor_select_friends";
	}	
	
	@RequestMapping(path="/showUploadForm",method=RequestMethod.GET)
	public String showUploadForm(@RequestParam("inventorId")long inventorId,Model model){
		model.addAttribute("inventorId", inventorId);
		return "inventor_upload_form";
	}
	
	@RequestMapping(path="/uploadAttachmentFile",method=RequestMethod.POST)
	public void uploadProxyFile(@RequestParam("inventorId") int inventorId,HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		int userId = PrincipalUtils.getCurrentUserId();
		String relativeUrl = inventorService.getInventorUrlById(inventorId);
		if(relativeUrl==null){
		try{
			String savePath=Settings.INVENTOR_ATTACHMENT_FILE_PATH;
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
			String newFileName = userId + "_" + inventorId + "_" + fileName;
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
				String filePath = Settings.INVENTOR_ATTACHMENT_FILE_PATH + relativeUrl;
				File file2=new File(filePath);
				file2.delete();
//				String filePath2=filePath.substring(0, filePath.lastIndexOf("/"));
				String[] s=relativeUrl.split("/");
				String filePath2=Settings.INVENTOR_ATTACHMENT_FILE_PATH+s[0];
				File file3=new File(filePath2);
				if(file3.isDirectory()){
					String[] files=file3.list();
					if(files.length==0){
						file3.delete();
					}
				}
				String savePath=Settings.INVENTOR_ATTACHMENT_FILE_PATH;
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
				String newFileName = userId + "_" + inventorId + "_" + fileName;
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
	

	@RequestMapping(path="/saveInventorFile",method=RequestMethod.POST)
	public void saveAttachmentFile(CommonInventor Inventor,PrintWriter writer){
		inventorService.saveAttachmentFile(Inventor);
		writer.write(1);
	}
	
	@RequestMapping(path="/downloadAttachmentFile", method=RequestMethod.GET)
	public void downloadPatentFile(@RequestParam("inventorId")int InventorId, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("application/doc");
		String relativeUrl = inventorService.getInventorUrlById(InventorId);
		String downloadFileName = URLEncoder.encode(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1), "UTF8");
		String filePath =relativeUrl;
		File InventorFile = new File(filePath);
		if("FF".equals(getBrowser(request))){
		    //针对火狐浏览器处理
			downloadFileName =new String(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1).getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int)InventorFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(InventorFile));
	}
	
	private String getBrowser(HttpServletRequest request){
	    String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
	    if(UserAgent!=null){
	        if (UserAgent.indexOf("msie") >=0 ) return "IE";
	        if (UserAgent.indexOf("firefox") >= 0) return "FF";
	    }
	    return null;
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
		
		inventorService.insertUserInventors(userInventorRecords);
		return "app_person_list";
	}
	
	@RequestMapping(path="/searchInventor", method=RequestMethod.GET)
	public String searchUserPatents(@ModelAttribute("searchCondition")InventorSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<CommonInventor> inventors = inventorService.searchInventorByPage(searchCondition);
		int totalCount=(int)inventorService.searchInventorCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("inventors", inventors);
		model.addAttribute("page", page);
		return "inventor_list";
	}
	
	
	/* ---------费减备案---------start-------------费减备案---------*/
	
	
	@RequestMapping(path="/feeReduceTransactInventorForm")
	public String feeReduceTransactInventorForm(){
		return "fee_reduce_transact_inventor_add";
		
	}
	@RequestMapping(path="/addfeeRedurceInventor")
	public String addfeeRedurceInventor(@ModelAttribute CommonInventor inventor){
//		int userId=PrincipalUtils.getCurrentUserId();
//		inventor.setUserId(userId);
//		inventorService.addInventor(inventor);
//		UserInventor userInventor=new UserInventor();
//		userInventor.setUserId(userId);
//		List<Integer> inventorIds=inventorService.getIdByInventor(inventor);
//		int length=inventorIds.size();
//		Integer inventorId=0;
//		if(length==1){
//		 inventorId=inventorIds.get(0);
//		
//		}else{
//			inventorId=inventorIds.get(length-1);
//			
//		}
//		userInventor.setInventorId(inventorId);
//		inventorService.addUserInventor(userInventor);
//		
		
		return "fee_reduce_transact_inventor_add";
		
	}
	
}
