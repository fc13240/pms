package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;

public interface PatentDocMapper {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(@Param("userId")int userId);
	
	PatentDoc getUserPatentDocById(@Param("patentDocId")long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);
	
	void deletePatentDoc(long patentDocId);

	void savePatentImgUrl(Attachment attachment);
	
	List<Attachment> getAttachmentById(@Param("patentDocId")long patentDocId);
	
	void delectAttachmentById(@Param("attachmentId")long attachmentId);
	
	void deleteNullPatentDoc();
	
	void savePatentAbstractImg(PatentDoc PatentDoc);
	
	Attachment getLabelByUrl(String url);
	
	void savePatentDocAttachmentFile(PatentDoc PatentDoc);
	
	String getPatentDocAttachmentFile(@Param("patentDocId")long patentDocId);

	void savePatentDocFile(PatentDoc patentDoc);

	String getPatentDocUrlById(long patentDocId);
	
	void insertUserPatentDoc(List<Map<String, Integer>> userPatentDocRecords);
	
	List<PatentDoc> searchUserPatentDocsByPage(@Param("searchCondition")PatentDocSearchCondition searchCondition);
	
	int searchUserPatentDocsCount(@Param("searchCondition")PatentDocSearchCondition searchCondition);
}
