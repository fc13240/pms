package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lotut.pms.domain.EditorTest;
import com.lotut.pms.service.EditorService;

@Controller
@RequestMapping(path="/editor")
public class FindEditorController {
	
	private EditorService editorService;
	
	
	@Autowired
	public FindEditorController(EditorService editorService) {
		this.editorService = editorService;
	}

	@RequestMapping(path="/editorForm")
	public String editorForm(Model model){
		List<Integer> editorIds = editorService.findTextId();
		model.addAttribute("editorIds", editorIds);
		return "kindEditor";
	}
	
	@RequestMapping(path="/addEditorText")
	public String  addEditorText(@ModelAttribute("editorText") EditorTest editorTest){
		editorService.saveEditorText(editorTest);
		return "kindEditor";
	}
	
	@RequestMapping(path="/findTextById")
	public String  findTextById(@RequestParam("editorId") int editorId,Model model){
		EditorTest editorTest = editorService.findTextById(editorId);
		model.addAttribute("editorTest", editorTest);
		List<Integer> editorIds = editorService.findTextId();
		model.addAttribute("editorIds", editorIds);
		return "displayKindEditor";
	}
	
//	@RequestMapping(path="/findTextId")
//	public String  findTextId(){
//		List<Integer> editorIds = editorService.findTextId();
//		model
//		return "kindEditor";
//	}
	
}
