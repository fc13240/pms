package com.lotut.pms.dao.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;

public interface PatentDocMapper {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDocEditor(@Param("userId")int userId);
	
	int getUserPatentDocCount(@Param("userId")int userId);
	
	List<PatentDoc> getUserPatentDoc(Page page);
	
	PatentDoc getUserPatentDocById(@Param("patentDocId")long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);
	
	void deletePatentDoc(@Param("patentDocId")long patentDocId,@Param("userId")int userId);

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
	
	List<PatentDoc> searchUserPatentDocsByPage(PatentDocSearchCondition searchCondition);
	
	int searchUserPatentDocsCount(PatentDocSearchCondition searchCondition);
}
