package com.lotut.pms.dao;

import java.util.List;
import java.util.Map;

import com.lotut.pms.domain.Attachment;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.PatentDoc;
import com.lotut.pms.domain.PatentDocSearchCondition;

public interface PatentDocDao {
	void savePatentDoc(PatentDoc PatentDoc);
	
	int getUserPatentDocCount(int userId);
	
	List<PatentDoc> getUserPatentDoc(Page page);

	List<PatentDoc> getUserPatentDocEditor(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocId);
	
	void updatePatentDoc(PatentDoc patentDoc);
	
	void deletePatentDoc(long patentDocId,int userId);
	
	void savePatentImgUrl(Attachment attachment);
	
	List<Attachment> getAttachmentById(long patentDocId);
	
	boolean delectAttachmentById(long attachmentId);
	
	void deleteNullPatentDoc();
	
	void savePatentAbstractImg(PatentDoc PatentDoc);
	
	Attachment getLabelByUrl(String url);
	
	void savePatentDocAttachmentFile(PatentDoc PatentDoc);
	
	String getPatentDocAttachmentFile(long patentDocId);

	void savePatentDocFile(PatentDoc patentDoc);

	String getPatentDocUrlById(long patentDocId);
	
	void insertUserPatentDoc(List<Map<String, Integer>> userPatentDocRecords);
	
	List<PatentDoc> searchUserPatentDocsByPage(PatentDocSearchCondition searchCondition);
	
	int searchUserPatentDocsCount(PatentDocSearchCondition searchCondition);
	
	int getAttatchmentPicCount(long patentDocId );
	
	int getMaxAttachmentPicNum(long patentDocId );
	
	void updateAttachmentImgName(Attachment attachment);
	
	Attachment getAttachmentByAttachId(long attachmentId);
	
	void updateAttachmentImgUrl(Attachment attachment);
	
	List<PatentDoc> getPatentDocsByIds(List<Long> patentDocIds);
	
	void insertProxyOrgPatentDoc(List<Map<String, Long>> userPatentDocRecords);
	
	List<PatentDoc> getUserPatentDocByRole(Page page);
	
	int getUserPatentDocCountByRole(Page page);
	
	List<PatentDoc> getPatentDocByTechAndCustomer(Page page,List<Integer> statusList);
	
	int getPatentDocCountByTechAndCustomer(Page page,List<Integer> statusList);
	
	void savePatentStandardFile(PatentDoc patentDoc);
	
	void saveInternalCode(PatentDoc patentDoc);
	
	String getPatentDocAttachmentUrlById(Long patentDocId);
}
