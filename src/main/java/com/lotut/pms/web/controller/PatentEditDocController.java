package com.lotut.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.domain.TemplatePage;
import com.lotut.pms.domain.User;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.HTMLToWord;
import com.lotut.pms.web.util.WebUtils;

@Controller
@RequestMapping(path="/editor")
public class PatentEditDocController {
	private PatentDocService patentDocService;
	private PatentDocumentTemplateService patentDocumentTemplateService;
	
	@Autowired
	public PatentEditDocController(PatentDocService patentDocService,PatentDocumentTemplateService patentDocumentTemplateService) {
		this.patentDocService = patentDocService;
		this.patentDocumentTemplateService = patentDocumentTemplateService;
	}
	

	@RequestMapping(path="/newPatentDoc")
	public String inventionEditorForm(@RequestParam("patentType")int patentType, PatentDoc patentDoc,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDoc.setPatentType(patentType);
		patentDocService.savePatentDoc(patentDoc);
		long patentDocId=patentDoc.getPatentDocId();
		model.addAttribute("patentDocId",patentDocId);
		model.addAttribute("patentDoc",patentDoc);
		if(patentType==1){
			return "patent_doc_invent_edit";
		}else if(patentType==2){
			return "patent_doc_practical_edit";
		}
		return "";	
	}

	
	@RequestMapping(path="/savePatentDoc",method=RequestMethod.POST)
	public void  savePatentDoc(PatentDoc patentDoc,HttpServletRequest request,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
	
		patentDocService.updatePatentDoc(patentDoc);
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
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDoc", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("patenType",patentType);
		if(patentType==1){
			return "patent_doc_invent_edit";
		}else if(patentType==2){
			return "patent_doc_practical_edit";
		}
		return "";		
	}
	

	@RequestMapping(path="/patentDocList",method=RequestMethod.GET)//patentDocList
	public String  patentDocList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocss=patentDocService.getUserPatentDoc(userId);
		List<PatentDoc> patentDocs= new ArrayList<>();
		for (PatentDoc patentDoc:patentDocss) {
			if(patentDoc.getAppNo()==null&patentDoc.getAbstractDescription()==null
					&patentDoc.getBackgoundTech()==null&patentDoc.getContent()==null
					&patentDoc.getImplementWay()==null&patentDoc.getName()==null&patentDoc.getRightClaim()==null
					&patentDoc.getTechDomain()==null&patentDoc.getAbstractImg()==null){
					patentDocService.deleteNullPatentDoc();
			}else{
				patentDocs.add(patentDoc);
			}
		}
		model.addAttribute("patentDocs", patentDocs);
		return "patent_doc_list";
		
	}
	@RequestMapping(path="/deletePatentDoc",method=RequestMethod.GET)
	public String  deletePatentDoc(@RequestParam("patentDocId")long patentDocId,Model model){
		patentDocService.deletePatentDoc(patentDocId);
	    return "redirect:/editor/patentDocList.html";
	}
	
	
	
	@RequestMapping(path="/previewPatentDoc",method=RequestMethod.GET)
	public String previewPatentDoc(@RequestParam("patentDocId")long patentDocId,Model model,PrintWriter writer){
		PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocId);
		model.addAttribute("patentDoc", patentDoc);
		List<Attachment> Attachments=patentDocService.getAttachmentById(patentDocId);
		model.addAttribute("Attachments", Attachments);
		return "patent_doc_preview";
	}
	
	/*合并代码*/
	
	@RequestMapping(path="/patentDocTemplate")
	public String patentDocTemplate(){
		return "patent_doc_template_index";
	}
	
	@RequestMapping(path="/addPatentTemplate",produces={"text/html;charset=UTF-8;","application/json;"},method=RequestMethod.POST)
	public @ResponseBody String addBackTech(@ModelAttribute("patentDocumentTemplate") PatentDocumentTemplate patentDocumentTemplate){
		int UserId = PrincipalUtils.getCurrentUserId();
		patentDocumentTemplate.setCreatorId(UserId);
		PatentType pt=new PatentType();
		pt.setPatentTypeId(1);
		patentDocumentTemplate.setPatentType(pt);
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
		patentDocService.delectAttachmentById(attachmentId);
		writer.write(1);
	}
	
	@RequestMapping(path="/getTemplateList")
	public void getTemplateList(@RequestParam("sectionId")int sectionId,HttpServletResponse response) throws IOException{
		TemplatePage	templatePage = new TemplatePage();
		List<PatentDocumentTemplate> DocTemplates = patentDocumentTemplateService.getTemplateList(sectionId,templatePage.getPageSize());
		WebUtils.writeJsonStrToResponse(response, DocTemplates);
	}
	@RequestMapping(path="/getTemplateListByPage")
	public void getTemplateListByPage(@RequestParam("sectionId")int sectionId,@ModelAttribute("templatePage") TemplatePage templatePage ,HttpServletResponse response) throws IOException{
		templatePage.setSectionId(sectionId);
		int totalCount = patentDocumentTemplateService.getTemlateSizeBySectionId(sectionId);
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
	public void getTotalPage(@RequestParam("sectionId")int sectionId,HttpServletResponse response){
		int totalCount = patentDocumentTemplateService.getTemlateSizeBySectionId(sectionId);
		TemplatePage templatePage = new TemplatePage();
		int totalPage = (int)Math.ceil(totalCount/(double)templatePage.getPageSize());
		try{
			WebUtils.writeJsonStrToResponse(response, totalPage);
		}catch(IOException e){
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(path="/exportWord")
	public void exportWord(@RequestParam("patentDocId")long patentDocId,PrintWriter writer,HttpServletRequest reqeust, HttpServletResponse response) throws IOException{
		
		
		response.setContentType("application/vnd.ms-word");
		response.setHeader("X-FRAME-OPTIONS", "SAMEORIGIN");

		User user = PrincipalUtils.getCurrentPrincipal();
		String exportFileName = user.getUsername() + System.currentTimeMillis() + ".xls";
		PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocId);
		String exportExcelPath =HTMLToWord.writeWordFile(patentDoc, exportFileName);
		
		
		File excelFile = new File(exportExcelPath);
		response.setContentLength((int)excelFile.length());
		response.setHeader("Content-Disposition", "attachment;filename=" + exportFileName);
		
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
	//预览编辑功能
/*	@RequestMapping(path="/compilePatentDoc",method=RequestMethod.GET)
	public String  compilePatentDoc(@RequestParam("patentDocId")long patentDocId,@RequestParam("tab")int tab,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocId);
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patent", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("tab", tab);
		return "patentDoc_search2";
	}*/
	
	

}
