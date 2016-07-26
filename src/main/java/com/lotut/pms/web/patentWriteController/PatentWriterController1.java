package com.lotut.pms.web.patentWriteController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.util.PrincipalUtils;

@Controller
@RequestMapping(path="/editor1")
public class PatentWriterController1 {
	
	private PatentDocumentTemplateService patentDocumentTemplateService;
	
	@Autowired
	public PatentWriterController1(PatentDocumentTemplateService patentDocumentTemplateService) {
		super();
		this.patentDocumentTemplateService = patentDocumentTemplateService;
	}

	@RequestMapping(path="/editorTemplatePage")
	public String editorTemplatePage(){
		return "edit_template_index";
	}
	
	@RequestMapping(path="/addInventTemplate.html",produces={"text/html;charset=UTF-8;","application/json;"})
	public @ResponseBody String addInventTemplate(@ModelAttribute("patentDocumentTemplate") PatentDocumentTemplate patentDocumentTemplate){
		System.out.println("专利名称:"+patentDocumentTemplate.getContent());
		System.out.println("专利名称:"+patentDocumentTemplate.getTemplateTitle());
		
		
		int UserId = PrincipalUtils.getCurrentUserId();
		patentDocumentTemplate.setCreatorId(UserId);
		PatentDocSectionType pst=new PatentDocSectionType();
		pst.setPatentDocSectionId(1);
		patentDocumentTemplate.setPatentDocSectionType(pst);
		PatentType pt=new PatentType();
		pt.setPatentTypeId(1);
		patentDocumentTemplate.setPatentType(pt);
		patentDocumentTemplateService.savePatentDocumentTemplate(patentDocumentTemplate);
		return "添加发明模板成功！";
	}
}

