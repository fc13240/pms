package com.lotut.pms.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.PatentDocumentTemplateDao;
import com.lotut.pms.dao.mapper.PatentDocumentTemplateMapper;
import com.lotut.pms.domain.PatentDocumentTemplate;

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
		// TODO Auto-generated method stub
		return patentDocumentTemplateMapper.getPatentDocTemplateListByUserId(userId, patentDocSectionId);
	}

}
