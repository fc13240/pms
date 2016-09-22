package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.FileOption;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/petition")
public class PetitionController {
	
	private PetitionService petitionService;
	private UserService userService;
	
	@Autowired
	public PetitionController(PetitionService petitionService,UserService userService) {
		this.petitionService = petitionService;
		this.userService = userService;
	}
	
	@RequestMapping(path="/findAppPersonNameById")
	public void findAppPersonNameById(@RequestParam("appPersonIds") List<Integer> appPersonIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson>  appersons = petitionService.findAppPersonNameById(appPersonIds,userId);
		try{
			WebUtils.writeJsonStrToResponse(response, appersons);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findInventorNameById")
	public void findInventorNameById(@RequestParam("inventorIds") List<Long> inventorIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor>  inventors = petitionService.findInventorNameById(inventorIds,userId);
		try{
			WebUtils.writeJsonStrToResponse(response, inventors);
			
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/addCommonAppPerson")
	public void addCommonAppPerson(@ModelAttribute("commonAppPerson") CommonAppPerson commonAppPerson,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		
		petitionService.addCommonAppPerson(commonAppPerson,patentDocId);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/addCommonInventor",method=RequestMethod.POST)
	public void addCommonInventor(@ModelAttribute("commonInventor") CommonInventor commonInventor,@RequestParam("patentDocId") Long patentDocId, HttpServletResponse response){
	
		petitionService.addCommonInventor(commonInventor,patentDocId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/findContactNameById",method=RequestMethod.POST)
	public void findContactNameById(@RequestParam("contactIds") List<Integer> contactIds,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<ContactAddress> addresses = petitionService.findContactNameById(contactIds, userId);
		try{
			WebUtils.writeJsonStrToResponse(response, addresses);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/addPatentDocAppPerson",method=RequestMethod.POST)
	public void addPatentDocAppPerson(@RequestParam("appPersonIds") List<Integer> appPersonIds,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		int userId=PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson>  appersons = petitionService.findAppPersonNameById(appPersonIds,userId);
		petitionService.addPatentDocAppPerson(appersons, patentDocId,userId);
		
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/addPatentDocInventor",method=RequestMethod.POST)
	public void addPatentDocInventor(@RequestParam("inventorIds") List<Long> inventorIds,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor> commonInventors = petitionService.findInventorNameById(inventorIds, userId);
		petitionService.addPatentDocInventor(patentDocId, commonInventors, userId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/deletePatentDocApperson",method=RequestMethod.POST)
	public void deletePatentDocApperson(@RequestParam("personId") Long personId,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.deletePatentDocApperson(personId);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updatePatentDocApperson",method=RequestMethod.POST)
	public void updatePatentDocApperson(@ModelAttribute("patentDocAppPerson") PatentDocAppPerson patentDocAppPerson,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.updatePatentDocApperson(patentDocAppPerson);
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/deletePatentDocInventor",method=RequestMethod.POST)
	public void deletePatentDocInventor(@RequestParam("inventorId") Long inventorId,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		petitionService.deletePatentDocInventor(inventorId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updatePatentDocInventor",method=RequestMethod.POST)
	public void updatePatentDocInventor(@ModelAttribute("patentDocInventor") PatentDocInventor patentDocInventor,HttpServletResponse response){
		petitionService.updatePatentDocInventor(patentDocInventor);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocInventor.getPatentDocId());
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findAppPersonById",method=RequestMethod.POST)
	public void findAppPersonById(@RequestParam("personId") Long personId,HttpServletResponse response){
		PatentDocAppPerson patentDocAppPerson = petitionService.findAppPersonByAppId(personId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocAppPerson);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findInventorById",method=RequestMethod.POST)
	public void findInventorById(@RequestParam("inventorId") Long inventorId,HttpServletResponse response){
		PatentDocInventor patentDocInventor = petitionService.findInventorById(inventorId);
		try{
			WebUtils.writeJsonStrToResponse(response, patentDocInventor);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	/*原有请求书中附件功能*/
	/*@RequestMapping(path="/uploadPatentDocFile",method=RequestMethod.POST)
	public void uploadPatentDocFile(@RequestParam("file")MultipartFile file,@RequestParam("patentDocId") Long patentDocId,HttpServletResponse response){
		String saveDir = Settings.PATENT_DOC_FILE;
		String filename=file.getOriginalFilename();
		saveDir+=patentDocId+"/";
		File fileDir = new File(saveDir);
		try {
			if(!fileDir.exists()){
				fileDir.mkdir();
			}else{
				deleteDir(fileDir);
				fileDir.mkdir();
			}
			InputStream is = file.getInputStream();
			int BUFFER_SIZE = 8*1024;
			byte [] buffer = new byte[BUFFER_SIZE];
			try(OutputStream outputStream = new FileOutputStream(saveDir + filename);){
				int bytesRead = -1;
				while ((bytesRead = is.read(buffer)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}
				outputStream.flush();
				outputStream.close();
			}
			petitionService.updatePatentDocAttachmentUrl(saveDir + filename, patentDocId);
			WebUtils.writeJsonStrToResponse(response,"上传成功");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	
	@RequestMapping(path="/getPatentAttachmentFile")
	public void getPatentAttachmentFile(HttpServletRequest request,HttpServletResponse response,@RequestParam("patentDocId") Long patentDocId){
		String attachmentUrl = petitionService.getPatentAttachmentFile(patentDocId);
		String[] fileArray = attachmentUrl.split("/");
		String fileName = fileArray[fileArray.length-1];
		File attachmentFile = new File(attachmentUrl);
		try{
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;filename=" + new String( fileName.getBytes("gb2312"), "ISO8859-1" ));
		int BUFFER_SIZE = 8192;
		byte[] buffer = new byte[BUFFER_SIZE];
		try (OutputStream out = response.getOutputStream(); 
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(attachmentFile))) {
			int bytesRead = -1;
			while ((bytesRead = bis.read(buffer)) != -1) {
				out.write(buffer, 0, bytesRead);
			}
			out.flush();
			bis.close();
			out.close();
		}
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/settingContact",method=RequestMethod.POST)
	public void settingContact(Long patentDocId,int addressId,HttpServletResponse response){
		petitionService.updatePatentDocContact(patentDocId,addressId);
		
		List<ContactAddress> contactAddresses = petitionService.findPatentDocContactById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, contactAddresses);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/findContactById",method=RequestMethod.POST)
	public void findContactById(int id,HttpServletResponse response){
		
		ContactAddress contactAddress=userService.getContactAddressesById(id);
		//List<Map<String, String>> provinces = userService.getAllProvinces();
		
		try{
			WebUtils.writeJsonStrToResponse(response, contactAddress);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updateContact",method=RequestMethod.POST)
	public void updateContact(ContactAddress contactAddress,Long patentDocId,HttpServletResponse response){
		userService.updateUserContactAddresses(contactAddress);
		List<ContactAddress> contactAddresses = petitionService.findPatentDocContactById(patentDocId);
		try{
			WebUtils.writeJsonStrToResponse(response, contactAddresses);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/searchAppPerson")
	public void searchAppPerson(String keyword,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonAppPerson> commonAppPersons=petitionService.searchAppPerson(keyword, userId);
		try{
			WebUtils.writeJsonStrToResponse(response, commonAppPersons);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/searchInventor")
	public void searchInventor(String keyword,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		List<CommonInventor> commonInventors=petitionService.searchInventor(keyword, userId);
		try{
			WebUtils.writeJsonStrToResponse(response, commonInventors);
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	@RequestMapping(path="uploadPatentDocAppPersonFile")
	public void uploadPatentDocAppPersonFile(@RequestParam("file")MultipartFile file,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		String saveDir = Settings.APP_PERSON_ATTACHMENT_FILE_PATH;
		FileOption.patentDocFileOption(userId, file,saveDir, response);
		
	}
	
	@RequestMapping(path="uploadPatentDocInventorFile")
	public void uploadPatentDocFile(@RequestParam("file")MultipartFile file,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		String saveDir = Settings.INVENTOR_ATTACHMENT_FILE_PATH;
		FileOption.patentDocFileOption(userId, file, saveDir,response);
		
	}
	
	@RequestMapping(path="uploadPatentDocEntrustFile")
	public void uploadPatentDocEntrustFile(@RequestParam("file")MultipartFile file,HttpServletResponse response){
		int userId = PrincipalUtils.getCurrentUserId();
		String saveDir = Settings.PROXY_FILE_PATH;
		FileOption.patentDocFileOption(userId, file, saveDir,response);
	}
	
	@RequestMapping(path="/downloadPatentDocFile", method=RequestMethod.GET)
	public void downloadPatentDocAppPersonFile(String fileUrl, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("application/ostet-stream");
		String relativeUrl = fileUrl;
		String downloadFileName = URLEncoder.encode(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1), "UTF8");
		String filePath =relativeUrl;
		File patentDocFile = new File(filePath);
		if(WebUtils.isFireFox(request)){
			downloadFileName =new String(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1).getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int)patentDocFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(patentDocFile));
	}
}

