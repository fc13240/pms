package com.lotut.pms.web.patentWriteController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.service.PatentDocService;

@Controller
@RequestMapping(path="/editor")
public class PatentWriteDocController {
	private PatentDocService patentDocService;

	public PatentDocService getPatentDocService() {
		return patentDocService;
	}
	@Autowired
	public void setPatentDocService(PatentDocService patentDocService) {
		this.patentDocService = patentDocService;
	}
	@RequestMapping(path="/writeForm")
	public String editorForm(Model model){
		return "edit_index";
	}
	
}
