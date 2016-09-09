package com.lotut.pms.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lotut.pms.domain.PatentDocWorkflowHistory;
import com.lotut.pms.service.PatentDocWorkflowHistoryService;

@Controller
@RequestMapping(path="/patentDocWorkflowHistory")
public class PatentDocWorkflowHistoryController {
	private PatentDocWorkflowHistoryService patentDocWorkflowHistoryService;
	
	@Autowired
	public PatentDocWorkflowHistoryController(PatentDocWorkflowHistoryService patentDocWorkflowHistoryService) {
		this.patentDocWorkflowHistoryService = patentDocWorkflowHistoryService;
	}
	
	@RequestMapping(path="/getHistory")
	public String getHistory(long patentDocId,String patentDocName,Model model){
		List<PatentDocWorkflowHistory> patentDocWorkflowHistories=patentDocWorkflowHistoryService.getHistoryByPatentDocId((int)patentDocId);
		model.addAttribute("patentDocWorkflowHistories",patentDocWorkflowHistories);
		model.addAttribute("patentDocName",patentDocName);
		return "patent_doc_workflow_history_list";
		
	}
	

}
