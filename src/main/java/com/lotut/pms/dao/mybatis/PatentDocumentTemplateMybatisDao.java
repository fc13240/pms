package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDocumentTemplateDao;
import com.lotut.pms.dao.mapper.PatentDocumentTemplateMapper;
import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;

public class PatentDocumentTemplateMybatisDao extends SqlSessionDaoSupport implements PatentDocumentTemplateDao{
	private PatentDocumentTemplateMapper patentDocumentTemplateMapper;
	
	
	@Override
	public void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate) {
		patentDocumentTemplateMapper.savePatentDocumentTemplate(patentDocumentTemplate);
	}


	public void setPatentDocumentTemplateMapper(PatentDocumentTemplateMapper patentDocumentTemplateMapper) {
		this.patentDocumentTemplateMapper = patentDocumentTemplateMapper;
	}


	@Override
	public List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(int userId, int patentDocSectionId) {
		
		return patentDocumentTemplateMapper.getPatentDocTemplateListByUserId(userId, patentDocSectionId);
	}


	@Override
	public List<PatentDocSectionType> getPatentDocSectionTypes() {
		
		return patentDocumentTemplateMapper.getPatentDocSectionTypes();
	}


	@Override
	public PatentDocumentTemplate findTemplateDocByTemplateId(int templateId) {
		
		return patentDocumentTemplateMapper.findTemplateDocByTemplateId(templateId);
	}


	@Override
	public void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate) {
		patentDocumentTemplateMapper.updateTemplateDoc(patentDocumentTemplate);
	}


	@Override
	public void deleteTemplateDoc(int templateId) {
		
		patentDocumentTemplateMapper.deleteTemplateDoc(templateId);
	}


	@Override
	public List<PatentDocumentTemplate> getTemplateList(int sectionId,int pagSize,int patentType) {
		return patentDocumentTemplateMapper.getTemplateList(sectionId,pagSize,patentType);
	}

	public List<PatentDocumentTemplate> getTemplateListByPage(TemplatePage templatePage) {
		return patentDocumentTemplateMapper.getTemplateListByPage(templatePage);
	}


	@Override
	public int getTemlateSizeBySectionId(int sectionId,int patentType) {
		return patentDocumentTemplateMapper.getTemlateSizeBySectionId(sectionId,patentType);
	}
}
