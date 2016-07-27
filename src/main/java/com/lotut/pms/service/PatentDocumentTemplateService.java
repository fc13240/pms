package com.lotut.pms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocumentTemplate;

public interface PatentDocumentTemplateService {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);

	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(@Param("userId") int userId,@Param("patentDocSectionId") int patentDocSectionId);
}
