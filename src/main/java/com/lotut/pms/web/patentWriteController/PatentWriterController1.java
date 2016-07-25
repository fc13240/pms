package com.lotut.pms.web.patentWriteController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.PatentDocumentTemplate;

@Controller
@RequestMapping(path="/editor1")
public class PatentWriterController1 {
	
	@RequestMapping(path="/editorTemplatePage")
	public String editorTemplatePage(){
		return "edit_template_index";
	}
	
	@RequestMapping(path="/addInventTemplate.html")
	public void addInventTemplate(@ModelAttribute("patentDocumentTemplate") PatentDocumentTemplate patentDocumentTemplate){
		System.out.println("专利名称:"+patentDocumentTemplate.getContent());
	}
}

