package com.lotut.pms.web.patentWriteController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lotut.pms.constants.patentDocSectionTyeps;
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
	
	@RequestMapping(path="/templateList")
	public String templateList(Model model){
		//发明名称
		int userId = PrincipalUtils.getCurrentUserId();
		List<PatentDocumentTemplate> inventNameTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("inventName"));
		//技术领域
		List<PatentDocumentTemplate> techDomainTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("techDomain"));
		//背景技术
		List<PatentDocumentTemplate> backTechTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("backTech"));
		//发发明内容
		List<PatentDocumentTemplate> contentProblemTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("contentProblem"));
		List<PatentDocumentTemplate> contentClaimTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("contentClaim"));
		List<PatentDocumentTemplate> contentEffectTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("contentEffect"));
		
		//具体实施方式
		List<PatentDocumentTemplate> implementWayTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("implementWay"));
		//权利要求
		List<PatentDocumentTemplate> rightClaimTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("rightClaim"));
		//摘要
		List<PatentDocumentTemplate> abstractTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("abstract"));
		
		//实用新型
		//List<PatentDocumentTemplate> abstractTemplates = patentDocumentTemplateService.getPatentDocTemplateListByUserId(userId,patentDocSectionTyeps.SectionTyepMap.get("practicalName"));
		
		model.addAttribute("inventNameTemplates", inventNameTemplates);
		model.addAttribute("techDomainTemplates", techDomainTemplates);
		model.addAttribute("backTechTemplates", backTechTemplates);
		model.addAttribute("contentProblemTemplates", contentProblemTemplates);
		model.addAttribute("contentClaimTemplates", contentClaimTemplates);
		model.addAttribute("contentEffectTemplates", contentEffectTemplates);
		model.addAttribute("implementWayTemplates", implementWayTemplates);
		model.addAttribute("rightClaimTemplates", rightClaimTemplates);
		model.addAttribute("abstractTemplates", abstractTemplates);
		return "patentDoc_template_list";
	}
}

