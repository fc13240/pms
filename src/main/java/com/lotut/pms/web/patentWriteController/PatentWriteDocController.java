package com.lotut.pms.web.patentWriteController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.service.PatentDocService;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/editor")
public class PatentWriteDocController {
	private PatentDocService patentDocService;
	private PatentDocumentTemplateService patentDocumentTemplateService;
	
	@Autowired
	public PatentWriteDocController(PatentDocService patentDocService,PatentDocumentTemplateService patentDocumentTemplateService) {
		this.patentDocService = patentDocService;
		this.patentDocumentTemplateService = patentDocumentTemplateService;
	}
	

	@RequestMapping(path="/inventionWriterForm")
	public String inventionEditorForm(@RequestParam("patentType")int patentType, Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("patentType",patentType);
		return "patentDoc_invention_editor";
	}

	@RequestMapping(path="/practicalWriterForm")
	public String practicalEditorForm(@RequestParam("patentType")int patentType,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("patentType",patentType);
		return "patentDoc_practical_editor";
	}	
	
	@RequestMapping(path="/addPatentDoc",method=RequestMethod.POST)
	public void  addEditorText(PatentDoc patentDoc,HttpServletRequest request,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.savePatentDoc(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/findPatentDoc",method=RequestMethod.GET)
	public String  findPatentDoc(@RequestParam("patentDocsId")long patentDocsId,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocsId);
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patent", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		return "patentDoc_search";		
	}
	
	@RequestMapping(path="/compilePatentDoc",method=RequestMethod.GET)
	public String  compilePatentDoc(@RequestParam("patentDocsId")long patentDocsId,@RequestParam("tab")int tab,Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		PatentDoc patentDoc=patentDocService.getUserPatentDocById(patentDocsId);
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patent", patentDoc);
		model.addAttribute("patentDocs", patentDocs);
		model.addAttribute("tab", tab);
		return "patentDoc_search2";		
	}
	@RequestMapping(path="/PatentDocList",method=RequestMethod.GET)
	public String  PatentDocList(Model model){
		int userId=PrincipalUtils.getCurrentUserId();
		List<PatentDoc> patentDocs=patentDocService.getUserPatentDoc(userId);
		model.addAttribute("patentDocs", patentDocs);
		return "patent_write_list";
		
	}
	@RequestMapping(path="/deletePatentDoc",method=RequestMethod.GET)
	public String  deletePatentDoc(@RequestParam("patentDocsId")long patentDocsId,Model model){
		patentDocService.deletePatentDoc(patentDocsId);
	    return "redirect:/editor/PatentDocList.html";

		
	}
	
	
	@RequestMapping(path="/updatePatentDoc",method=RequestMethod.POST)
	public void  updatePatentDoc(@RequestParam("patentDocsId")long patentDocsId,PatentDoc patentDoc,Model model,PrintWriter writer){
		int userId=PrincipalUtils.getCurrentUserId();
		patentDoc.setUserId(userId);
		patentDocService.updatePatentDoc(patentDoc);
		writer.write(1);
	}
	
	@RequestMapping(path="/previewPatentDoc",method=RequestMethod.GET)
	public String previewPatentDoc(@RequestParam("patentDocsId")long patentDocsId,Model model,PrintWriter writer){
		PatentDoc patentDoc = patentDocService.getUserPatentDocById(patentDocsId);
		model.addAttribute("patentDoc", patentDoc);
		return "patentDoc_preview";
	}
	
	/*合并代码*/
	
	@RequestMapping(path="/patentDocTemplate")
	public String patentDocTemplate(){
		return "patentDoc_template_index";
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
		return "patentDoc_template_list";
	}

	@RequestMapping(path="/findTemplateDocByTemplateId",method=RequestMethod.GET)
	public String findTemplateDocByTemplateId(int templateId,Model model,int patentDocSectionId){
		PatentDocumentTemplate patentDocumentTemplate = patentDocumentTemplateService.findTemplateDocByTemplateId(templateId);
		model.addAttribute("patentDocumentTemplate", patentDocumentTemplate);
		model.addAttribute("patentDocSectionId", patentDocSectionId);
		return "patentDoc_template_update"; 
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
		return "patentDoc_template_list";
	}
	
	
	@RequestMapping(path="/deletTemplateDocById",method=RequestMethod.POST,produces={"text/html;charset=UTF-8;","application/json"})
	@ResponseBody
	public String deletTemplateDocById(@RequestParam("templateId") int templateId){
		patentDocumentTemplateService.deleteTemplateDoc(templateId);
		return "删除成功！";
	}
	
	
	@RequestMapping(path="/savePatentImgUrl",method=RequestMethod.POST)
	public String savePatentImgUrl(Model model){
		return "patentDoc_invention_editor";
	}
	
	
	/**
	 * 提交表单操作
	 */
	@RequestMapping(path="/ajaxForm",method=RequestMethod.POST)
	public void ajaxForm(HttpServletResponse response, String content){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        PrintWriter writer = null;
        try {
            writer = response.getWriter();
            
			writer.println(content);
            
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
	}
}
