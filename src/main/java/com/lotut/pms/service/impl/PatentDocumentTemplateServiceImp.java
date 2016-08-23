package com.lotut.pms.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.lotut.pms.dao.PatentDocumentTemplateDao;
import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;
import com.lotut.pms.service.PatentDocumentTemplateService;

public class PatentDocumentTemplateServiceImp implements PatentDocumentTemplateService{
	private PatentDocumentTemplateDao  patentDocumentTemplateDao;

	public PatentDocumentTemplateServiceImp(PatentDocumentTemplateDao patentDocumentTemplateDao) {
		this.patentDocumentTemplateDao = patentDocumentTemplateDao;
	}

	@Override
	@Transactional
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
	@Transactional
	public void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate) {
		patentDocumentTemplateDao.updateTemplateDoc(patentDocumentTemplate);
	}

	@Override
	@Transactional
	public void deleteTemplateDoc(int templateId) {
		patentDocumentTemplateDao.deleteTemplateDoc(templateId);
	}

	@Override
	public List<PatentDocumentTemplate> getTemplateList(int sectionId,int pageSize,int patentType) {
		return patentDocumentTemplateDao.getTemplateList(sectionId,pageSize,patentType);
	}

	@Override
	public List<PatentDocumentTemplate> getTemplateListByPage(TemplatePage templatePage) {
		return patentDocumentTemplateDao.getTemplateListByPage(templatePage);
	}

	@Override
	public int getTemlateSizeBySectionId(int sectionId,int patentType) {
		return patentDocumentTemplateDao.getTemlateSizeBySectionId(sectionId,patentType);
	}
	
}
