package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
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
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lotut.pms.constants.PatentDocWorkflowAction;
import com.lotut.pms.constants.Settings;
import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.CommonAppPerson;
import com.lotut.pms.domain.CommonInventor;
import com.lotut.pms.domain.ContactAddress;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocAppPerson;
import com.lotut.pms.domain.PatentDocInventor;
import com.lotut.pms.domain.PatentDocSearchCondition;
import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocStatus;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.AppPersonService;
import com.lotut.pms.service.FriendService;
import com.lotut.pms.service.InventorService;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;
import com.lotut.pms.service.PatentDocWorkflowService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.service.PetitionService;
import com.lotut.pms.service.UserService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.CreateWord;
import com.lotut.pms.web.util.DocUtil;
import com.lotut.pms.web.util.FileOption;
import com.lotut.pms.web.util.WebUtils;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;

@Controller
@RequestMapping(path="/editor")
public class PatentEditDocController {
	private PatentDocService patentDocService;
	private PatentDocumentTemplateService patentDocumentTemplateService;
	private InventorService inventorService ;
	private AppPersonService appPersonService;
	private UserService userService;
	private FriendService friendService;
	private PetitionService petitionService;
	private PatentDocWorkflowService patentDocWorkflowService;
	private PatentDocWorkflowHistoryService patentDocWorkflowHistoryService;
	
	
	@Autowired
	public PatentEditDocController(PatentDocService patentDocService,PatentDocumentTemplateService patentDocumentTemplateService,
			InventorService inventorService,AppPersonService appPersonService,FriendService friendService,
			PetitionService petitionService,UserService userService,
			PatentDocWorkflowHistoryService patentDocWorkflowHistoryService,PatentDocWorkflowService patentDocWorkflowService) {
		this.patentDocService = patentDocService;
		this.patentDocumentTemplateService = patentDocumentTemplateService;
		this.inventorService = inventorService;
		this.appPersonService = appPersonService;
		this.friendService = friendService;
		this.petitionService = petitionService;
		this.userService = userService;
		this.patentDocWorkflowHistoryService=patentDocWorkflowHistoryService;
		this.patentDocWorkflowService=patentDocWorkflowService;
	}

	@RequestMapping(path="/newPatentType")
	public String newPatentTypeForm(Model model){
			
			return "patent_doc_type_list";
	}

	@RequestMapping(path="/newPatentDoc",method=RequestMethod.GET)
	public String inventionEditorForm(@RequestParam("patentType")int patentType, PatentDoc patentDoc,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDoc.setPatentType(patentType);
		patentDocService.savePatentDoc(patentDoc);
		int id=(int) patentDoc.getPatentDocId();
		int action=PatentDocWorkflowAction.ActionType.get("保存或修改");
		patentDocWorkflowHistoryService.insertHistory(id, action);
		long patentDocId=patentDoc.getPatentDocId();
		List<CommonInventor> inventors = petitionService.getUserCommonInventors(userId);
		List<CommonAppPerson> appPersons = petitionService.getUserCommonAppPersons(userId);
		List<ContactAddress>  contactAddresses = userService.getUserContactAddresses(userId);
		List<Map<String, String>> provinces = userService.getAllProvinces();
		model.addAttribute("patentDocId",patentDocId);
		model.addAttribute("patentDoc",patentDoc);
		model.addAttribute("inventors",inventors);
		model.addAttribute("appPersons",appPersons);
		model.addAttribute("contactAddresses",contactAddresses);
		model.addAttribute("provinces", provinces);
		if(patentType==1){
			return "patent_doc_invent_edit";
		}else if(patentType==2){
			return "patent_doc_practical_edit";
		}else if(patentType==3){
			return "patent_doc_interface_edit";
		}
		return "";	
	}

	
	@RequestMapping(path="/savePreviewPatentDoc",method=RequestMethod.POST)
	public void  savePreviewPatentDoc(PatentDoc patentDoc,HttpServletRequest request,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.updatePatentDoc(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/savePatentDoc",method=RequestMethod.POST)
	public void  savePatentDoc(PatentDoc patentDoc,HttpServletRequest request,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.updatePatentDoc(patentDoc);
		int id=(int) patentDoc.getPatentDocId();
		int action=PatentDocWorkflowAction.ActionType.get("保存或修改");
		patentDocWorkflowHistoryService.insertHistory(id, action);
		writer.write(1);
	}
	
	@RequestMapping(path="/savePatentAbstractImg",method=RequestMethod.POST)
	public void  savePatentAbstractImg(PatentDoc patentDoc,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.savePatentAbstractImg(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/editPatentDoc",method=RequestMethod.GET)
	public String  editPatentDoc(@RequestParam("patentDocId")long patentDocId,@RequestParam("patentType")int patentType,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocId);
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDocEditor(userId);
		model.addAttribute("patentDoc", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("patenType",patentType);
		
		List<PatentDocAppPerson> patentDocAppPersons = petitionService.findPatentDocAppPersonById(patentDocId);
		List<PatentDocInventor> patentDocInventors = petitionService.findPatentDocInventorById(patentDocId);
		
		model.addAttribute("patentDocAppPersons",patentDocAppPersons);
		model.addAttribute("patentDocInventors",patentDocInventors);
		
		List<CommonInventor> inventors = inventorService.getAllInventorsByUser(userId);
		List<CommonAppPerson> appPersons= appPersonService.getAllAppPersonByUser(userId);
		
		List<Map<String, String>> provinces = userService.getAllProvinces();
		
		List<ContactAddress>  contactAddresses = userService.getUserContactAddresses(userId);
		ContactAddress contactAddress = userService.getContactAddressesById(patentDoc.getContactId());
	
		
		model.addAttribute("inventors",inventors);
		model.addAttribute("appPersons",appPersons);
		model.addAttribute("provinces", provinces);
		model.addAttribute("contactAddress", contactAddress);
		model.addAttribute("contactAddresses",contactAddresses);
		
		if(patentType==1){
			return "patent_doc_invent_edit";
		}else if(patentType==2){
			return "patent_doc_practical_edit";
		}else if(patentType==3){
			return "patent_doc_interface_edit";
		}
		return "";		
	}
	

	@RequestMapping(path="/patentDocList",method=RequestMethod.GET)//patentDocList
	public String  patentDocList(Model model, Page page, HttpSession session){
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		
		List<PatentDoc> patentDocs;
		int totalCount;
		if (PrincipalUtils.isPlatform()) {
			page.setStatus(1);
			page.setProxyStatus(2);
			totalCount=(int)patentDocService.getUserPatentDocCountByRole(page);
			page.setTotalRecords(totalCount);
			 patentDocs=patentDocService.getUserPatentDocByRole(page);
		}else if(PrincipalUtils.isProxyOrg()){
			page.setStatus(2);
			page.setProxyStatus(3);
			totalCount=(int)patentDocService.getUserPatentDocCountByRole(page);
			page.setTotalRecords(totalCount);
			 patentDocs=patentDocService.getUserPatentDocByRole(page);
		}else if(PrincipalUtils.isCustomerSupport()){
//			page.setStatus(4);
//			totalCount=(int)patentDocService.getUserPatentDocCountByRole(page);
//			page.setTotalRecords(totalCount);
//			 patentDocs=patentDocService.getUserPatentDocByRole(page);
			page.setProxyStatus(3);
			List<Integer> excludeStatusList=new ArrayList<>();
			excludeStatusList.add(1);
			excludeStatusList.add(2);
			excludeStatusList.add(4);
			excludeStatusList.add(5);
			excludeStatusList.add(6);
			excludeStatusList.add(7);
			excludeStatusList.add(9);
			excludeStatusList.add(10);
			totalCount=patentDocService.getPatentDocCountByTechAndCustomer(page, excludeStatusList);
			page.setTotalRecords(totalCount);
			 patentDocs=patentDocService.getPatentDocByTechAndCustomer(page, excludeStatusList);
			
			
		}else if(PrincipalUtils.isTech()){
			//page.setStatus(5);
//			totalCount=(int)patentDocService.getUserPatentDocCountByRole(page);
//			page.setTotalRecords(totalCount);
//			 patentDocs=patentDocService.getUserPatentDocByRole(page);
			page.setProxyStatus(3);
			List<Integer> excludeStatusList=new ArrayList<>();
			excludeStatusList.add(1);
			excludeStatusList.add(2);
			excludeStatusList.add(3);
			excludeStatusList.add(9);
			excludeStatusList.add(10);
			totalCount=patentDocService.getPatentDocCountByTechAndCustomer(page, excludeStatusList);
			page.setTotalRecords(totalCount);
			 patentDocs=patentDocService.getPatentDocByTechAndCustomer(page, excludeStatusList);
			
		}else if(PrincipalUtils.isProcess()){
			page.setStatus(9);
			page.setProxyStatus(3);
			totalCount=(int)patentDocService.getUserPatentDocCountByRole(page);
			page.setTotalRecords(totalCount);
			 patentDocs=patentDocService.getUserPatentDocByRole(page);
		}else{
			totalCount=(int)patentDocService.getUserPatentDocCount(userId);
			page.setTotalRecords(totalCount);
			patentDocs=patentDocService.getUserPatentDoc(page);
		}
		
		
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("page", page);
		return "patent_doc_list";
		
	}
	
	@RequestMapping(path="/searchPatentDoc", method=RequestMethod.GET)
	public String searchUserPatents(@ModelAttribute("searchCondition")PatentDocSearchCondition searchCondition, Model model,HttpSession session) {
		Page page=searchCondition.getPage();
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		page.setPageSize(WebUtils.getPageSize(session));
		searchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		List<PatentDoc> resultPatentDocs = patentDocService.searchUserPatentDocsByPage(searchCondition);
		int totalCount=(int)patentDocService.searchUserPatentDocsCount(searchCondition);
		page.setTotalRecords(totalCount);
		model.addAttribute("patentDocs", resultPatentDocs);
		model.addAttribute("page", page);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/deletePatentDoc",method=RequestMethod.GET)
	public String  deletePatentDoc(@RequestParam("patentDocId")long patentDocId,Model model){
		int userId = PrincipalUtils.getCurrentUserId();
		patentDocService.deletePatentDoc(patentDocId,userId);
		int action=PatentDocWorkflowAction.ActionType.get("删除");
		patentDocWorkflowHistoryService.insertHistory((int)patentDocId, action);
	    return "redirect:/editor/patentDocList.html";
	}
	
	
	
	@RequestMapping(path="/previewPatentDoc",method=RequestMethod.GET)
	public String previewPatentDoc(@RequestParam("patentDocId")long patentDocId,@RequestParam("patentType")int patentType,Model model){
		PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocId);
		model.addAttribute("patentDoc", patentDoc);
		List<Attachment> Attachments=patentDocService.getAttachmentById(patentDocId);
		model.addAttribute("Attachments", Attachments);
		if(patentType==1){
			return "patent_doc_preview";
		}else if(patentType==2){
			return "patent_doc_preview";
		}else if(patentType==3){
			return "patent_doc_interface_preview";
		}
		return "";		
	}
	
	@RequestMapping(path="/previewInterfacePatentDoc",method=RequestMethod.GET)
	public String previewInterfacePatentDoc(@RequestParam("patentDocId")long patentDocId,Model model,PrintWriter writer){
		PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocId);
		model.addAttribute("patentDoc", patentDoc);
		List<Attachment> Attachments=patentDocService.getAttachmentById(patentDocId);
		model.addAttribute("Attachments", Attachments);
		return "patent_doc_interface_preview";
	}
	/*合并代码*/
	
	@RequestMapping(path="/choicePatentDocTemplateType")
	public String choicePatentDocTemplateType(){
		return "patent_doc_template_type_list";
	}

	@RequestMapping(path="/newPatentDocTemplate")
	public String newPatentDocTemplate(@RequestParam("patentType") int patentType,Model model){
		model.addAttribute("patentType", patentType);
		return "patent_doc_template_index";
	}
	
	@RequestMapping(path="/addPatentTemplate",produces={"text/html;charset=UTF-8;","application/json;"},method=RequestMethod.POST)
	public @ResponseBody String addBackTech(@ModelAttribute("patentDocumentTemplate") PatentDocumentTemplate patentDocumentTemplate){
		int UserId = PrincipalUtils.getCurrentUserId();
		patentDocumentTemplate.setCreatorId(UserId);
		patentDocumentTemplateService.savePatentDocumentTemplate(patentDocumentTemplate);
		return "添加模板成功！";
	}
	
	@RequestMapping(path="/templateList")
	public String templateList(Model model,Integer patentDocSectionId,HttpSession session){
		int userId = PrincipalUtils.getCurrentUserId();
		List<PatentDocumentTemplate> templateDocList  = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionId);
		List<PatentDocSectionType> patentDocSectionTypes = patentDocumentTemplateService.getPatentDocSectionTypes();
		model.addAttribute("templateDocList", templateDocList);
		model.addAttribute("patentDocSectionTypes", patentDocSectionTypes);
		model.addAttribute("sectionValue", patentDocSectionId);
		return "patent_doc_template_list";
	}

	@RequestMapping(path="/findTemplateDocByTemplateId",method=RequestMethod.GET)
	public String findTemplateDocByTemplateId(int templateId,Model model,int patentDocSectionId){
		PatentDocumentTemplate patentDocumentTemplate = patentDocumentTemplateService.findTemplateDocByTemplateId(templateId);
		model.addAttribute("patentDocumentTemplate", patentDocumentTemplate);
		model.addAttribute("patentDocSectionId", patentDocSectionId);
		return "patent_doc_template_modify"; 
	}
	
	@RequestMapping(path="/updateTemplateDoc",method=RequestMethod.POST)
	public String updateTemplateDoc(@ModelAttribute("patentDocumentTemplate") PatentDocumentTemplate updatePatentDocumentTemplate, Model model){
		patentDocumentTemplateService.updateTemplateDoc(updatePatentDocumentTemplate);
		int userId = PrincipalUtils.getCurrentUserId();
		List<PatentDocumentTemplate> templateDocList  = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,updatePatentDocumentTemplate.getPatentDocSectionType().getPatentDocSectionId());
		List<PatentDocSectionType> patentDocSectionTypes = patentDocumentTemplateService.getPatentDocSectionTypes();
		model.addAttribute("templateDocList", templateDocList);
		model.addAttribute("patentDocSectionTypes", patentDocSectionTypes);
		model.addAttribute("sectionValue", updatePatentDocumentTemplate.getPatentDocSectionType().getPatentDocSectionId());
		return "patent_doc_template_list";
	}
	
	
	@RequestMapping(path="/deletTemplateDocById",method=RequestMethod.POST,produces={"text/html;charset=UTF-8;","application/json"})
	@ResponseBody
	public String deletTemplateDocById(@RequestParam("templateId") int templateId){
		patentDocumentTemplateService.deleteTemplateDoc(templateId);
		return "删除成功！";
	}
	
	
	@RequestMapping(path="/savePatentImgUrl",method=RequestMethod.POST)
	public void savePatentImgUrl(Attachment attachment,PrintWriter writer){
		patentDocService.savePatentImgUrl(attachment);
		writer.write(1);
	}
	
	@RequestMapping(path="/savePracticalPatentImgUrl",method=RequestMethod.POST)
	public void savePracticalPatentImgUrl(Attachment attachment,HttpSession session,PrintWriter writer){
		patentDocService.savePatentImgUrl(attachment);
		writer.write(1);
	}
	
	@RequestMapping(path="/getAttachmentById",method=RequestMethod.POST)
	public void getAttachmentById(@RequestParam("patentDocId")long patentDocId,Model model,HttpServletResponse response,PrintWriter writer){
			try {
				List<Attachment> attachmentImg=patentDocService.getAttachmentById(patentDocId);
				WebUtils.writeJsonStrToResponse(response, attachmentImg);
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	@RequestMapping(path="/getLabelByUrl",method=RequestMethod.POST)
		public void getLabelById(@RequestParam("ImgUrl") String ImgUrl,Model model,HttpServletResponse response,PrintWriter writer){
		try {
			Attachment attachment=patentDocService.getLabelByUrl(ImgUrl);
			WebUtils.writeJsonStrToResponse(response, attachment);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(path="/delectAttachmentById",method=RequestMethod.POST)
	public void delectAttachmentById(@RequestParam("attachmentId")long attachmentId,Model model,HttpServletResponse response,PrintWriter writer){
			Attachment attachment=patentDocService.getAttachmentByAttachId(attachmentId);
			String url=attachment.getAttachmentUrl();
			
			String picPath=url.substring(0, url.lastIndexOf("."));

			long patentDocId=attachment.getPatentDocId();
			PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocId);
			int patentType=patentDoc.getPatentType();
			String imgPath;
			if(patentType==1 || patentType==2){
				 imgPath=Settings.PATENTDOC_DIR+picPath;
			}else{
				 imgPath=Settings.PATENTDOC_DIR+picPath;
			}
			System.out.println(imgPath);
			File file =new File(imgPath);
			file.delete();
		patentDocService.delectAttachmentById(attachmentId);
		writer.write(1);
	}
	
	@RequestMapping(path="/getTemplateList")
	public void getTemplateList(@RequestParam("sectionId")int sectionId,@RequestParam("patentType")int patentType,HttpServletResponse response) throws IOException{
		TemplatePage	templatePage = new TemplatePage();
		List<PatentDocumentTemplate> DocTemplates = patentDocumentTemplateService.getTemplateList(sectionId,templatePage.getPageSize(),patentType);
		WebUtils.writeJsonStrToResponse(response, DocTemplates);
	}
	@RequestMapping(path="/getTemplateListByPage")
	public void getTemplateListByPage(@RequestParam("sectionId")int sectionId,@ModelAttribute("templatePage") TemplatePage templatePage ,HttpServletResponse response) throws IOException{
		templatePage.setSectionId(sectionId);
		int totalCount = patentDocumentTemplateService.getTemlateSizeBySectionId(sectionId,templatePage.getPatentType());
		int currentTotalCount = templatePage.getCurrentPage()*templatePage.getPageSize();
		if(templatePage.getCurrentPage()<=1){
			templatePage.setCurrentPage(1);
		}
		if(currentTotalCount>=totalCount){
			templatePage.setCurrentPage((int)Math.ceil(totalCount/(double)templatePage.getPageSize()));
		}
		List<PatentDocumentTemplate> DocTemplates = patentDocumentTemplateService.getTemplateListByPage(templatePage);
		WebUtils.writeJsonStrToResponse(response, DocTemplates);
	}
	
	@RequestMapping(path="/getTotalPage")
	public void getTotalPage(@RequestParam("sectionId")int sectionId,@RequestParam("patentType")int patentType,HttpServletResponse response){
		int totalCount = patentDocumentTemplateService.getTemlateSizeBySectionId(sectionId,patentType);
		TemplatePage templatePage = new TemplatePage();
		int totalPage = (int)Math.ceil(totalCount/(double)templatePage.getPageSize());
		try{
			WebUtils.writeJsonStrToResponse(response, totalPage);
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(path="/exportWord")
	public void exportWord(@RequestParam("patentDocId")long patentDocId,HttpServletRequest reqeust, HttpServletResponse response) throws IOException {
		try{
		String manualFileName = "说明书" +".doc";
		String rightFileName = "权利要求书"+ ".doc";
		String manualAbstractFileName = "说明书摘要"  + ".doc";
		String manualImgFileName = "说明书附图" + ".doc";
		String abstractFileName = "摘要附图" + ".doc";
		 PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocId);
		 List<Attachment> AttachmentIntrodurces=patentDocService.getAttachmentById(patentDocId);

		 SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		 String contentName = df.format(new Date()) + "_" + new Random().nextInt(1000);
		 String patentExportWord = Settings.PATENT_EXPORT_WORD_NAME;
		 String saveWordPathDir=patentExportWord+contentName;
		 File dirFile = new File(saveWordPathDir);
		 if (!dirFile.exists()) {
				dirFile.mkdirs();
		 }
		 
		 List<String> ImgUrl=getAttachmentImgUrl(patentDocId);
		 List<String> ImgPath=getPicPath(ImgUrl);
		 copyImg(ImgPath,saveWordPathDir);
		CreateWord.writeWordManualFile(saveWordPathDir,patentDoc, manualFileName,AttachmentIntrodurces);
		CreateWord.writeWordRightFile(saveWordPathDir,patentDoc, rightFileName);
		CreateWord.writeWordManualAbstractFile(saveWordPathDir,patentDoc, manualAbstractFileName);
		CreateWord.writeWordManualAttachmentFile(saveWordPathDir,patentDoc, manualImgFileName);
		CreateWord.writeWordAbstractImgFile(saveWordPathDir,patentDoc, abstractFileName);
		String zipPath=saveWordPathDir+"/"+contentName+".zip";
		try {
			
			ZipFile zipFile = new ZipFile(zipPath);
			String folderToAdd = saveWordPathDir;
		
			ZipParameters parameters = new ZipParameters();
			
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
			zipFile.addFolder(folderToAdd, parameters);
			zipFile.getFile().getName();
		} catch (ZipException e) {
			e.printStackTrace();
		}
		
			String fileName=contentName+".zip";
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName,"UTF-8"));
			File wordFile = new File(zipPath);
			int BUFFER_SIZE = 8192;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = response.getOutputStream(); 
					BufferedInputStream bis = new BufferedInputStream(new FileInputStream(wordFile))) {
				int bytesRead = -1;
				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				bis.close();
				out.close();
				out.flush();
				
			}
			CreateWord.deleteDir(new File(saveWordPathDir));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/uploadFile",method=RequestMethod.POST)
	public void uploadPatentAttachment(HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		try{
			String savePath=Settings.PATENTDOC_ATTACHMENT_FILE_PATH;
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
			String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
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
			WebUtils.writeJsonStrToResponse(response,savePath+newFileName);
		}catch(Exception e){
			e.printStackTrace();
		}

	}
	
	@RequestMapping(path="/savePatentDocAttachmentFile",method=RequestMethod.POST)
	public void savePatentDocAttachmentFile(PatentDoc patentDoc,PrintWriter writer){
		patentDocService.savePatentDocAttachmentFile(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/getPatentDocAttachmentFile",method=RequestMethod.GET)
	public void  getPatentDocAttachmentFile(@RequestParam("patentDocId")long patentDocId,HttpServletResponse response,Model model){
		try{
			String filePath=patentDocService.getPatentDocAttachmentFile(patentDocId);
			String[] file=filePath.split("/");
			String fileName=file[file.length-1];
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName,"UTF-8"));
			File wordFile = new File(filePath);
			int BUFFER_SIZE = 8192;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = response.getOutputStream(); 
					BufferedInputStream bis = new BufferedInputStream(new FileInputStream(wordFile))) {
				int bytesRead = -1;
				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				bis.close();
				out.close();
		} catch (IOException e) {
			e.printStackTrace();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/deletePatentDocAttachmentFile",method=RequestMethod.GET)
	public void deletePatentDocAttachmentFile(@RequestParam("filePath")String filePath,PrintWriter writer){
		CreateWord.deleteDir(new File(filePath));
		writer.write(1);
	}
	
	public List<String> getAttachmentImgUrl(long patentDocId){
		List<Attachment> Imgs=patentDocService.getAttachmentById(patentDocId);
		List<String> ImgUrls=new ArrayList<>();
		for(Attachment Img: Imgs){
			String url=Img.getAttachmentUrl();
			ImgUrls.add(url);
		}
		return ImgUrls;
	}
	
	public  List<String> getPicPath(List<String> ImgUrls){
		List<String> savePath=new ArrayList<>();
		for(String ImgURl:ImgUrls){
			String url=DocUtil.ImagUrltoImagAddress(ImgURl);
			savePath.add(url);
		}
		return savePath;
	}
	
	public void copyImg(List<String> saveImgPath,String saveWordPathDir){
		try{
			for(String imgPath:saveImgPath){
				File from = new File(imgPath);
		        File to = new File(saveWordPathDir+"/"+from.getName());
		        FileUtils.copyFile(from, to);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping(path="/showUploadForm",method=RequestMethod.GET)
	public String showUploadForm(@RequestParam("patentDocId")long patentDocId,Model model){
		model.addAttribute("patentDocId", patentDocId);
		return "patent_doc_upload_form";
	}
	
	@RequestMapping(path="/showUploadPatentFileForm",method=RequestMethod.GET)
	public String showUploadPatentFileForm(@RequestParam("patentDocId")long patentDocId,Model model){
		model.addAttribute("patentDocId", patentDocId);
		return "patent_doc_upload_patent_file_form";
	}
	
	
	@RequestMapping(path="/uploadPatentDocFile",method=RequestMethod.POST)
	public void uploadPatentDocFile(HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		int userId = PrincipalUtils.getCurrentUserId();
		String savePath=Settings.PATENTDOC_FILE_PATH;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file");
		String fileName = multipartFile.getOriginalFilename();
		FileOption.fileUpload(userId, multipartFile, savePath, fileName, response);
		
		
//		try{
//			String savePath=Settings.PATENTDOC_FILE_PATH;
//			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
//			MultipartFile file1 = multipartRequest.getFile("file");
//			String fileName = file1.getOriginalFilename();
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//			String ymd = sdf.format(new Date());
//			savePath += ymd + "/";
//			File dirFile = new File(savePath);
//			if (!dirFile.exists()) {
//				dirFile.mkdirs();
//			}
//			String newFileName = userId + "_" + new Random().nextInt(10000) + "_" + fileName;
//			InputStream is = file1.getInputStream();
//			int BUFFER_SIZE = 8 * 1024;
//			byte[] buffer = new byte[BUFFER_SIZE];
//			try (OutputStream out = new FileOutputStream(savePath + newFileName);) {
//				int bytesRead = -1;
//				while ((bytesRead = is.read(buffer)) != -1) {
//					out.write(buffer, 0, bytesRead);
//				}
//				out.flush();
//				out.close();
//			}
//			WebUtils.writeJsonStrToResponse(response,ymd + "/"+newFileName);
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		
	}	
	
	@RequestMapping(path="/uploadPatentStandardFile",method=RequestMethod.POST)
	public void uploadPatentFile(HttpServletRequest request,HttpServletResponse response,PrintWriter printOut){
		int userId = PrincipalUtils.getCurrentUserId();
		String savePath=Settings.PATENT_DOC_SATNDARD_FILE;
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartRequest.getFile("file");
		String fileName = multipartFile.getOriginalFilename();
		FileOption.fileUpload(userId, multipartFile, savePath, fileName, response);
	}
	
	@RequestMapping(path="/savePatentDocFile",method=RequestMethod.POST)
	public void savePatentDocFile(PatentDoc patentDoc,PrintWriter writer){
		patentDocService.savePatentDocFile(patentDoc);
		patentDoc.getPatentDocId();
		List<Long> patentDocIds =new ArrayList<>();
		patentDocIds.add(patentDoc.getPatentDocId());
		final int PATENT_DOC_STAUTS_PAID = 8;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIds,PATENT_DOC_STAUTS_PAID);
		writer.write(1);
	}
	
	@RequestMapping(path="/savePatentStandardFile",method=RequestMethod.POST)
	public void savePatentFile(PatentDoc patentDoc,PrintWriter writer){
		patentDocService.savePatentStandardFile(patentDoc);
		patentDoc.getPatentDocId();
		List<Long> patentDocIds =new ArrayList<>();
		patentDocIds.add(patentDoc.getPatentDocId());
		final int PATENT_DOC_STAUTS_PAID = 10;
		patentDocWorkflowService.updatePatentDocStatus(patentDocIds,PATENT_DOC_STAUTS_PAID);
		writer.write(1);
	}
	
	
	@RequestMapping(path="/downloadPatentFile", method=RequestMethod.GET)
	public void downloadPatentFile(@RequestParam("patentDocId")long patentDocId, HttpServletResponse response,HttpServletRequest request) throws IOException {
		response.setContentType("application/doc");
		String relativeUrl = patentDocService.getPatentDocUrlById(patentDocId);
		String downloadFileName = URLEncoder.encode(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1), "UTF8");
		String filePath = Settings.PATENTDOC_FILE_PATH + relativeUrl;
		File patentDocFile = new File(filePath);
		if(WebUtils.isFireFox(request)){
			downloadFileName =new String(relativeUrl.substring(relativeUrl.lastIndexOf("/")+1).getBytes("UTF-8"),"iso-8859-1");
		}
		response.setHeader("Content-Disposition", "attachment;filename=" + downloadFileName);
		response.setContentLength((int)patentDocFile.length());
		WebUtils.writeStreamToResponse(response, new FileInputStream(patentDocFile));
	}
		
	@RequestMapping(path="showFriends", method=RequestMethod.GET)
	public String showFriends(Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.getUserFriends(userId);
		model.addAttribute("friends", friends);
		return "patent_doc_select_friends";
	}
	
	
	
	@RequestMapping(path="searchFriends", method=RequestMethod.GET)
	public String searchFriends(@RequestParam("keyword")String keyword, Model model) {
		int userId = PrincipalUtils.getCurrentUserId();
		List<User> friends = friendService.searchUserFriends(userId, keyword);
		model.addAttribute("friends", friends);
		return "patent_doc_select_friends";
	}
	
	@RequestMapping(path="/addShares", method=RequestMethod.GET)
	public String sharePatents(@RequestParam("patentDocIds")List<Integer> patentDocIds, @RequestParam("friends")List<Integer> friendIds) {
		List<Map<String, Integer>> userPatentDocRecords = new ArrayList<>();
		for (int patentDocId: patentDocIds) {
			for (int friendId: friendIds) {
				Map<String, Integer> userPatentRecord =  new HashMap<String, Integer>();
				userPatentRecord.put("userId", friendId);
				userPatentRecord.put("patentDocId", patentDocId);
				userPatentDocRecords.add(userPatentRecord);
			}
		}
		
		patentDocService.insertUserPatentDoc(userPatentDocRecords);
		return "patent_doc_list";
	}
	
	@RequestMapping(path="/downloadPic")
	public void downloadPic(@RequestParam("patentDocId")long patentDocId,HttpServletRequest reqeust, HttpServletResponse response) throws IOException {
		try{

		 SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		 String contentName = df.format(new Date()) + "_" + new Random().nextInt(1000);
		 String patentExportWord = Settings.PATENTDOC_ATTACHMENT_PATH;
		 String picPathdir=patentExportWord+patentDocId;
		 File dirFile = new File(picPathdir);
		 if (!dirFile.exists()) {
				dirFile.mkdirs();
		 }
		 

		String zipPath=Settings.TEMP_DIR+contentName+".zip";
		try {
			
			ZipFile zipFile = new ZipFile(zipPath);
			String folderToAdd = picPathdir;
		
			ZipParameters parameters = new ZipParameters();
			
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
			zipFile.addFolder(folderToAdd, parameters);
			zipFile.getFile().getName();
		} catch (ZipException e) {
			e.printStackTrace();
		}
		
			String fileName=contentName+".zip";
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName,"UTF-8"));
			File wordFile = new File(zipPath);
			int BUFFER_SIZE = 8192;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = response.getOutputStream(); 
					BufferedInputStream bis = new BufferedInputStream(new FileInputStream(wordFile))) {
				int bytesRead = -1;
				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				bis.close();
				out.close();
				
			}
			wordFile.delete();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	@RequestMapping(path="/updateAttachmentImgName", method=RequestMethod.POST)
	public void updateAttachmentImgName(Attachment attachment ,PrintWriter writer){
		String picName=attachment.getCaption();
		long attachmentId=attachment.getAttachmentId();
		Attachment attachment1=patentDocService.getAttachmentByAttachId(attachmentId);
		String url=attachment1.getAttachmentUrl();
		/*操作url更改,生成新的图片路径*/
		String[] arr=url.split("\\.");
		String str1=url.substring(0, url.lastIndexOf("/")+1);
		String newName=str1+picName+"."+arr[1]+"."+arr[2];
		String newImgUrl=newName;
		/*更新旧的ImgUrl*/
		Attachment newAttachment=new Attachment();
		newAttachment.setAttachmentId(attachmentId);
		newAttachment.setAttachmentUrl(newImgUrl);
		patentDocService.updateAttachmentImgUrl(newAttachment);
		/*查找图片路径并修改图片名*/
		String picPath="/opt/media/patent"+url.substring(0, url.lastIndexOf("."));
		File file=new File(picPath);
		if(file.exists()){
		file.renameTo(new File("/opt/media/patent"+str1+picName+"."+arr[1]));
		}
		patentDocService.updateAttachmentImgName(attachment);
		writer.write(1);
	}
	
	@RequestMapping(path="/downloadInterFacePic")
	public void downloadInterFacePic(@RequestParam("patentDocId")long patentDocId,HttpServletRequest reqeust, HttpServletResponse response) throws IOException {
		try{

		 SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		 String contentName = df.format(new Date()) + "_" + new Random().nextInt(1000);
		 String patentExportWord = Settings.PATENTDOC_INTERFACEPIC_PATH;
		 String picPathdir=patentExportWord+patentDocId;
		 File dirFile = new File(picPathdir);
		 if (!dirFile.exists()) {
				dirFile.mkdirs();
		 }
		 

		String zipPath=Settings.TEMP_DIR+contentName+".zip";
		try {
			
			ZipFile zipFile = new ZipFile(zipPath);
			String folderToAdd = picPathdir;
		
			ZipParameters parameters = new ZipParameters();
			
			parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
			parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
			zipFile.addFolder(folderToAdd, parameters);
			zipFile.getFile().getName();
		} catch (ZipException e) {
			e.printStackTrace();
		}
		
			String fileName=contentName+".zip";
			response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName,"UTF-8"));
			File wordFile = new File(zipPath);
			int BUFFER_SIZE = 8192;
			byte[] buffer = new byte[BUFFER_SIZE];
			try (OutputStream out = response.getOutputStream(); 
					BufferedInputStream bis = new BufferedInputStream(new FileInputStream(wordFile))) {
				int bytesRead = -1;
				while ((bytesRead = bis.read(buffer)) != -1) {
					out.write(buffer, 0, bytesRead);
				}
				out.flush();
				bis.close();
				out.close();
				
			}
			wordFile.delete();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	

	

}
