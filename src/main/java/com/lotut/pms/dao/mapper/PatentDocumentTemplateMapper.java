package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;

public interface PatentDocumentTemplateMapper {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);
	
	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(@Param("userId") int userId,@Param("patentDocSectionId") int patentDocSectionId);
	
	List<PatentDocSectionType> getPatentDocSectionTypes();
	
	PatentDocumentTemplate findTemplateDocByTemplateId(@Param("templateId") int templateId);
	
	void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate);
	
	void deleteTemplateDoc(@Param("templateId") int templateId);
}
