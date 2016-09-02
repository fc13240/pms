package com.lotut.pms.service.impl;

import com.lotut.pms.dao.PatentDocDao;
import com.lotut.pms.dao.PatentDocWorkflowDao;
import com.lotut.pms.service.PatentDocWorkflowService;

public class PatentDocWorkflowServiceImpl implements PatentDocWorkflowService{
	private PatentDocWorkflowDao patentDocWorkflowDao;
	private PatentDocDao patentDocDao;
	

	public PatentDocWorkflowServiceImpl(PatentDocWorkflowDao patentDocWorkflowDao,PatentDocDao patentDocDao) {
		this.patentDocWorkflowDao = patentDocWorkflowDao;
		this.patentDocDao=patentDocDao;
	}
	
	
}
