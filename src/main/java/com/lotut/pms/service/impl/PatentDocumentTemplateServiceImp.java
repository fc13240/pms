package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PatentDocumentTemplateDao;
import com.lotut.pms.domain.PatentDocSectionType;
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

	@Override
	public List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(int userId, int patentDocSectionId) {
		return patentDocumentTemplateDao.getPatentDocTemplateListByUserId(userId, patentDocSectionId);
	}

	@Override
	public List<PatentDocSectionType> getPatentDocSectionTypes() {
		return patentDocumentTemplateDao.getPatentDocSectionTypes();
	}

	@Override
	public PatentDocumentTemplate findTemplateDocByTemplateId(int templateId) {
		return patentDocumentTemplateDao.findTemplateDocByTemplateId(templateId);
	}

	@Override
	public void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate) {
		patentDocumentTemplateDao.updateTemplateDoc(patentDocumentTemplate);
	}
	
}
