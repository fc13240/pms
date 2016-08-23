package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;

public interface PatentDocumentTemplateMapper {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);
	
	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(@Param("userId") int userId,@Param("patentDocSectionId") int patentDocSectionId);
	
	List<PatentDocSectionType> getPatentDocSectionTypes();
	
	PatentDocumentTemplate findTemplateDocByTemplateId(@Param("templateId") int templateId);
	
	void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate);
	
	void deleteTemplateDoc(@Param("templateId") int templateId);
	
	List<PatentDocumentTemplate> getTemplateList(@Param("sectionId") int sectionId,@Param("pageSize") int pageSize,@Param("patentType") int patentType);
	
	List<PatentDocumentTemplate> getTemplateListByPage(TemplatePage templatePage);
	
	int getTemlateSizeBySectionId(@Param("sectionId") int sectionId,@Param("patentType") int patentType);
}
