package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocumentTemplate;

public interface PatentDocumentTemplateMapper {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);
	
	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(@Param("userId") int userId,@Param("patentDocSectionId") int patentDocSectionId);
}
