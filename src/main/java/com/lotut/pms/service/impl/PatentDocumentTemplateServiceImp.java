package com.lotut.pms.service.impl;

import com.lotut.pms.dao.PatentDocumentTemplateDao;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.service.PatentDocumentTemplateService;

public class PatentDocumentTemplateServiceImp implements PatentDocumentTemplateService{
	private PatentDocumentTemplateDao  patentDocumentTemplateDao;

	public PatentDocumentTemplateServiceImp(PatentDocumentTemplateDao patentDocumentTemplateDao) {
		this.patentDocumentTemplateDao = patentDocumentTemplateDao;
	}

	@Override
	public void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate) {
		patentDocumentTemplateDao.savePatentDocumentTemplate(patentDocumentTemplate);
	}
	
}
