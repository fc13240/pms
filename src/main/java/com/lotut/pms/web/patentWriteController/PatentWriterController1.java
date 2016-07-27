package com.lotut.pms.web.patentWriteController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.PatentType;
import com.lotut.pms.service.PatentDocumentTemplateService;
import com.lotut.pms.util.PrincipalUtils;

import jdk.nashorn.internal.ir.RuntimeNode.Request;


@Controller
@RequestMapping(path="/editor1")
public class PatentWriterController1 {
	
	private PatentDocumentTemplateService patentDocumentTemplateService;
	
	@Autowired
	public PatentWriterController1(PatentDocumentTemplateService patentDocumentTemplateService) {
		super();
		this.patentDocumentTemplateService = patentDocumentTemplateService;
	}

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
}

